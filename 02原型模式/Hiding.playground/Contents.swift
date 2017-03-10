//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//class Message{
//    
//    var to:String
//    var subject:String
//    
//    init(to:String,
//         subject:String) {
//        
//        self.to = to
//        self.subject = subject
//    }
//}
//
//class MessageLogger{
//
//    var messages:[Message] = []
//    
//    //1、第一次变动，为了让数组里对象都不一样，采用初始化方法
//    //但这样做有一个缺点，就是会随着初始化方法改变而改变
//    func logMessage(msg:Message){
//        messages.append(Message.init(to: msg.to, subject: msg.subject))
//    }
//    
//    func processMessage(callback:(Message) -> Void){
//        for msg in messages{
//            callback(msg)
//        }
//    }
//}
//
//var logger = MessageLogger()
//
//var message = Message.init(to: "Joe", subject: "Hello")
//logger.logMessage(msg: message)
//
//message.to = "Bob"
//message.subject = "Free for dinner?"
//logger.logMessage(msg: message)
//
//logger.processMessage { msg -> Void  in
//    print("Message - To:\(msg.to) Subject:\(msg.subject)")
//}
//var data = [Message]()
//var copiedData = NSMutableArray(array:data,copyItems:true)


//解决办法，使用原型模式，复制

class Message :NSObject,NSCopying{
    
    var to:String
    var subject:String
    
    init(to:String,
         subject:String) {
        
        self.to = to
        self.subject = subject
    }
    //实现copy协议
    func copy(with zone: NSZone? = nil) -> Any {
        return Message.init(to: self.to, subject: self.subject)
    }
}

class MessageLogger{
    
    var messages:[Message] = []
    
    //直接copy对象即可,以后就不用改变了。
    func logMessage(msg:Message){
        messages.append(msg.copy() as! Message)
    }
    
    func processMessage(callback:(Message) -> Void){
        for msg in messages{
            callback(msg)
        }
    }
}

var logger = MessageLogger()

var message = Message.init(to: "Joe", subject: "Hello")
logger.logMessage(msg: message)

message.to = "Bob"
message.subject = "Free for dinner?"
logger.logMessage(msg: message)

logger.processMessage { msg -> Void  in
    print("Message - To:\(msg.to) Subject:\(msg.subject)")
}






