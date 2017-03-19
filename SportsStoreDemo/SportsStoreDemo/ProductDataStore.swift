//
//  ProductDataStore.swift
//  SportsStoreDemo
//
//  Created by OnlyStu on 2017/3/18.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

final class ProductDataSoure{
    
    var callback:((Product) -> Void)?
    private var networkQ:DispatchQueue
    private var uiQ:DispatchQueue
    lazy var products:[Product] = self.loadData()
    
    init() {
        networkQ = DispatchQueue.global()
        uiQ = DispatchQueue.main
    }
    
    private func loadData() -> [Product]{
    
        for p in productData {
         
            networkQ.async {
                
                //对象池取出一个对象
                let stockConn = NetworkPool.getConnection()
                
                //取出对象属性的值，赋值给product
                let level = stockConn.getStockLevel(name: p.name)
                if level != nil {
                    p.stockLevel = level!
                    self.uiQ.async {
                        if self.callback != nil{
                            self.callback!(p)
                        }
                    }
                }
                //使用完，就归还给对象池
                NetworkPool.returnConnection(conn: stockConn)
            }
        }
        return productData
    }

    
    private var productData :[Product] = [
        
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

}
