//
//  logicalTypesViewController.swift
//  SwiftInvalid
//
//  Created by admin on 19.03.2023.
//

import UIKit

class logicalTypesViewController: UIViewController {
    
    @IBOutlet var LableInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
       
        // Создание UIScrollView
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2200)
        scrollView.isScrollEnabled = true
        
       
        
        LableInfo.text = """
        В Swift есть простой логический тип Bool. Этот тип называют логическим, потому что он может быть только true или false. Swift предусматривает две логические константы, true и false соответственно:

        let orangesAreOrange = true
        let turnipsAreDelicious = false
        Типы для orangesAreOrange и turnipsAreDelicious были выведены как Bool, исходя из того факта, что мы им присвоили логические литералы. Так же как с Int и Double в предыдущих главах, вам не нужно указывать константы или переменные как Bool, если при создании вы присвоили им значения true или false. Вывод типов помогает сделать код Swift кратким и читабельным тогда, когда вы создаете константы или переменные со значениями которые точно известны.

        Логические значения очень полезны когда вы работаете с условными операторами, такими как оператор if:

        if turnipsAreDelicious {
         print("Mmm, tasty turnips!")
        } else {
         print("Eww, turnips are horrible.")
        }
        // Выведет "Eww, turnips are horrible."
        Условные операторы, такие как оператор if детально рассматриваются в главе Управление потоком.

        Строгая типизация Swift препятствует замене значения Bool на не логическое значение. Следующий пример выведет ошибку компиляции:

        let i = 1
        if i {
         // этот пример не скомпилируется, и выдаст ошибку компиляции
        }
        Тем не менее, альтернативный пример ниже правильный:

        let i = 1
        if i == 1 {
         // этот пример выполнится успешно
        }
        Результат сравнения i == 1 имеет тип Bool, и поэтому этот второй пример совершает проверку типов. Такие сравнения как i == 1 обсуждаются в главе Базовые операторы.

        Как в других примерах строгой типизации в Swift, этот подход предотвращает случайные ошибки и гарантирует, что замысел определенной части кода понятен.
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
        button.setTitle("Кортежи", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17) // Установка жирного шрифта для заголовка кнопки
        button.frame = CGRect(x: scrollView.contentSize.width - 140, y: scrollView.contentSize.height, width: 120, height: -100)
        scrollView.addSubview(button)
    }
    
    // действие при нажатии на кнопку
    @objc func buttonTapped() {
        let NextVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TuplesViewController") as! TuplesViewController
        navigationController?.pushViewController(NextVC, animated: true)
 
    }
    
    
}
