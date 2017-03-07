//
//  ViewController.swift
//  SportsStoreDemo
//
//  Created by OnlyStu on 2017/3/5.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource{
 
    @IBOutlet weak var totalStockLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
//换成模版前
//    var products = [
//        ("Kayak","A boat for one person","Watersports",275.0,10),
//        ("Lifejecket","Protective and fashionable","Watersports",48.95,14),
//        ("Soccer Ball","FIFA-approved size and weight","Soccer",19.5,32),
//        ("Coner Flags","Give your playing field a professional touch","Soccer",34.95,1),
//        ("Stadium","Flat-packed 35,000-seat stadium","Soccer",79500.0,4 ),
//        ("Thinking Cap","Improve your brain efficiency by 75%","Chess",16.0,8),
//        ("Unstedy Chair","Secretly give your opponent a disadvantage","Chess",29.95,3),
//        ("Human Chess Board","A fun game for the family","Chess",75.0,2),
//        ("Bling-Bling King","Gold-plated,diamond-studded King","Chess",79500.0,4)]
    
    //换成模版后
    var products = [
    
        Product.init(name: "Kayak", description: "A boat for one person", category: "Watersports", price: 275.0, stockLevel: 10),
        Product.init(name: "Lifejecket", description: "Protective and fashionable", category: "Watersports", price: 48.95, stockLevel: 14),
        Product.init(name: "Soccer Ball", description: "FIFA-approved size and weight", category: "Soccer", price: 19.5, stockLevel: 32),
        Product.init(name: "Coner Flags", description: "Give your playing field a professional touch", category: "Soccer", price: 34.95, stockLevel: 1),
        Product.init(name: "Stadium", description: "Flat-packed 35,000-seat stadium", category: "Soccer", price: 79500.0, stockLevel: 4),
        Product.init(name: "Thinking Cap", description: "Improve your brain efficiency by 75%", category: "Chess", price: 16.0, stockLevel: 8),
        Product.init(name: "Unstedy Chair", description: "Secretly give your opponent a disadvantage", category: "Chess", price: 29.95, stockLevel: 3),
        Product.init(name: "Human Chess Board", description: "A fun game for the family", category: "Chess", price: 75.0, stockLevel: 2),
        Product.init(name: "Bling-Bling King", description: "Gold-plated,diamond-studded King", category: "Chess", price: 79500.0, stockLevel: 4),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
       
         dispalyStockTotal()
        }
    
    func dispalyStockTotal(){
        
        //reduce就是遍历每个数组元素，并执行闭包
        //这里表达的意思是，所有的 product.4相加
//换成模版前
//        let stockTotal = products.reduce(0) { (total, product) -> Int in
//            total + product.stockLevel
//        }
//        totalStockLabel.text = "\(stockTotal) Products in Stock"
        
        //遍历数组，返回两个值
        let finalTotals:(Int,Double) = products.reduce((0,0.0)) { (total, product) -> (Int,Double) in
            
            return(
            
                total.0 + product.stockLevel,
                total.1 + product.stockValue
            )
        }
        totalStockLabel.text = "\(finalTotals.0) Products in Stock." + "Total Value:\(Utils.currencyStringFromNumber(number: finalTotals.1))"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let product = products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductTableCell
        
        //记录当前的row值，为后面修改textFiled、steppter改变值用
//换成模版前
//        cell.productId = indexPath.row
//        
//        cell.nameLabel.text = product.0
//        cell.descriptionLabel.text = product.1
//        cell.stockStepper.value = Double(product.4)
//        cell.stockField.text = String(product.4)
        
        cell.product = products[indexPath.row]
        cell.nameLabel.text = product.name
        cell.descriptionLabel.text = product.description
        cell.stockStepper.value = Double(product.stockLevel)
        cell.stockField.text = String(product.stockLevel)
        
        return cell
    }
    
 
    @IBAction func stockLevelDidChanged(_ sender: Any) {
        //当前控件
        if var currentCell = sender as? UIView{
        
            while true {
                //当前控件的父视图
                currentCell = currentCell.superview!
                //如果父视图是ProductTableCell
                if let cell = currentCell as? ProductTableCell {
                    //得到当前row
//换成模版前
//                    if let id = cell.productId {
//                        var newStockLevel:Int?
//                        
//                        //stepper、textfield的value改变方法是同一个
//                        //value给newStockLevel赋值
//                        if let stepper = sender as? UIStepper{
//                            
//                            newStockLevel = Int(stepper.value);
//                        }
//                        else if let textfield = sender as? UITextField {
//                        
//                            newStockLevel = Int((textfield.text)!)
//                        }
//                        
//                        //最后把newStockLevel赋值给product.4
//                        if let level = newStockLevel {
//                            products[id].4 = level
//                            cell.stockField.text = String(level)
//                        }
                    if let product = cell.product {
                        
                        if let stepper = sender as? UIStepper{
                        
                            product.stockLevel = Int(stepper.value)
                        }
                        else if let textfield = sender as? UITextField{
                            
                            product.stockLevel = Int((textfield.text)!)!
                        }
                        cell.stockStepper.value = Double(product.stockLevel)
                        cell.stockField.text = String(product.stockLevel)
                    
                }
                    //执行完跳出循环
                    break
                }
            }
            //刷新label的值
             dispalyStockTotal()
        }
    }
}

