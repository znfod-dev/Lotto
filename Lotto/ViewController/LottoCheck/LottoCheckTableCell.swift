//
//  LottoCheckTableCell.swift
//  Lotto
//
//  Created by JongHyun Park on 2020/05/23.
//  Copyright © 2020 Znfod. All rights reserved.
//

import UIKit

class LottoCheckTableCell: UITableViewCell {
    
    @IBOutlet weak var turnLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var number1Lbl: UILabel!
    @IBOutlet weak var number2Lbl: UILabel!
    @IBOutlet weak var number3Lbl: UILabel!
    @IBOutlet weak var number4Lbl: UILabel!
    @IBOutlet weak var number5Lbl: UILabel!
    @IBOutlet weak var number6Lbl: UILabel!
    @IBOutlet weak var bnusNoLbl: UILabel!
    
    @IBOutlet weak var resultLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setNumber1Lbl(value:Int) {
        self.setNumberLayer(label: self.self.number1Lbl, value: value)
    }
    func setNumber2Lbl(value:Int) {
        self.setNumberLayer(label: self.self.number2Lbl, value: value)
    }
    func setNumber3Lbl(value:Int) {
        self.setNumberLayer(label: self.self.number3Lbl, value: value)
    }
    func setNumber4Lbl(value:Int) {
        self.setNumberLayer(label: self.self.number4Lbl, value: value)
    }
    func setNumber5Lbl(value:Int) {
        self.setNumberLayer(label: self.self.number5Lbl, value: value)
    }
    func setNumber6Lbl(value:Int) {
        self.setNumberLayer(label: self.self.number6Lbl, value: value)
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
