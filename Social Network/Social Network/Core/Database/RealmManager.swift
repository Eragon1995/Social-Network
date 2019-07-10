//
//  RealmManager.swift

import Foundation
import RealmSwift

class RealmManager {
    
    let realm = try! Realm()
    
    /**
     Delete local database
     */
    func deleteDatabase() {
        try! realm.write({
            realm.deleteAll()
        })
    }
    
    /**
     Save array of objects to database
     */
    func saveObjects(objs: [Object]) {
        try! realm.write({
            // If update = true, objects that are already in the Realm will be
            // updated instead of added a new.
            realm.add(objs, update: true)
        })
    }
    func saveObject(obj: Object) {
        try! realm.write({
            // If update = true, objects that are already in the Realm will be
            // updated instead of added a new.
            realm.add(obj, update: true)
        })
    }
    
    
    /**
     Returs an array as Results<object>?
     */
    func getObjects(type: Object.Type) -> Results<Object>? {
        return realm.objects(type)
    }
    
    //filter
    // Example : let predicate = NSPredicate(format: "base = %@ AND price > 67", findBase)
    func getObjectsWithFilter(type: Object.Type,predicate : NSPredicate) -> Results<Object>? {
        return self.realm.objects(type).filter(predicate)
    }
    
    func getObjectWithPrimaryKey(type: Object.Type,primaryKey : Any) -> Object? {
        return realm.object(ofType: type, forPrimaryKey: primaryKey)
    }
    func getSum(type: Object.Type,property : String,predicate : NSPredicate) -> Double {
        return realm.objects(type).filter(predicate).sum(ofProperty: property)
    }
    func deleteWithFilter(type: Object.Type,predicate : NSPredicate) -> Void {
         try! realm.write({
            realm.delete(self.getObjectsWithFilter(type: type, predicate: predicate)!)
         })
    }
    func deleteAllObject(type: Object.Type) -> Void {
        try! realm.write({
            realm.delete(self.getObjects(type: type)!)
        })
    }
    func deletObject(object: Object) -> Void {
        try! realm.write({
            realm.delete(object)
        })
    }
}
