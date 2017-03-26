//
//  main.swift
//  FactoryMethod
//
//  Created by OnlyStu on 2017/3/19.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

print("Hello, World!")

let passengers = [1,3,5]

for p in passengers{

    print("\(p) pasengers:\(CarSelector.selectCar(passengers: p)!)")
}
		
