//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Appointment{

    var name:String
    var day:String
    var place:String
    
    func printDetail(label:String){
        
        print("\(label) with \(name) on \(day) at \(place)")
    }
}

var beerMeeting = Appointment(name:"Bob",day:"Mon",place:"Joe's Bar")

var workMeeting = beerMeeting
workMeeting.name = "Alice"
workMeeting.day = "Fri"
workMeeting.place = "Conference Rm 2"

beerMeeting.printDetail(label: "Social")
workMeeting.printDetail(label: "Work")
