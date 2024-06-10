//
//  ColorContentView.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 09.06.2024.
//

import SwiftUI
import SwiftData

struct ColorContentView: View {

    @State private var showView: Bool = false
    @State private var selectedColor: DummyColors = .none

    @Environment(\.modelContext) private var context

    /// Stored colors
    @Query private var storedColors: [ColorModel]

    var body: some View {
        NavigationStack {
            List {
                ForEach(storedColors) { color in
                    HStack {
                        Circle()
                            .fill(Color(color.color).gradient)
                            .frame(width: 35, height: 35)

                        Text(color.name)
                    }
                }
            }
            .navigationTitle("My Colors")
            .toolbar {
                Button("Add") { showView.toggle() }

            }
            .sheet(isPresented: $showView){
                NavigationStack {
                    List {
                        Picker("Select", selection: $selectedColor) {
                            ForEach(DummyColors.allCases, id: \.rawValue) {
                                Text($0.rawValue)
                                    .tag($0)
                            }
                        }
                    }
                    .navigationTitle("Choose a color")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Cancel", role: .destructive) {
                                selectedColor = .none
                                showView.toggle()
                            }
                        }

                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Add") {
                                let colorModel = ColorModel(name: selectedColor.rawValue, color: selectedColor.color)
                                context.insert(colorModel)
                                selectedColor = .none
                                showView.toggle()
                            }
                            .disabled(selectedColor == .none)
                        }
                    }
                }
                .interactiveDismissDisabled()
                .presentationDetents([.height(200)])
            }
        }
    }
}

#Preview {
    ColorContentView()
}


@Model
class ColorModel {
    var name: String
    /// we can use the transformable attribute to include Custom Transformers in our data model
    @Attribute(.transformable(by: ColorTransformer.self)) var color: UIColor

    init(name: String, color: Color) {
        self.name = name
        self.color = UIColor(color)
    }
}

/// Custom Transformer for accepting Color values
class ColorTransformer: ValueTransformer {
    override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? UIColor else { return nil }

        do {
            return try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
        } catch {
            return nil
        }
    }

    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }

        do {
            return try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
        } catch {
            return nil
        }
    }

    /// SwiftData requires these two funcs for transformers to work properly
    override class func transformedValueClass() -> AnyClass {
        UIColor.self
    }

    override class func allowsReverseTransformation() -> Bool {
        true
    }

    static func register() {
        /// Do not use a custom name here, instead enter the exact name of your transformer
        ValueTransformer.setValueTransformer(ColorTransformer(), forName: .init("ColorTransformer"))
    }
}
