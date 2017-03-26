//
//  RentalCar.swift
//  FactoryMethod
//
//  Created by OnlyStu on 2017/3/19.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

//1、定义全局工厂方法 + 协议
#if false
func creatRentalCar(passengers:Int) -> RentalCar?{
    
    var car:RentalCar?
    
    switch passengers {
    case 0...1:
        car = Sports()
    case 2...3:
        car = Compact()
    case 4...8:
        car = SUV()
    case 9...14:
        car = Mininvan()
    default:
        car = nil
    }
    return car
}

protocol RentalCar{
    
    var name:String{get}
    var passengers:Int{get}
    var pricePerDay:Float{get}
}

class Compact: RentalCar {
    var name = "VM Golf"
    var passengers = 3
    var pricePerDay: Float = 20
}

class Sports:RentalCar{

    var name = "Porsche Boxter"
    var passengers: Int = 1
    var pricePerDay: Float = 100
}

class SUV: RentalCar {
    var name = "Cadillac Escalade"
    var passengers: Int = 8
    var pricePerDay: Float = 75
}

class Mininvan: RentalCar{

    var name = "Chevrolet Evpress"
    var passengers = 14
    var pricePerDay: Float = 40
}

#endif

//2、使用类实现工厂方法

class RentalCar{
    private var nameBV :String
    private var passengersBV:Int
    private var pricePerDayBV:Float
    
    private init(name:String,passengers:Int,price:Float) {
        self.nameBV = name
        self.passengersBV = passengers
        self.pricePerDayBV = price
    }
    
    final var name:String{
        get{ return nameBV }
    }
    
    final var passengers:Int{
        get { return passengersBV}
    }
    
    final var pricePerDay:Float{
        get { return pricePerDayBV }
    }
    class func creatRentalCar(passengers:Int) -> RentalCar?{
        
        //元类型，RentalCar的任意类型，包括本身类型、还有子类类型
        var carImpl:RentalCar.Type?
        
        switch passengers {
        case 0...3:
            carImpl = Compact.self
        case 4...8:
            carImpl = SUV.self
        default:
            carImpl = nil
        }
        return carImpl?.creatRentalCar(passengers: passengers)
    }
    
    class Compact:RentalCar{
        
        fileprivate convenience init(){
            self.init(name: "VM Golf", passengers: 3, price: 20)
        }
        
        fileprivate override init(name:String,passengers:Int,price:Float){
            super.init(name: name, passengers: passengers, price: price)
        }
        //override重写父类方法
        override class func creatRentalCar(passengers:Int) -> RentalCar?{
            if passengers < 2 {
                return shareInstance
            }else{
                return SmallCompact.shareInstance
            }
        }
        
        //单例
        class var shareInstance:RentalCar{
            
            get{
                struct SingletonWrapper{
                    static let singleton = Compact()
                }
                return SingletonWrapper.singleton
            }
        }
    }
    
    class SmallCompact: Compact {
        fileprivate init(){
            super.init(name: "Ford Fiesta", passengers: 3, price: 15)
        }
        
        override class var shareInstance:Compact{
            get{
                struct SingletonWrapper{
                    static let singleton = SmallCompact()
                }
                return SingletonWrapper.singleton
            }

        }
    }
    
    class SUV:RentalCar{
        
        fileprivate init(){
            super.init(name: "Cadillac Escalade", passengers: 8, price: 75)
        }
        
        override class func creatRentalCar(passengers:Int) -> RentalCar?{
            return SUV()
        }
    }
}
