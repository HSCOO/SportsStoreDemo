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
    
    var productStore = ProductDataSoure()
    
    //tip:对象模版模式
    //换成模版后
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        dispalyStockTotal()
        
        //回调刷新cell数据
        productStore.callback = {(p:Product) in
            
            for cell in self.tableView.visibleCells {
                
                if let pcell = cell as? ProductTableCell {
                    
                    if pcell.product?.name == p.name{
                        
                        pcell.stockStepper.value = Double(p.stockLevel)
                        pcell.stockField.text = String(p.stockLevel)
                    }
                }
            }
            self.dispalyStockTotal()
        }
    }
    
    func dispalyStockTotal(){
        
        //reduce就是遍历每个数组元素，并执行闭包
        //遍历数组，返回两个值
        let finalTotals:(Int,Double) = productStore.products.reduce((0,0.0)) { (total, product) -> (Int,Double) in
            
            return(
            
                total.0 + product.stockLevel,
                total.1 + product.stockValue
            )
        }
        totalStockLabel.text = "\(finalTotals.0) Products in Stock." + "Total Value:\(Utils.currencyStringFromNumber(number: finalTotals.1))"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productStore.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductTableCell
        
        //记录当前的row值，为后面修改textFiled、steppter改变值用
        let product = productStore.products[indexPath.row]
        cell.product = product
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
                        productLogger.logItem(item: product)
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

