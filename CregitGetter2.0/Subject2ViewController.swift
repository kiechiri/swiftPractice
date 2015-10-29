//
//  Subject2ViewController.swift
//  CregitGetter2.0
//
//  Created by 綿岡晃輝 on 2015/10/22.
//  Copyright © 2015年 綿岡晃輝. All rights reserved.
//

import UIKit

class Subject2ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var selectedNumber :Int!
    var courceNumber:Int!
    
    //投稿ボタン
    var post_button: UIBarButtonItem!

    
    
    var tableItems_1:[NSString] = []
    var tableItems_2:[NSString] = []
    var tableItems_3:[NSString] = []
    var tableItems_4:[NSString] = []
    var tableItems_5:[NSString] = []
    var tableItems_6:[NSString] = []
    var tableItems_7:[NSString] = []
    var tableItems_8:[NSString] = []
    var tableItems_9:[NSString] = []
    var mySections: [NSString?] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "講義選択"
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 178/255, green: 7/255, blue: 13/255, alpha: 1.0)
        
        post_button = UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: "onClick")
        self.navigationItem.rightBarButtonItem = post_button
        
        if (selectedNumber == 11){
            tableItems_1 = ["科目名a"]
            tableItems_2 = ["科目名b"]
            tableItems_3 = ["科目名c"]
            tableItems_4 = ["科目名d"]
            tableItems_5 = ["科目名e"]
            tableItems_6 = ["科目名f"]
            tableItems_7 = ["科目名g"]
            tableItems_8 = ["科目名h"]
            tableItems_9 = ["科目名i"]
        }else if (selectedNumber == 12){
            tableItems_1 = ["科目名j"]
            tableItems_2 = ["科目名l"]
            tableItems_3 = ["科目名m"]
            tableItems_4 = ["科目名o"]
            tableItems_5 = ["科目名p"]
            tableItems_6 = ["科目名q"]
            tableItems_7 = ["科目名r"]
            tableItems_8 = ["科目名t"]
            tableItems_9 = ["科目名u"]
        }else if (selectedNumber == 13){
            tableItems_1 = ["科目名v"]
            tableItems_2 = ["科目名w"]
            tableItems_3 = ["科目名x"]
            tableItems_4 = ["科目名y"]
            tableItems_5 = ["科目名z"]
            tableItems_6 = ["科目名f"]
            tableItems_7 = ["科目名g"]
            tableItems_8 = ["科目名h"]
            tableItems_9 = ["科目名i"]
        }else if (selectedNumber == 14){
            tableItems_1 = ["科目名a"]
            tableItems_2 = ["科目名b"]
            tableItems_3 = ["科目名c"]
            tableItems_4 = ["科目名d"]
            tableItems_5 = ["科目名e"]
            tableItems_6 = ["科目名f"]
            tableItems_7 = ["科目名g"]
            tableItems_8 = ["科目名h"]
            tableItems_9 = ["科目名i"]
        }else if (selectedNumber == 15){
            tableItems_1 = ["科目名a"]
            tableItems_2 = ["科目名b"]
            tableItems_3 = ["科目名c"]
            tableItems_4 = ["科目名d"]
            tableItems_5 = ["科目名e"]
            tableItems_6 = ["科目名f"]
            tableItems_7 = ["科目名g"]
            tableItems_8 = ["科目名h"]
            tableItems_9 = ["科目名i"]
        }else if (selectedNumber == 21){
            tableItems_1 = ["科目名a"]
            tableItems_2 = ["科目名b"]
            tableItems_3 = ["科目名c"]
            tableItems_4 = ["科目名d"]
            tableItems_5 = ["科目名e"]
            tableItems_6 = ["科目名f"]
            tableItems_7 = ["科目名g"]
            tableItems_8 = ["科目名h"]
            tableItems_9 = ["科目名i"]
        }else if (selectedNumber == 22){
            tableItems_1 = ["科目名a"]
            tableItems_2 = ["科目名b"]
            tableItems_3 = ["科目名c"]
            tableItems_4 = ["科目名d"]
            tableItems_5 = ["科目名e"]
            tableItems_6 = ["科目名f"]
            tableItems_7 = ["科目名g"]
            tableItems_8 = ["科目名h"]
            tableItems_9 = ["科目名i"]
        }else if (selectedNumber == 23){
            tableItems_1 = ["科目名a"]
            tableItems_2 = ["科目名b"]
            tableItems_3 = ["科目名c"]
            tableItems_4 = ["科目名d"]
            tableItems_5 = ["科目名e"]
            tableItems_6 = ["科目名f"]
            tableItems_7 = ["科目名g"]
            tableItems_8 = ["科目名h"]
            tableItems_9 = ["科目名i"]
        }else if (selectedNumber == 24){
            tableItems_1 = ["科目名a"]
            tableItems_2 = ["科目名b"]
            tableItems_3 = ["科目名c"]
            tableItems_4 = ["科目名d"]
            tableItems_5 = ["科目名e"]
            tableItems_6 = ["科目名f"]
            tableItems_7 = ["科目名g"]
            tableItems_8 = ["科目名h"]
            tableItems_9 = ["科目名i"]
        }else if (selectedNumber == 25){
            tableItems_1 = ["科目名a"]
            tableItems_2 = ["科目名b"]
            tableItems_3 = ["科目名c"]
            tableItems_4 = ["科目名d"]
            tableItems_5 = ["科目名e"]
            tableItems_6 = ["科目名f"]
            tableItems_7 = ["科目名g"]
            tableItems_8 = ["科目名h"]
            tableItems_9 = ["科目名i"]
        }else if (selectedNumber == 31){
            tableItems_1 = ["科目名a"]
            tableItems_2 = ["科目名b"]
            tableItems_3 = ["科目名c"]
            tableItems_4 = ["科目名d"]
            tableItems_5 = ["科目名e"]
            tableItems_6 = ["科目名f"]
            tableItems_7 = ["科目名g"]
            tableItems_8 = ["科目名h"]
            tableItems_9 = ["科目名i"]
        }else if (selectedNumber == 32){
            tableItems_1 = ["科目名a"]
            tableItems_2 = ["科目名b"]
            tableItems_3 = ["科目名c"]
            tableItems_4 = ["科目名d"]
            tableItems_5 = ["科目名e"]
            tableItems_6 = ["科目名f"]
            tableItems_7 = ["科目名g"]
            tableItems_8 = ["科目名h"]
            tableItems_9 = ["科目名i"]
        }else if (selectedNumber == 33){
            tableItems_1 = []
            tableItems_2 = []
            tableItems_3 = []
            tableItems_4 = []
            tableItems_5 = []
            tableItems_6 = []
            tableItems_7 = []
            tableItems_8 = []
            tableItems_9 = []
        }else if (selectedNumber == 34){
            tableItems_1 = []
            tableItems_2 = []
            tableItems_3 = []
            tableItems_4 = []
            tableItems_5 = []
            tableItems_6 = []
            tableItems_7 = []
            tableItems_8 = []
            tableItems_9 = []
        }else if (selectedNumber == 35){
            tableItems_1 = []
            tableItems_2 = []
            tableItems_3 = []
            tableItems_4 = []
            tableItems_5 = []
            tableItems_6 = []
            tableItems_7 = []
            tableItems_8 = []
            tableItems_9 = []
        }else if (selectedNumber == 41){
            tableItems_1 = []
            tableItems_2 = []
            tableItems_3 = []
            tableItems_4 = []
            tableItems_5 = []
            tableItems_6 = []
            tableItems_7 = []
            tableItems_8 = []
            tableItems_9 = []
        }else if (selectedNumber == 42){
            tableItems_1 = []
            tableItems_2 = []
            tableItems_3 = []
            tableItems_4 = []
            tableItems_5 = []
            tableItems_6 = []
            tableItems_7 = []
            tableItems_8 = []
            tableItems_9 = []
        }else if (selectedNumber == 43){
            tableItems_1 = []
            tableItems_2 = []
            tableItems_3 = []
            tableItems_4 = []
            tableItems_5 = []
            tableItems_6 = []
            tableItems_7 = []
            tableItems_8 = []
            tableItems_9 = []
        }else if (selectedNumber == 44){
            tableItems_1 = []
            tableItems_2 = []
            tableItems_3 = []
            tableItems_4 = []
            tableItems_5 = []
            tableItems_6 = []
            tableItems_7 = []
            tableItems_8 = []
            tableItems_9 = []
        }else if (selectedNumber == 45){
            tableItems_1 = []
            tableItems_2 = []
            tableItems_3 = []
            tableItems_4 = []
            tableItems_5 = []
            tableItems_6 = []
            tableItems_7 = []
            tableItems_8 = []
            tableItems_9 = []
        }else if (selectedNumber == 51){
            tableItems_1 = []
            tableItems_2 = []
            tableItems_3 = []
            tableItems_4 = []
            tableItems_5 = []
            tableItems_6 = []
            tableItems_7 = []
            tableItems_8 = []
            tableItems_9 = []
        }else if (selectedNumber == 52){
            tableItems_1 = []
            tableItems_2 = []
            tableItems_3 = []
            tableItems_4 = []
            tableItems_5 = []
            tableItems_6 = []
            tableItems_7 = []
            tableItems_8 = []
            tableItems_9 = []
        }else if (selectedNumber == 53){
            tableItems_1 = []
            tableItems_2 = []
            tableItems_3 = []
            tableItems_4 = []
            tableItems_5 = []
            tableItems_6 = []
            tableItems_7 = []
            tableItems_8 = []
            tableItems_9 = []
        }else if (selectedNumber == 54){
            tableItems_1 = []
            tableItems_2 = []
            tableItems_3 = []
            tableItems_4 = []
            tableItems_5 = []
            tableItems_6 = []
            tableItems_7 = []
            tableItems_8 = []
            tableItems_9 = []
        }else if (selectedNumber == 55){
            tableItems_1 = []
            tableItems_2 = []
            tableItems_3 = []
            tableItems_4 = []
            tableItems_5 = []
            tableItems_6 = []
            tableItems_7 = []
            tableItems_8 = []
            tableItems_9 = []
            tableItems_9 = []
        }
        
        //画面サイズを取得
        let width: CGFloat! = self.view.bounds.width
        let height: CGFloat! = self.view.bounds.height
        
        var myTable:UITableView
        
        //テーブルを表示
        myTable = UITableView(frame: CGRectMake(0, 20, width, height - 20))
        myTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        myTable.dataSource = self
        myTable.delegate = self
        self.view.addSubview(myTable)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
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
            return tableItems_1.count
        }else if section == 1{
            return tableItems_2.count
        }else if section == 2{
            return tableItems_3.count
        }else if section == 3{
            return tableItems_4.count
        }else if section == 4{
            return tableItems_5.count
        }else if section == 5{
            return tableItems_6.count
        }else if section == 6{
            return tableItems_7.count
        }else if section == 7{
            return tableItems_8.count
        }else if section == 8{
            return tableItems_9.count
        }
        else{
            return 0
        }
        
    }
    //Cellに値を設定する
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        if (indexPath.section == 0){
            cell.textLabel?.text = "\(tableItems_1[indexPath.row])"
        }else if (indexPath.section == 1){
            cell.textLabel?.text = "\(tableItems_2[indexPath.row])"
        }else if (indexPath.section == 2){
            cell.textLabel?.text = "\(tableItems_3[indexPath.row])"
        }else if (indexPath.section == 3){
            cell.textLabel?.text = "\(tableItems_4[indexPath.row])"
        }else if (indexPath.section == 4){
            cell.textLabel?.text = "\(tableItems_5[indexPath.row])"
        }else if (indexPath.section == 5){
            cell.textLabel?.text = "\(tableItems_6[indexPath.row])"
        }else if (indexPath.section == 6){
            cell.textLabel?.text = "\(tableItems_7[indexPath.row])"
        }else if (indexPath.section == 7){
            cell.textLabel?.text = "\(tableItems_8[indexPath.row])"
        }else if (indexPath.section == 8){
            cell.textLabel?.text = "\(tableItems_9[indexPath.row])"
        }
        
        return cell
    }
    //Cellが選択された際に呼び出される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.section == 0 && indexPath.row == 0){
            let VC1 = BrowseViewController()
            
            self.navigationController?.pushViewController(VC1, animated: true)
            
        }
    }
}