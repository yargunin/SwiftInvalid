//
//  dataTypesViewController.swift
//  SwiftInvalid
//
//  Created by admin on 19.03.2023.
//

import UIKit

class dataTypesViewController: UIViewController {
    
    
    @IBOutlet var LableInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
       
        // Создание UIScrollView
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 3800)
        scrollView.isScrollEnabled = true
        
       
        
        LableInfo.text = """
                В этой статье мы продолжаем изучать программирование на Swift, языке, с помощью которого создаются приложения для iOS и программы для OS X. Сегодня вас ждет обзор типов данных языка программирования Swift, а также немного кода.

                При написании кода мы работаем с разными типами данных Swift. Базовые типы, которые используются чаще всего:

                String (текстовая строка);
                Int (целое число);
                Float (32-битное число с плавающей точкой);
                Double (64-битное число с плавающей точкой для более длинных переменных);
                Bool (логическое значение «true» или «false»).
                Swift обрабатывает их всех по отдельности. Посмотрим на особенности типов данных Swift.
                
                Тип String
                Строки бывают длинными (миллион и более букв), короткими (10 букв) или даже пустыми (без единой буквы). При этом все они работают одинаково.

                Swift знает, что переменная name должна содержать строку, поскольку при ее создании мы ввели текстовое значение «Tim McGraw»:

                var name = "Tim McGraw"
                Если переписать код следующим образом, наш проект перестанет работать:

                var name
                name = "Tim McGraw"
                Xcode выдаст сообщение об ошибке: «Type annotation missing in pattern», что переводится буквально как: «Я не могу определить тип данных, потому что вы не предоставили достаточно информации».

                Как поступить в такой ситуации? На самом деле у нас есть два варианта действий: либо инициировать переменную с первоначальным значением, либо указать ее тип. Создадим переменную, указав ее тип (String) после двоеточия, а начальное значение присвоим позже в любой части кода:

                var name: String
                name = "Tim McGraw"
                Такая запись не приведет к ошибке, поскольку Swift знает, какой тип данных переменная name получит в будущем.

                Обратите внимание: чтобы ваш код был «чистым», не ставьте пробел перед двоеточием.
                
                Тип Int
                Попробуем создать новую переменную с типом Int, которая содержит целое число, т.е. число без дробной части. Это могут быть как положительные (простые), так и отрицательные целые числа: 3, 30, 300, –16777216...

                var name: String
                name = "Tim McGraw"
                var age: Int
                age = 25
                Мы инициировали строковую переменную name и целочисленную переменную age.

                Обратите внимание на обязательные требования: в языке Swift принято стандартное соглашение о кодировании, согласно которому имена переменных, констант, методов, функций начинаются с прописной буквы (name, age), а типов данных — с заглавной (String, Int).

                Теперь, когда у нас есть две переменные с различными типами данных, мы можем проверить работу механизма соответствия типов в действии. Сделаем следующее:

                name = 25
                age = "Time McGraw"
                В этом коде мы пытаемся присвоить целое число строковой переменной и строку — целочисленной переменной. К счастью, Xcode сообщит нам об ошибках, соблюдая негласное соглашение: программист сообщает о том, какие данные собирается хранить в переменных, а среда берет на себя функции контроля за их строгим и неукоснительным соблюдением.

                Перед тем, как двигаться дальше, удалите или закомментируйте эти две строки, в противном случае весь последующий код в playground работать не будет.
                
                Типы Float и Double
                В Swift типы данных Float и Double используются для хранения чисел с плавающей запятой, например: 3,1; 3,141; 3,1415926; –16777216,5. Они отличаются между собой только количеством отображаемых цифр в десятичной части числа. Компания Apple рекомендует всегда использовать тип Double по умолчанию.

                Введите следующий код в playground:

                var latitude: Double
                latitude = 36.166667
                var longitude: Float
                longitude = –86.783333
                Обратите внимание, что при выводе результатов в правой части рабочей области playground переменная longitude где–то «потеряла» цифру «3» в конце. Чтобы лучше понять и разобраться с тем, что происходит, немного изменим наш предыдущий код:

                var longitude: Float
                longitude = –86.783333
                longitude = –186.783333
                longitude = –1286.783333
                longitude = –12386.783333
                longitude = –123486.783333
                longitude = –1234586.783333
                Переменная longitude имеет тип Float, в котором предусмотрено 8 бит для хранения данных. Это накладывает ограничения на отображение целой и дробной части — Swift постоянно пытается «выровнять» число, «забирая» разряды из дробной и добавляя их в целую часть числа. Чем ближе левая сторона к своему максимуму, тем меньше места остается для правой!
                Изменив тип с Float на Double, мы получим корректное отображение всех чисел:

                var longitude: Double
                В этом примере показано основное отличие между типами Double и Float. Оно заключается в двойной точности хранения и отображения хранимых чисел. Отдельно хочу обратить внимание на то, что при попытке ввода большого числа вроде 123456789,123456789 результат будет округлен до 123456789,1234568.

                Тип Boolean
                У Swift есть встроенный тип данных, который используется для хранения значений «true» и «false». Он называется Boolean или коротко Bool:

                var stayOutTooLate: Bool
                stayOutTooLate = true
                var nothingInBrain: Bool
                nothingInBrain = true
                var missABeat: Bool
                missABeat = false
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
        button.setTitle("Многострочные строки", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17) // Установка жирного шрифта для заголовка кнопки
        button.frame = CGRect(x: scrollView.contentSize.width - 180, y: scrollView.contentSize.height, width: 150, height: -100)
        scrollView.addSubview(button)
    }
    
    // действие при нажатии на кнопку
    @objc func buttonTapped() {
        let NextVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "multilineLinesViewController") as! multilineLinesViewController
        navigationController?.pushViewController(NextVC, animated: true)
 
    }
    
    
}
