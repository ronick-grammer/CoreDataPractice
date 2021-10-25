//
//  Person.swift
//  CoreDataPractice
//
//  Created by RONICK on 2021/10/22.
//

import UIKit
import CoreData

class Person: NSManagedObject {

    class func findOrCreatePerson(matching personInfo: PersonInfo, in context: NSManagedObjectContext) throws -> Person {
        
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        request.predicate = NSPredicate(format: "name = %@", personInfo.name)
        
        do {
            let matches = try context.fetch(request)
            if matches.count > 0 {
                assert(matches.count == 1, "Person.findOrCreatePerson -- database inconsistency")
                print("exists \(matches[0].name)")
                return matches[0]
            }
        } catch {
            throw error
        }
        
        let person = Person(context: context)
        person.name = personInfo.name
        person.age = Int16.init(exactly: personInfo.age as NSNumber) ?? 0
        person.created = personInfo.created
        print("exists \(person.name)")
        return person
        
    }
}
