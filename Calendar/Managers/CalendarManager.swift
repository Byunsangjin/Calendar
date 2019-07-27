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
    
    func setMonthArr() {
        let curDate = date
        self.currentMonthArr = curDate.getMonthArray()
        self.preMonthArr = curDate.getPreMonthDate().getMonthArray()
        self.nextMonthArr = curDate.getNextMonthDate().getMonthArray()
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
