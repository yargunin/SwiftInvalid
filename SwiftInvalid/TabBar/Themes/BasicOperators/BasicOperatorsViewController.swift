//
//  BasicOperatorsViewController.swift
//  SwiftInvalid
//
//  Created by admin on 28.03.2023.
//

import UIKit

class BasicOperatorsViewController: UIViewController {

    @IBOutlet var LableInfo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

            
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
           
            // Создание UIScrollView
            let scrollView = UIScrollView(frame: view.bounds)
            scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            scrollView.contentSize = CGSize(width: view.bounds.width, height: 1100)
            scrollView.isScrollEnabled = true
            scrollView.backgroundColor = .white
           
            
        let imageAttachment = NSTextAttachment()
        let originalImage = UIImage(named: "Базовые операторы")
        let resizedImage = originalImage?.resize(toWidth: 365, height: 1000)
        imageAttachment.image = resizedImage
        let imageString = NSAttributedString(attachment: imageAttachment)

        LableInfo.attributedText = imageString
            LableInfo.sizeToFit()
            
            // Добавление UILabel в UIScrollView
            scrollView.addSubview(LableInfo)
            
            // Добавление UIScrollView на view контроллера
            view.addSubview(scrollView)
            
            // Создание кнопки
            let button = UIButton(type: .system)
            button.setTitle("Оператор присваивания", for: .normal)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17) // Установка жирного шрифта для заголовка кнопки
            button.frame = CGRect(x: scrollView.contentSize.width - 240, y: scrollView.contentSize.height, width: 240, height: -100)
            scrollView.addSubview(button)
        }
        
        // действие при нажатии на кнопку
        @objc func buttonTapped() {
            let NextVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AssignmentOperatorsViewController") as! AssignmentOperatorsViewController
            navigationController?.pushViewController(NextVC, animated: true)
     
        }
        
        
    }
