//
//  CommentInfo.swift
//  CoreDataPractice
//
//  Created by RONICK on 2021/10/24.
//

import Foundation

/*
데이터를 저장하기 위한 테스트용 객체
 */

struct CommentInfo {
    let identifier: String
    let text: String
    let created: Date
    let owner: PersonInfo
    
    init(identifier: String, text: String, created: Date, owner: PersonInfo) {
        self.identifier = identifier
        self.text = text
        self.created = created
        self.owner = owner
    }
}


// CommentInfo 를 추가하면 Core Data에 추가적으로 저장됨
var commentInfoData: [CommentInfo] = [
    CommentInfo(identifier: "1", text: "hello", created: Date(), owner: personInfoData[0]),
    CommentInfo(identifier: "2", text: "world", created: Date(), owner: personInfoData[1]),
    CommentInfo(identifier: "3", text: "wow!!!!!!this is great", created: Date(), owner: personInfoData[2]),
    CommentInfo(identifier: "4", text: "damn sucks", created: Date(), owner: personInfoData[3]),
    CommentInfo(identifier: "5", text: "what the hell", created: Date(), owner: personInfoData[4]),
    CommentInfo(identifier: "6", text: "hello", created: Date(), owner: personInfoData[0]),
    CommentInfo(identifier: "7", text: "wowowowowowowow", created: Date(), owner: personInfoData[0]),
    CommentInfo(identifier: "8", text: "heyheyhey", created: Date(), owner: personInfoData[1]),
    CommentInfo(identifier: "9", text: "umumumumumumumum", created: Date(), owner: personInfoData[1]),
    CommentInfo(identifier: "10", text: "trytrytrytrytry", created: Date(), owner: personInfoData[2])
]
