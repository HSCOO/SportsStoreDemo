//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Message{

    
    var to:String
    var subject:String
    
    init(to:String,
         subject:String) {
        
        self.to = to
        self.subject = subject
    }
}

class MessageLogger{

    var messages:[Message] = []
    
    //1、第一次变动，每次增加初始化
    func logMessage(msg:Message){
        messages.append(Message.init(to: msg.to, subject: msg.subject))
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
var data = [Message]()
var copiedData = NSMutableArray(array:data,copyItems:true)




