//
//  Global.swift
//  Emoji
//
//  Created by Ant on 16/9/15.
//  Copyright © 2016年 Ant. All rights reserved.
//

import Foundation
import Messages


func getStickerByImageName(name: String, description: String) -> MSSticker {
    
    let bundle = Bundle.main
    guard let placeholderURL = bundle.url(forResource: name, withExtension: "png") else { fatalError("Unable to find sticker image: \(name)") }
    
    do {
        let stiker = try MSSticker(contentsOfFileURL: placeholderURL, localizedDescription: description)
        return stiker
    }
    catch {
        fatalError("Failed to create sticker: \(error)")
    }
}
