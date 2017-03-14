//
//  Logger.swift
//  Singleton
//
//  Created by OnlyStu on 2017/3/12.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

//全局变量
let globalLogger = Logger()

//final修饰后，防止子类创建
final class Logger{
    
    private var data = [String]()
    private let arrayQ = DispatchQueue.init(label: "arrayQ")
    //只在本文件有效,防止其他地方实例
    fileprivate init() {
        
    }
    
    func log(msg:String){
        arrayQ.sync {
            data.append(msg)
        }
    }
    
    func printLog(){
     
        for msg in data {
            print("Log:\(msg)")
        }
    }
}
