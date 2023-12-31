//
//  AboutSwiftViewController.swift
//  SwiftInvalid
//
//  Created by admin on 25.03.2023.
//

import UIKit

class AboutSwiftViewController: UIViewController {
    
    
    
    @IBOutlet var LableInfo: UILabel!
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        
       // navigationItem.rightBarButtonItem = UIBarButtonItem(title: "К тесту", style: .plain, target: nil, action: nil)

        // Создание UIScrollView
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1100)
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = .white
    
        let imageAttachment = NSTextAttachment()
        let originalImage = UIImage(named: "О Swift")
        let resizedImage = originalImage?.resize(toWidth: 363, height: 1000)
        imageAttachment.image = resizedImage
        let imageString = NSAttributedString(attachment: imageAttachment)

        LableInfo.attributedText = imageString
        
        // Добавление UILabel в UIScrollView
        scrollView.addSubview(LableInfo)
        
        // Добавление UIScrollView на view контроллера
        view.addSubview(scrollView)
        
        // Создание кнопки
        let button = UIButton(type: .system)
        button.setTitle("Переменные и Константы", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17) // Установка жирного шрифта для заголовка кнопки
        button.frame = CGRect(x: scrollView.contentSize.width - 250, y: scrollView.contentSize.height, width: 250, height: -100)
        scrollView.addSubview(button)
    }
    
    

    
    // действие при нажатии на кнопку
    @objc func buttonTapped() {
        let NextVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "LectureViewController") as! LectureViewController
        navigationController?.pushViewController(NextVC, animated: true)
 
    }
    
    
   
    }

    

    
    
    

