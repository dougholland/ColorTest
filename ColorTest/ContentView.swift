//
//  ContentView.swift
//  ColorTest
//
//  Created by Doug Holland on 11/12/24.
//

import SwiftUI

import SwiftData

import MapKit

struct ContentView: View {
    @Environment(\.modelContext) private var context
    
    @Query var colors: [ColorModel]
    
    @State var colorPickerColor = Color.blue
    
    @State var mapFeatureColor = Color.blue
    
    @State var color1 = Color.blue
    
    @State var color2 = Color.blue
    
    @State var color3 = Color.blue
    
    @State private var position: MapCameraPosition = .automatic
    
    @State var selection: MapSelection<MKMapItem>?
    
    var body: some View {
        VStack {
            // NOTE: when the color originates from the ColorPicker all three rectangles are the same color, in light and dark appearance.
            ColorPicker(selection: $colorPickerColor) {
                Text("Choose Color")
            }
            
            // NOTE: when the color originates from the selected MapFeature, all three rectangles are only the same in light appearance.
            Map(position: $position, selection: $selection) {
                
            }
            
            ZStack {
                Rectangle()
                    .fill(color1)
            
                Text("Original Color")
                    .foregroundStyle(.white)
            }
            
            ZStack {
                Rectangle()
                    .fill(color2)
                
                Text("UIColorValueTransformer Transformed Color")
                    .foregroundStyle(.white)
            }
            
            ZStack {
                Rectangle()
                    .fill(color3)
                
                Text("SwiftData Query Color")
                    .foregroundStyle(.white)
            }
        }
        .onAppear {
            self.color2 = copyColorAsData(self.color1)
        }
        .onChange(of: colorPickerColor) {
            color1 = colorPickerColor
            
            // copy the color using the ColorValueTransformer directly (used within the SwiftData model).
            self.color2 = copyColor(self.color1)
            
            // SwiftData requires var and so the warning about this being changed to a 'let' constant should be ignored.
            var colorModel: ColorModel = ColorModel(uiColor: UIColor(color1))
            
            context.insert(colorModel)
            
            do {
                try context.save()
            } catch {
                debugPrint("error saving: \(error.localizedDescription)")
            }
        }
        .onChange(of: selection) {
            if let feature = selection?.feature {
                if let color = feature.backgroundColor {
                    color1 = color
                    
                    // copy the color using the ColorValueTransformer directly (used within the SwiftData model).
                    self.color2 = copyColor(self.color1)
                    
                    // SwiftData requires var and so the warning about this being changed to a 'let' constant should be ignored.
                    var colorModel: ColorModel = ColorModel(uiColor: UIColor(color1))
                    
                    context.insert(colorModel)
                    
                    do {
                        try context.save()
                    } catch {
                        debugPrint("error saving: \(error.localizedDescription)")
                    }
               }
            }
        }
        .onChange(of: colors) {
            // copy the color from the SwiftData query.
            if let color = colors.last?.uiColor {
                self.color3 = Color(color)
            }
        }
    }
    
    func copyColor(_ color: Color) -> Color {
        let uiColor = UIColor(color)
        
        return Color(uiColor: uiColor)
    }
    
    func copyColorAsData(_ color: Color) -> Color {
        let uiColor = UIColor(color)
        
        uiColor.printColorComponents()
        
        let transformer: UIColorValueTransformer = UIColorValueTransformer()
        
        let data: Data? = transformer.transformedValue(uiColor) as? Data
        
        if let data = data {
            let transformedColor: UIColor? = transformer.reverseTransformedValue(data) as? UIColor
            
            if let transformedColor = transformedColor {
                transformedColor.printColorComponents()
                
                return Color(uiColor: transformedColor)
            }
        }
        
        return Color.red
    }
}

#Preview {
    ContentView()
}
