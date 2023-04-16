//
//  CustomTypesViewController.swift
//  SwiftInvalid
//
//  Created by admin on 30.03.2023.
//

import UIKit

class CustomTypesViewController: UIViewController {

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
            Константы и переменные связывают имя (например, maximumNumberOfLoginAttempts или welcomeMessage) со значением определенного типа (например, число 10 или строка "Hello"). Значение константы не может быть изменено после его установки, тогда как переменной может быть установлено другое значение в будущем.
            
            Объявление констант и переменных
            Константы и переменные должны быть объявлены, перед тем как их использовать. Константы объявляются с помощью ключевого слова let, а переменные с помощью var. Вот пример того, как константы и переменные могут быть использованы для отслеживания количества попыток входа, которые совершил пользователь:
            
            let maximumNumberOfLoginAttempts = 10
            var currentLoginAttempt = 0
            Этот код можно прочесть как:
            
            «Объяви новую константу с именем maximumNumberOfLoginAttempts, и задай ей значение 10. Потом, объяви новую переменную с именем currentLoginAttempt, и задай ей начальное значение 0.»
            
            В этом примере максимальное количество доступных попыток входа объявлено как константа, потому что максимальное значение никогда не меняется. Счетчик текущего количества попыток входа объявлен как переменная, потому что это значение должно увеличиваться после каждой неудачной попытки входа.
            
            Вы можете объявить несколько констант или несколько переменных на одной строке, разделяя их запятыми:
            
            var x = 0.0, y = 0.0, z = 0.0
            Заметка
            Если хранимое значение в вашем коде не будет меняться, всегда объявляйте его как константу, используя ключевое слово let. Используйте переменные только для хранения значений, которые должны будут меняться.
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
            button.setTitle("Уровень доступа класса и подкласса", for: .normal)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17) // Установка жирного шрифта для заголовка кнопки
            button.frame = CGRect(x: scrollView.contentSize.width - 200, y: scrollView.contentSize.height, width: 200, height: -100)
            scrollView.addSubview(button)
        }
        
        // действие при нажатии на кнопку
        @objc func buttonTapped() {
            let NextVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ClassSubclassViewController") as! ClassSubclassViewController
            navigationController?.pushViewController(NextVC, animated: true)
     
        }
        
        
    }
