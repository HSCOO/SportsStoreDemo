//
//  main.swift
//  AbstractFactory
//
//  Created by OnlyStu on 2017/3/27.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

print("Hello, World!")



let factory = CarFatory.getFactory(car: Cars.SPORTS)

//var car = Car(carType:Cars.SPORTS,floor:ShortFloorplan(),suspension:RaceSuspension(),drive:RearWheelDrive())
//var car = Car(carType:Cars.SPORTS,floor:factory.createFloorplan(),suspension:factory.creatSuspension(),drive:factory.creatDrivetrain())
//car.pritDetails()
let car = Car(carType:Cars.SPORTS)
car.pritDetails()
    

		
