//
//  Logger.swift
//  SportsStoreDemo
//
//  Created by OnlyStu on 2017/3/8.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

//全局变量
let productLogger = Logger<Product>(callback:{p in
    
    print("Change: \(p.name) \(p.stockLevel) items in stock")
})


  //遵守NSObject、NSCopying协议的泛型
  final class Logger<T> where T:NSObject,T:NSCopying{

    var dataItems:[T] = []
    var callback:(T) -> Void
    var arrayQ = DispatchQueue.init(label: "arrayQ")
    var callbackQ = DispatchQueue.init(label: "callbackQ")
    
    //保护callback，并提示是否需要保护，这样做的好处就是，外界可以做保护，自身也可以做保护，就有两个选择
    fileprivate init(callback:@escaping (T) -> Void,protect:Bool = true) {
        self.callback = callback
        if protect {
            self.callback = {(item:T) in
                self.callbackQ.sync {
                    callback(item)
                }
            }
        }
    }
    
    func logItem(item:T) {
        //dispatch_barrier 最新写法
        //当barrier队列执行的时候，其他线程不能执行，就是串行队列
        //执行到其他队列的时候就是并行队列，直到运行到下一个barrier
        arrayQ.async(execute: DispatchWorkItem.init(qos: DispatchQoS.default, flags: DispatchWorkItemFlags.barrier, block: { 
            self.dataItems.append(item.copy() as! T)
            self.callback(item)
        }))
    }
    
    func processItems(callback:(T) -> Void){
        arrayQ.sync {
            for item in dataItems{
                callback(item)
            }
        }
    }
}
