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
    
    
    
    // MARK:- Methods
    func getMonthDaysNumber(year: Int, month: Int) -> Int {
        self.dateComponents = DateComponents(year: year, month: month)
        let date = calendar.date(from: self.dateComponents!)!
        
        let range = calendar.range(of: .day, in: .month, for: date)
        let numDays = range?.count
        
        return numDays!
    }
    
    
    
    func getFirstDayOfWeekInMonth(year: Int, month: Int) -> Int {
        
    }
}
