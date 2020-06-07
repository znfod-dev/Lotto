//
//  LottoTableCell.swift
//  Lotto
//
//  Created by JongHyun Park on 2020/04/26.
//  Copyright © 2020 Znfod. All rights reserved.
//

import UIKit

class LottoTableCell: UITableViewCell {
    @IBOutlet weak var drwNoLbl: UILabel!
    //drwtNo1
    @IBOutlet weak var drwtNo1Lbl: UILabel!
    //drwtNo2
    @IBOutlet weak var drwtNo2Lbl: UILabel!
    //drwtNo3
    @IBOutlet weak var drwtNo3Lbl: UILabel!
    //drwtNo4
    @IBOutlet weak var drwtNo4Lbl: UILabel!
    //drwtNo5
    @IBOutlet weak var drwtNo5Lbl: UILabel!
    //drwtNo6
    @IBOutlet weak var drwtNo6Lbl: UILabel!
    //bnusNo
    @IBOutlet weak var bnusNoLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.drwtNo1Lbl.layer.masksToBounds = true
        self.drwtNo1Lbl.layer.cornerRadius = 20
        self.drwtNo1Lbl.backgroundColor = UIColor.get1To10()
        self.drwtNo2Lbl.layer.masksToBounds = true
        self.drwtNo2Lbl.layer.cornerRadius = 20
        self.drwtNo2Lbl.backgroundColor = UIColor.get11To20()
        self.drwtNo3Lbl.layer.masksToBounds = true
        self.drwtNo3Lbl.layer.cornerRadius = 20
        self.drwtNo3Lbl.backgroundColor = UIColor.get21To30()
        self.drwtNo4Lbl.layer.masksToBounds = true
        self.drwtNo4Lbl.layer.cornerRadius = 20
        self.drwtNo4Lbl.backgroundColor = UIColor.get31To40()
        self.drwtNo5Lbl.layer.masksToBounds = true
        self.drwtNo5Lbl.layer.cornerRadius = 20
        self.drwtNo5Lbl.backgroundColor = UIColor.get41To45()
        self.drwtNo6Lbl.layer.masksToBounds = true
        self.drwtNo6Lbl.layer.cornerRadius = 20
        self.drwtNo6Lbl.backgroundColor = UIColor.red
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setDrwtNo1Lbl(value:Int) {
        self.setNumberLayer(label: self.drwtNo1Lbl, value: value)
    }
    func setDrwtNo2Lbl(value:Int) {
        self.setNumberLayer(label: self.drwtNo2Lbl, value: value)
    }
    func setDrwtNo3Lbl(value:Int) {
        self.setNumberLayer(label: self.drwtNo3Lbl, value: value)
    }
    func setDrwtNo4Lbl(value:Int) {
        self.setNumberLayer(label: self.drwtNo4Lbl, value: value)
    }
    func setDrwtNo5Lbl(value:Int) {
        self.setNumberLayer(label: self.drwtNo5Lbl, value: value)
    }
    func setDrwtNo6Lbl(value:Int) {
        self.setNumberLayer(label: self.drwtNo6Lbl, value: value)
    }
    func setBnusNoLbl(value:Int) {
        self.setNumberLayer(label: self.bnusNoLbl, value: value)
    }
    func setNumberLayer(label:UILabel, value:Int) {
        label.text = String("\(value)")
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        self.setLblBackgroundColor(label: label, value: value)
        
    }
    func setLblBackgroundColor(label:UILabel, value:Int) {
        if value <= 10 {
            label.backgroundColor = UIColor.get1To10()
        }else if value <= 20 {
            label.backgroundColor = UIColor.get11To20()
        }else if value <= 30 {
            label.backgroundColor = UIColor.get21To30()
        }else if value <= 40 {
            label.backgroundColor = UIColor.get31To40()
        }else {
            label.backgroundColor = UIColor.get41To45()
        }
    }
    
}
