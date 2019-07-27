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
    
    var date = Date()
    
    var year = Date().getDate().year
    var month = Date().getDate().month
    var day = Date().getDate().year
    
    func setCurrentMonthArr() {
        let preMonthDays = date.getPreMonthDaysNumber()
        let curMonthDays = date.getMonthDaysNumber()
        let curFirstDayWeek = date.getFirstDayWeekInMonth()
        let curLastDayWeek = date.getLastDayWeekInMonth()
        
        // 이전 달 넣기
        for dayWeek in 0..<curFirstDayWeek - 1 {
            let preMonthDay = preMonthDays - dayWeek
            self.currentMonthArr.append(preMonthDay)
        }
        
        // 현재 달 넣기
        for day in 1...curMonthDays {
            self.currentMonthArr.append(day)
        }
        
        // 다음 달 넣기
        for day in 1...7 - curLastDayWeek {
            self.currentMonthArr.append(day)
        }
    }
}
