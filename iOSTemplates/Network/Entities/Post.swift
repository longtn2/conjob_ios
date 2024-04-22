//
//  Post.swift
//  iOSTemplates
//
//  Created by mac on 11/4/24.
//  Copyright © 2024 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import Foundation
class Post: Decodable {
    var id: String
    var type: String
    var url: String
    var name: String
    var description: String
    var avartar: String
    var numberHeart: Int
    var numberMessage: Int
    var numberShare: Int
    
    init(id: String, type: String, url: String, name: String, description: String, avartar: String, numberHeart: Int, numberMessage: Int, numberShare: Int) {
        self.id = id
        self.type = type
        self.url = url
        self.name = name
        self.description = description
        self.avartar = avartar
        self.numberHeart = numberHeart
        self.numberMessage = numberMessage
        self.numberShare = numberShare
    }
}
