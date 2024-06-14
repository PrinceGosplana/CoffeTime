//
//  PixelArtContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 14.06.2024.
//

import PhotosUI
import SwiftUI

struct PixelArtContentView: View {

    @State var selectedPhotoItem: PhotosPickerItem?
    @State var originalImage: UIImage?
    @State var pixelatedImage: UIImage?
    @State var cropInsets: CGFloat = 0.0
    @State var pixelationScale: CGFloat = 0.0
    @State var isPhotoPickerPresented = false
    @State var imagesaved = false

    var body: some View {
        VStack {
            Group {
                if let pixelatedImage {
                    PAImageView(image: pixelatedImage)
                        .photosPicker(
                            isPresented: $isPhotoPickerPresented,
                            selection: $selectedPhotoItem,
                            matching: .images
                        )
                        .onTapGesture {
                            isPhotoPickerPresented.toggle()
                        }
                } else if let originalImage {
                    PAImageView(image: originalImage)
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 3)
                            .frame(width: 300, height: 400)
                            .background(.thinMaterial, in: .rect(cornerRadius: 20))
                        
                        Image(systemName: "plus")
                            .font(.system(size: 120, weight: .ultraLight))
                    }
                    .foregroundStyle(.gray)
                    .photosPicker(isPresented: $isPhotoPickerPresented, selection: $selectedPhotoItem, matching: .images)
                    .onTapGesture {
                        isPhotoPickerPresented.toggle()
                    }
                }
            }
            Spacer()

            Slider(value: $pixelationScale, in: 0...100, step: 1) { Text("Pixelation Scale") }

            Button {
                if let pixelatedImage {
                    saveImageToPhotos(image: pixelatedImage)
                    imagesaved = true
                }
            } label: {
                ZStack {
                    Color.clear
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(.thinMaterial, in: .rect(cornerRadius: 10))
                    if !imagesaved {
                        Text("Save image")
                            .bold()
                            .font(.title2)
                    } else {
                        Image(systemName: "checkmark.circle")
                            .font(.title)
                            .foregroundStyle(.green)
                    }
                }
            }
            .disabled(pixelatedImage == nil)
            .tint(.primary)

            Spacer()
                .onChange(of: pixelationScale) { oldValue, newValue in
                    if let originalImage {
                        pixelatedImage = applyPixellateFilter(image: originalImage, scale: newValue, cropInsets: 0)
                    }
                }
        }
        .padding(.horizontal, 20)
        .onChange(of: selectedPhotoItem) { oldValue, newValue in
            Task {
                if let data = try? await newValue?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    pixelationScale = 0.0
                    originalImage = uiImage
                    pixelatedImage = nil
                }
            }
            imagesaved = false
        }
    }

    private func applyPixellateFilter(image: UIImage, scale: CGFloat, cropInsets: CGFloat) -> UIImage? {
        guard let inputImage = CIImage(image: image) else { return nil }

        let croppedImage = inputImage
            .cropped(
                to: CGRect(
                    x: cropInsets,
                    y: cropInsets,
                    width: inputImage.extent.width - 2 * cropInsets,
                    height: inputImage.extent.height - 2 * cropInsets
                )
            )
        guard let filter = CIFilter(name: "CIPixellate") else { return nil }

        filter.setValue(croppedImage, forKey: kCIInputImageKey)
        filter.setValue(scale, forKey: kCIInputScaleKey)

        let context = CIContext()

        guard let outputImage = filter.outputImage,
              let cgImage = context.createCGImage(outputImage, from: croppedImage.extent) else { return nil  }

        let pixelatedUIImage = UIImage(cgImage: cgImage)

        // Resize back to original size with transparent edges
        let renderer = UIGraphicsImageRenderer(size: image.size)
        let finalImage = renderer.image { _ in
            image.draw(at: .zero)
            pixelatedUIImage.draw(
                in: CGRect(
                    x: cropInsets,
                    y: cropInsets,
                    width: image.size.width - 2 * cropInsets,
                    height: image.size.height - 2 * cropInsets
                )
            )
        }

        return finalImage
    }

    private func saveImageToPhotos(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

#Preview {
    PixelArtContentView()
}
