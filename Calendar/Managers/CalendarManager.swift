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
    var preMonthArr = [Int]()
    var currentMonthArr = [Int]()
    var nextMonthArr = [Int]()
    
    var year = Date().getDate().year
    var month = Date().getDate().month
    var day = Date().getDate().year
    
    
    
    // MARK:- Methods
    func getMonthDaysNumber(year: Int, month: Int) -> Int {
        let dateComponents = DateComponents(year: year, month: month)
        let date = calendar.date(from: dateComponents)
        let range = calendar.range(of: .day, in: .month, for: date!)
        let numDays = range?.count
        
        return numDays!
    }
    
    
    
    func getFirstDayWeekInMonth(yaer: Int, month: Int) -> Int {
        let dateComponents = DateComponents(year: year, month: month)
        let date = calendar.date(from: dateComponents)
        return self.calendar.dateComponents([.weekday], from: date!).weekday!
    }
    
    
    
    func getLastDayOfWeekInMonth(year: Int, month: Int) -> Int {
//        let date = self.date
//        let weekDay = self.calendar.dateComponents([.weekday], from: date).weekday
        
//        return weekDay!
        return 0
    }
    
    
    
    func function() {
        let dateComponents = DateComponents(year: year, month: month)
        let date = self.calendar.date(from: dateComponents)
        let range = self.calendar.range(of: .day, in: .month, for: date!)
        let numDays = range?.count
        
        let firstDayWeekInMonth = self.calendar.dateComponents([.weekday], from: date!).weekday!
    }
}
