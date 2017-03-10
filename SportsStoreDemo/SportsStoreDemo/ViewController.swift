//
//  ViewController.swift
//  SportsStoreDemo
//
//  Created by OnlyStu on 2017/3/5.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import UIKit

var handler = {(p:Product) in

    print("Change:\(p.name) \(p.stockLevel) items in stock")
}

class ViewController: UIViewController,UITableViewDataSource{
 
    @IBOutlet weak var totalStockLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let logger = Logger<Product>(callback:handler)
    //tip:对象模版模式
    //换成模版后
    var products = [
    
        Product.init(name: "Kayak",
                     description: "A boat for one person",
                     category: "Watersports",
                     price: 275.0,
                     stockLevel: 10),
        
        Product.init(name: "Lifejecket",
                     description: "Protective and fashionable",
                     category: "Watersports",
                     price: 48.95,
                     stockLevel: 14),
        
        Product.init(name: "Soccer Ball",
                     description: "FIFA-approved size and weight",
                     category: "Soccer",
                     price: 19.5,
                     stockLevel: 32),
        
        Product.init(name: "Coner Flags",
                     description: "Give your playing field a professional touch",
                     category: "Soccer",
                     price: 34.95,
                     stockLevel: 1),
        
        Product.init(name: "Stadium",
                     description: "Flat-packed 35,000-seat stadium",
                     category: "Soccer",
                     price: 79500.0,
                     stockLevel: 4),
        
        Product.init(name: "Thinking Cap",
                     description: "Improve your brain efficiency by 75%",
                     category: "Chess",
                     price: 16.0,
                     stockLevel: 8),
        
        Product.init(name: "Unstedy Chair",
                     description: "Secretly give your opponent a disadvantage",
                     category: "Chess",
                     price: 29.95,
                     stockLevel: 3),
        
        Product.init(name: "Human Chess Board",
                     description: "A fun game for the family",
                     category: "Chess",
                     price: 75.0,
                     stockLevel: 2),
        
        Product.init(name: "Bling-Bling King",
                     description: "Gold-plated,diamond-studded King",
                     category: "Chess",
                     price: 79500.0,
                     stockLevel: 4),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
       
         dispalyStockTotal()
        }
    
    func dispalyStockTotal(){
        
        //reduce就是遍历每个数组元素，并执行闭包
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
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductTableCell
        
        //记录当前的row值，为后面修改textFiled、steppter改变值用
        let product = products[indexPath.row]
        cell.product = products[indexPath.row]
        cell.nameLabel.text = product.name
        cell.descriptionLabel.text = product.productDescription
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
                    if let product = cell.product {
                        
                        if let stepper = sender as? UIStepper{
                        
                            product.stockLevel = Int(stepper.value)
                        }
                        else if let textfield = sender as? UITextField{
                            
                            product.stockLevel = Int((textfield.text)!)!
                        }
                        cell.stockStepper.value = Double(product.stockLevel)
                        cell.stockField.text = String(product.stockLevel)
                        logger.logItem(item: product)
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

