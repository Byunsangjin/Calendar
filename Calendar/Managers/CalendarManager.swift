//
//  CalendarManager.swift
//  Calendar
//
//  Created by Byunsangjin on 22/07/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

import Foundation

struct DayInfo {
    var day: Int
    // 현재 날짜가 어느달의 날짜인지 확인하는 index
    var monthIndex: MonthIndex
    var isSunday: Bool
    
    init(day: Int,
         monthIndex: MonthIndex,
         isSunday: Bool = false) {
        self.day = day
        self.monthIndex = monthIndex
        self.isSunday = isSunday
    }
}

enum MonthIndex: Int {
    case PRE_MONTH = -1
    case CUR_MONTH = 0
    case NEXT_MONTH = 1
    
}

class CalendarManager {
    
    // MARK:- Constants
    static let shared = CalendarManager()
    let calendar = Calendar.current
    
    
    
    // MARK:- Variables
    var preMonthArr = [DayInfo]()
    var currentMonthArr = [DayInfo]()
    var nextMonthArr = [DayInfo]()
    
    var date = Date()
    
    var year = Date().getDate().year
    var month = Date().getDate().month
    var day = Date().getDate().year
    
    
    
    // MARK:- Methods
    func setMonthArr() {
        let curDate = date
        self.currentMonthArr = curDate.getMonthArray()
        self.preMonthArr = curDate.getPreMonthDate().getMonthArray()
        self.nextMonthArr = curDate.getNextMonthDate().getMonthArray()
    }
    
    
    
    func moveCurMonth() {
        date = Date()
        setMonthArr()
    }
    
    
    
    func movePreMonth() {
        date = date.getPreMonthDate()
        
        self.nextMonthArr = self.currentMonthArr
        self.currentMonthArr = self.preMonthArr
        
        self.preMonthArr = self.date.getPreMonthDate().getMonthArray()
    }
    
    
    
    func moveNextMonth() {
        date = date.getNextMonthDate()
        
        self.preMonthArr = self.currentMonthArr
        self.currentMonthArr = self.nextMonthArr
        
        self.nextMonthArr = self.date.getNextMonthDate().getMonthArray()
    }
}
