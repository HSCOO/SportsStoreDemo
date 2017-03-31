//
//  Abstract.swift
//  AbstractFactory
//
//  Created by OnlyStu on 2017/3/27.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

class CarFatory{
    
    //避免下面创建factoryType.init()报错
    required init() {
    
    }
    
    func createFloorplan() -> Floorplan {
        fatalError("Not implemented")
    }
    
    func creatSuspension() -> Suspension {
        fatalError("Not implemented")
    }
    
    func creatDrivetrain() -> Drivetrain {
        fatalError("Not implemented")
    }
    
    final class func getFactory(car:Cars) -> CarFatory?{
        //使用元类
        var factoryType:CarFatory.Type
        switch car {
        case .COMPACT:
            factoryType = CompactCarFactory.self
        case .SPORTS:
            factoryType = SportsCarFactory.self
        case .SUV:
            factoryType = SUVCarFactory.self
        }
        //取得单例类型
        var factory = factoryType.sharedInstance
        //如果这个类没有实现单例，就init()返回对象即可
        if (factory == nil) {
            factory = factoryType.init()
        }
        return factory
    }
    //子类可以实现这个方法，获取单例
    class var sharedInstance:CarFatory? {
        get{
            return nil
        }
    }
}
