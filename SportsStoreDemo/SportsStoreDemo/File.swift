//
//  File.swift
//  SportsStoreDemo
//
//  Created by OnlyStu on 2017/3/6.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

class Product {
    
    //对外get只读
    private(set) var name:String
    private(set) var description:String
    private(set) var category:String
    
    //私有属性
    private var stockLevelBackingValue:Int = 0
    private var priceBackingValue:Double = 0
    
    init(name:String,
         description:String,
         category:String,
         price:Double,
         stockLevel:Int) {
        
        self.name = name
        self.description = description
        self.category = category
        self.price = price
        self.stockLevel = stockLevel
    }
    //实现get、set
    var stockLevel:Int{
    
        get{ return stockLevelBackingValue}
        set{ stockLevelBackingValue = max(0, newValue)}
    }
    
    private(set) var price:Double{
    
        get{ return priceBackingValue}
        set{ priceBackingValue = max(1, newValue)}
    }
    
    var stockValue:Double{
        
        get{ return price * Double(stockLevel)}
    }
}
