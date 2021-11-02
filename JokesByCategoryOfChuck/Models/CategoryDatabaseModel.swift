//
//  CategoryDatabaseModel+CoreDataClass.swift
//  
//
//  Created by Evgeniy Nosko on 2.11.21.
//
//

import Foundation
import CoreData

@objc(CategoryDatabaseModel)
public class CategoryDatabaseModel: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryDatabaseModel> {
        return NSFetchRequest<CategoryDatabaseModel>(entityName: "CategoryDatabaseModel")
    }
    
    @NSManaged public var categories: NSObject?
}
