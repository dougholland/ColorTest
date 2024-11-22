//
//  ColorModel.swift
//  ColorTest
//
//  Created by Doug Holland on 11/12/24.
//

import SwiftUI

import SwiftData

@Model
final class ColorModel: Identifiable, Hashable {
    var id = UUID()
    
    @Attribute(.transformable(by: UIColorValueTransformer.name.rawValue))
    var uiColor: UIColor?
    
    var red: CGFloat?
    
    var green: CGFloat?
    
    var blue: CGFloat?
    
    var opacity: CGFloat?
    
    init(id: UUID = UUID(), uiColor: UIColor? = nil) {
        self.id = id
        
        self.uiColor = uiColor
        
        self.red = uiColor?.cgColor.components?[0] ?? 0
        
        self.green = uiColor?.cgColor.components?[1] ?? 0
        
        self.blue = uiColor?.cgColor.components?[2] ?? 0
        
        self.opacity = uiColor?.cgColor.components?[3] ?? 0
    }
}
