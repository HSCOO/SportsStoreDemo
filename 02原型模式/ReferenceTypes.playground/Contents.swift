//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//********1、实现copy前
//class Apponitment{
//
//    var name:String
//    var day:String
//    var place:String
//    
//    init(name:String,
//         day:String,
//         place:String) {
//        
//        self.name = name
//        self.day = day
//        self.place = place
//    }
//    
//    func printDetail(label:String) {
//        
//        print("\(label) with \(name) on \(day) at \(place)")
//    }
//}
//
//var beerMeeting = Apponitment(name:"Bob",day:"Mon",place:"Joe's Bar")
//
//var workMeeting = beerMeeting
//workMeeting.name = "Alice"
//workMeeting.day = "Fri"
//workMeeting.place = "Conference Rm 2"
//
//beerMeeting.printDetail(label: "Social")
//workMeeting.printDetail(label: "Work")

//********2、实现copy后
class Apponitment:NSObject,NSCopying{
    
    var name:String
    var day:String
    var place:String
    
    init(name:String,
         day:String,
         place:String) {
        
        self.name = name
        self.day = day
        self.place = place
    }
    
    func printDetail(label:String) {
        
        print("\(label) with \(name) on \(day) at \(place)")
    }
    //实现协议方法
    func copy(with zone: NSZone? = nil) -> Any {
        return Apponitment.init(name: self.name,
                                day: self.day,
                                place: self.place)
    }
}

var beerMeeting = Apponitment(name:"Bob",day:"Mon",place:"Joe's Bar")
//使用copy复制，转换类型
var workMeeting = beerMeeting.copy() as! Apponitment
workMeeting.name = "Alice"
workMeeting.day = "Fri"
workMeeting.place = "Conference Rm 2"

beerMeeting.printDetail(label: "Social")
workMeeting.printDetail(label: "Work")


//********3、浅复制
//
//class Location{
//    
//    var name:String
//    var address:String
//    
//    init(name:String,
//         address:String) {
//        self.name = name
//        self.address = address
//    }
//}
//
//class Apponitment:NSObject,NSCopying{
//    
//    var name:String
//    var day:String
//    var place:Location
//    
//    init(name:String,
//         day:String,
//         place:Location) {
//        
//        self.name = name
//        self.day = day
//        self.place = place
//    }
//    
//    func printDetail(label:String) {
//        
//        print("\(label) with \(name) on \(day) at \(place.name) + \(place.address)")
//    }
//    //实现协议方法
//    func copy(with zone: NSZone? = nil) -> Any {
//        return Apponitment.init(name: self.name,
//                                day: self.day,
//                                place: self.place)
//    }
//}
//
//var beerMeeting = Apponitment(name:"Bob",day:"Mon",place:Location.init(name: "Joe's Bar", address: "123 Main St"))
////使用copy复制，转换类型
//var workMeeting = beerMeeting.copy() as! Apponitment
//workMeeting.name = "Alice"
//workMeeting.day = "Fri"
//workMeeting.place.name = "Conference Rm 2"
//workMeeting.place.address = "Company HQ"
//
////结果发现只有place没有变化，Location没有实现NSCopying协议，只是做了浅复制
//beerMeeting.printDetail(label: "Social")
//workMeeting.printDetail(label: "Work")

//********4、深复制
//这就说明，不仅类本身需要实现，NSCopying协议，而且属性也需要实现各自NSCopying协议
//class Location:NSObject,NSCopying{
//    
//    var name:String
//    var address:String
//    
//    init(name:String,
//         address:String) {
//        self.name = name
//        self.address = address
//    }
//    
//    func copy(with zone: NSZone? = nil) -> Any {
//        return Location.init(name: self.name, address: self.address)
//    }
//}
//
//class Apponitment:NSObject,NSCopying{
//    
//    var name:String
//    var day:String
//    var place:Location
//    
//    init(name:String,
//         day:String,
//         place:Location) {
//        
//        self.name = name
//        self.day = day
//        self.place = place
//    }
//    
//    func printDetail(label:String) {
//        
//        print("\(label) with \(name) on \(day) at \(place.name) + \(place.address)")
//    }
//    //实现协议方法,并且内部需要copyLocation
//    func copy(with zone: NSZone? = nil) -> Any {
//        return Apponitment.init(name: self.name,
//                                day: self.day,
//                                place: self.place.copy() as! Location)
//    }
//}
//
//var beerMeeting = Apponitment(name:"Bob",day:"Mon",place:Location.init(name: "Joe's Bar", address: "123 Main St"))
////使用copy复制，转换类型
//var workMeeting = beerMeeting.copy() as! Apponitment
//workMeeting.name = "Alice"
//workMeeting.day = "Fri"
//workMeeting.place.name = "Conference Rm 2"
//workMeeting.place.address = "Company HQ"
//
////结果发现place也变化了，实现了深复制
//beerMeeting.printDetail(label: "Social")
//workMeeting.printDetail(label: "Work")


