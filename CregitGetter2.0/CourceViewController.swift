//
//  CourceViewController.swift
//  CregitGetter2.0
//
//  Created by 綿岡晃輝 on 2015/10/22.
//  Copyright © 2015年 綿岡晃輝. All rights reserved.
//

import UIKit

class CourceViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    
    /*********************************プロパティ宣言ゾーン**********************************/
    
    
    //テーブルを用意
    var myTable: UITableView!
    
    //テーブルに表示するアイテムの配列
    var myTableItems_all: [NSString] = ["全学部共通"]
    var myTableItems_major: [NSString] = ["商学部","経済学部","経営学部","理学部","工学部","医学部医学科","医学部看護学科","生活科学部"]
    
    //セクション分けで使用する配列
    var mySections: [NSString] = ["一般","専門"]
    
    //選択学部を選別するための数字
    var courceNumber:Int?
    
    //投稿ボタン
    var post_button: UIBarButtonItem!
    
    /********************************Build実行*******************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "過去問共有"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 178/255, green: 7/255, blue: 13/255, alpha: 1.0)
        
        
        let navigationBarHeight: CGFloat = (self.navigationController?.navigationBar.frame.size.height)!
        
        
        //statusBarの高さを取得する
        let statusBarHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        
        //画面サイズを取得
        let width: CGFloat! = self.view.bounds.width
        let height: CGFloat! = self.view.bounds.height
        
        
        
        //テーブルを表示
        myTable = UITableView(frame: CGRectMake(0,  navigationBarHeight + statusBarHeight, width, height - navigationBarHeight))
        myTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        myTable.dataSource = self
        myTable.delegate = self
        self.view.addSubview(myTable)
        
        post_button = UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: "onClick")
        self.navigationItem.rightBarButtonItem = post_button
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    /***********************************デバッグ*******************************************/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    /**********************************関数宣言ゾーン*******************************************/
    
    func onClick(){
        let VC = PostViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
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
            return myTableItems_all.count
        }else if section == 1{
            return myTableItems_major.count
        }else{
            return 0
        }
        
    }
    
    //Cellが選択された際に呼び出される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.section == 0 && indexPath.row == 0){
            courceNumber = 0
        }else if (indexPath.section == 1){
            if(indexPath.row == 0){
                courceNumber = 1
            }else if(indexPath.row == 1){
                courceNumber = 2
            }else if(indexPath.row == 2){
                courceNumber = 3
            }else if(indexPath.row == 3){
                courceNumber = 4
            }else if(indexPath.row == 4){
                courceNumber = 5
            }else if(indexPath.row == 5){
                courceNumber = 6
            }else if(indexPath.row == 6){
                courceNumber = 7
            }else if(indexPath.row == 7){
                courceNumber = 8
            }
        }
        
        
        
        var VC1 = ScheduleViewController()
        VC1.courceNumber = courceNumber
        
        self.navigationController?.pushViewController(VC1, animated: true)
       
        
        
    }
    
    //Cellに値を設定する
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        if (indexPath.section == 0){
            cell.textLabel?.text = "\(myTableItems_all[indexPath.row])"
        }else if (indexPath.section == 1){
            cell.textLabel?.text = "\(myTableItems_major[indexPath.row])"
        }
        
        return cell
    }
    
    
    
    
}