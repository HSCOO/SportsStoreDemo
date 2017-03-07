//
//  main.swift
//  ObjectTemplate
//
//  Created by OnlyStu on 2017/3/6.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

print("Hello, World!")


//1、
//最开始版本
//方法和数组紧耦合
//var products = [
//    
//    ("Kayak","A boat for one person",275.0,10),
//    ("Lifejacket","Protective and fashionable",48.95,14),
//    ("Soccer Ball","FIFA-approved size and weight",19.5,32)
//]
//
//func calculateTax(product:(String,String,Double,Int)) -> Double
//{
//    return product.2 * 0.2
//}
//
//func calculateStockValue(tuples:[(String,String,Double,Int)]) -> Double {
//    
//    return tuples.reduce(0, { (total, product) -> Double in
//        return total + (product.2 * Double(product.3))
//    })
//}
//
//print("Sales tax for Kayak:$\(calculateTax(product: products[0]))")
//print("Total value of stock:$\(calculateStockValue(tuples: products))")


//2、
//删除一个元素时，方法参数和使用都要改
//var products = [
//    
//    ("Kayak",275.0,10),
//    ("Lifejacket",48.95,14),
//    ("Soccer Ball",19.5,32)
//]
//
//func calculateTax(product:(String,Double,Int)) -> Double
//{
//    return product.1 * 0.2
//}
//
//func calculateStockValue(tuples:[(String,Double,Int)]) -> Double {
//    
//    return tuples.reduce(0, { (total, product) -> Double in
//        return total + (product.1 * Double(product.2))
//    })
//}
//
//print("Sales tax for Kayak:$\(calculateTax(product: products[0]))")
//print("Total value of stock:$\(calculateStockValue(tuples: products))")


//3、
//使用Product模版类以后

//var products = [
//    Product.init(name: "Kayak", description: "A boat for one person", price: 275.0, stock: 10),
//    Product.init(name: "Lifejacket", description: "Protective and fashionable", price: 48.95, stock: 14),
//    Product.init(name: "Soccer Ball", description: "FIFA-approved size and weight", price: 19.5, stock: 32)
//]
//
//func calculateTax(product:Product) -> Double
//{
//    return product.price * 0.2
//}
//
//func calculateStockValue(tuples:[Product]) -> Double {
//
//    return tuples.reduce(0, { (total, product) -> Double in
//        return total + (product.price * Double(product.stock))
//    })
//}
//print("Sales tax for Kayak:$\(calculateTax(product: products[0]))")
//print("Total value of stock:$\(calculateStockValue(tuples: products))")

//4、
//使用Product模版类以后
//删除一个属性description后基本不会变动
//var products = [
//    Product.init(name: "Kayak", price: 275.0, stock: 10),
//    Product.init(name: "Lifejacket", price: 48.95, stock: 14),
//    Product.init(name: "Soccer Ball", price: 19.5, stock: 32)
//]
//
//func calculateTax(product:Product) -> Double
//{
//    return product.price * 0.2
//}
//
//func calculateStockValue(tuples:[Product]) -> Double {
//    
//    return tuples.reduce(0, { (total, product) -> Double in
//        return total + (product.price * Double(product.stock))
//    })
//}
//print("Sales tax for Kayak:$\(calculateTax(product: products[0]))")
//print("Total value of stock:$\(calculateStockValue(tuples: products))")



//5、
//把操作模版的方法封装到模版类中，不暴露细节
//var products = [
//    Product.init(name: "Kayak", price: 275.0, stock: 10),
//    Product.init(name: "Lifejacket", price: 48.95, stock: 14),
//    Product.init(name: "Soccer Ball", price: 19.5, stock: 32)
//]
//
//func calculateStockValue(tuples:[Product]) -> Double {
//    
//    return tuples.reduce(0, { (total, product) -> Double in
//        return total + product.stockValue
//    })
//}
//
//print("Sales tax for Kayak:$\(products[0].calculateTax(rate: 0.2))")
//print("Total value of stock:$\(calculateStockValue(tuples: products))")


var products = [
    Product.init(name: "Kayak", price: 275.0, stock: 10),
    Product.init(name: "Lifejacket", price: 48.95, stock: 14),
    Product.init(name: "Soccer Ball", price: 19.5, stock: 32)
]

func calculateStockValue(tuples:[Product]) -> Double {
    
    return tuples.reduce(0, { (total, product) -> Double in
        return total + product.stockValue
    })
}

print("Sales tax for Kayak:$\(products[0].calculateTax(rate: 0.2))")
print("Total value of stock:$\(calculateStockValue(tuples: products))")

//检查stock是否能低于0
products[0].stock = -100
print("stock level for Kayak:\(products[0].stock)")

