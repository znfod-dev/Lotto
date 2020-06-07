//
//  DrawVC.swift
//  Lotto
//
//  Created by JongHyun Park on 2020/05/03.
//  Copyright © 2020 Znfod. All rights reserved.
//

import UIKit

class DrawVC: BaseVC {
    
    @IBOutlet weak var tableView: UITableView!
    var dictionary1 = Dictionary<Int, Int>()
    var dictionary2 = Dictionary<Int, Int>()
    var dictionary3 = Dictionary<Int, Int>()
    
    var arr1 = Array<Lto>()
    var arr2 = Array<Lto>()
    var arr3 = Array<Lto>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FireStoreManager.shared.load645(last100: { dictionary in
            print("100회 dictionary : \(dictionary)")
            self.dictionary1 = dictionary
        
            self.tableView.reloadSections(IndexSet.init(integer: 0), with: .automatic)
        }, last200: { dictionary in
            print("200회 dictionary : \(dictionary)")
            self.dictionary2 = dictionary
           for i in 1..<46 {
                let lto = Lto.init(number: i, count: self.dictionary2[i]!)
                self.arr2.append(lto)
            }
            self.arr2.sort { (lto1, lto2) -> Bool in
                return lto1.count < lto2.count
            }
            self.tableView.reloadSections(IndexSet.init(integer: 1), with: .automatic)
        }, success: { dictionary in
            print("전체 dictionary : \(dictionary)")
            self.dictionary3 = dictionary
            for i in 1..<46 {
                let lto = Lto.init(number: i, count: self.dictionary3[i]!)
                self.arr3.append(lto)
            }
            self.arr3.sort { (lto1, lto2) -> Bool in
                return lto1.count < lto2.count
            }
            self.tableView.reloadSections(IndexSet.init(integer: 2), with: .automatic)
        }) { error in
            
        }
    }
    
    
}
extension DrawVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow = 0
        if section == 0 {
            if arr1.count == 45 {

             numberOfRow = 1
            }else {
                numberOfRow = 0
            }
        }else if section == 1 {
             if arr2.count == 45 {

                        numberOfRow = 1
                       }else {
                           numberOfRow = 0
                       }
        }else if section == 2 {
             if arr3.count == 45 {

                        numberOfRow = 1
                       }else {
                           numberOfRow = 0
                       }
        }
        return numberOfRow
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:DrawTableCell! = tableView.dequeueReusableCell(withIdentifier: "DrawCell") as? DrawTableCell
        let row = indexPath.row
        let sec = indexPath.section
            if sec == 0 {
                cell.titleLbl.text = "최근 100회까지의 통계"
            }else if sec == 1 {
                cell.titleLbl.text = "최근 200회까지의 통계"
            }else if sec == 2 {
                cell.titleLbl.text = "지금까지의 통계"
            }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc:RecordVC = storyboard.instantiateViewController(withIdentifier: "RecordVC") as! RecordVC
        if section == 0 {
            // vc.array = arr1
            self.navigationController?.pushViewController(vc, animated: true)
        }else if section == 1 {
            // vc.array = arr2
            self.navigationController?.pushViewController(vc, animated: true)
        }else if section == 2 {
            // vc.array = arr3
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


