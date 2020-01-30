//
//  ViewController.swift
//  MAP19Firestore
//
//  Created by David Svensson on 2020-01-30.
//  Copyright © 2020 David Svensson. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var db: Firestore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        db = Firestore.firestore()
        
      //  let morot = ["name" : "morot", "done" : false] as [String : Any]
        
        let itemRef = db.collection("items")
        
        let tryffel = Item(name: "tryffel")
        
       // itemRef.addDocument(data: tryffel.toDict())
        
//        itemRef.document("morot").getDocument() { (document , error) in
//            if let document = document, document.exists {
//                print(document.data())
//            }
//        }
        
        itemRef.addSnapshotListener() {
            (snapshot, error) in
            guard let documents = snapshot?.documents else {return}
            
            for document in documents {
                //print(document.data())
                let item = Item(snapshot: document)
                print(item.name)
            }
        }
        
        
        
        
    }


}

