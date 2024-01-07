//
//  StatementsAndPreconditionsViewController.swift
//  SwiftInvalid
//
//  Created by admin on 25.03.2023.
//

import UIKit

class StatementsAndPreconditionsViewController: UIViewController {

    @IBOutlet var LableInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
       
        // Создание UIScrollView
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1800)
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = .white
       
        
        let imageAttachment = NSTextAttachment()
        let originalImage = UIImage(named: "Утверждения и предусловия")
        let resizedImage = originalImage?.resize(toWidth: 365, height: 1700)
        imageAttachment.image = resizedImage
        let imageString = NSAttributedString(attachment: imageAttachment)

        LableInfo.attributedText = imageString
        
        // Добавление UILabel в UIScrollView
        scrollView.addSubview(LableInfo)
        
        // Добавление UIScrollView на view контроллера
        view.addSubview(scrollView)
        
        // Создание кнопки
        let button = UIButton(type: .system)
        button.setTitle("Базовые операторы", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17) // Установка жирного шрифта для заголовка кнопки
        button.frame = CGRect(x: scrollView.contentSize.width - 200, y: scrollView.contentSize.height, width: 200, height: -100)
        scrollView.addSubview(button)
        
        // Создание кнопки "К Тесту"
                let testButton = UIButton(type: .system)
                testButton.setTitle("К Тесту", for: .normal)
                testButton.addTarget(self, action: #selector(testButtonTapped), for: .touchUpInside)
                testButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
                testButton.frame = CGRect(x: scrollView.contentSize.width - 400, y: scrollView.contentSize.height , width: 100, height: -100)
                scrollView.addSubview(testButton)
    }
    
    // действие при нажатии на кнопку
    @objc func buttonTapped() {
        let NextVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "BasicOperatorsViewController") as! BasicOperatorsViewController
        navigationController?.pushViewController(NextVC, animated: true)
 
    }
    
    @objc func testButtonTapped() {
        let NextVC = UIStoryboard(name: "Tests", bundle: nil).instantiateViewController(withIdentifier: "BasicsViewController") as! BasicsViewController
        navigationController?.pushViewController(NextVC, animated: true)
       }
    
}
