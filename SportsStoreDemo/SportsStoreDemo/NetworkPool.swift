//
//  NetworkPool.swift
//  SportsStoreDemo
//
//  Created by OnlyStu on 2017/3/18.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

final class NetworkPool{
    
    private let connectionCount = 3
    private var connections = [NetworkConnection]()
    private var semaphore:DispatchSemaphore
    private var queue : DispatchQueue
    
    //初始化时，元素都是固定的3个
    //也就是说对象池作为一个单例，保存了固定的对象数量，做存、取操作
    private init() {
        
        for _ in 0 ..< connectionCount {
            
            connections.append(NetworkConnection())
        }
        semaphore = DispatchSemaphore.init(value: connectionCount)
        queue = DispatchQueue.init(label: "networkpoolQ")
    }
    //取出一个元素，对象池就少一个元素
    private func doGetConnection() -> NetworkConnection{
    
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        var result : NetworkConnection? = nil
        
        queue.sync {
            result = self.connections.remove(at: 0)
        }
        return result!
    }
    //返回一个元素，对象池就增加一个
    private func doReturnConnection(conn:NetworkConnection){
    
        queue.async {
            self.connections.append(conn)
            self.semaphore.signal()
        }
    }
    
    class func getConnection() -> NetworkConnection{
    
        return sharedInstance.doGetConnection()
    }
    
    class func returnConnection(conn:NetworkConnection) {
        sharedInstance.doReturnConnection(conn: conn)
    }
    //单例模式
    private class var sharedInstance:NetworkPool{

        
            struct SingletonWrapper{
                
                static let singleton = NetworkPool()
            }
            return SingletonWrapper.singleton
    }
}
