//
//  Utils.swift
//  SportsStoreDemo
//
//  Created by OnlyStu on 2017/3/6.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation


class Utils{

    class func currencyStringFromNumber(number:Double) -> String{
    
        let formatter = NumberFormatter()
        let num = NSNumber.init(value: number)
        
        return "$" + formatter.string(from: num)! 
        
    }
}
