//
//  ColorValueConverter.swift
//  ColorTest
//
//  Created by Doug Holland on 11/12/24.
//

import Foundation

import SwiftUI

extension UIColor {
    func printColorComponents() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        debugPrint("UIColor - red: \(red) green: \(green) blue: \(blue) alpha: \(alpha)")
    }
}

@objc(UIColorValueTransformer)
class UIColorValueTransformer: ValueTransformer {
    override class func transformedValueClass() -> AnyClass {
        return UIColor.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return true
    }
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? UIColor else { return nil }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            
            return data
        } catch {
            assertionFailure("assertion failure: \(error)")
            
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? NSData else { return nil }
        
        do {
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data as Data)
            
            return color
        } catch {
            assertionFailure("assertion failure: \(error)")
            
            return nil
        }
    }
}

extension UIColorValueTransformer {
    /// The name of the transformer. This is the name used to register the transformer using `ValueTransformer.setValueTrandformer(_"forName:)`.
    static let name = NSValueTransformerName(rawValue: String(describing: UIColorValueTransformer.self))

    /// Registers the value transformer with `ValueTransformer`.
    public static func register() {
        let transformer = UIColorValueTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
}
