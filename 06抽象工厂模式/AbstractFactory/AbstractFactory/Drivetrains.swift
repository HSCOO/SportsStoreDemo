//
//  Drivetrains.swift
//  AbstractFactory
//
//  Created by OnlyStu on 2017/3/27.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

protocol Drivetrain {
    var driveType:Driveoption{get}
}

enum Driveoption :String {
    case FRONT="Front";
    case REAR = "Rear";
    case ALL = "4WD";
}

class FrontWheelDrive: Drivetrain {
    var driveType: Driveoption = Driveoption.FRONT
}

class RearWheelDrive: Drivetrain {
    var driveType: Driveoption = Driveoption.REAR
}

class ALLWheelDrive: Drivetrain {
    var driveType: Driveoption = Driveoption.ALL
}
