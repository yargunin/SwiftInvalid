//
//  AnnotationOfTypesViewController.swift
//  SwiftInvalid
//
//  Created by admin on 25.03.2023.
//

import UIKit

class AnnotationOfTypesViewController: UIViewController {

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
        Вы можете добавить обозначение типа, когда объявляете константу или переменную, чтобы иметь четкое представление о типах значений, которые могут хранить константы или переменные. Написать обозначение типа, можно поместив двоеточие после имени константы или переменной, затем пробел, за которым следует название используемого типа.

        Этот пример добавляет обозначение типа для переменной с именем welcomeMessage, чтобы обозначить, что переменная может хранить String:

        var welcomeMessage: String
        Двоеточие в объявлении значит "...типа...", поэтому код выше может быть прочитан как:

        «Объяви переменную с именем welcomeMessage, тип которой будет String»

        Фраза «тип которой будет String» означает «может хранить любое String значение». Представьте, что словосочетание «тип которой будет такой-то» означает - значение, которое будет храниться.

        Теперь переменной welcomeMessage можно присвоить любое текстовое значение, без каких либо ошибок:

        welcomeMessage = "Hello"
        Вы можете создать несколько переменных одного типа в одной строке, разделенной запятыми, с одной аннотацией типа после последнего имени переменной:

        var red, green, blue: Double
        Заметка
        Редко когда вам понадобится обозначать тип на практике. Когда вы даете начальное значение константе или переменной на момент объявления, Swift всегда может вывести тип, который будет использовать в константе или переменной. Это описано в Строгая типизация и Вывод типов. В примере welcomeMessage выше, не было присвоения начального значения, так что тип переменной welcomeMessage указывается с помощью обозначения типа вместо того, чтобы вывести из начального значения.


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
        button.setTitle("Печать констант и переменных", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17) // Установка жирного шрифта для заголовка кнопки
        button.frame = CGRect(x: scrollView.contentSize.width - 310, y: scrollView.contentSize.height, width: 300, height: -100)
        scrollView.addSubview(button)
    }
    
    // действие при нажатии на кнопку
    @objc func buttonTapped() {
        let NextVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "LetAndVarViewController") as! LetAndVarViewController
        navigationController?.pushViewController(NextVC, animated: true)
 
    }
    
    
}
