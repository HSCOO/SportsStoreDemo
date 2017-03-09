//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//1、只是做了简单的浅复制
//class Person:NSObject,NSCopying{
//
//    var name:String
//    var country:String
//    
//    init(name:String,
//         country:String) {
//        self.name = name
//        self.country = country
//    }
//    
//    func copy(with zone: NSZone? = nil) -> Any {
//        return Person.init(name: self.name, country: self.country)
//    }
//}
//
//var people = [
//    Person.init(name: "Joe", country: "France"),
//    Person.init(name: "Bob", country: "USA")
//]
//
//var otherpeople = people
//people[0].country = "UK"
//print("Country:\(otherpeople[0].country)")

//2、遍历每个元素做深复制
class Person:NSObject,NSCopying{
    
    var name:String
    var country:String
    
    init(name:String,
         country:String) {
        self.name = name
        self.country = country
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Person.init(name: self.name, country: self.country)
    }
}
//输入数组，产生数组
func deepCopy(data:[Any]) -> [Any]{

    //遍历数组元素,把每个元素item替换成AnyObject返回
    return data.map({ (item) -> AnyObject in
        //首先判断item是否已经实现NSCopying协议
        if item is NSCopying && item is NSObject{
            return (item as! NSObject).copy() as AnyObject
        }else{
            return item as AnyObject
        }
    })
}


var people = [
    Person.init(name: "Joe", country: "France"),
    Person.init(name: "Bob", country: "USA")
]

var otherpeople = deepCopy(data: people) as! [Person]
people[0].country = "UK"
print("Country:\(otherpeople[0].country)")

