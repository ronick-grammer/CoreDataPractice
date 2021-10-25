//
//  Comment.swift
//  CoreDataPractice
//
//  Created by RONICK on 2021/10/22.
//

import UIKit
import CoreData

class Comment: NSManagedObject {
    // 외부에서 CommentInfo 데이터를 가지고 와서 데이터가 이미 존재하면 가져오고 없으면 새로 생성하기
    // 어떤 데이터베이스(?) context에서 진행할 것인지
    class func findOrCreate(matching commentInfo: CommentInfo, in context: NSManagedObjectContext) throws -> Comment {
        
        // identifier를 가지고 유일한 하나의 객체를 찾는 것이므로 request.sortDescriptors 를 사용할 필요가 없음
        let request: NSFetchRequest<Comment> = Comment.fetchRequest()
        request.predicate = NSPredicate(format: "unique = %@", commentInfo.identifier)
        
        do {
            let matches = try context.fetch(request)
            if matches.count > 0 { // 만약 존재한다면
                assert(matches.count == 1, "Comment.findOrCreateComment -- database inconsistency")
                print("exists \(matches[0].text)")
                return matches[0]
            }
            
        } catch {
            throw error
        }
        
        let comment = Comment(context: context)
        comment.unique = commentInfo.identifier
        comment.text = commentInfo.text
        comment.created = commentInfo.created
        // relation 에 있어서 person을 연결해줬기 때문에 반대로 person 입장에서도 comment를 가진 것이나 다름없다
        comment.person = try? Person.findOrCreatePerson(matching: commentInfo.owner, in: context)
        print("not exist \(comment.text)")
        return comment
    }
}
