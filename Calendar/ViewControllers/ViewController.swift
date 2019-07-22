//
//  ViewController.swift
//  Calendar
//
//  Created by Byunsangjin on 22/07/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Constants
    let CELL_WIDTH = 38
    let CELL_HEIGHT = 38
    

    // MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(CalendarManager.shared.getMonthDaysNumber())
    }
}



extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayCollectionViewCell", for: indexPath) as! DayCollectionViewCell
        cell.dayLabel.text = "\(indexPath.row)"
        
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
