//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class LogItem{

    var from:String?
    @NSCopying var data:NSArray?
}

var dataArray = NSMutableArray(array:[1,2,3])

var logItem = LogItem()
logItem.from = "Alice"
logItem.data = dataArray

dataArray[1] = 10
print("value: \(logItem.data?[1])")

