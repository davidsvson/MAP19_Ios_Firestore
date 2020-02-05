//
//  Item.swift
//  MAP19Firestore
//
//  Created by David Svensson on 2020-01-30.
//  Copyright © 2020 David Svensson. All rights reserved.
//

import Foundation
import Firebase

class Item {
    
    var name : String
    var done : Bool

    
    init(name: String, done: Bool = false ) {
        self.name = name
        self.done = done
    }
    
    
    // en contructor som tar in ett firestore document ocg skapar ett object utifron det
    init(snapshot: QueryDocumentSnapshot) {
        let snapshotValue = snapshot.data() as [String : Any]
        name = snapshotValue["name"] as! String
        done = snapshotValue["done"] as! Bool
    }
    
    func switchDone() {
        done = !done
    }
    
    // gör om ett object till en dictionary som kan laddas upp på firestore
    func toDict() -> [String : Any] {
        return ["name" : name,
                "done" : done]
    }
    
}
