//
//  Logger.swift
//  SportsStoreDemo
//
//  Created by OnlyStu on 2017/3/8.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

//遵守NSObject、NSCopying协议的泛型
class Logger<T> where T:NSObject,T:NSCopying{

    var dataItems:[T] = []
    var callback:(T) -> Void
    
    init(callback:@escaping (T) -> Void) {
        self.callback = callback
    }
    
    func logItem(item:T) {
        
        dataItems.append(item.copy() as! T)
        callback(item)
    }
    
    func processItems(callback:(T) -> Void){
        
        for item in dataItems{
            callback(item)
        }
    }
}
