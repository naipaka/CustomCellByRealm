//
//  AddViewController.swift
//  CustomCellSample1
//
//  Created by rMac on 2019/02/16.
//  Copyright © 2019 naipaka. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {
    
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var itemNumber: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        // Itemクラスのインスタンス作成
        let newItem = Item()
        // TextFieldの値を代入
        newItem.itemName = itemName.text!
        newItem.itemNumber = itemNumber.text!
        
        // インスタンスをRealmに保存
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newItem)
            })
        }catch{
        }
        // 画面を閉じる
        self.dismiss(animated: true,completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
