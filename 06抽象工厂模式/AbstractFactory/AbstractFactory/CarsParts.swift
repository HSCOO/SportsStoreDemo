//
//  CarsParts.swift
//  AbstractFactory
//
//  Created by OnlyStu on 2017/3/27.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

enum Cars:String {
    case COMPACT = "VM Golf";
    case SPORTS = "Porsche Boxter";
    case SUV = "Cadillac Escalade";
}

struct Car {
    var carType:Cars
    var floor:Floorplan
    var suspension:Suspension
    var drive:Drivetrain
    
    init(carType:Cars) {
        let concreteFactory = CarFatory.getFactory(car: carType)
        self.floor = (concreteFactory?.createFloorplan())!
        self.suspension = (concreteFactory?.creatSuspension())!
        self.drive = (concreteFactory?.creatDrivetrain())!
        self.carType = carType
    }
    
    
    func pritDetails(){
        print("Car type:\(carType.rawValue)")
        print("Seats: \(floor.seats)")
        print("Engine:\(floor.enginePosition.rawValue)")
        print("Susension:\(suspension.suspensionType.rawValue)")
        print("Drive:\(drive.driveType.rawValue)")
    }
}
