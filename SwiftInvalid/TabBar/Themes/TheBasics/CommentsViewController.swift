//
//  CommentsViewController.swift
//  SwiftInvalid
//
//  Created by admin on 25.03.2023.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet var LableInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
       
        // Создание UIScrollView
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1100)
        scrollView.isScrollEnabled = true
        
       
        
        LableInfo.text = """
        Используйте комментарии, чтобы добавить неисполняемый текст в коде, как примечание или напоминание самому себе. Комментарии игнорируются компилятором Swift во время компиляции кода.

        Комментарии в Swift очень похожи на комментарии в C. Однострочные комментарии начинаются с двух слешей (//):

        // это комментарий
        Вы также можете написать многострочные комментарии, которые начинаются со слеша и звездочки (/*) и заканчиваются звездочкой, за которой следует слеш (*/):

        /* это тоже комментарий,
        но написанный на двух строках */
        В отличие от многострочных комментариев в C, многострочные комментарии в Swift могут быть вложены в другие многострочные комментарии. Вы можете написать вложенные комментарии, начав многострочный блок комментариев, а затем, начать второй многострочный комментарий внутри первого блока. Затем второй блок закрывается, а за ним закрывается первый блок:

        /* это начало первого многострочного комментария
        /* это второго, вложенного многострочного комментария */
        это конец первого многострочного комментария */
        Вложенные многострочные комментарии позволяют закомментировать большие блоки кода быстро и легко, даже если код уже содержит многострочные комментарии.
        """
        LableInfo.lineBreakMode = .byWordWrapping
        LableInfo.font = UIFont.systemFont(ofSize: 17)
        LableInfo.numberOfLines = 0
        LableInfo.sizeToFit()
        
        // Добавление UILabel в UIScrollView
        scrollView.addSubview(LableInfo)
        
        // Добавление UIScrollView на view контроллера
        view.addSubview(scrollView)
        
        // Создание кнопки
        let button = UIButton(type: .system)
        button.setTitle("Целые числа", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17) // Установка жирного шрифта для заголовка кнопки
        button.frame = CGRect(x: scrollView.contentSize.width - 160, y: scrollView.contentSize.height, width: 120, height: -100)
        scrollView.addSubview(button)
    }
    
    // действие при нажатии на кнопку
    @objc func buttonTapped() {
        let NextVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "IntegersViewController") as! IntegersViewController
        navigationController?.pushViewController(NextVC, animated: true)
 
    }
    
    
}
