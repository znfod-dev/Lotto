//
//  FireStoreManager.swift
//  Lotto
//
//  Created by JongHyun Park on 2020/04/26.
//  Copyright © 2020 Znfod. All rights reserved.
//

import UIKit
import Firebase


class FireStoreManager: NSObject {
    static let shared = FireStoreManager()
    
    let db = Firestore.firestore()
    
    override init() {
        super.init()
    }
    
    func loadDB(success: @escaping(_ success: Array<DRW>)-> Void,
                fail: @escaping(_ error: Error)-> Void){
        let lottoRef = db.collection("Lotto645").order(by: "drwNo", descending: true)
        lottoRef.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                fail(err)
            } else {
                var drwList = Array<DRW>()
                drwList = querySnapshot!.documents.compactMap { DRW.init(dictionary: $0.data()) }
                
                success(drwList)
            }
        }
    } 
    func getLottoData(val:Int) {
        WebManager.shared.getLottoNumber(drwNo: val, success: { success, drw in
            if success == true {
                if let drw = drw {
                    self.updateDrwData(drwNo: drw.drwNo!, drw: drw)
                }
                self.getLottoData(val: val+1)
            }else {
                
            }
        }) { error in
            
        }
    }
    func updateDrwData(drwNo:Int, drw:DRW) {
        print("updateDrwData")
        db.collection("Lotto645").document(String(format: "%04d", drwNo)).setData(
            drw.toDictionary()
        ) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    func load645(last100: @escaping(_ success: Dictionary<Int, Int>)-> Void,
                 last200: @escaping(_ success: Dictionary<Int, Int>)-> Void,
                 success: @escaping(_ success: Dictionary<Int, Int>)-> Void,
                 fail: @escaping(_ error: Error)-> Void){
        let lottoRef = db.collection("Lotto645").order(by: "drwNo", descending: true)
        lottoRef.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                fail(err)
            } else {
                var dictionary = Dictionary<Int, Int>()
                for i in 1..<46 {
                    dictionary.updateValue(0, forKey: i)
                }
                var count = 0
                for document in querySnapshot!.documents {
                    let drw = DRW.init(dictionary: document.data())
                    dictionary.updateValue(dictionary[(drw?.drwtNo1)!]! + 1, forKey: (drw?.drwtNo1)!)
                    dictionary.updateValue(dictionary[(drw?.drwtNo2)!]! + 1, forKey: (drw?.drwtNo2)!)
                    dictionary.updateValue(dictionary[(drw?.drwtNo3)!]! + 1, forKey: (drw?.drwtNo3)!)
                    dictionary.updateValue(dictionary[(drw?.drwtNo4)!]! + 1, forKey: (drw?.drwtNo4)!)
                    dictionary.updateValue(dictionary[(drw?.drwtNo5)!]! + 1, forKey: (drw?.drwtNo5)!)
                    dictionary.updateValue(dictionary[(drw?.drwtNo6)!]! + 1, forKey: (drw?.drwtNo6)!)
                    if count == 100 {
                        last100(dictionary)
                    }else if count == 200 {
                        last200(dictionary)
                    }
                    count = count + 1
                }
                success(dictionary)
            }
        }
    }
    
}
