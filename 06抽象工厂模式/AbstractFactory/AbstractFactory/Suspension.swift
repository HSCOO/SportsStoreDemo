//
//  Suspension.swift
//  AbstractFactory
//
//  Created by OnlyStu on 2017/3/27.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

//加入@objc，这样枚举就能实现原型模式
@objc protocol Suspension{
    var suspensionType:SuspensionOption{get}
    //为了统一copy方法，不让copy方法暴露在工厂方法中
    //添加这个方法统一封装，不让工厂方法知道是否实现copy
    static func getInstance() -> Suspension
}

class RoadSuspension: Suspension {
    var suspensionType = SuspensionOption.STANDARD
    //外界就不能直接创建
    private init(){}
    //只能通过这个方法返回实例
    class func getInstance() -> Suspension{
        return RoadSuspension()
    }
}

class OffRoadSuspension: Suspension {
    var suspensionType: SuspensionOption = SuspensionOption.SOFT
    
    private init(){}
    class func getInstance() -> Suspension{
        return OffRoadSuspension()
    }
}



class RaceSuspension:NSObject,NSCopying,Suspension{
   
    var suspensionType: SuspensionOption = SuspensionOption.SPORTS
    //因为它从NSObject继承了一个空的init
    private override init(){}
    
    func copy(with zone: NSZone? = nil) -> Any {
        return RaceSuspension()
    }
    
    //单例模式
    private class var prototype:RaceSuspension{
    
        get{
            struct SingletonWrapper{
                static let singleton = RaceSuspension()
            }
            return SingletonWrapper.singleton
        }
    }
    //封装copy
    class func getInstance() -> Suspension {
        return prototype.copy() as! Suspension
    }
}



