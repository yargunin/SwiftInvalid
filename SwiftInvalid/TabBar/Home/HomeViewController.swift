//
//  HomeViewController.swift
//  SwiftInvalid
//
//  Created by admin on 06.02.2023.
//

import UIKit
import UICircularProgressRing

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let width = view.frame.width
        let height = view.frame.height
        let progressRing = UICircularProgressRing(frame: CGRect(x: (width - 100) / 2, y: (height - 100) / 2, width: 100, height: 100))
        view.addSubview(progressRing)
        progressRing.maxValue = 100
        progressRing.innerRingColor = UIColor.gray
        progressRing.outerRingColor = UIColor.blue
        progressRing.fontColor = UIColor.white
        progressRing.font = UIFont.systemFont(ofSize: 20)
        progressRing.value = 50
        progressRing.startProgress(to: 50, duration: 2.0)
    }
}

    
    
    

