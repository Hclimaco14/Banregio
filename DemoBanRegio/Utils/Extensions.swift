//
//  Extensions.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//

import Foundation

public extension String {
    func toDate(_ format:String ) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "es_MX")
        dateFormatter.timeZone = TimeZone(identifier:"America/Mexico_City") ?? TimeZone.current
        return dateFormatter.date(from: self)
    }
    
    func toDouble() -> Double {
        let double = Double(self) ?? 0
        return double
    }
    func toInt() -> Int {
        let num = Int(self) ?? 0
        return num
    }
}

public extension Date {
    static func dateBy(year:Int,month:Int,day:Int) -> Date {
        var dateStart = DateComponents()
        dateStart.year = year
        dateStart.month = month
        dateStart.day = day
        dateStart.timeZone = TimeZone(identifier: "America/Mexico_City") ?? TimeZone.current
        
        let userCalendar = Calendar.current
        return userCalendar.date(from: dateStart) ?? Date()
    }
    
    func toStringWithFormat(_ format:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "es_MX")
        dateFormatter.timeZone = TimeZone(identifier: "America/Mexico_City")
        return dateFormatter.string(from: self)
    }
    
    func year() -> Int {
        //Get Year
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.year, from: self)
        let year = components.year
        return year!
    }
    
    func day() -> Int {
        //Get Year
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.day, from: self)
        return components.day!
    }
    
    func month() -> Int {
        //Get Month
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.month, from: self)
        let month = components.month
        
        return month!
    }
    
    
    func difernceInDays(to final:  Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self, to: final)
        return components.day ?? 0
    }
    
    static func difernceInDays(from initial: Date, to final:  Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: initial, to: final)
        return components.day ?? 0
    }
    
    func difernceInMonth(to final:  Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: self, to: final)
        return components.day ?? 0
    }
    
    static func difernceInMonth(from initial: Date, to final:  Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: initial, to: final)
        return components.day ?? 0
    }
}

public extension Double {
    func format(f: String = ".2") -> String {
        return String(format: "%\(f)f", self)
    }
}
