//
//  CalendarManager.swift
//  Calendar
//
//  Created by Byunsangjin on 22/07/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

import Foundation

class CalendarManager {
    
    // MARK:- Constants
    static let shared = CalendarManager()
    let calendar = Calendar.current
    
    
    
    // MARK:- Variables
    var dateComponents:DateComponents?
    var date: Date = Date()
    
    var preMonthArr = [Int]()
    var currentMonthArr = [Int]()
    var nextMonthArr = [Int]()
    
    
    
    // MARK:- Methods
    func getDate() -> Date {
        return date
    }
    
    
    
    func getMonthDaysNumber() -> Int {
        let range = calendar.range(of: .day, in: .month, for: self.date)
        let numDays = range?.count
        
        return numDays!
    }
    
    
    
    func getFirstDayOfWeekInMonth() -> Int? {
        guard let weekDay = self.calendar.dateComponents([.weekday], from: self.date).weekday else {
            return nil
        }
        
        return weekDay
    }
    
    
    
    func getLastDayOfWeekInMonth() -> Int? {
        let date = self.date - 1
        
        guard let weekDay = self.calendar.dateComponents([.weekday], from: date).weekday else {
            return nil
        }
        
        return weekDay
    }
    
    
    
    func setDateArray() {
        let date = self.date.getDate()
        
        let year = date.year
        let month = date.month
        let day = date.day
        
        
    }
}
