//
//  PriceCalculator.swift
//  FactoryMethod
//
//  Created by OnlyStu on 2017/3/22.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

class  PriceCalculator{
    
    class func calculatePrice(passengers:Int,days:Int) -> Float?{
        
        let  car = RentalCar.creatRentalCar(passengers: passengers)
        return car == nil ? nil : car!.pricePerDay * Float(days)
    }
}
