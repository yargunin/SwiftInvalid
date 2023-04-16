//
//  TuplesViewController.swift
//  SwiftInvalid
//
//  Created by admin on 25.03.2023.
//

import UIKit

class TuplesViewController: UIViewController {

    @IBOutlet var LableInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
       
        // Создание UIScrollView
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1100)
        scrollView.isScrollEnabled = true
        
       
        
       
            let imageAttachment = NSTextAttachment()
            let originalImage = UIImage(named: "Снимок экрана 2023-04-16 в 14.41.21.png")
        let resizedImage = originalImage?.resize(toWidth: 380, height: 100) // Replace 300 with the desired width
            imageAttachment.image = resizedImage
            let imageString = NSAttributedString(attachment: imageAttachment)

            let textString = "Кортежи группируют несколько значений в одно составное значение. Значения внутри кортежа могут быть любого типа, то есть, нет необходимости, чтобы они были одного и того же типа.\n\nВ данном примере (404, \"Not Found\") это кортеж, который описывает код HTTP статуса. Код HTTP статуса — особое значение, возвращаемое веб-сервером каждый раз, когда вы запрашиваете веб-страницу. Код статуса 404 Not Found возвращается, когда вы запрашиваете страницу, которая не существует.\n\n"

            let attributedString = NSMutableAttributedString(string: textString, attributes: [
                .font: UIFont.systemFont(ofSize: 17),
                .foregroundColor: UIColor.black
            ])
            attributedString.append(imageString)

            LableInfo.attributedText = attributedString
        

        // Продолжение текста здесь
        if let attributedText = LableInfo.attributedText {
            let continuationString = "Чтобы передать код статуса, кортеж (404, \"Not Found\") группирует вместе два отдельных значения Int и String: число и понятное человеку описание. Это может быть описано как \"кортеж типа (Int, String)\".\n\nВы можете создать кортеж с любой расстановкой типов, и они могут содержать сколько угодно нужных вам типов. Ничто вам не мешает иметь кортеж типа (Int, Int, Int), или типа (String, Bool), или же с любой другой расстановкой типов по вашему желанию.\n\nВы можете разложить содержимое кортежа на отдельные константы и переменные, к которым можно получить доступ привычным способом:"
            let continuationAttributedString = NSAttributedString(string: continuationString)
            let newAttributedString = NSMutableAttributedString(attributedString: attributedText)
            newAttributedString.append(continuationAttributedString)
            LableInfo.attributedText = newAttributedString
        }
        
        // Создание нового изображения
        if let newImage = UIImage(named: "Снимок экрана 2023-04-16 в 15.20.03.png") {
            // Изменение размера изображения
            let resizedImage = newImage.resize(toWidth: 380, height: 100)

            // Создание нового вложения изображения
            let newImageAttachment = NSTextAttachment()
            newImageAttachment.image = resizedImage

            // Создание нового NSAttributedString из вложения изображения
            let newImageAttributedString = NSAttributedString(attachment: newImageAttachment)

            // Добавление нового NSAttributedString в конец существующего атрибутированного текста
            if let attributedText = LableInfo.attributedText {
                let newAttributedString = NSMutableAttributedString(attributedString: attributedText)
                newAttributedString.append(NSAttributedString(string: "\n"))
                newAttributedString.append(newImageAttributedString)
                LableInfo.attributedText = newAttributedString
            }
        }
      

        




        

        
        LableInfo.lineBreakMode = .byWordWrapping
        LableInfo.numberOfLines = 0
        LableInfo.sizeToFit()
        
        // Добавление UILabel в UIScrollView
        scrollView.addSubview(LableInfo)
        
        // Добавление UIScrollView на view контроллера
        view.addSubview(scrollView)
        
        // Создание кнопки
        let button = UIButton(type: .system)
        button.setTitle("Опциональные типы (опционалы)", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17) // Установка жирного шрифта для заголовка кнопки
        button.frame = CGRect(x: scrollView.contentSize.width - 350, y: scrollView.contentSize.height, width: 350, height: -100)
        scrollView.addSubview(button)
    }
    
    // действие при нажатии на кнопку
    @objc func buttonTapped() {
        let NextVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "OptionalTypesViewController") as! OptionalTypesViewController
        navigationController?.pushViewController(NextVC, animated: true)
 
    }
    
    
}
extension UIImage {
    func resize(toWidth width: CGFloat, height: CGFloat) -> UIImage? {
        let size = CGSize(width: width, height: height)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(renderingMode)
    }
}

