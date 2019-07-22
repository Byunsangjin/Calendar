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
        let year = calendar.component(.year, from: Date())
        let month = calendar.component(.month, from: Date())
        let day = calendar.component(.day, from: Date())
        
        return (year, month, day)
    }
}
