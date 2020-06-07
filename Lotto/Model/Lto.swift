//
//  Lto.swift
//  Lotto
//
//  Created by JongHyun Park on 2020/05/03.
//  Copyright © 2020 Znfod. All rights reserved.
//

import Foundation

struct Lto {
    // 번호
    var number = 0
    // 당첨 번호 6
    var count = 0

    init(number:Int, count:Int) {
        self.number = number
        self.count = count
    }
}
