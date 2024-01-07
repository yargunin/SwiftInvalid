import UIKit

class BasicsViewController: UIViewController {
    
    var quizData: [(question: String, options: [String], correctAnswer: String)] = [
        ("Какой язык программирования вы изучаете?", ["Swift", "Java", "Python", "C++"], "Swift"),
        ("Что такое iOS?", ["Язык программирования", "Операционная система", "Компилятор"], "Операционная система")
        // Добавьте другие вопросы по мере необходимости
    ]
    
    var currentQuestionIndex = 0
    var correctAnswerIndex = 0
    let delayInSeconds: TimeInterval = 1 // Задержка в секундах

    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        showQuestion()
    }
    
    func setupUI() {
        // Добавьте questionLabel на view
        view.addSubview(questionLabel)
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        updateAnswerButtons()
    }
    
    func updateAnswerButtons() {
        // Удаляем предыдущие кнопки ответов
        for subview in view.subviews {
            if subview is UIButton {
                subview.removeFromSuperview()
            }
        }
        
        // Добавьте кнопки ответов
        for i in 0..<quizData[currentQuestionIndex].1.count {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(quizData[currentQuestionIndex].1[i], for: .normal)
            button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
            view.addSubview(button)
            button.backgroundColor = .orange
            button.layer.cornerRadius = 20
            button.tintColor = .black
            
            
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20 + CGFloat(50 * i)),
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                button.heightAnchor.constraint(equalToConstant: 40)
            ])
        }
    }
    
    func showQuestion() {
        // Убедитесь, что текущий индекс в пределах массива
        guard currentQuestionIndex < quizData.count else {
            print("Все вопросы пройдены")
            return
        }
        
           // Перемешиваем варианты ответов
           let shuffledOptions = quizData[currentQuestionIndex].options.shuffled()
           
           // Устанавливаем текст вопроса на questionLabel
           questionLabel.text = quizData[currentQuestionIndex].question
           
        // Сохраняем индекс правильного ответа
            correctAnswerIndex = shuffledOptions.firstIndex(of: quizData[currentQuestionIndex].correctAnswer) ?? 0
        
           // Обновляем массив вариантов ответов
           quizData[currentQuestionIndex].options = shuffledOptions
           
           // Обновляем кнопки ответов
           updateAnswerButtons()
       
    }
    
    @objc func answerButtonTapped(_ sender: UIButton) {
        let selectedAnswer = sender.currentTitle ?? ""
        
        // Проверяем, правильный ли ответ
        let isCorrect = selectedAnswer == quizData[currentQuestionIndex].correctAnswer
        
        // Определяем цвет для кнопки
        let color: UIColor = isCorrect ? .green : .red
        
        // Окрашиваем кнопку
        sender.backgroundColor = color
        
        // Если правильный ответ, вызываем метод перехода к следующему вопросу
        if isCorrect {
            // Показываем окно завершения теста с задержкой
            DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds) { [weak self] in
                self?.moveToNextQuestion()
            }
        }
    }

    func moveToNextQuestion() {
        currentQuestionIndex += 1
        
        if currentQuestionIndex < quizData.count {
            showQuestion()
            updateAnswerButtons()
        } else {
            print("Вопросы закончились")
            // Показываем окно завершения теста
            showTestCompletionAlert()
        }
    }

    
    func showTestCompletionAlert() {
        let alert = UIAlertController(title: "Тест завершен", message: "Поздравляем! Вы завершили тест.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.navigateToLearnViewController()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    func navigateToLearnViewController() {
        // Переход на экран с таблицей
        if let learnViewController = UIStoryboard(name: "TabBar", bundle: nil)
            .instantiateViewController(withIdentifier: "LearnViewController") as? LearnViewController {
            navigationController?.pushViewController(learnViewController, animated: true)
        }
    }

}

