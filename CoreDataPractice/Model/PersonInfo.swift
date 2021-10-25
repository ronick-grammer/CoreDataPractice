//
//  PersonInfo.swift
//  CoreDataPractice
//
//  Created by RONICK on 2021/10/24.
//

import Foundation

/*
데이터를 저장하기 위한 테스트용 객체
 */

struct PersonInfo {
    let name: String
    let age: Int
    let single: Bool
    let created: Date
    
    init(name: String, age: Int, single: Bool, created: Date) {
        self.name = name
        self.age = age
        self.single = single
        self.created = created
    }
}

var personInfoData: [PersonInfo] = [
    PersonInfo(name: "kevin", age: 19, single: true, created: Date()),
    PersonInfo(name: "davis", age: 28, single: false, created: Date()),
    PersonInfo(name: "kimyounghyun", age: 32, single: true, created: Date()),
    PersonInfo(name: "ronaldo", age: 24, single: true, created: Date()),
    PersonInfo(name: "cristiano", age: 45, single: false, created: Date())
]
