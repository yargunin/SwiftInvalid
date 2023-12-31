
import UIKit

class LearnViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    // Properties
    var sections: [String] = []
    var cells: [String: [String]] = [:]
    var readLectures: Set<String> = Set(UserDefaults.standard.stringArray(forKey: "readLectures") ?? [])
    var selectedCells = [IndexPath]()
    var searchBar = UISearchBar()
    let tableView = UITableView()
    var filteredSections: [String] = []
    
    // Оригинальные данные
    var originalSections: [String] = []
    var originalCells: [String: [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData() // Вот эта строка важна
        // Сохраняем оригинальные данные
        originalSections = sections
        originalCells = cells
    }
    
    
    
    
    func setupUI() {
        // Настройка Search Bar
        searchBar.searchBarStyle = .default
        searchBar.placeholder = "Поиск"
        searchBar.delegate = self
        searchBar.isUserInteractionEnabled = true
        navigationItem.titleView = searchBar
        
        self.navigationItem.hidesBackButton = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        tableView.register(LearnTableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        // Настройка таблицы
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupData() {
        if self.sections.isEmpty {
            // Если данных в UserDefaults нет, то задаем их вручную
            self.sections = ["Основы", "Базовые операторы", "Строки и символы",
                             "Типы коллекций", "Управление потоком", "Функции", "Замыкания",
                             "Перечисления", "Структуры и классы", "Свойства", "Методы", "Сабскрипты", "Наследование",
                             "Инициализация", "Деинициализация", "Опциональная последовательность",
                             "Обработка ошибок", "Согласованность","Приведение типов",
                             "Вложенные типы", "Расширения", "Непрозрачные типы",
                             "Протоколы", "Универсальные шаблоны",
                             "Автоматический подсчет ссылок (ARC)", "Безопасность хранения",
                             "Контроль доступа","Продвинутые операторы"]
            
            
            self.cells = [
                "Основы": ["О Swift", "Переменные и Константы", "Аннотация типов", "Название констант и переменных", "Комментарии", "Целые числа",
                           "Числовые литералы", "Преобразования числовых типов", "Логические типы", "Кортежи", "Опциональные типы (опционалы)", "Утверждения и предусловия"],
                "Базовые операторы": ["Базовые операторы", "Оператор присваивания", "Арифметические операторы", "Cоставные операторы присваивания", "Операторы сравнения", "Тернарный условный оператор", "Оператор объединения по nil", "Операторы диапазона", "Логические операторы"],
                "Строки и символы": ["Строки и символы", "Строковые литералы", "Инициализация пустых строк", "Конкатенация строк и символов", "Интерполяция строк", "Юникод (Unicode)",
                                     "Подсчет символов", "Доступ и изменение строки", "Подстроки", "Сравнение строк"],
                "Типы коллекций": ["Типы коллекций", "Массивы", "Множества", "Словари"],
                "Управление потоком": ["Управление потоком", "Циклы For-in", "Циклы While", "Условные инструкции", "Операторы передачи управления", "Ранний выход и Проверка доступности API"],
                "Функции": ["Функции", "Объявление и вызов функций", "Параметры функции и возвращаемые значения", "Ярлыки аргументов и имена параметров функций", "Функциональные типы", "Вложенные функции"],
                "Замыкания": ["Замыкания", "Замыкающие выражения", "Последующее замыкание", "Захват значений", "Замыкания - ссылочный тип", "Сбегающие замыкания", "Автозамыкания (autoclosures)"],
                "Перечисления": ["Перечисления", "Синтаксис перечислений", "Использование перечислений с инструкцией switch", "Итерация по кейсам перечисления", "Ассоциативные значения", "Исходные значения", "Рекурсивные перечисления"],
                "Структуры и классы": ["Структуры и классы", "Сравнение классов и структур", "Структуры и перечисления - типы значения", "Классы - ссылочный тип"],
                "Свойства": ["Свойства", "Свойства хранения", "Вычисляемые свойства", "Наблюдатели свойства", "Обертки для свойств", "Глобальные и локальные переменные", "Свойства типа",],
                "Методы": ["Методы", "Методы экземпляра", "Методы типа",],
                "Сабскрипты": ["Сабскрипты", "Синтаксис сабскрипта", "Использование сабскрипта", "Опции сабскрипта",],
                "Наследование": ["Наследование", "Определение базового класса", "Наследование подклассом", "Переопределение", "Предотвращение переопределений"],
                "Инициализация": ["Инициализация", "Установка начальных значений для свойств хранения", "Настройка инициализации", "Дефолтные инициализаторы", "Делегирование инициализатора для типов значения",
                                  "Наследование и инициализация класса", "Проваливающиеся инициализаторы", "Требуемые инициализаторы"],
                "Деинициализация": ["Деинициализация"],
                "Опциональная последовательность": ["Опциональная последовательность"],
                "Обработка ошибок": ["Обработка ошибок", "Отображение и генерация ошибок", "Как обрабатывать ошибки"],
                "Согласованность": ["Согласованность", "Определение и вызов асинхронных функций", "Задачи и группы задач"],
                "Приведение типов": ["Приведение типов", "Определение классовой иерархии для приведения типов", "Проверка типа", "Понижающее приведение", "Приведение типов для Any и AnyObject"],
                "Вложенные типы": ["Вложенные типы", "Вложенные типы в действии", "Ссылка на вложенные типы"],
                "Расширения": ["Расширения", "Синтаксис расширений", "Вычисляемые свойства в расширениях", "Инициализаторы в расширениях", "Методы в расширениях"],
                "Непрозрачные типы": ["Непрозрачные типы", "Проблема, которую решают непрозрачные типы", "Возвращение непрозрачного типа", "Различия между типом протокола и непрозрачным типом"],
                "Протоколы": ["Протоколы", "Синтаксис протокола", "Требование свойств", "Требование методов", "Требования изменяющих методов", "Требование инициализатора", "Протоколы как типы",
                              "Делегирование", "Добавление реализации протокола через расширение", "Принятие протокола через синтезированную реализацию", "Коллекции типов протокола", "Наследование протокола", "Композиция протоколов", "Проверка соответствия протоколу", "Опциональные требования протокола", "Расширения протоколов"],
                "Универсальные шаблоны": ["Универсальные шаблоны", "Проблема, которую решают универсальные шаблоны", "Универсальные функции", "Параметры типа", "Расширяем универсальный тип", "Связанные типы", "Оговорка where"],
                "Автоматический подсчет ссылок (ARC)": ["О ARC", "Работа ARC", "ARC в действии", "Циклы сильных ссылок между экземплярами классов", "Замена циклов сильных ссылок между экземплярами классов",
                                                        "Циклы сильных ссылок в замыканиях", "Замена циклов сильных ссылок в замыканиях"],
                "Безопасность хранения": ["Безопасность хранения", "Что такое конфликт доступа к памяти", "Характеристики доступа к памяти", "Конфликты"],
                "Контроль доступа": ["Контроль доступа", "Модули и исходные файлы", "Уровни доступа", "Синтаксис контроля доступа", "Пользовательские типы", "Уровень доступа класса и подкласса", "Константы, переменные, свойства и сабскрипты"],
                "Продвинутые операторы": ["Продвинутые операторы", "Побитовые операторы", "Операторы переполнения", "Приоритет и ассоциативность", "Операторные функции", "Пользовательские операторы"]]
            
        }
    }
    
    // MARK: - Table view data source
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName = sections[section]
        return cells[sectionName]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if !filteredSections.isEmpty {
            return filteredSections.indices.contains(section) ? filteredSections[section] : nil
        } else {
            return sections.indices.contains(section) ? sections[section] : nil
        }
    }



    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let displayCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? LearnTableViewCell else {
            return UITableViewCell()
        }
        
        
        
        
        let sectionName = sections[indexPath.section]
        guard let sectionCells = cells[sectionName] else {
            return UITableViewCell()
        }
        
        let cellName = sectionCells[indexPath.row]
        displayCell.textLabel?.text = cellName
        displayCell.textLabel?.numberOfLines = 0
        
        let isRead = readLectures.contains(cellName)
        displayCell.accessoryType = isRead ? .checkmark : .none
        
        let contentWidth = tableView.frame.width - (tableView.contentInset.left + tableView.contentInset.right)
        displayCell.frame.size.width = contentWidth
        
        return displayCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionName = sections[indexPath.section]
        guard let cellName = cells[sectionName]?[indexPath.row], let cell = tableView.cellForRow(at: indexPath) as? LearnTableViewCell else {
            return
        }
        
        if !readLectures.contains(cellName) {
            readLectures.insert(cellName)
            UserDefaults.standard.set(Array(readLectures), forKey: "readLectures")
            cell.accessoryType = .checkmark
        }
        
        
        
        
        
        
        
        
        
        
        switch cellName {
            
            
            // MARK: Основы
        case "О Swift":
            let AboutSwiftVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AboutSwiftViewController") as! AboutSwiftViewController
            navigationController?.pushViewController(AboutSwiftVC, animated: true)
            
        case "Переменные и Константы":
            let lectureVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "LectureViewController") as! LectureViewController
            navigationController?.pushViewController(lectureVC, animated: true)
            
            
        case "Аннотация типов":
            let AnnotationOfTypesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AnnotationOfTypesViewController") as! AnnotationOfTypesViewController
            navigationController?.pushViewController(AnnotationOfTypesVC, animated: true)
            
        case "Название констант и переменных":
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
            
            
            
            // MARK: Базовые операторы
        case "Базовые операторы":
            let BasicOperatorsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "BasicOperatorsViewController") as! BasicOperatorsViewController
            navigationController?.pushViewController(BasicOperatorsVC, animated: true)
            
        case "Оператор присваивания":
            let AssignmentOperatorsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AssignmentOperatorsViewController") as! AssignmentOperatorsViewController
            navigationController?.pushViewController(AssignmentOperatorsVC, animated: true)
            
        case "Арифметические операторы":
            let ArithmeticOperatorsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ArithmeticOperatorsViewController") as! ArithmeticOperatorsViewController
            navigationController?.pushViewController(ArithmeticOperatorsVC, animated: true)
            
        case "Cоставные операторы присваивания":
            let CompoundOperatorsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "CompoundOperatorsViewController") as! CompoundOperatorsViewController
            navigationController?.pushViewController(CompoundOperatorsVC, animated: true)
            
        case "Операторы сравнения":
            let ComparisonOperatorsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ComparisonOperatorsViewController") as! ComparisonOperatorsViewController
            navigationController?.pushViewController(ComparisonOperatorsVC, animated: true)
            
        case "Тернарный условный оператор":
            let TernaryOperatorVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TernaryOperatorViewController") as! TernaryOperatorViewController
            navigationController?.pushViewController(TernaryOperatorVC, animated: true)
            
        case "Оператор объединения по nil":
            let TheUnionOperatorVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TheUnionOperatorViewController") as! TheUnionOperatorViewController
            navigationController?.pushViewController(TheUnionOperatorVC, animated: true)
            
        case "Операторы диапазона":
            let RangeOperatorVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "RangeOperatorViewController") as! RangeOperatorViewController
            navigationController?.pushViewController(RangeOperatorVC, animated: true)
            
        case "Логические операторы":
            let LogicalOperatorsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "LogicalOperatorsViewController") as! LogicalOperatorsViewController
            navigationController?.pushViewController(LogicalOperatorsVC, animated: true)
            
            
            
            // MARK: Строки и символы
            
        case "Строки и символы":
            let StringsAndSymbolsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "StringsAndSymbolsViewController") as! StringsAndSymbolsViewController
            navigationController?.pushViewController(StringsAndSymbolsVC, animated: true)
            
        case "Строковые литералы":
            let StringLiteralsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "StringLiteralsViewController") as! StringLiteralsViewController
            navigationController?.pushViewController(StringLiteralsVC, animated: true)
            
        case "Инициализация пустых строк":
            let InitializerEmptyStringsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "InitializerEmptyStringsViewController") as! InitializerEmptyStringsViewController
            navigationController?.pushViewController(InitializerEmptyStringsVC, animated: true)
            
        case "Конкатенация строк и символов":
            let ConcatenationVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ConcatenationViewController") as! ConcatenationViewController
            navigationController?.pushViewController(ConcatenationVC, animated: true)
            
        case "Интерполяция строк":
            let InterpolationVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "InterpolationViewController") as! InterpolationViewController
            navigationController?.pushViewController(InterpolationVC, animated: true)
            
        case "Юникод (Unicode)":
            let UnicodeVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "UnicodeViewController") as! UnicodeViewController
            navigationController?.pushViewController(UnicodeVC, animated: true)
            
        case "Подсчет символов":
            let CountingCharactersVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "CountingCharactersViewController") as! CountingCharactersViewController
            navigationController?.pushViewController(CountingCharactersVC, animated: true)
            
        case "Доступ и изменение строки":
            let ModificationVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ModificationViewController") as! ModificationViewController
            navigationController?.pushViewController(ModificationVC, animated: true)
            
        case "Подстроки":
            let SubstringsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "SubstringsViewController") as! SubstringsViewController
            navigationController?.pushViewController(SubstringsVC, animated: true)
            
        case "Сравнение строк":
            let StringAlignmentVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "StringAlignmentViewController") as! StringAlignmentViewController
            navigationController?.pushViewController(StringAlignmentVC, animated: true)
            
            
            
            // MARK: Типы Колекций
            
        case "Типы коллекций":
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
            
            
            
            
            // MARK: Управление потоком
            
        case "Управление потоком":
            let FlowControlVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "FlowControlViewController") as! FlowControlViewController
            navigationController?.pushViewController(FlowControlVC, animated: true)
            
        case "Циклы For-in":
            let CyclesForInVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "CyclesForInViewController") as! CyclesForInViewController
            navigationController?.pushViewController(CyclesForInVC, animated: true)
            
        case "Циклы While":
            let CyclesWhileVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "CyclesWhileViewController") as! CyclesWhileViewController
            navigationController?.pushViewController(CyclesWhileVC, animated: true)
            
        case "Условные инструкции":
            let ConditionalInstructionsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ConditionalInstructionsViewController") as! ConditionalInstructionsViewController
            navigationController?.pushViewController(ConditionalInstructionsVC, animated: true)
            
        case "Операторы передачи управления":
            let TransmissionOperatorsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TransmissionOperatorsViewController") as! TransmissionOperatorsViewController
            navigationController?.pushViewController(TransmissionOperatorsVC, animated: true)
            
        case "Ранний выход и Проверка доступности API":
            let EarlyExitVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "EarlyExitViewController") as! EarlyExitViewController
            navigationController?.pushViewController(EarlyExitVC, animated: true)
            
            
            
            
            // MARK: Функции
            
        case "Функции":
            let FunctionsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "FunctionsViewController") as! FunctionsViewController
            navigationController?.pushViewController(FunctionsVC, animated: true)
            
        case "Объявление и вызов функций":
            let AnnouncementAndChallengeVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AnnouncementAndChallengeViewController") as! AnnouncementAndChallengeViewController
            navigationController?.pushViewController(AnnouncementAndChallengeVC, animated: true)
            
        case "Параметры функции и возвращаемые значения":
            let FunctionParametersVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "FunctionParametersViewController") as! FunctionParametersViewController
            navigationController?.pushViewController(FunctionParametersVC, animated: true)
            
        case "Ярлыки аргументов и имена параметров функций":
            let ArgumentLabelsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ArgumentLabelsViewController") as! ArgumentLabelsViewController
            navigationController?.pushViewController(ArgumentLabelsVC, animated: true)
            
        case "Функциональные типы":
            let FunctionalTypesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "FunctionalTypesViewController") as! FunctionalTypesViewController
            navigationController?.pushViewController(FunctionalTypesVC, animated: true)
            
        case "Вложенные функции":
            let FunctionalTypesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "FunctionalTypesViewController") as! FunctionalTypesViewController
            navigationController?.pushViewController(FunctionalTypesVC, animated: true)
            
            
            
            
            // MARK: Замыкания
            
        case "Замыкания":
            let ClosuresVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ClosuresViewController") as! ClosuresViewController
            navigationController?.pushViewController(ClosuresVC, animated: true)
            
        case "Замыкающие выражения":
            let ClosingExpressionsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ClosingExpressionsViewController") as! ClosingExpressionsViewController
            navigationController?.pushViewController(ClosingExpressionsVC, animated: true)
            
        case "Последующее замыкание":
            let SubsequentClosuresVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "SubsequentClosuresViewController") as! SubsequentClosuresViewController
            navigationController?.pushViewController(SubsequentClosuresVC, animated: true)
            
        case "Захват значений":
            let CapturingValuesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "CapturingValuesViewController") as! CapturingValuesViewController
            navigationController?.pushViewController(CapturingValuesVC, animated: true)
            
        case "Замыкания - ссылочный тип":
            let ReferentialClosuresVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ReferentialClosuresViewController") as! ReferentialClosuresViewController
            navigationController?.pushViewController(ReferentialClosuresVC, animated: true)
            
        case "Сбегающие замыкания":
            let ReferentialClosuresVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "EscapingClosuresViewController") as! EscapingClosuresViewController
            navigationController?.pushViewController(ReferentialClosuresVC, animated: true)
            
        case "Автозамыкания (autoclosures)":
            let ReferentialClosuresVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AutoclosuresViewController") as! AutoclosuresViewController
            navigationController?.pushViewController(ReferentialClosuresVC, animated: true)
            
            
            
            // MARK: Перечесления
            
        case "Перечисления":
            let TransfersVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TransfersViewController") as! TransfersViewController
            navigationController?.pushViewController(TransfersVC, animated: true)
            
        case "Синтаксис перечислений":
            let EnumerationSyntaxVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "EnumerationSyntaxViewController") as! EnumerationSyntaxViewController
            navigationController?.pushViewController(EnumerationSyntaxVC, animated: true)
            
        case "Использование перечислений с инструкцией switch":
            let UsingEnumerationsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "UsingEnumerationsViewController") as! UsingEnumerationsViewController
            navigationController?.pushViewController(UsingEnumerationsVC, animated: true)
            
        case "Итерация по кейсам перечисления":
            let CaseByCaseVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "CaseByCaseViewController") as! CaseByCaseViewController
            navigationController?.pushViewController(CaseByCaseVC, animated: true)
            
        case "Ассоциативные значения":
            let AssociativeValuesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AssociativeValuesViewController") as! AssociativeValuesViewController
            navigationController?.pushViewController(AssociativeValuesVC, animated: true)
            
        case "Исходные значения":
            let InitialValuesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "InitialValuesViewController") as! InitialValuesViewController
            navigationController?.pushViewController(InitialValuesVC, animated: true)
            
        case "Рекурсивные перечисления":
            let InitialValuesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "RecursiveEnumerationsViewController") as! RecursiveEnumerationsViewController
            navigationController?.pushViewController(InitialValuesVC, animated: true)
            
            
            
            // MARK: Структыра и классы
            
        case "Структуры и классы":
            let StructuresAndClassesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "StructuresAndClassesViewController") as! StructuresAndClassesViewController
            navigationController?.pushViewController(StructuresAndClassesVC, animated: true)
            
        case "Сравнение классов и структур":
            let ClassComparisonVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ClassComparisonViewController") as! ClassComparisonViewController
            navigationController?.pushViewController(ClassComparisonVC, animated: true)
            
        case "Структуры и перечисления - типы значения":
            let StructuresAndEnumerationsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "StructuresAndEnumerationsViewController") as! StructuresAndEnumerationsViewController
            navigationController?.pushViewController(StructuresAndEnumerationsVC, animated: true)
            
        case "Классы - ссылочный тип":
            let ReferenceClassesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ReferenceClassesViewController") as! ReferenceClassesViewController
            navigationController?.pushViewController(ReferenceClassesVC, animated: true)
            
            
            // MARK: Свойства
            
        case "Свойства":
            let FeaturesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "FeaturesViewController") as! FeaturesViewController
            navigationController?.pushViewController(FeaturesVC, animated: true)
            
        case "Свойства хранения":
            let StoragePropertiesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "StoragePropertiesViewController") as! StoragePropertiesViewController
            navigationController?.pushViewController(StoragePropertiesVC, animated: true)
            
        case "Вычисляемые свойства":
            let CalculatedPropertiesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "CalculatedPropertiesViewController") as! CalculatedPropertiesViewController
            navigationController?.pushViewController(CalculatedPropertiesVC, animated: true)
            
        case "Наблюдатели свойства":
            let PropertyObserversVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "PropertyObserversViewController") as! PropertyObserversViewController
            navigationController?.pushViewController(PropertyObserversVC, animated: true)
            
        case "Обертки для свойств":
            let WrappersForPropertiesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "WrappersForPropertiesViewController") as! WrappersForPropertiesViewController
            navigationController?.pushViewController(WrappersForPropertiesVC, animated: true)
            
        case "Глобальные и локальные переменные":
            let GlobalAndLocalVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "GlobalAndLocalViewController") as! GlobalAndLocalViewController
            navigationController?.pushViewController(GlobalAndLocalVC, animated: true)
            
        case "Свойства типа":
            let TypePropertiesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TypePropertiesViewController") as! TypePropertiesViewController
            navigationController?.pushViewController(TypePropertiesVC, animated: true)
            
            
            
            // MARK: Методы
            
        case "Методы":
            let MethodsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "MethodsViewController") as! MethodsViewController
            navigationController?.pushViewController(MethodsVC, animated: true)
            
        case "Методы экземпляра":
            let InstanceMethodsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "InstanceMethodsViewController") as! InstanceMethodsViewController
            navigationController?.pushViewController(InstanceMethodsVC, animated: true)
            
        case "Методы типа":
            let TypeMethodsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TypeMethodsViewController") as! TypeMethodsViewController
            navigationController?.pushViewController(TypeMethodsVC, animated: true)
            
            
            
            // MARK: Сабскрипты
            
        case "Сабскрипты":
            let SubscriptsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "SubscriptsViewController") as! SubscriptsViewController
            navigationController?.pushViewController(SubscriptsVC, animated: true)
            
        case "Синтаксис сабскрипта":
            let SubscriptSyntaxVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "SubscriptSyntaxViewController") as! SubscriptSyntaxViewController
            navigationController?.pushViewController(SubscriptSyntaxVC, animated: true)
            
        case "Использование сабскрипта":
            let UsingSubscriptVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "UsingSubscriptViewController") as! UsingSubscriptViewController
            navigationController?.pushViewController(UsingSubscriptVC, animated: true)
            
        case "Опции сабскрипта":
            let SubscriptOptionsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "SubscriptOptionsViewController") as! SubscriptOptionsViewController
            navigationController?.pushViewController(SubscriptOptionsVC, animated: true)
            
            
            
            // MARK: Наследование
            
        case "Наследование":
            let InheritanceVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "InheritanceViewController") as! InheritanceViewController
            navigationController?.pushViewController(InheritanceVC, animated: true)
            
        case "Определение базового класса":
            let DefiningBaseClassVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "DefiningBaseClassViewController") as! DefiningBaseClassViewController
            navigationController?.pushViewController(DefiningBaseClassVC, animated: true)
            
        case "Наследование подклассом":
            let SubclassInheritanceVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "SubclassInheritanceViewController") as! SubclassInheritanceViewController
            navigationController?.pushViewController(SubclassInheritanceVC, animated: true)
            
        case "Переопределение":
            let RedefinitionVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "RedefinitionViewController") as! RedefinitionViewController
            navigationController?.pushViewController(RedefinitionVC, animated: true)
            
        case "Предотвращение переопределений":
            let PreventingOverridesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "PreventingOverridesViewController") as! PreventingOverridesViewController
            navigationController?.pushViewController(PreventingOverridesVC, animated: true)
            
            
            
            // MARK: Инициализация
            
        case "Инициализация":
            let InitializationVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "InitializationViewController") as! InitializationViewController
            navigationController?.pushViewController(InitializationVC, animated: true)
            
        case "Установка начальных значений для свойств хранения":
            let SettingValuesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "SettingValuesViewController") as! SettingValuesViewController
            navigationController?.pushViewController(SettingValuesVC, animated: true)
            
        case "Настройка инициализации":
            let SettingInitializationVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "SettingInitializationViewController") as! SettingInitializationViewController
            navigationController?.pushViewController(SettingInitializationVC, animated: true)
            
        case "Дефолтные инициализаторы":
            let DefaultInitializersVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "DefaultInitializersViewController") as! DefaultInitializersViewController
            navigationController?.pushViewController(DefaultInitializersVC, animated: true)
            
        case "Делегирование инициализатора для типов значения":
            let DelegatingInitializerVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "DelegatingInitializerViewController") as! DelegatingInitializerViewController
            navigationController?.pushViewController(DelegatingInitializerVC, animated: true)
            
        case "Наследование и инициализация класса":
            let DefiningBaseClassVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "InitializerInheritanceViewController") as! InitializerInheritanceViewController
            navigationController?.pushViewController(DefiningBaseClassVC, animated: true)
            
        case "Проваливающиеся инициализаторы":
            let FailingInitializersVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "FailingInitializersViewController") as! FailingInitializersViewController
            navigationController?.pushViewController(FailingInitializersVC, animated: true)
            
        case "Требуемые инициализаторы":
            let RequiredInitializersVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "RequiredInitializersViewController") as! RequiredInitializersViewController
            navigationController?.pushViewController(RequiredInitializersVC, animated: true)
            
            
            // MARK: Деинициализация
            
        case "Деинициализация":
            let DeinitializationVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "DeinitializationViewController") as! DeinitializationViewController
            navigationController?.pushViewController(DeinitializationVC, animated: true)
            
            
            // MARK: Опциональная последовательность
            
        case "Опциональная последовательность":
            let OptionalSequenceVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "OptionalSequenceViewController") as! OptionalSequenceViewController
            navigationController?.pushViewController(OptionalSequenceVC, animated: true)
            
            
            // MARK: Обработка ошибок
            
        case "Обработка ошибок":
            let ErrorHandlingVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ErrorHandlingViewController") as! ErrorHandlingViewController
            navigationController?.pushViewController(ErrorHandlingVC, animated: true)
            
        case "Отображение и генерация ошибок":
            let ErrorDisplayVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ErrorDisplayViewController") as! ErrorDisplayViewController
            navigationController?.pushViewController(ErrorDisplayVC, animated: true)
            
        case "Как обрабатывать ошибки":
            let HowHandleErrorsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "HowHandleErrorsViewController") as! HowHandleErrorsViewController
            navigationController?.pushViewController(HowHandleErrorsVC, animated: true)
            
            
            
            // MARK: Согласованность
            
        case "Согласованность":
            let ConsistencyVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ConsistencyViewController") as! ConsistencyViewController
            navigationController?.pushViewController(ConsistencyVC, animated: true)
            
        case "Определение и вызов асинхронных функций":
            let DefinitionChallengeVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "DefinitionChallengeViewController") as! DefinitionChallengeViewController
            navigationController?.pushViewController(DefinitionChallengeVC, animated: true)
            
        case "Задачи и группы задач":
            let TasksGroupsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TasksGroupsViewController") as! TasksGroupsViewController
            navigationController?.pushViewController(TasksGroupsVC, animated: true)
            
            
            
            // MARK: Приведение типов
            
        case "Приведение типов":
            let TypeConversionVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TypeConversionViewController") as! TypeConversionViewController
            navigationController?.pushViewController(TypeConversionVC, animated: true)
            
        case "Определение классовой иерархии для приведения типов":
            let DefiningHierarchyVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "DefiningHierarchyViewController") as! DefiningHierarchyViewController
            navigationController?.pushViewController(DefiningHierarchyVC, animated: true)
            
        case "Проверка типа":
            let TypeCheckVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TypeCheckViewController") as! TypeCheckViewController
            navigationController?.pushViewController(TypeCheckVC, animated: true)
            
        case "Понижающее приведение":
            let StepDownCastVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "StepDownCastViewController") as! StepDownCastViewController
            navigationController?.pushViewController(StepDownCastVC, animated: true)
            
        case "Приведение типов для Any и AnyObject":
            let AnyObjectVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AnyObjectViewController") as! AnyObjectViewController
            navigationController?.pushViewController(AnyObjectVC, animated: true)
            
            
            
            // MARK: Вложенные типы
            
        case "Вложенные типы":
            let NestedTypesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "NestedTypesViewController") as! NestedTypesViewController
            navigationController?.pushViewController(NestedTypesVC, animated: true)
            
        case "Вложенные типы в действии":
            let TypesActionVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TypesActionViewController") as! TypesActionViewController
            navigationController?.pushViewController(TypesActionVC, animated: true)
            
        case "Ссылка на вложенные типы":
            let ReferenceTypesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ReferenceTypesViewController") as! ReferenceTypesViewController
            navigationController?.pushViewController(ReferenceTypesVC, animated: true)
            
            
            // MARK: Расширения
            
        case "Расширения":
            let ExtensionsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ExtensionsViewController") as! ExtensionsViewController
            navigationController?.pushViewController(ExtensionsVC, animated: true)
            
        case "Синтаксис расширений":
            let SyntaxExtensionsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "SyntaxExtensionsViewController") as! SyntaxExtensionsViewController
            navigationController?.pushViewController(SyntaxExtensionsVC, animated: true)
            
        case "Вычисляемые свойства в расширениях":
            let PropertiesExtensionsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "PropertiesExtensionsViewController") as! PropertiesExtensionsViewController
            navigationController?.pushViewController(PropertiesExtensionsVC, animated: true)
            
        case "Инициализаторы в расширениях":
            let ExtensionInitializersVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ExtensionInitializersViewController") as! ExtensionInitializersViewController
            navigationController?.pushViewController(ExtensionInitializersVC, animated: true)
            
        case "Методы в расширениях":
            let ExtensionMethodsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ExtensionMethodsViewController") as! ExtensionMethodsViewController
            navigationController?.pushViewController(ExtensionMethodsVC, animated: true)
            
            
            
            // MARK: Непрозрачные типы
            
        case "Непрозрачные типы":
            let OpaqueTypesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "OpaqueTypesViewController") as! OpaqueTypesViewController
            navigationController?.pushViewController(OpaqueTypesVC, animated: true)
            
        case "Проблема, которую решают непрозрачные типы":
            let ProblemTypesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ProblemTypesViewController") as! ProblemTypesViewController
            navigationController?.pushViewController(ProblemTypesVC, animated: true)
            
        case "Возвращение непрозрачного типа":
            let TypeReturnVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TypeReturnViewController") as! TypeReturnViewController
            navigationController?.pushViewController(TypeReturnVC, animated: true)
            
        case "Различия между типом протокола и непрозрачным типом":
            let TypeDifferencesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TypeDifferencesViewController") as! TypeDifferencesViewController
            navigationController?.pushViewController(TypeDifferencesVC, animated: true)
            
            
            
            // MARK: Протоколы
            
        case "Протоколы":
            let ProtocolsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ProtocolsViewController") as! ProtocolsViewController
            navigationController?.pushViewController(ProtocolsVC, animated: true)
            
        case "Синтаксис протокола":
            let ProtocolSyntaxVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ProtocolSyntaxViewController") as! ProtocolSyntaxViewController
            navigationController?.pushViewController(ProtocolSyntaxVC, animated: true)
            
        case "Требование свойств":
            let PropertyRequirementVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "PropertyRequirementViewController") as! PropertyRequirementViewController
            navigationController?.pushViewController(PropertyRequirementVC, animated: true)
            
        case "Требование методов":
            let MethodsRequirementVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "MethodsRequirementViewController") as! MethodsRequirementViewController
            navigationController?.pushViewController(MethodsRequirementVC, animated: true)
            
        case "Требования изменяющих методов":
            let RequirementsModifyingVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "RequirementsModifyingMethodsViewController") as! RequirementsModifyingMethodsViewController
            navigationController?.pushViewController(RequirementsModifyingVC, animated: true)
            
        case "Требование инициализатора":
            let InitializerRequirementVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "InitializerRequirementViewController") as! InitializerRequirementViewController
            navigationController?.pushViewController(InitializerRequirementVC, animated: true)
            
        case "Протоколы как типы":
            let ProtocolsAsTypesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ProtocolsAsTypesViewController") as! ProtocolsAsTypesViewController
            navigationController?.pushViewController(ProtocolsAsTypesVC, animated: true)
            
        case "Делегирование":
            let DelegationVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "DelegationViewController") as! DelegationViewController
            navigationController?.pushViewController(DelegationVC, animated: true)
            
        case "Добавление реализации протокола через расширение":
            let AddingProtocolVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AddingProtocolViewController") as! AddingProtocolViewController
            navigationController?.pushViewController(AddingProtocolVC, animated: true)
            
        case "Принятие протокола через синтезированную реализацию":
            let ProtocolAdoptionVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ProtocolAdoptionViewController") as! ProtocolAdoptionViewController
            navigationController?.pushViewController(ProtocolAdoptionVC, animated: true)
            
        case "Коллекции типов протокола":
            let CollectionsProtocolTypesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "CollectionsProtocolTypesViewController") as! CollectionsProtocolTypesViewController
            navigationController?.pushViewController(CollectionsProtocolTypesVC, animated: true)
            
        case "Наследование протокола":
            let ProtocolInheritanceVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ProtocolInheritanceViewController") as! ProtocolInheritanceViewController
            navigationController?.pushViewController(ProtocolInheritanceVC, animated: true)
            
        case "Композиция протоколов":
            let CompositionProtocolsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "CompositionProtocolsViewController") as! CompositionProtocolsViewController
            navigationController?.pushViewController(CompositionProtocolsVC, animated: true)
            
        case "Проверка соответствия протоколу":
            let CheckingProtocolsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "CheckingProtocolsViewController") as! CheckingProtocolsViewController
            navigationController?.pushViewController(CheckingProtocolsVC, animated: true)
            
        case "Опциональные требования протокола":
            let OptionalRequirementsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "OptionalRequirementsViewController") as! OptionalRequirementsViewController
            navigationController?.pushViewController(OptionalRequirementsVC, animated: true)
            
        case "Расширения протоколов":
            let ProtocolExtensionsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ProtocolExtensionsViewController") as! ProtocolExtensionsViewController
            navigationController?.pushViewController(ProtocolExtensionsVC, animated: true)
            
            
            
            // MARK: Универсальные шаблоны
            
        case "Универсальные шаблоны":
            let UniversalTemplatesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "UniversalTemplatesViewController") as! UniversalTemplatesViewController
            navigationController?.pushViewController(UniversalTemplatesVC, animated: true)
            
        case "Проблема, которую решают универсальные шаблоны":
            let UniversalSolveVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "UniversalSolveViewController") as! UniversalSolveViewController
            navigationController?.pushViewController(UniversalSolveVC, animated: true)
            
        case "Универсальные функции":
            let UniversalFunctionsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "UniversalFunctionsViewController") as! UniversalFunctionsViewController
            navigationController?.pushViewController(UniversalFunctionsVC, animated: true)
            
        case "Параметры типа":
            let TypeParametersVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TypeParametersViewController") as! TypeParametersViewController
            navigationController?.pushViewController(TypeParametersVC, animated: true)
            
        case "Расширяем универсальный тип":
            let ExpandingUniversalTypeVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ExpandingUniversalTypeViewController") as! ExpandingUniversalTypeViewController
            navigationController?.pushViewController(ExpandingUniversalTypeVC, animated: true)
            
        case "Связанные типы":
            let RelatedTypesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "RelatedTypesViewController") as! RelatedTypesViewController
            navigationController?.pushViewController(RelatedTypesVC, animated: true)
            
        case "Оговорка where":
            let ReservationWhereVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ReservationWhereViewController") as! ReservationWhereViewController
            navigationController?.pushViewController(ReservationWhereVC, animated: true)
            
            
            
            // MARK: Автоматический подсчет ссылок (ARC)
            
        case "О ARC":
            let AboutARCVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AboutARCViewController") as! AboutARCViewController
            navigationController?.pushViewController(AboutARCVC, animated: true)
            
        case "Работа ARC":
            let ARCOperationVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ARCOperationViewController") as! ARCOperationViewController
            navigationController?.pushViewController(ARCOperationVC, animated: true)
            
        case "ARC в действии":
            let ARCInActionVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ARCInActionViewController") as! ARCInActionViewController
            navigationController?.pushViewController(ARCInActionVC, animated: true)
            
        case "Циклы сильных ссылок между экземплярами классов":
            let StrongLinkCyclesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "StrongLinkCyclesViewController") as! StrongLinkCyclesViewController
            navigationController?.pushViewController(StrongLinkCyclesVC, animated: true)
            
        case "Замена циклов сильных ссылок между экземплярами классов":
            let ReplacingCyclesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ReplacingCyclesViewController") as! ReplacingCyclesViewController
            navigationController?.pushViewController(ReplacingCyclesVC, animated: true)
            
        case "Циклы сильных ссылок в замыканиях":
            let CyclesClosuresVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "CyclesClosuresViewController") as! CyclesClosuresViewController
            navigationController?.pushViewController(CyclesClosuresVC, animated: true)
            
        case "Замена циклов сильных ссылок в замыканиях":
            let ReplacementInClosuresVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ReplacementInClosuresViewController") as! ReplacementInClosuresViewController
            navigationController?.pushViewController(ReplacementInClosuresVC, animated: true)
            
            
            
            // MARK: Безопасность хранения
            
        case "Безопасность хранения":
            let StorageSecurityVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "StorageSecurityViewController") as! StorageSecurityViewController
            navigationController?.pushViewController(StorageSecurityVC, animated: true)
            
        case "Что такое конфликт доступа к памяти":
            let AccessConflictVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AccessConflictViewController") as! AccessConflictViewController
            navigationController?.pushViewController(AccessConflictVC, animated: true)
            
        case "Характеристики доступа к памяти":
            let AccessCharacteristicsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AccessCharacteristicsViewController") as! AccessCharacteristicsViewController
            navigationController?.pushViewController(AccessCharacteristicsVC, animated: true)
            
        case "Конфликты":
            let ConflictsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ConflictsViewController") as! ConflictsViewController
            navigationController?.pushViewController(ConflictsVC, animated: true)
            
            
            
            // MARK: Контроль доступа
            
        case "Контроль доступа":
            let AccessControlVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AccessControlViewController") as! AccessControlViewController
            navigationController?.pushViewController(AccessControlVC, animated: true)
            
        case "Модули и исходные файлы":
            let ModulesFilesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ModulesFilesViewController") as! ModulesFilesViewController
            navigationController?.pushViewController(ModulesFilesVC, animated: true)
            
        case "Уровни доступа":
            let AccessLevelsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AccessLevelsViewController") as! AccessLevelsViewController
            navigationController?.pushViewController(AccessLevelsVC, animated: true)
            
        case "Синтаксис контроля доступа":
            let ControlSyntaxVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ControlSyntaxViewController") as! ControlSyntaxViewController
            navigationController?.pushViewController(ControlSyntaxVC, animated: true)
            
        case "Пользовательские типы":
            let CustomTypesVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "CustomTypesViewController") as! CustomTypesViewController
            navigationController?.pushViewController(CustomTypesVC, animated: true)
            
        case "Уровень доступа класса и подкласса":
            let ClassSubclassVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ClassSubclassViewController") as! ClassSubclassViewController
            navigationController?.pushViewController(ClassSubclassVC, animated: true)
            
        case "Константы, переменные, свойства и сабскрипты":
            let LetVarPropSubVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "LetVarPropSubViewController") as! LetVarPropSubViewController
            navigationController?.pushViewController(LetVarPropSubVC, animated: true)
            
            
            
            // MARK: Продвинутые операторы
            
        case "Продвинутые операторы":
            let AdvancedOperatorsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AdvancedOperatorsViewController") as! AdvancedOperatorsViewController
            navigationController?.pushViewController(AdvancedOperatorsVC, animated: true)
            
        case "Побитовые операторы":
            let BitwiseOperatorsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "BitwiseOperatorsViewController") as! BitwiseOperatorsViewController
            navigationController?.pushViewController(BitwiseOperatorsVC, animated: true)
            
        case "Операторы переполнения":
            let OverflowOperatorsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "OverflowOperatorsViewController") as! OverflowOperatorsViewController
            navigationController?.pushViewController(OverflowOperatorsVC, animated: true)
            
        case "Приоритет и ассоциативность":
            let PriorityAssociativityVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "PriorityAssociativityViewController") as! PriorityAssociativityViewController
            navigationController?.pushViewController(PriorityAssociativityVC, animated: true)
            
        case "Операторные функции":
            let OperatorFunctionsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "OperatorFunctionsViewController") as! OperatorFunctionsViewController
            navigationController?.pushViewController(OperatorFunctionsVC, animated: true)
            
        case "Пользовательские операторы":
            let CustomOperatorsVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "CustomOperatorsViewController") as! CustomOperatorsViewController
            navigationController?.pushViewController(CustomOperatorsVC, animated: true)
            
            
            
            
            
        default:
            break
        }
    }
    // MARK: - Search Bar Delegate
    
    func restoreOriginalData() {
        updateData(on: originalCells, filteredSections: originalSections)
    }

    
    func updateData(on updatedCells: [String: [String]], filteredSections: [String]) {
        self.cells = updatedCells
        self.filteredSections = filteredSections
        tableView.reloadData()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        restoreOriginalData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func filterContentForSearchText(_ searchText: String) {
        if searchText.isEmpty {
            restoreOriginalData()
        } else {
            // Фильтрация данных и обновление таблицы
            let filteredSections = originalSections.filter { section in
                let filteredItems = originalCells[section, default: []].filter { $0.lowercased().contains(searchText.lowercased()) }
                return !filteredItems.isEmpty
            }
            
            var filteredCells: [String: [String]] = [:]
            for section in filteredSections {
                let items = originalCells[section, default: []].filter { $0.lowercased().contains(searchText.lowercased()) }
                filteredCells[section] = items
            }
            
            updateData(on: filteredCells, filteredSections: filteredSections)
        }
    }
}
    
    

