//
//  LottoCheckVC.swift
//  Lotto
//
//  Created by JongHyun Park on 2020/05/23.
//  Copyright © 2020 Znfod. All rights reserved.
//

import UIKit

class LottoCheckVC: BaseVC {
    
    @IBOutlet weak var tableView: UITableView!
    var results = Array<Result>()
    var drw:DRW!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        
    }
}

extension LottoCheckVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows = 0
        if section == 0 {
            numberOfRows = 1
        }else if section == 1 {
            numberOfRows = self.results.count
        }else {
            
        }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:LottoCheckTableCell!
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "LottoCell") as? LottoCheckTableCell
            if let val = drw.drwNo {
                cell.turnLbl.text = String("\(val) 회")
            }
            if let val = drw.drwNoDate {
                let formatter = DateFormatter.init()
                formatter.dateFormat = "yyyy-MM-dd"
                let date = formatter.string(from: val)
                cell.dateLbl.text = String("\(date) 추첨")
            }
            if let val = drw.drwtNo1 {
                cell.setNumber1Lbl(value: val)
            }
            if let val = drw.drwtNo2 {
                cell.setNumber2Lbl(value: val)
            }
            if let val = drw.drwtNo3 {
                cell.setNumber3Lbl(value: val)
            }
            if let val = drw.drwtNo4 {
                cell.setNumber4Lbl(value: val)
            }
            if let val = drw.drwtNo5 {
                cell.setNumber5Lbl(value: val)
            }
            if let val = drw.drwtNo6 {
                cell.setNumber6Lbl(value: val)
            }
            if let val = drw.bnusNo {
                cell.setBnusNoLbl(value: val)
            }
            
        }else if indexPath.section == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "LottoCheckCell") as? LottoCheckTableCell
            let result = results[indexPath.row]
            
            cell.resultLbl.text = result.result
            cell.setNumber1Lbl(value: result.number1)
            cell.setNumber2Lbl(value: result.number2)
            cell.setNumber3Lbl(value: result.number3)
            cell.setNumber4Lbl(value: result.number4)
            cell.setNumber5Lbl(value: result.number5)
            cell.setNumber6Lbl(value: result.number6)
             
        }else {
            cell = LottoCheckTableCell.init()
        }
        
        return cell
    }
}


