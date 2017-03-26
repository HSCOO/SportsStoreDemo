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
    fileprivate var salesTaxRate:Double = 0.2
    
    required init(name:String,
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
        
        get{ return (price * (1 + salesTaxRate)) * Double(stockLevel)}
    }
    
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Product.init(name: self.name,
                            description: self.productDescription,
                            category: self.category,
                            price: self.price,
                            stockLevel: self.stockLevel)
    }
    
    var upsells:[UpsellOpportunities]{
        get{
            return Array()
        }
    }
    
    //工厂方法
    //根据category来创建不同的类型
    class func createProduct(name:String,description:String,category:String,price:Double,stockLevel:Int) -> Product{
    
        //Produnct.Type指元类型，可以是任意Product的任意子类、Product类
        var productType:Product.Type
        
        switch category {
        case "Watersports":
            productType = WatersportsProduct.self
        case "Soccer":
            productType = SoccerProduct.self
        default:
            productType = Product.self
        }
        return productType.init(name:name,description:description,category:category,price:price,stockLevel:stockLevel)
    }
}

enum UpsellOpportunities{

    case SwimmingLessons;
    case MapOfLakes;
    case SoccerVideos;
}

class WatersportsProduct:Product{
    
    required init(name: String, description: String, category: String, price: Double, stockLevel: Int) {
        super.init(name: name, description: description, category: category, price: price, stockLevel: stockLevel)
        salesTaxRate = 0.10
    }
    
    override var upsells: [UpsellOpportunities]{
        return [UpsellOpportunities.SwimmingLessons,UpsellOpportunities.MapOfLakes]
    }
}

class SoccerProduct:Product{

    required init(name: String, description: String, category: String, price: Double, stockLevel: Int) {
        super.init(name: name, description: description, category: category, price: price, stockLevel: stockLevel)
        salesTaxRate = 0.25
    }
    override var upsells: [UpsellOpportunities]{
        return [UpsellOpportunities.SoccerVideos]
    }
}


