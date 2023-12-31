//
//  CustomOperatorsViewController.swift
//  SwiftInvalid
//
//  Created by admin on 30.03.2023.
//

import UIKit

class CustomOperatorsViewController: UIViewController {
    
    @IBOutlet var LableInfo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        // Создание UIScrollView
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 5600)
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = .white
        
        
        let imageAttachment = NSTextAttachment()
        let originalImage = UIImage(named: "Пользовательские операторы")
        let resizedImage = originalImage?.resize(toWidth: 365, height: 5500)
        imageAttachment.image = resizedImage
        let imageString = NSAttributedString(attachment: imageAttachment)

        LableInfo.attributedText = imageString
        
        // Добавление UILabel в UIScrollView
        scrollView.addSubview(LableInfo)
        
        // Добавление UIScrollView на view контроллера
        view.addSubview(scrollView)
        
        
        
        
        
    }
}
