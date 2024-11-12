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
    
    init(id: UUID = UUID(), uiColor: UIColor? = nil) {
        self.id = id
        
        self.uiColor = uiColor
    }
}
