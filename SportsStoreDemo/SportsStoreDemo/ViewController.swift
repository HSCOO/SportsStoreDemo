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
    var products = [
        ("Kayak","A boat for one person","Watersports",275.0,10),
        ("Lifejecket","Protective and fashionable","Watersports",48.95,14),
        ("Soccer Ball","FIFA-approved size and weight","Soccer",19.5,32),
        ("Coner Flags","Give your playing field a professional touch","Soccer",34.95,1),
        ("Stadium","Flat-packed 35,000-seat stadium","Soccer",79500.0,4 ),
        ("Thinking Cap","Improve your brain efficiency by 75%","Chess",16.0,8),
        ("Unstedy Chair","Secretly give your opponent a disadvantage","Chess",29.95,3),
        ("Human Chess Board","A fun game for the family","Chess",75.0,2),
        ("Bling-Bling King","Gold-plated,diamond-studded King","Chess",79500.0,4)]

    override func viewDidLoad() {
        super.viewDidLoad()
       
         dispalyStockTotal()
        }
    
    func dispalyStockTotal(){
        
        //reduce就是遍历每个数组元素，并执行闭包
        //这里表达的意思是，所有的 product.4相加
        let stockTotal = products.reduce(0) { (total, product) -> Int in
            total + product.4
        }
        totalStockLabel.text = "\(stockTotal) Products in Stock"
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let product = products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductTableCell
        
        //记录当前的row值，为后面修改textFiled、steppter改变值用
        cell.productId = indexPath.row
        
        cell.nameLabel.text = product.0
        cell.descriptionLabel.text = product.1
        cell.stockStepper.value = Double(product.4)
        cell.stockField.text = String(product.4)
        
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
                    //得到当前row值
                    if let id = cell.productId {
                        var newStockLevel:Int?
                        
                        //stepper、textfield的value改变方法是同一个
                        //value给newStockLevel赋值
                        if let stepper = sender as? UIStepper{
                            
                            newStockLevel = Int(stepper.value);
                        }
                        else if let textfield = sender as? UITextField {
                        
                            newStockLevel = Int((textfield.text)!)
                        }
                        
                        //最后把newStockLevel赋值给product.4
                        if let level = newStockLevel {
                            products[id].4 = level
                            cell.stockField.text = String(level)
                        }
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

