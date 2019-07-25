//
//  Extension+Date.swift
//  Calendar
//
//  Created by Byunsangjin on 22/07/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

import Foundation

extension Date {
    func getDate() -> (year: Int, month: Int, day: Int) {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: self)
        let month = calendar.component(.month, from: self)
        let day = calendar.component(.day, from: self)
        
        return (year, month, day)
    }
    
    
    
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.string(from: self)
    }
    
    
    
    func stringToDate(string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: string) else {
            return nil
        }
        
        return date
    }
    
    
    
    func getMonthDaysNumber() -> Int {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: self)
        let numDays = range?.count
        
        return numDays!
    }
    
    
    
    func getPreMonthDaysNumber() -> Int {
        return (self.startOfMonth() - 1).getMonthDaysNumber()
    }
    
    
    
    func getFirstDayWeekInMonth() -> Int {
        let calendar = Calendar.current
        return calendar.dateComponents([.weekday], from: self.startOfMonth()).weekday!
    }
    
    
    
    func getLasDayWeekInMonth() -> Int {
        let calendar = Calendar.current
        return calendar.dateComponents([.weekday], from: self.endOfMonth()).weekday!
    }
    
    
    
    func startOfMonth() -> Date {
        let calendar = Calendar.current
        return calendar.date(from: calendar.dateComponents([.year, .month], from: calendar.startOfDay(for: self)))!
    }

    
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
}
