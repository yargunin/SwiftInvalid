//
//  AboutSwiftViewController.swift
//  SwiftInvalid
//
//  Created by admin on 25.03.2023.
//

import UIKit

class AboutSwiftViewController: UIViewController {
    
    
    
    @IBOutlet var LableInfo: UILabel!
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        
       // navigationItem.rightBarButtonItem = UIBarButtonItem(title: "К тесту", style: .plain, target: nil, action: nil)

        // Создание UIScrollView
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1400)
        scrollView.isScrollEnabled = true
        
    
        
        LableInfo.text = """
            Swift - новый язык программирования для разработки приложений под iOS, macOS, watchOS и tvOS. Несмотря на это, многие части Swift могут быть вам знакомы из вашего опыта разработки на C и Objective-C.
        
            Swift предоставляет свои собственные версии фундаментальных типов C и Objective-C, включая Int для целых чисел, Double и Float для значений с плавающей точкой, Bool для булевых значений, String для текста. Swift также предоставляет мощные версии трех основных типов коллекций, Array, Set и Dictionary, как описано в разделе Типы коллекций.
        
            Подобно C, Swift использует переменные для хранения и обращения к значениям по уникальному имени. Swift также широко использует переменные, значения которых не могут быть изменены. Они известны как константы, и являются гораздо более мощными, чем константы в C. Константы используются в Swift повсеместно, чтобы сделать код безопаснее и чище в случаях, когда вы работаете со значениями, которые не должны меняться.
        
            В дополнение к знакомым типам, Swift включает расширенные типы, которых нет в Objective-C. К ним относятся кортежи, которые позволяют создавать и передавать группы значений. Кортежи могут возвращать несколько значений из функции как одно целое значение.
        
            Swift также включает опциональные типы, которые позволяют работать с отсутствующими значениями. Опциональные значения говорят либо «здесь есть значение, и оно равно х», либо «здесь нет значения вообще». Опциональные типы подобны использованию nil с указателями в Objective-C, но они работают со всеми типами, не только с классами. Опциональные значения безопаснее и выразительнее чем nil указатели в Objective-C, и находятся в сердце многих наиболее мощных особенностей Swift.
        
            Swift - язык типобезопасный, что означает, что Swift помогает вам понять, с какими типами значений ваш код может работать. Если кусок вашего кода ожидает String, безопасность типов не даст вам передать ему Int по ошибке. Кроме того, безопасность типов не позволит вам случайно передать опциональный String куску кода, который ожидает неопциональный String. Безопасность типов позволяет вам улавливать и исправлять ошибки как можно раньше в процессе разработки.
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
        button.setTitle("Переменные и Константы", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17) // Установка жирного шрифта для заголовка кнопки
        button.frame = CGRect(x: scrollView.contentSize.width - 250, y: scrollView.contentSize.height, width: 250, height: -100)
        scrollView.addSubview(button)
    }
    
    

    
    // действие при нажатии на кнопку
    @objc func buttonTapped() {
        let NextVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "LectureViewController") as! LectureViewController
        navigationController?.pushViewController(NextVC, animated: true)
 
    }
    
    
   
    }

    

    
    
    

