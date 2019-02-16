//
//  ViewController.swift
//  CustomCellSample1
//
//  Created by rMac on 2019/02/16.
//  Copyright © 2019 naipaka. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var itemList: Results<Item>!
    let cellHeigh:CGFloat = 125
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Realmからデータを取得
        do{
            let realm = try Realm()
            itemList = realm.objects(Item.self)
        }catch{
        }
        // tableViewにカスタムセルを登録
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.tableFooterView = UIView()
    }
    
    // 画面が表示される直前にtableViewを更新
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        // カスタムセル内のプロパティ設定
        cell.itemName.text = itemList[indexPath.row].itemName
        cell.itemName.textAlignment = .center
        cell.itemName.adjustsFontSizeToFitWidth = true
        cell.itemNumber.text = itemList[indexPath.row].itemNumber
        cell.itemNumber.textAlignment = .center
        cell.itemNumber.adjustsFontSizeToFitWidth = true
        
        return cell
    }

    // セルの削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if(editingStyle == UITableViewCell.EditingStyle.delete) {
            // Realm内のデータを削除
            do{
                let realm = try Realm()
                try realm.write {
                    realm.delete(self.itemList[indexPath.row])
                }
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }catch{
            }
        }
    }
    
    // セルの高さを設定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeigh
    }
}

