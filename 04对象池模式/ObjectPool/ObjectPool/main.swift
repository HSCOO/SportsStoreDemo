//
//  main.swift
//  ObjectPool
//
//  Created by OnlyStu on 2017/3/15.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

print("Hello, World!")

var queue = DispatchQueue.init(label: "workQ")
var group = DispatchGroup()

print("Strating...")

for i in 1 ... 20{

    queue.async(group: group, execute: DispatchWorkItem.init(block: { 
        
        var book = Library.checkoutBook(reader: "reader#\(i)")
        if book != nil{
            
            Thread.sleep(forTimeInterval: (Double(arc4random() % 2)))
            Library.returnBook(book: book!)
        }
    }))
}

_ = group.wait(timeout: .distantFuture)

print("All blocks complete")
Library.printReport()
