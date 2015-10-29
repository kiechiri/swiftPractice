//
//  Subject1ViewController.swift
//  CregitGetter2.0
//
//  Created by 綿岡晃輝 on 2015/10/22.
//  Copyright © 2015年 綿岡晃輝. All rights reserved.
//

import UIKit

class Subject1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView :UITableView?
    var open:Bool = false
    var subjectPart: [String] = ["一般教育科目","基礎教育科目","外国語科目","健康スポーツ科目"]
    var selectedNumber: Int?
    var courceNumber:Int?
    var selectedClassName: String?
    
    //投稿ボタン
    var post_button: UIBarButtonItem!

    
    //セクションの配列
    //extendが広げるかどうかのBool
    var sections: [(title: String, details: [String], extended: Bool)] = []
    
    
    /*************************Build実行*******************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "講義選択"
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 178/255, green: 7/255, blue: 13/255, alpha: 1.0)
        
        
        //セクションに値を与える
        if (selectedNumber == 11){
           self.getSectionsValue_11()
        }else if (selectedNumber == 12){
           self.getSectionsValue_12()
        }else if (selectedNumber == 13){
            self.getSectionsValue_13()
        }else if (selectedNumber == 14){
            self.getSectionsValue_14()
        }else if (selectedNumber == 15){
            self.getSectionsValue_15()
        }else if (selectedNumber == 21){
            self.getSectionsValue_21()
        }else if (selectedNumber == 22){
            self.getSectionsValue_22()
        }else if (selectedNumber == 23){
            self.getSectionsValue_23()
        }else if (selectedNumber == 24){
            self.getSectionsValue_24()
        }else if (selectedNumber == 25){
            self.getSectionsValue_25()
        }else if (selectedNumber == 31){
            self.getSectionsValue_31()
        }else if (selectedNumber == 32){
            self.getSectionsValue_32()
        }else if (selectedNumber == 33){
            self.getSectionsValue_33()
        }else if (selectedNumber == 34){
            self.getSectionsValue_34()
        }else if (selectedNumber == 35){
            self.getSectionsValue_35()
        }else if (selectedNumber == 41){
            self.getSectionsValue_41()
        }else if (selectedNumber == 42){
            self.getSectionsValue_42()
        }else if (selectedNumber == 43){
            self.getSectionsValue_43()
        }else if (selectedNumber == 44){
            self.getSectionsValue_44()
        }else if (selectedNumber == 45){
            self.getSectionsValue_45()
        }else if (selectedNumber == 51){
            self.getSectionsValue_51()
        }else if (selectedNumber == 52){
            self.getSectionsValue_52()
        }else if (selectedNumber == 53){
            self.getSectionsValue_53()
        }else if (selectedNumber == 54){
            self.getSectionsValue_54()
        }else if (selectedNumber == 55){
            self.getSectionsValue_55()
        }
        
        
        //tableviewを作る
        self.createTableView()
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
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
        
        //四分割の代入
        if 0 == indexPath.row {
            cell?.textLabel?.text = section.title
        }
        //講義名の代入
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
        
        
        
        if(indexPath.row != 0){
            
            
            let VC1 = BrowseViewController()
            VC1.selectedNumber = selectedNumber
            VC1.courceNumber = courceNumber
            VC1.seletedClassName = selectedClassName
            
            
            self.navigationController?.pushViewController(VC1, animated: true)
            
        }
        
        
        
        // deselec.
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
    func getSectionsValue_11(){
        
        var details: [String]
        details = []
        details.append("   ")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   応用数学B")
        details.append("　　基礎物理学2")
        details.append("　　基礎物理学2-E")
        details.append("　　入門物理学2")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   College English 3")
        details.append("　　ドイツ語基礎 3")
        details.append("　　フランス語基礎 3")
        details.append("　　中国語基礎 3")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("　　")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_12(){
        
        var details: [String]
        details = []
        details.append("   数学の考え方 2")
        details.append("　　植物の機能と人間社会?") //読めない
        details.append("　　芸術の世界")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   基礎有機化学 2")
        details.append("　　図形科学 2")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("　　College English 3")
        details.append("　　ドイツ語基礎 3")
        details.append("　　フランス語基礎 3")
        details.append("　　中国語基礎　3")
        details.append("　　ロシア語基礎 3")
        details.append("　　朝鮮語基礎 3")
        details.append("　　日本語 3B")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_13(){
        
        var details: [String]
        details = []
        details.append("   都市の地理学")
        details.append("   プログラミング入門")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   建設地学")
        details.append("   基礎物理学実験 2")
        details.append("   基礎化学実験 2")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   College English 3")
        details.append("   ドイツ語基礎 3")
        details.append("   フランス語基礎 3")
        details.append("   中国語基礎 3")
        details.append("   中国語特修 3")
        details.append("   ロシア語基礎 3")
        details.append("   朝鮮語基礎 3")
        details.append("   日本語 1B")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_14(){
        
        var details: [String]
        details = []
        details.append("   プログラミング入門")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   基礎数学B")
        details.append("   建築地学実習")
        details.append("   基礎物理学実験 2")
        details.append("   基礎化学実験 2")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   College English 3")
        details.append("   ドイツ語基礎 3")
        details.append("   フランス語基礎 3")
        details.append("   中国語基礎 3")
        details.append("   ロシア語基礎 3")
        details.append("   朝鮮語基礎 3")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_15(){
        
        var details: [String]
        details = []
        details.append("   ")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("　　基礎物理実験 2")
        details.append("　　基礎化学実験 2")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("　　College English 1 (再)")
        details.append("　　College English 2 (再)")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_21(){
        
        var details: [String]
        details = []
        details.append("   地球学入門")
        details.append("   地球の科学")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   解析4")
        details.append("   生物学概論A")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   College English 4")
        details.append("   ACE Critical Writing")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_22(){
        
        var details: [String]
        details = []
        details.append("   社会科学のフロンティア")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   解析2")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   Colegge English 4")
        details.append("   ACE Intensive Reading")
        details.append("   ドイツ語応用2B")
        details.append("   フランス語応用2B")
        details.append("   中国語応用2B")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   体力トレーニング科学")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_23(){
        
        var details: [String]
        details = []
        details.append("   日常の中の不思議を探す")
        details.append("   現代社会におけるキャリアデザイン")
        details.append("   ミクロとマクロの世界")
        details.append("   21世紀の植物の科学と食糧・環境問題")
        details.append("   西洋社会の歴史")
        details.append("   民族と社会")
        details.append("   現代の分子科学")
        details.append("   認知の仕組み")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   基礎有機化学 M")
        details.append("   基礎物理学実験 1")
        details.append("   基礎科学実験 1")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   College English 4")
        details.append("   ドイツ語特修8")
        details.append("   フランス語特修2")
        details.append("   中国語特修4")
        details.append("   朝鮮語特修4")
        details.append("   日本語2B")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   健康科学スポーツ実習")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_24(){
        
        var details: [String]
        details = []
        details.append("   プログラミング入門")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   基礎数学B")
        details.append("   建築地学実習")
        details.append("   基礎物理学実験2")
        details.append("   基礎科学実験2")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   College English 3")
        details.append("   ドイツ語基礎 3")
        details.append("   フランス語基礎 3")
        details.append("   中国語基礎 3")
        details.append("   中国語特修 3")
        details.append("   ロシア語基礎 3")
        details.append("   朝鮮語基礎 3")
        details.append("   日本語 1B")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_25(){
        
        var details: [String]
        details = []
        details.append("   ")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   基礎物理学実験2")
        details.append("   基礎化学実験2")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("　　")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_31(){
        
        var details: [String]
        details = []
        details.append("   情報の探索と利用")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   基礎物理学1A")
        details.append("   基礎物理学4")
        details.append("   基礎物理学4-E")
        details.append("   基礎無機化学")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   College English4")
        details.append("   ドイツ語基礎4")
        details.append("   フランス語基礎4")
        details.append("   中国語基礎4")
        details.append("   ロシア語基礎4")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_32(){
        
        var details: [String]
        details = []
        details.append("　　情報の探索と利用")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   基礎物理化学B")
        details.append("   生物学概論B")
        details.append("   生物学概論C")
        details.append("   生物学概論2")
        details.append("   一般地球学A2")
        details.append("   一般地球学B2")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   College English 4")
        details.append("   ACE Presentation")
        details.append("   ドイツ語基礎4")
        details.append("   フランス語基礎4")
        details.append("   中国語基礎4")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_33(){
        
        var details: [String]
        details = []
        details.append("   ドキュメンタリー環境と生命")
        details.append("   環境と文化")
        details.append("   現代社会と健康")
        details.append("   実験で知る自然の世界")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   College English 4")
        details.append("   ACE Films")
        details.append("   ドイツ語基礎4")
        details.append("   フランス語基礎4")
        details.append("   中国語基礎4")
        details.append("   中国語特修6")
        details.append("   ロシア語特修2")
        details.append("   朝鮮語基礎4")
        details.append("   朝鮮語特修2")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_34(){
        
        var details: [String]
        details = []
        details.append("   国際地域経済と都市")
        details.append("   東洋社会の歴史")
        details.append("   西洋美術の流れ")
        details.append("   行動と学習の心境")
        details.append("   メディアの社会学")
        details.append("   地域実践演習")
        details.append("   実験で知る自然の世界")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   College English4")
        details.append("   ドイツ語基礎4")
        details.append("   フランス語基礎4")
        details.append("   中国語基礎4")
        details.append("   ロシア語基礎4")
        details.append("   朝鮮語基礎4")
        details.append("   日本語5B")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_35(){
        
        var details: [String]
        details = []
        details.append("   現代都市論")
        details.append("   生命と進化")
        details.append("   歴史の中の大阪")
        details.append("   大阪学")
        details.append("   生死の論理")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("　　College English 1")
        details.append("　　College English 2")
        details.append("　　College English 3")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_41(){
        
        var details: [String]
        details = []
        details.append("   家族と社会")
        details.append("   言葉の歴史")
        details.append("   情報基礎")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   線形代数2")
        details.append("   物理学2")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("　　Coleege English 4")
        details.append("　　ACE: TOEIC650")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   健康・スポーツ科学実習")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_42(){
        
        var details: [String]
        details = []
        details.append("　　現代の地理学")
        details.append("   言語学入門")
        details.append("   日本と世界の教育")
        details.append("   情報化の光と影")
        details.append("   現代社会と健康")
        details.append("   情報基礎")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   College English 4")
        details.append("   ACE: TOEFL80")
        details.append("   ACE: TOEFL650")
        details.append("   ドイツ語特修2")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   健康・スポーツ科学実習")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_43(){
        
        var details: [String]
        details = []
        details.append("   教育と発達の心理学")
        details.append("   現代社会と大学")
        details.append("   ゲームで学ぶ社会行動")
        details.append("   日本社会の歴史")
        details.append("   プログラミング入門")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   統計学B")
        details.append("   基礎物理化学A")
        details.append("   基礎物理実験1")
        details.append("   化学実験")
        details.append("   生物学実験B")
        details.append("   地球学実験B")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   College English 4")
        details.append("   ACE: Media English")
        details.append("   ACE: TOEFL80+")
        details.append("   フランス語特修6")
        details.append("   中国語特修8")
        details.append("   朝鮮応用2A")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   健康運動科学")
        details.append("   健康・スポーツ科学講義")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_44(){
        
        var details: [String]
        details = []
        details.append("   環境と経済")
        details.append("   日本事情2B")
        details.append("   視覚文化の世界")
        details.append("   方と社会")
        details.append("   データから見る大阪都市")
        details.append("   プログラミング入門")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   生物学B")
        details.append("   化学実験")
        details.append("   生物学実験B")
        details.append("   地球学実験B")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("　　College English 4")
        details.append("　　ACE Crritical Writing")
        details.append("　　朝鮮語応用2B")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   健康・スポーツ科学講義")
        details.append("   スポーツ科学実践科学")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_45(){
        
        var details: [String]
        details = []
        details.append("   ")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   College English 5 (再)")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_51(){
        
        var details: [String]
        details = []
        details.append("   部落解放のフロンティア")
        details.append("   情報基礎")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_52(){
        
        var details: [String]
        details = []
        details.append("　　ジェンダーと現代社会2")
        details.append("　　エスミックスタディ")
        details.append("　　障がい者と人権2")
        details.append("　　平和と人権")
        details.append("　　世界のマイノリティ")
        details.append("　　日本事情1B")
        details.append("　　情報基礎")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_53(){
        
        var details: [String]
        details = []
        details.append("   地域実践演習1")
        details.append("   プログラミング入門")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   図形科学2")
        details.append("   入門物理学実践")
        details.append("   生物学実験B")
        details.append("   生物学実験M")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   ドイツ語応用2A")
        details.append("   ドイツ語特修4")
        details.append("   フランス語必修2A")
        details.append("   フランス語特修8")
        details.append("   中国語応用2A")
        details.append("   中国語特修10")
        details.append("   ロシア語特修4")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_54(){
        
        var details: [String]
        details = []
        details.append("   人権と多様性の研究")
        details.append("   都市・地域政策")
        details.append("   社会と統計")
        details.append("   プログラミング入門")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   応用数学C")
        details.append("   基礎物理学2")
        details.append("   入門物理学実験")
        details.append("   生物実験B")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   ドイツ語応用2A")
        details.append("   ドイツ語特修10")
        details.append("   フランス語応用2A")
        details.append("   フランス語特修10")
        details.append("   中国語応用2A")
        details.append("   ロシア語応用2A")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
    
    func getSectionsValue_55(){
        
        var details: [String]
        details = []
        details.append("   大阪の自然")
        details.append("   光と生命")
        details.append("   環境と法・行政")
        details.append("   技術と生命")
        details.append("   市大都市研究の最前線")
        sections.append((title: subjectPart[0], details: details, extended: false))
        
        details = []
        details.append("   図形科学")
        details.append("   生物学実験")
        sections.append((title: subjectPart[1], details: details, extended: false))
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[2], details: details, extended: false))
        
        
        details = []
        details.append("   ")
        sections.append((title: subjectPart[3], details: details, extended: false))
    }
}