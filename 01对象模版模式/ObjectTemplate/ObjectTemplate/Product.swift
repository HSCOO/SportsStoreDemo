//
//  Product.swift
//  ObjectTemplate
//
//  Created by OnlyStu on 2017/3/6.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

class Product{

// 1、
//    var name:String
//    var description :String
//    var price :Double
//    var stock:Int
//    
//    init(name:String,description:String,price:Double,stock:Int) {
//        self.name = name
//        self.description = description
//        self.price = price
//        self.stock = stock
//    }
   
//2、
//删除description
//    var name:String
//    var price :Double
//    var stock:Int
//    
//    init(name:String,price:Double,stock:Int) {
//        self.name = name
//        self.price = price
//        self.stock = stock
//    }
    
//3、封装方法，主要是处理数据的方法
//    var name:String
//    var price :Double
//    var stock:Int
//    
//    init(name:String,price:Double,stock:Int) {
//        self.name = name
//        self.price = price
//        self.stock = stock
//    }
//    
//    func calculateTax(rate:Double) -> Double {
//        return self.price * rate
//    }
//    
//    var stockValue:Double{
//    
//        get{
//            return self.price * Double(self.stock)
//        }
//    }
    
    var name:String
    var price :Double
    private var stockBackingValue:Int = 0

    var stock:Int{
        
        get{
            
            return stockBackingValue
        }
        set{
            //newValue指的是set方法的输入值
            stockBackingValue = max(0, newValue)
        }
    }
    
    init(name:String,price:Double,stock:Int) {
        self.name = name
        self.price = price
        self.stock = stock
    }
    
    func calculateTax(rate:Double) -> Double {
        return self.price * rate
    }
    
    var stockValue:Double{
        
        get{
            return self.price * Double(self.stock)
        }
    }
    
}
