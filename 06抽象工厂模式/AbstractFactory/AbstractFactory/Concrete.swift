//
//  Concrete.swift
//  AbstractFactory
//
//  Created by OnlyStu on 2017/3/27.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

class CompactCarFactory: CarFatory {
    override func createFloorplan() -> Floorplan {
        return StandardFloorplan()
    }
    override func creatSuspension() -> Suspension {
        return RoadSuspension.getInstance()
    }
    
    override func creatDrivetrain() -> Drivetrain {
        return FrontWheelDrive()
    }
    //重写父类方法，实现单例
    override class var sharedInstance:CarFatory? {
        get{
            struct SingletonWrapper{
                static let singleton = CompactCarFactory()
            }
            return SingletonWrapper.singleton
        }
    }
}

class SportsCarFactory: CarFatory {
    override func createFloorplan() -> Floorplan {
        return ShortFloorplan()
    }
    
    override func creatSuspension() -> Suspension {
        return RaceSuspension.getInstance()
    }
    
    override func creatDrivetrain() -> Drivetrain {
        return ALLWheelDrive()
    }
}

class SUVCarFactory: CarFatory {
    override func createFloorplan() -> Floorplan {
        return LongFloorplan()
    }
    
    override func creatSuspension() -> Suspension {
        return OffRoadSuspension.getInstance()
    }
    
    override func creatDrivetrain() -> Drivetrain {
        return ALLWheelDrive()
    }
}
