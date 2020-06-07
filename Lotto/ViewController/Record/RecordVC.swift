//
//  RecordVC.swift
//  Lotto
//
//  Created by JongHyun Park on 2020/05/03.
//  Copyright © 2020 Znfod. All rights reserved.
//

import UIKit

class RecordVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    //
    var dictionary = Dictionary<Int, Int>()
    // count 순
    var arrayByCount = Array<Lto>()
    // 번호 순
    var arrayNo = Array<Lto>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension RecordVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("numberOfItemsInSection")
        return self.arrayByCount.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:RecordCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecordCell", for: indexPath) as! RecordCollectionCell
        let lto = self.arrayByCount[indexPath.row]
        cell.numberLbl.text = String(lto.number)
        cell.countLbl.text = String(lto.count)
        return cell
    }
    
}


