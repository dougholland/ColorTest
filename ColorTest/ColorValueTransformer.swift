//
//  ColorValueConverter.swift
//  ColorTest
//
//  Created by Doug Holland on 11/12/24.
//

import SwiftUI

import Foundation

@objc(UIColorValueTransformer)
class UIColorValueTransformer: ValueTransformer {
    static let name = NSValueTransformerName(rawValue: String(describing: UIColorValueTransformer.self))
    
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
    
    public static func register() {
        let transformer = UIColorValueTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
}
