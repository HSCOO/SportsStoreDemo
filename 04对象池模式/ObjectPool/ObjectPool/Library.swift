//
//  Library.swift
//  ObjectPool
//
//  Created by OnlyStu on 2017/3/18.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

final class Library{

    private var books:[Book]
    private let pool:Pool<Book>
    
    //初始化对象池里面的对象数量
    private init(stockLevel:Int) {
        books = [Book]()
        for count in 1 ... stockLevel {
            books.append(Book.init(author: "Dickens", title: "Hard times", stock: count))
        }
        pool = Pool<Book>.init(items: books)
    }
    
    //单例，对象池里注入两个book对象
    private class var singleton : Library{
    
        struct SinglestonWrapper{
            static let singleton = Library.init(stockLevel: 2)
        }
        return SinglestonWrapper.singleton
    }
    
    //借书
    class func checkoutBook(reader:String) -> Book?{
    
        let book = singleton.pool.getFromPool()
        book?.reader = reader
        book?.checkoutCount = (book?.checkoutCount)! + 1
        return book
    }
    
    //还书
    class func returnBook(book:Book){
    
        book.reader = nil
        singleton.pool.returnToPool(item: book)
    }
    
    class func printReport(){
    
        for book in singleton.books {
         
            print("...Book#\(book.stockNumber)...")
            print("Checked out \(book.checkoutCount) times")
            
            if book.reader != nil {
            
                print("Checked out to \(book.reader!)")
            }else{
                print("In stock")
            }
        }
    }
}
