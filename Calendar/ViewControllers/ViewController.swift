//
//  ViewController.swift
//  Calendar
//
//  Created by Byunsangjin on 22/07/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet var calendarView: UICollectionView!
    @IBOutlet var viewHeightConstraint: NSLayoutConstraint!
    
    
    
    // MARK:- Constants
    let CELL_WIDTH = 38
    let CELL_HEIGHT = 38
    
    
    
    // MARK:- Variables
    var curMonthArr = [DayInfo]()
    
    

    // MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CalendarManager.shared.setMonthArr()
        self.curMonthArr = CalendarManager.shared.currentMonthArr
    }
    
    
    
    // MARK:- Actions
    @IBAction func preBtnTouched(_ sender: Any) {
        CalendarManager.shared.movePreMonth()
        self.curMonthArr = CalendarManager.shared.currentMonthArr
        
        self.viewHeightConstraint.constant = CGFloat(self.curMonthArr.count / 7 * CELL_HEIGHT)
        self.calendarView.reloadData()
    }
    
    
    
    @IBAction func nextBtnTouched(_ sender: Any) {
        CalendarManager.shared.moveNextMonth()
        self.curMonthArr = CalendarManager.shared.currentMonthArr
        
        self.viewHeightConstraint.constant = CGFloat(self.curMonthArr.count / 7 * CELL_HEIGHT)
        self.calendarView.reloadData()
    }
}



extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.curMonthArr.count
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayCollectionViewCell", for: indexPath) as! DayCollectionViewCell
        
        let dayInfo = self.curMonthArr[indexPath.row]
        var textColor = UIColor.red
        if !dayInfo.isSunday {
            let textAlpha:CGFloat = dayInfo.monthIndex == MonthIndex.CUR_MONTH ? 0.5 : 0.2
            textColor = UIColor.black.withAlphaComponent(textAlpha)
        }
        
        cell.dayLabel.textColor = textColor
        cell.dayLabel.text = "\(self.curMonthArr[indexPath.row].day)"
        
        return cell
    }
}



extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CELL_WIDTH, height: CELL_HEIGHT)
    }
}



class DayCollectionViewCell: UICollectionViewCell {
    @IBOutlet var dayLabel: UILabel!
}
