//
//  IntegersViewController.swift
//  SwiftInvalid
//
//  Created by admin on 25.03.2023.
//

import UIKit

class IntegersViewController: UIViewController {

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
        Integer (целое число) - это число, не содержащее дробной части, например, как 42 и -23. Целые числа могут быть либо знаковыми (положительными, ноль или отрицательными) либо беззнаковыми (положительными или ноль).

        Swift предусматривает знаковые и беззнаковые целые числа в 8, 16, 32 и 64 битном форматах. Эти целые числа придерживаются соглашения об именах, аналогичных именам в C, в том, что 8-разрядное беззнаковое целое число имеет тип Uint8, а 32-разрядное целое число имеет тип Int32. Как и все типы в Swift, эти типы целых чисел пишутся с заглавной буквы.

        Границы целых чисел
        Вы можете получить доступ к минимальному и максимальному значению каждого типа целого числа с помощью его свойств min и max:

        let minValue = UInt8.min // minValue равен 0, а его тип UInt8
        let maxValue = UInt8.max // maxValue равен 255, а его тип UInt8
        Тип значения этих свойств соответствует размеру числа (в примере выше этот тип UInt8) и поэтому может быть использован в выражениях наряду с другими значениями того же типа.

        Int
        В большинстве случаев вам не нужно будет указывать конкретный размер целого числа для использования в коде. В Swift есть дополнительный тип целого числа - Int, который имеет тот же размер что и разрядность системы:

        На 32-битной платформе, Int того же размера что и Int32
        На 64-битной платформе, Int того же размера что и Int64
        Если вам не нужно работать с конкретным размером целого числа, всегда используйте в своем коде Int для целых чисел. Это придает коду логичность и совместимость. Даже на 32-битных платформах, Int может хранить любое значение в пределах -2 147 483 648 и 2 147 483 647, а этого достаточно для многих диапазонов целых чисел.

        UInt
        Swift также предусматривает беззнаковый тип целого числа - UInt, который имеет тот же размер что и разрядность системы:

        На 32-битной платформе, UInt того же размера что и UInt32
        На 64-битной платформе, UInt того же размера что и UInt64
        Заметка
        Используйте UInt, только когда вам действительно нужен тип беззнакового целого с размером таким же, как разрядность системы. Если это не так, использовать Int предпочтительнее, даже когда известно, что значения будут неотрицательными. Постоянное использование Int для целых чисел способствует совместимости кода, позволяет избежать преобразования между разными типами чисел, и соответствует выводу типа целого числа, как описано в Строгая типизация и Вывод Типов.
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
        button.setTitle("Числовые литералы", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17) // Установка жирного шрифта для заголовка кнопки
        button.frame = CGRect(x: scrollView.contentSize.width - 200, y: scrollView.contentSize.height, width: 180, height: -100)
        scrollView.addSubview(button)
    }
    
    // действие при нажатии на кнопку
    @objc func buttonTapped() {
        let NextVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "NumericLiteralsViewController") as! NumericLiteralsViewController
        navigationController?.pushViewController(NextVC, animated: true)
 
    }
    
    
}
