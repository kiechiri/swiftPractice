//
//  ScheduleViewController.swift
//  CregitGetter2.0
//
//  Created by 綿岡晃輝 on 2015/10/22.
//  Copyright © 2015年 綿岡晃輝. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView :UITableView?
    var open:Bool = false
    var dayOfTheWeek_close: [String] = ["月曜日","火曜日","水曜日","木曜日","金曜日"]
    var selectedNumber: Int = 0
    var courceNumber:Int?
    let BarHeight: CGFloat = 50
    //投稿ボタン
    var post_button: UIBarButtonItem!

    
    
    
    //セクションの配列
    //extendが広げるかどうかのBool
    var sections: [(title: String, details: [String], extended: Bool)] = []
    
    
    /*************************Build実行*******************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "時間指定"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 178/255, green: 7/255, blue: 13/255, alpha: 1.0)
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        //セクションに値を与える
        self.getSectionsValue_close()
        
        //tableviewを作る
        self.createTableView()
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        self.navigationController?.navigationBar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        post_button = UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: "onClick")
        self.navigationItem.rightBarButtonItem = post_button
        
    }
    
    /*******************************デバック*******************************/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*****************************関数宣言ゾーン****************************/
    
    func onClick(){
        let VC = PostViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    /*セクションの数を返す*/
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    /*セルの数を返す*/
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowInSection = sections[section].extended ? sections[section].details.count + 1 : 1
        return rowInSection
    }
    
    /*セルを返す*/
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let titleCellId = "TitleCell"
        let detailsCellId = "DetailsCell"
        
        let section = sections[indexPath.section]
        
        var cell: UITableViewCell?
        var cellId: String
        if 0 == indexPath.row {
            cellId = titleCellId
        }else{
            cellId = detailsCellId
        }
        
        cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        
        if nil == cell {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }else{
            // toExpand
        }
        
        //曜日を代入
        if 0 == indexPath.row {
            cell?.textLabel?.text = section.title
        }
            //時限を代入
        else{
            cell?.textLabel?.text = "  \(section.details[indexPath.row - 1])"
        }
        
        if (indexPath.row == 0){
            cell?.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.04)
        }
        
        return cell!
    }
    
    /*セルが選択された時に呼び出される*/
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0 {
            
            //extendのBoolを変更する
            sections[indexPath.section].extended = !sections[indexPath.section].extended
            open = !open
            
            //extend = false
            if !sections[indexPath.section].extended{
                self.toContract(tableView, indexPath: indexPath)
            }
                
                //extend = ture
            else{
                self.toExpand(tableView, indexPath: indexPath)
            }
            
        }
        
        if (indexPath.section == 0 && indexPath.row == 1){
            selectedNumber = 11
        }else if(indexPath.section == 0 && indexPath.row == 2){
            selectedNumber = 12
        }else if(indexPath.section == 0 && indexPath.row == 3){
            selectedNumber = 13
        }else if(indexPath.section == 0 && indexPath.row == 4){
            selectedNumber = 14
        }else if(indexPath.section == 0 && indexPath.row == 5){
            selectedNumber = 15
        }else if(indexPath.section == 1 && indexPath.row == 1){
            selectedNumber = 21
        }else if(indexPath.section == 1 && indexPath.row == 2){
            selectedNumber = 22
        }else if(indexPath.section == 1 && indexPath.row == 3){
            selectedNumber = 23
        }else if(indexPath.section == 1 && indexPath.row == 4){
            selectedNumber = 24
        }else if(indexPath.section == 1 && indexPath.row == 5){
            selectedNumber = 25
        }else if(indexPath.section == 2 && indexPath.row == 1){
            selectedNumber = 31
        }else if(indexPath.section == 2 && indexPath.row == 2){
            selectedNumber = 32
        }else if(indexPath.section == 2 && indexPath.row == 3){
            selectedNumber = 33
        }else if(indexPath.section == 2 && indexPath.row == 4){
            selectedNumber = 34
        }else if(indexPath.section == 2 && indexPath.row == 5){
            selectedNumber = 35
        }else if(indexPath.section == 3 && indexPath.row == 1){
            selectedNumber = 41
        }else if(indexPath.section == 3 && indexPath.row == 2){
            selectedNumber = 42
        }else if(indexPath.section == 3 && indexPath.row == 3){
            selectedNumber = 43
        }else if(indexPath.section == 3 && indexPath.row == 4){
            selectedNumber = 44
        }else if(indexPath.section == 3 && indexPath.row == 5){
            selectedNumber = 45
        }else if(indexPath.section == 4 && indexPath.row == 1){
            selectedNumber = 51
        }else if(indexPath.section == 4 && indexPath.row == 2){
            selectedNumber = 52
        }else if(indexPath.section == 4 && indexPath.row == 3){
            selectedNumber = 53
        }else if(indexPath.section == 4 && indexPath.row == 4){
            selectedNumber = 54
        }else if(indexPath.section == 4 && indexPath.row == 5){
            selectedNumber = 55
        }
        
        if(indexPath.row != 0){
            
            
            var VC1 = Subject1ViewController()
            let VC2 = Subject2ViewController()
            
            if(courceNumber == 0){
                VC1.selectedNumber = selectedNumber
                VC1.courceNumber = courceNumber
                
                self.navigationController?.pushViewController(VC1, animated: true)
                
            }else{
                VC2.selectedNumber = selectedNumber
                VC2.courceNumber = courceNumber
                
                self.navigationController?.pushViewController(VC2, animated: true)
                
            }
        }
        
        
        
        // deselec
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    /*detailsを閉じる*/
    /// - parameter tableView: self.tableView
    /// - parameter indexPath: NSIndexPath
    /// - returns:
    private func toContract(tableView: UITableView, indexPath: NSIndexPath) {
        let startRow = indexPath.row + 1
        let endRow = sections[indexPath.section].details.count + 1
        
        var indexPaths: [NSIndexPath] = []
        for var i = startRow; i < endRow; i++ {
            indexPaths.append(NSIndexPath(forRow: i , inSection: indexPath.section))
        }
        
        tableView.deleteRowsAtIndexPaths(indexPaths,
            withRowAnimation: UITableViewRowAnimation.Fade)
    }
    
    /*open detailsを開く*/
    /// - parameter tableView: self.tableView
    /// - parameter indexPath: NSIndexPath
    /// - returns:
    private func toExpand(tableView: UITableView, indexPath: NSIndexPath) {
        let startRow = indexPath.row + 1
        let endRow = sections[indexPath.section].details.count + 1
        
        var indexPaths: [NSIndexPath] = []
        for var i = startRow; i < endRow; i++ {
            indexPaths.append(NSIndexPath(forRow: i, inSection: indexPath.section))
        }
        
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Fade)
        
        // scroll to the selected cell.
        tableView.scrollToRowAtIndexPath(NSIndexPath(
            forRow: indexPath.row, inSection: indexPath.section),
            atScrollPosition: UITableViewScrollPosition.Top, animated: true)
    }
    
    /*tableviewを作る*/
    private func createTableView(){
        
        // status bar height
        let statusBarHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得する.
        let frameWidth: CGFloat = self.view.frame.width
        let frameHeight: CGFloat = self.view.frame.height
        
        let navigationBarHeight: CGFloat = (self.navigationController?.navigationBar.frame.size.height)!
        
        tableView = UITableView(frame: CGRectMake(0,  0, frameWidth, frameHeight - navigationBarHeight))
        self.view.addSubview(tableView!)
        
        
    }
    
    
    
    /*セクションに値を与える*/
    func getSectionsValue_close(){
        
        var details: [String]
        details = []
        
        details.append("   １限目")
        details.append("   ２限目")
        details.append("   ３限目")
        details.append("   ４限目")
        details.append("   ５限目")
        sections.append((title: dayOfTheWeek_close[0], details: details, extended: false))
        
        
        
        details = []
        details.append("   １限目")
        details.append("   ２限目")
        details.append("   ３限目")
        details.append("   ４限目")
        details.append("   ５限目")
        sections.append((title: dayOfTheWeek_close[1], details: details, extended: false))
        
        details = []
        details.append("   １限目")
        details.append("   ２限目")
        details.append("   ３限目")
        details.append("   ４限目")
        details.append("   ５限目")
        sections.append((title: dayOfTheWeek_close[2], details: details, extended: false))
        
        
        details = []
        details.append("   １限目")
        details.append("   ２限目")
        details.append("   ３限目")
        details.append("   ４限目")
        details.append("   ５限目")
        sections.append((title: dayOfTheWeek_close[3], details: details, extended: false))
        
        
        details = []
        details.append("   １限目")
        details.append("   ２限目")
        details.append("   ３限目")
        details.append("   ４限目")
        details.append("   ５限目")
        sections.append((title: dayOfTheWeek_close[4], details: details, extended: false))
    }
    
}
