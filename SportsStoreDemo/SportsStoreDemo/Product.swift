//
//  File.swift
//  SportsStoreDemo
//
//  Created by OnlyStu on 2017/3/6.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

//tip:对象模版模式

import Foundation

//原型模式
class Product:NSObject,NSCopying {
    
    //对外get只读
    private(set) var name:String
//    private(set) var description:String
    private(set) var productDescription:String
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
        self.productDescription = description
        self.category = category
        
        super.init()
        
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
    
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Product.init(name: self.name,
                            description: self.productDescription,
                            category: self.category,
                            price: self.price,
                            stockLevel: self.stockLevel)
    }
}
