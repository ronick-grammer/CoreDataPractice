//
//  InfoTableViewController.swift
//  CoreDataPractice
//
//  Created by RONICK on 2021/10/24.
//

import UIKit
import CoreData

class InfoTableViewController: UITableViewController {

    var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        insertInfo(comments: commentInfoData)
    }
    
    func insertInfo(comments: [CommentInfo]) {
        updateDatabase(with: comments)
    }
    
    private func updateDatabase(with comments: [CommentInfo]) {
        
        // main queue(container?.viewContext)가 아닌 백그라운드 queue를 사용하여 멀티스레드 구현
        // 왜냐하면 데이터 관련 작업을 하느라 main이 block 되면 안되기 때문이다.
        // 때문에 다른 스레드(백그라운드 스레드)에서
        container?.performBackgroundTask { [weak self] context in
            print("start")
            for commentInfo in comments {
                _ = try? Comment.findOrCreate(matching: commentInfo, in: context)
            }
            
            try? context.save()
            
            self?.printDatabaseStatistics()
            print("end")
        }
        
    }
    
    private func printDatabaseStatistics() {

        
        if let context = container?.viewContext {
            // viewContext는 main 큐에서 실행되어야 하기에 그것을 보장하는 perform 블록에서 처리를 한다.
            context.perform {
                if Thread.isMainThread {
                    print("on main thread")
                } else {
                    print("off main thread")
                }
                
            // 전부 가져오기
                if let commentCount = (try? context.fetch(Comment.fetchRequest()))?.count {
                    print("\(commentCount) comments")
                }
                
                if let personCount = (try? context.fetch(Person.fetchRequest()))?.count {
                    print("\(personCount) person")
                }
                
//                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentInfoData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! InfoTableViewCell
        
        cell.configure(name: commentInfoData[indexPath.row].owner.name, text: commentInfoData[indexPath.row].text)
        
        return cell
    }
}
