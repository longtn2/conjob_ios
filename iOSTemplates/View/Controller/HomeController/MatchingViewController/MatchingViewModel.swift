//
//  MatchingViewModel.swift
//  iOSTemplates
//
//  Created by mac on 11/4/24.
//  Copyright © 2024 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import Foundation
final class MatchingViewModel {
    var posts: [Post] = []
    func listPost() {
        let post1 = Post(id: "postid_1", image: "image_post1", name: "Văn Hào", description: "Hôm nay tôi mệt rả rời muốn tìm gì đó chơi vui được hông tìm gì đó chơi vui được hôngtìm gì đó chơi vui được hông", avartar: "image_avatar1", numberHeart: 200, numberMessage: 100, numberShare: 50)
        let post2 = Post(id: "postid_2", image: "image_post1", name: "Văn Hào Trương", description: "muốn tìm gì đó chơi vui được hông muốn tìm gì đó chơi vui được hông", avartar: "image_avatar2", numberHeart: 250, numberMessage: 10, numberShare: 70)
        let post3 = Post(id: "postid_3", image: "image_post1", name: "Trương Văn Hào", description: "Hôm nay tôi mệt rả rời muốn tìm gì đó chơi vui được hông", avartar: "image_avatar1", numberHeart: 200, numberMessage: 100, numberShare: 50)
        let post4 = Post(id: "postid_4", image: "image_post1", name: "Văn Bi iiii", description: "hihihi hông", avartar: "image_avatar2", numberHeart: 250, numberMessage: 10, numberShare: 70)
        posts = [post1, post2, post3, post4]
    }
    
    func viewModelForMatching(at index: Int) -> Post {
        return posts[index]
    }
}
