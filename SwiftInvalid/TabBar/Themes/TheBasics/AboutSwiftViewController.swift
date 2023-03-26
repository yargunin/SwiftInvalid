//
//  AboutSwiftViewController.swift
//  SwiftInvalid
//
//  Created by admin on 25.03.2023.
//

import UIKit

class AboutSwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Устанавливаем текст для кнопки назад
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)

        
    }

    @objc func goToLearnViewController() {
        // Создаем экземпляр LearnViewController из Storyboard
        let learnVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "LearnViewController") as! LearnViewController
        
        // Переходим на LearnViewController
        navigationController?.pushViewController(learnVC, animated: true)
    }

    

    @IBAction func nextLearnButtom(_ sender: Any) {
        
            let lectureVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "LectureViewController") as! LectureViewController
            navigationController?.pushViewController(lectureVC, animated: true)
        }

    }
    
    
    

