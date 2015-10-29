//
//  HomeViewController.swift
//  CregitGetter2.0
//
//  Created by 綿岡晃輝 on 2015/10/24.
//  Copyright © 2015年 綿岡晃輝. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    
    /*********************************プロパティ宣言ゾーン**********************************/
    
    
    //テーブルを用意
    var myTable: UITableView!
    
    //テーブルに表示するアイテムの配列
    var myTableItems_setting: [NSString] = ["プロフィール設定","ログアウト"]
    var myTableItems_others: [NSString] = ["ADOCUSアプリ","よくある質問","ヘルプ"]
    
    //セクション分けで使用する配列
    var mySections: [NSString] = ["設定","その他"]
    
   
    @IBOutlet weak var Header: UIImageView!
    /********************************Build実行*******************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "ホーム"
        
        //statusBarの高さを取得する
        let statusBarHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 178/255, green: 7/255, blue: 13/255, alpha: 1.0)
        
        //画面サイズを取得
        let width: CGFloat! = self.view.bounds.width
        let height: CGFloat! = self.view.bounds.height
        
        
        
        //テーブルを表示
        myTable = UITableView(frame: CGRectMake(0, height/2, width, height/2))
        myTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        myTable.dataSource = self
        myTable.delegate = self
        self.view.addSubview(myTable)
        
        
    }
    
    /***********************************デバッグ*******************************************/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    /**********************************関数宣言ゾーン*******************************************/
    
    
    
    //セクションの数を返す
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return mySections.count
    }
    
    //セクションのタイトルを返す
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    
    //セルの行数を指定
    func tableView(tableView:UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if section == 0 {
            return myTableItems_setting.count
        }else if section == 1{
            return myTableItems_others.count
        }else{
            return 0
        }
        
    }
    
    //Cellが選択された際に呼び出される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.section == 0 && indexPath.row == 0){
            
            let VC1 = ProfileViewController()
            
           self.navigationController?.pushViewController(VC1, animated: true)
        
        }
    }
    
    //Cellに値を設定する
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        if (indexPath.section == 0){
            cell.textLabel?.text = "\(myTableItems_setting[indexPath.row])"
        }else if (indexPath.section == 1){
            cell.textLabel?.text = "\(myTableItems_others[indexPath.row])"
        }
        
        return cell
    }
    
    
    
}
