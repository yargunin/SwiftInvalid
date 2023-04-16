//
//  NumericLiteralsViewController.swift
//  SwiftInvalid
//
//  Created by admin on 25.03.2023.
//

import UIKit

class NumericLiteralsViewController: UIViewController {

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
        
        Числовые литералы могут быть написаны как:

        Десятичное число, без префикса
        Двоичное число, с префиксом 0b
        Восьмеричное число, с префиксом 0o
        Шестнадцатеричное число, с префиксом 0x
        Все эти литералы целого числа имеют десятичное значение 17:

        let decimalInteger = 17
        let binaryInteger = 0b10001 // 17 в двоичной нотации
        let octalInteger = 0o21 // 17 в восмеричной нотации
        let hexadecimalInteger = 0x11 // 17 в шестнадцатеричной нотации
        Литералы с плавающей точкой могут быть десятичными (без префикса) или шестнадцатеричными (с префиксом 0x). Они всегда должны иметь число (десятичное или шестнадцатеричное) по обе стороны от дробной точки. Они также могут иметь экспоненту, с указанием в верхнем или нижнем регистре е для десятичных чисел с плавающей точкой, или в верхнем или нижнем регистре р для шестнадцатеричных чисел с плавающей точкой.

        Для десятичных чисел с показателем степени ехр, базовое число умножается на 10exp:

        1.25e2 означает 1.25 × 102, или 125.0.
        1.25e-2 означает 1.25 × 10-2, или 0.0125.
        Для шестнадцатеричных чисел с показателем степени ехр, базовое число умножается на 2exp:

        0xFp2 означает 15 × 22, или 60.0.
        0xFp-2 означает 15 × 2-2, или 3.75.
        Все эти числа с плавающей точкой имеют десятичное значение 12.1875:

        let decimalDouble = 12.1875
        let exponentDouble = 1.21875e1
        let hexadecimalDouble = 0xC.3p0
        Числовые литералы могут содержать дополнительное форматирование, чтобы их было удобнее читать. Целые числа и числа с плавающей точкой могут быть дополнены нулями и могут содержать символы подчеркивания для увеличения читабельности. Ни один тип форматирования не влияет на базовое значение литерала:

        let paddedDouble = 000123.456
        let oneMillion = 1_000_000
        let justOverOneMillion = 1_000_000.000_000_1
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
        button.setTitle("Преобразования числовых типов", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17) // Установка жирного шрифта для заголовка кнопки
        button.frame = CGRect(x: scrollView.contentSize.width - 320, y: scrollView.contentSize.height, width: 300, height: -100)
        scrollView.addSubview(button)
    }
    
    // действие при нажатии на кнопку
    @objc func buttonTapped() {
        let NextVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ConvertingNumericTypesViewController") as! ConvertingNumericTypesViewController
        navigationController?.pushViewController(NextVC, animated: true)
 
    }
    
    
}
