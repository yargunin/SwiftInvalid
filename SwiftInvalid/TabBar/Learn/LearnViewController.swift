
import UIKit

class LearnViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Properties
    var sections: [String] = []
    var cells: [String: [String]] = [:]
    let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        
        
        tableView.register(LearnTableViewCell.self, forCellReuseIdentifier: "cell")
        
        if self.sections.isEmpty {
            // Если данных в UserDefaults нет, то задаем их вручную
            self.sections = ["Основы", "Базовые операторы", "Строки и символы",
                             "Типы коллекций", "Управление потоком", "Функции", "Замыкания",
                             "Перечесления", "Структуры и классы", "Свойства", "Методы", "Сабскрипты", "Наследование",
                             "Инициализация", "Деинициализация", "Опциональная последовательность",
                             "Обработка ошибок", "Согласованность","Приведение типов",
                             "Вложенные типы", "Расширения", "Непрозрачные типы",
                             "Протоколы", "Универсальные шаблоны",
                             "Автоматический подсчет ссылок (ARC)", "Безопасность хранения",
                             "Контроль доступа","Продвинутые операторы"]
            
            
            self.cells = [
                "Основы": ["О Swift", "Переменные и Константы", "Типы данных", "Многострочные строки",  "Аннотация типов", "Печать констант и переменных", "Комментарии", "Целые числа",
                          "Числовые литералы", "Преобразования числовых типов", "Логические типы", "Кортежи", "Опциональные типы (опционалы)", "Утверждения и предусловия"],
                "Базовые операторы": ["Терминология", "Оператор присваивания", "Арифметические операторы", "Cоставные операторы присваивания", "Операторы сравнения", "Тернарный условный оператор",
                                     "Оператор объединения по nil", "Операторы диапазона", "Логические операторы"],
                "Строки и символы": ["Строки и символы", "Строковые литералы", "Инициализация пустых строк", "Конкатенация строк и символов", "Интерполяция строк", "Юникод (Unicode)",
                                    "Подсчет символов", "Доступ и изменение строки", "Подстроки", "Сравнение строк"],
                "Типы коллекций": ["О Типах", "Массивы", "Множества", "Словари"],
                "Управление потоком": ["О Потоках", "Циклы For-in", "Циклы While", "Условные инструкции", "Операторы передачи управления", "Ранний выход и Проверка доступности API"],
                "Функции": ["О Функциях", "Объявление и вызов функций", "Параметры функции и возвращаемые значения", "Ярлыки аргументов и имена параметров функций", "Функциональные типы"],
                "Замыкания": ["О Замыканиях", "Замыкающие выражения", "Последующее замыкание", "Захват значений", "Замыкания - ссылочный тип"],
                "Перечесления": ["О Перечеслениях", "Синтаксис перечислений", "Использование перечислений с инструкцией switch", "Итерация по кейсам перечисления", "Ассоциативные значения", "Исходные значения"],
                "Структуры и классы": ["О Структурах и Классах", "Сравнение классов и структур", "Структуры и перечисления - типы значения", "Классы - ссылочный тип"],
                "Свойства": ["О Свойствах", "Свойства хранения", "Вычисляемые свойства", "Наблюдатели свойства", "Обертки для свойств", "Глобальные и локальные переменные", "Свойства типа",],
                "Методы": ["О Методах", "Методы экземпляра", "Методы типа",],
                "Сабскрипты": ["О Сабскриптах", "Синтаксис сабскрипта", "Использование сабскрипта", "Опции сабскрипта",],
                "Наследование": ["О Наследовании", "Определение базового класса", "Наследование подклассом", "Переопределение", "Предотвращение переопределений"],
                "Инициализация": ["О Инициализации", "Установка начальных значений для свойств хранения", "Настройка инициализации", "Дефолтные инициализаторы", "Делегирование инициализатора для типов значения",
                                 "Наследование и инициализация класса", "Проваливающиеся инициализаторы", "Требуемые инициализаторы"],
                "Деинициализация": ["Как работает деинициализация"],
                "Опциональная последовательность": ["ОП как альтернатива принудительному извлечению"],
                "Обработка ошибок": ["О Обработке ошибок", "Отображение и генерация ошибок", "Обработка ошибок"],
                "Согласованность": ["О Согласованности", "Определение и вызов асинхронных функций", "Задачи и группы задач"],
                "Приведение типов": ["О Приведение типов", "Определение классовой иерархии для приведения типов", "Проверка типа", "Понижающее приведение", "Приведение типов для Any и AnyObject"],
                "Вложенные типы": ["О Вложенных типах", "Вложенные типы в действии", "Ссылка на вложенные типы"],
                "Расширения": ["О Расширениях", "Синтаксис расширений", "Вычисляемые свойства в расширениях", "Инициализаторы в расширениях", "Методы в расширениях"],
                "Непрозрачные типы": ["О Непрозрачных типах", "Проблема, которую решают непрозрачные типы", "Возвращение непрозрачного типа", "Различия между типом протокола и непрозрачным типом"],
                "Протоколы": ["О Протоколах", "Синтаксис протокола", "Требование свойств", "Требование методов", "Требование инициализатора", "Протоколы как типы", "Коллекции типов протокола", "Композиция протоколов", "Проверка соответствия протоколу", "Опциональные требования протокола", "Расширения протоколов"],
                "Универсальные шаблоны": ["О Шаблонах", "Проблема, которую решают универсальные шаблоны", "Универсальные функции", "Параметры типа", "Расширяем универсальный тип", "Связанные типы", "Оговорка where"],
                "Автоматический подсчет ссылок (ARC)": ["О ARC", "Работа ARC", "ARC в действии", "Циклы сильных ссылок между экземплярами классов", "Замена циклов сильных ссылок между экземплярами классов",
                                                       "Циклы сильных ссылок в замыканиях", "Замена циклов сильных ссылок в замыканиях"],
                "Безопасность хранения": ["О Безопасности", "Что такое конфликт доступа к памяти", "Характеристики доступа к памяти", "Конфликты"],
                "Контроль доступа": ["О Контроле доступа", "Модули и исходные файлы", "Уровни доступа", "Синтаксис контроля доступа", "Пользовательские типы", "Уровень доступа класса и подкласса", "Константы, переменные, свойства и сабскрипт"],
                "Продвинутые операторы": ["О Продвинутых операторах", "Побитовые операторы", "Операторы переполнения", "Приоритет и ассоциативность", "Операторные функции", "Пользовательские операторы"]]
            
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LearnTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: - Table view data source
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName = sections[section]
        return cells[sectionName]!.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? LearnTableViewCell else {
            return UITableViewCell()
        }
        

        
        let sectionName = sections[indexPath.section]
        if let cellName = cells[sectionName]?[indexPath.row] {
            cell.textLabel?.text = cellName
        } else {
            cell.textLabel?.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionName = sections[indexPath.section]
        let cellName = cells[sectionName]![indexPath.row]
        
      
        switch cellName {
            
            
            // MARK: Основы
        case "О Swift":
            let AboutSwiftVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AboutSwiftViewController") as! AboutSwiftViewController
            navigationController?.pushViewController(AboutSwiftVC, animated: true)

        case "Переменные и Константы":
            let lectureVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "LectureViewController") as! LectureViewController
            navigationController?.pushViewController(lectureVC, animated: true)

        case "Типы данных":
            let dataTypesLectureVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "dataTypesViewController") as! dataTypesViewController
            navigationController?.pushViewController(dataTypesLectureVC, animated: true)

        case "Многострочные строки":
            let multilineLinesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "multilineLinesViewController") as! multilineLinesViewController
            navigationController?.pushViewController(multilineLinesVC, animated: true)
            
        case "Аннотация типов":
            let AnnotationOfTypesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AnnotationOfTypesViewController") as! AnnotationOfTypesViewController
            navigationController?.pushViewController(AnnotationOfTypesVC, animated: true)
            
        case "Печать констант и переменных":
            let LetAndVarVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "LetAndVarViewController") as! LetAndVarViewController
            navigationController?.pushViewController(LetAndVarVC, animated: true)

        case "Комментарии":
            let CommentsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "CommentsViewController") as! CommentsViewController
            navigationController?.pushViewController(CommentsVC, animated: true)

        case "Целые числа":
            let IntegersVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "IntegersViewController") as! IntegersViewController
            navigationController?.pushViewController(IntegersVC, animated: true)
            
        case "Числовые литералы":
            let NumericLiteralsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "NumericLiteralsViewController") as! NumericLiteralsViewController
            navigationController?.pushViewController(NumericLiteralsVC, animated: true)
            
        case "Преобразования числовых типов":
            let ConvertingVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ConvertingNumericTypesViewController") as! ConvertingNumericTypesViewController
            navigationController?.pushViewController(ConvertingVC, animated: true)
            
        case "Логические типы":
            let logicalTypesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "logicalTypesViewController") as! logicalTypesViewController
            navigationController?.pushViewController(logicalTypesVC, animated: true)
            
        case "Кортежи":
            let TuplesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TuplesViewController") as! TuplesViewController
            navigationController?.pushViewController(TuplesVC, animated: true)
            
        case "Опциональные типы (опционалы)":
            let OptionalTypesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "OptionalTypesViewController") as! OptionalTypesViewController
            navigationController?.pushViewController(OptionalTypesVC, animated: true)
            
        case "Утверждения и предусловия":
            let StatementsAndPreconditionsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "StatementsAndPreconditionsViewController") as! StatementsAndPreconditionsViewController
            navigationController?.pushViewController(StatementsAndPreconditionsVC, animated: true)
            
            
            
            // MARK: Типы Колекций
        case "О Типах":
            let AboutTypesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AboutTypesViewController") as! AboutTypesViewController
            navigationController?.pushViewController(AboutTypesVC, animated: true)

        case "Массивы":
            let ArrayVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ArrayViewController") as! ArrayViewController
            navigationController?.pushViewController(ArrayVC, animated: true)

        case "Множества":
            let SetsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "SetsViewController") as! SetsViewController
            navigationController?.pushViewController(SetsVC, animated: true)
            
        case "Словари":
            let DictionariesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "DictionariesViewController") as! DictionariesViewController
            navigationController?.pushViewController(DictionariesVC, animated: true)
            
        
            
        
            
        default:
            break
        }
    }



}


