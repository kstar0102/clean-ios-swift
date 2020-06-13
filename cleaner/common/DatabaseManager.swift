//
//  DatabaseManager.swift
//  CountMemoForEsApp
//
//  Created by ADV on 2020/03/21.
//  Copyright © 2020 Yoko Ishikawa. All rights reserved.
//

import UIKit
import CoreData

class DatabaseManager: NSObject {
    // MARK: - Core Data stack

    static var persistentContainer: NSPersistentContainer = {
    
        let container = NSPersistentContainer(name: "cleaner")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
        }
    }
    
    static func getBinDatas() -> [BinData] {
        var searchData:[BinData] = []
        let context = persistentContainer.viewContext
        //%@はstring型を表す
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BinData")
        //複数条件かつ部分一致でじ検索
//        let predicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or
//            , subpredicates: [
//                NSPredicate(format: "completedFlag == %@", NSNumber(value: completed))
//                ])
//        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "binDate", ascending: true)
        ]

        let fetchData = try! context.fetch(fetchRequest)

        if(!fetchData.isEmpty){
            for i in 0..<fetchData.count{
                searchData.append(fetchData[i] as! BinData)
            }
            do{
                try context.save()
            }catch{
                print(error)
            }
        }

        return searchData
    }
    
}
