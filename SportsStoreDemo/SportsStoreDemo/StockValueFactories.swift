//
//  StockValueFactories.swift
//  SportsStoreDemo
//
//  Created by OnlyStu on 2017/3/29.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

class StockTotalFactory{
    
    enum Currency {
        case USD
        case GBP
    }
    
    fileprivate(set) var formatter:StockValueFormatter?
    fileprivate(set) var converter:StockValueConverter?
    
    class func getFactory(curr:Currency) -> StockTotalFactory {
        if curr == Currency.USD{
            return DollarStockTotalFactory.sharedInstance
        }else{
            return PoundStockTotalFactory.shareInstance
        }
    }
}

private class DollarStockTotalFactory:StockTotalFactory{
    
    private override init(){
        super.init()
        formatter = DollarStockValueFormatter()
        converter = DollarStockValueConverter()
    }
    
    class var sharedInstance:StockTotalFactory{
        
        get{
            struct SingletonWrapper{
                static let singleton = DollarStockTotalFactory()
            }
            return SingletonWrapper.singleton
        }
    }
}

private class PoundStockTotalFactory:StockTotalFactory{

    private override init(){
        super.init()
        formatter = PoundStockValueFormatter()
        converter = PoundStockValueConverter()
    }
    
    class var shareInstance:StockTotalFactory{
    
        get{
            struct SingletonWrapper{
                static let singleton = PoundStockTotalFactory()
            }
            return SingletonWrapper.singleton
        }
    }
}
