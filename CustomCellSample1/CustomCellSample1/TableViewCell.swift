//
//  TableViewCell.swift
//  CustomCellSample1
//
//  Created by rMac on 2019/02/16.
//  Copyright © 2019 naipaka. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    // 商品名
    @IBOutlet weak var itemName: UILabel!
    // 数量
    @IBOutlet weak var itemNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
