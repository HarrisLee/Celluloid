//
//  AdjustmentData.swift
//  Celluloid
//
//  Created by Mango on 16/3/18.
//  Copyright © 2016年 Mango. All rights reserved.
//

import Foundation
import JSONCodable

public struct AdjustmentData {
    
    public static let formatIdentifier = "Mango.CelluloidPhotoExtension"
    public static let formatVersion    = "1.0"
    
    public static func supportIdentifier(identifier: String, version: String) -> Bool {
        return identifier == self.formatIdentifier && version == self.formatVersion
    }
    
    //state restoration property
    public var bubbles = [BubbleModel]()
    public var stickers = [StickerModel]()
    public var filterType = FilterType.Original
    
    public init() {}
    
    public static func decode(data: NSData) -> AdjustmentData {
        let dic = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [String:AnyObject]
        return AdjustmentData(object: dic)
    }
    
    public func encode() -> NSData {
        return NSKeyedArchiver.archivedDataWithRootObject(self.toJSON())
    }
}

extension AdjustmentData: JSONEncodable {
    public func toJSON() -> AnyObject {
        do {
            return try JSONEncoder.create({ encoder in
                try encoder.encode(bubbles, key: PropertyKey.bubbles.rawValue)
                try encoder.encode(stickers, key: PropertyKey.stickers.rawValue)
                try encoder.encode(filterType, key: PropertyKey.filterType.rawValue)
            })
        }catch{
            fatalError("\(error)")
        }
    }
}

extension AdjustmentData: JSONDecodable {
    public init(object: JSONObject) {
        do {
            let decoder = JSONDecoder(object: object)
            bubbles = try decoder.decode(PropertyKey.bubbles.rawValue)
            stickers = try decoder.decode(PropertyKey.stickers.rawValue)
            filterType = try decoder.decode(PropertyKey.filterType.rawValue)
        }catch{
            fatalError("\(error)")
        }
    }
}


private enum PropertyKey: String {
    case bubbles
    case stickers
    case filterType
}