//
//  Pool.swift
//  ObjectPool
//
//  Created by OnlyStu on 2017/3/15.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation
//泛型数据
class Pool<T>{

    private var data = [T]()
    //自定义队列
    private let arrayQ = DispatchQueue.init(label: "arrayQ")
    // 为什么要引入信号量，在一种极端情况下，数组中只有一个元素，两个线程先后访问，第一个线程正在取元素的同时，第二个线程也在取。当第一个线程取完的时候，第二个线程继续取的时候数组会空就会报错
    private let semaphore : DispatchSemaphore
    
    //初始化时，data保存传入的数组
    init(items:[T]) {
        
        data.reserveCapacity(data.count)
        for itme in items {
            data.append(itme)
        }
        //创建一个和数组个数相等的信号量
        semaphore = DispatchSemaphore.init(value: items.count)
    }
    
    //从data数组中取出第一个对象，同时删除第一个对象
    func getFromPool() -> T? {
        
        var result:T?
        //信号量减1，判断是否还有信号
        let sempResult = semaphore.wait(timeout: DispatchTime.distantFuture)
        if  sempResult == DispatchTimeoutResult.success {
            //同步删除元素
            arrayQ.sync {
                result = self.data.remove(at: 0)
            }
        }
        return result
    }
    //返还对象给data数组
    func returnToPool(item:T) {
        
        arrayQ.async {
            self.data.append(item)
            //信号量加1
            self.semaphore.signal()
        }
    }
}
