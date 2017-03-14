//
//  main.swift
//  Singleton
//
//  Created by OnlyStu on 2017/3/12.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

print("Hello, World!")

//服务器只有一个，不会因为实例化多个而增加
//需要从实际情况做考虑

//let logger = Logger()

var server = BackupServer.server

let queue = DispatchQueue.init(label: "wrokQueue")
let group = DispatchGroup()

for count in 0 ..< 100{

  queue.async(group: group, execute: DispatchWorkItem.init(block: { 
    
        BackupServer.server.backup(item: DataItem.init(type: DataItem.ItemType.Email, data: "bob@example.com"))
  }))
}
group.wait()

print("\(server.getData().count) items were backed up")

server.backup(item: DataItem.init(type: DataItem.ItemType.Email, data: "joe@example.com"))
server.backup(item: DataItem.init(type: DataItem.ItemType.Email, data: "555-123-1133"))

globalLogger.log(msg: "Backed up 2 items to \(server.name)")

var otherServer = BackupServer.server
otherServer.backup(item: DataItem.init(type: DataItem.ItemType.Email, data: "bob@example.com"))

globalLogger.log(msg: "Backed up 2 items to \(otherServer.name)")

globalLogger.printLog()
