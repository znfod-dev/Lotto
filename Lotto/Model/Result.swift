//
//  Result.swift
//  Lotto
//
//  Created by JongHyun Park on 2020/05/22.
//  Copyright © 2020 Znfod. All rights reserved.
//

import Foundation

// 당첨번호 조회
struct Result {
    // 결과
    var result:String = ""
    // 번호 1
    var number1:Int = 0
    // 번호 2
    var number2:Int = 0
    // 번호 3
    var number3:Int = 0
    // 번호 4
    var number4:Int = 0
    // 번호 5
    var number5:Int = 0
    // 번호 6
    var number6:Int = 0
    
    init(_ dictionary:Dictionary<String, Any>) {
        self.result = dictionary["result"] as! String
        self.number1 = dictionary["number1"] as! Int
        self.number2 = dictionary["number2"] as! Int
        self.number3 = dictionary["number3"] as! Int
        self.number4 = dictionary["number4"] as! Int
        self.number5 = dictionary["number5"] as! Int
        self.number6 = dictionary["number6"] as! Int
    }
    
    init(_ array:Array<String>) {
        self.result = array[0]
        self.number1 = Int(array[1])!
        self.number2 = Int(array[2])!
        self.number3 = Int(array[3])!
        self.number4 = Int(array[4])!
        self.number5 = Int(array[5])!
        self.number6 = Int(array[6])!
        
    }
    
}


