//
//  BackupServer.swift
//  Singleton
//
//  Created by OnlyStu on 2017/3/12.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

class DataItem{

    enum ItemType:String {
        case Email = "Email Address"
        case Phone = "Telephone Number"
        case Card = "Credit Card Number"
    }
    
    var type:ItemType
    var data:String
    
    init(type:ItemType,data:String) {
        self.type = type
        self.data = data
    }
}

final class BackupServer {
    
    let name:String
    private var data = [DataItem]()
    private var arrayQ = DispatchQueue.init(label: "arrayQ")
    
    //此处写的logger会被覆盖
//    let logger = Logger()
    
    fileprivate init(name:String) {
        self.name = name
        globalLogger.log(msg: "Created new server \(name)")
    }
    
    func  backup(item:DataItem) {
        
        arrayQ.sync {
            
            self.data.append(item)
            globalLogger.log(msg: "\(self.name) backed up item of type \(item.type.rawValue)")
        }
    }
    
    func getData() -> [DataItem] {
        return data
    }
    //结构体单例的创建
    //继承于BackupServer的子类server
    class var server:BackupServer{
        
        //结构体
        struct SingletonWrapper{
            //静态属性，用实例赋值
            static let singleton = BackupServer.init(name: "MainServer")
        }
        //返回结构体的属性值
        return SingletonWrapper.singleton
    }
}
