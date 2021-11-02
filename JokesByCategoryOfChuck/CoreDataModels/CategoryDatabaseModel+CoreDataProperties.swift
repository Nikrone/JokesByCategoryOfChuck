//
//  CategoryDatabaseModel+CoreDataProperties.swift
//  
//
//  Created by Evgeniy Nosko on 2.11.21.
//
//

import Foundation
import CoreData


extension CategoryDatabaseModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryDatabaseModel> {
        return NSFetchRequest<CategoryDatabaseModel>(entityName: "CategoryDatabaseModel")
    }

    @NSManaged public var categories: NSObject?

}
