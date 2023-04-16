//
//  OptionalTypesViewController.swift
//  SwiftInvalid
//
//  Created by admin on 25.03.2023.
//

import UIKit

class OptionalTypesViewController: UIViewController {

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
        Опциональные типы используются в тех случаях, когда значение может отсутствовать. Опциональный тип подразумевает, что возможны два варианта: или значение есть, и его можно извлечь из опционала, либо его вообще нет.

        Заметка
        В C или Objective-C нет понятия опционалов. Ближайшее понятие в Objective-C это возможность вернуть nil из метода, который в противном случае вернул бы объект. В этом случае nil обозначает «отсутствие допустимого объекта». Тем не менее, это работает только для объектов, и не работает для структур, простых типов C, или значений перечисления. Для этих типов, методы Objective-C, как правило, возвращают специальное значение (например, NSNotFound), чтобы указать отсутствие значения. Этот подход предполагает, что разработчик, который вызвал метод, знает, что есть это специальное значение и что его нужно учитывать. Опционалы Swift позволяют указать отсутствие значения для абсолютно любого типа, без необходимости использования специальных констант.

        Приведем пример, который покажет, как опционалы могут справиться с отсутствием значения. У типа Int в Swift есть инициализатор, который пытается преобразовать значение String в значение типа Int. Тем не менее, не каждая строка может быть преобразована в целое число. Строка "123" может быть преобразована в числовое значение 123, но строка "hello, world" не имеет очевидного числового значения для преобразования.

        В приведенном ниже примере используется метод Int() для попытки преобразовать String в Int:

        let possibleNumber = "123"
        let convertedNumber = Int(possibleNumber)
        // для convertedNumber выведен тип "Int?", или "опциональный Int"
        Поскольку метод Int() может иметь недопустимый аргумент, он возвращает опциональный Int, вместо Int. Опциональный Int записывается как Int?, а не Int. Знак вопроса означает, что содержащееся в ней значение является опциональным, что означает, что он может содержать некое Int значение, или он может вообще не содержать никакого значения. (Он не может содержать ничего другого, например, Bool значение или значение String. Он либо Int, либо вообще ничто)

        nil
        Мы можем установить опциональную переменную в состояние отсутствия значения, путем присвоения ему специального значения nil

        var serverResponseCode: Int? = 404
        // serverResponseCode содержит реальное Int значение 404
        serverResponseCode = nil
        // serverResponseCode теперь не содержит значения
        Заметка
        nil не может быть использован с не опциональными константами и переменными. Если значение константы или переменной при определенных условиях в коде должно когда-нибудь отсутствовать, всегда объявляйте их как опциональное значение соответствующего типа.

        Если объявить опциональную переменную без присвоения значения по умолчанию, то переменная автоматически установится в nil для вас:

        var surveyAnswer: String?
        // surveyAnswer автоматически установится в nil
        Заметка
        nil в Swift не то же самое что nil в Objective-C. В Objective-C nil является указателем на несуществующий объект. В Swift nil не является указателем, а является отсутствием значения определенного типа. Устанавливаться в nil могут опционалы любого типа, а не только типы объектов.
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
        button.setTitle("Утверждения и предусловия", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17) // Установка жирного шрифта для заголовка кнопки
        button.frame = CGRect(x: scrollView.contentSize.width - 300, y: scrollView.contentSize.height, width: 300, height: -100)
        scrollView.addSubview(button)
    }
    
    // действие при нажатии на кнопку
    @objc func buttonTapped() {
        let NextVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "StatementsAndPreconditionsViewController") as! StatementsAndPreconditionsViewController
        navigationController?.pushViewController(NextVC, animated: true)
 
    }
    
    
}
