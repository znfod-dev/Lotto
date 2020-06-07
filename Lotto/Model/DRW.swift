//
//  WinPrize.swift
//  Lotto
//
//  Created by JongHyun Park on 2020/04/26.
//  Copyright © 2020 Znfod. All rights reserved.
//

import UIKit
import Firebase

struct DRW {
    // 날짜
    var drwNoDate:Date?
    // 회차
    var drwNo:Int?
    // 총 판매 금액 899,2360,1000
    var totSellamnt:Int?
    // 1인당 1등 당첨 금액 28,3485,6141
    var firstWinamnt:Int?
    // 1등 총 당첨 금액 226,7884,9128
    var firstAccumamnt:Int?
    // 1등 당첨자 수
    var firstPrzwnerCo:Int?
    // 당첨 번호 1
    var drwtNo1:Int?
    // 당첨 번호 2
    var drwtNo2:Int?
    // 당첨 번호 3
    var drwtNo3:Int?
    // 당첨 번호 4
    var drwtNo4:Int?
    // 당첨 번호 5
    var drwtNo5:Int?
    // 당첨 번호 6
    var drwtNo6:Int?
    // 보너스 번호
    var bnusNo:Int?
    // updated
    var updated:Bool?
    
    init?(dictionary: [String: Any]) {
        if let dateStr = dictionary["drwNoDate"] as? String {
            let formatter = DateFormatter.init()
            formatter.dateFormat = "yyyy-MM-dd"
            guard let date = formatter.date(from: dateStr) else { return }
            self.drwNoDate = date
        }else if let date = dictionary["drwNoDate"] as? Timestamp {
            self.drwNoDate = date.dateValue()
        }
        self.drwNo = dictionary["drwNo"] as? Int
        self.totSellamnt = dictionary["totSellamnt"] as? Int
        self.firstWinamnt = dictionary["firstWinamnt"]  as? Int
        self.firstAccumamnt = dictionary["firstAccumamnt"] as? Int
        self.firstPrzwnerCo = dictionary["firstPrzwnerCo"] as? Int
        self.drwtNo1 = dictionary["drwtNo1"] as? Int
        self.drwtNo2 = dictionary["drwtNo2"] as? Int
        self.drwtNo3 = dictionary["drwtNo3"] as? Int
        self.drwtNo4 = dictionary["drwtNo4"] as? Int
        self.drwtNo5 = dictionary["drwtNo5"] as? Int
        self.drwtNo6 = dictionary["drwtNo6"] as? Int
        self.bnusNo = dictionary["bnusNo"] as? Int
        self.updated = dictionary["updated"] as? Bool
        
    }
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        dictionary["drwNoDate"] = self.drwNoDate
        dictionary["drwNo"] = self.drwNo
        dictionary["totSellamnt"] = self.totSellamnt
        dictionary["firstWinamnt"] = self.firstWinamnt
        dictionary["firstAccumamnt"] = self.firstAccumamnt
        dictionary["firstPrzwnerCo"] = self.firstPrzwnerCo
        dictionary["drwtNo1"] = self.drwtNo1
        dictionary["drwtNo2"] = self.drwtNo2
        dictionary["drwtNo3"] = self.drwtNo3
        dictionary["drwtNo4"] = self.drwtNo4
        dictionary["drwtNo5"] = self.drwtNo5
        dictionary["drwtNo6"] = self.drwtNo6
        dictionary["bnusNo"] = self.bnusNo
        dictionary["updated"] = self.updated
        return dictionary
    }
    
}
