//
//  item.swift
//  CustomCellSample1
//
//  Created by rMac on 2019/02/16.
//  Copyright © 2019 naipaka. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    // 商品名
    @objc dynamic var itemName = ""
    // 数量
    @objc dynamic var itemNumber = ""
}
