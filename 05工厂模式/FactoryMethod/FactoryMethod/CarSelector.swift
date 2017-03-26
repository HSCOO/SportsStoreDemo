//
//  CarSelector.swift
//  FactoryMethod
//
//  Created by OnlyStu on 2017/3/19.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

class CarSelector{

    class func selectCar(passengers:Int) -> String?{
        
        return RentalCar.creatRentalCar(passengers: passengers)?.name
    }
}
