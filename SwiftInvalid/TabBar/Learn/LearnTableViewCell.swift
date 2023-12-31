//
//  LearnTableViewCell.swift
//  SwiftInvalid
//
//  Created by admin on 06.02.2023.
//

import UIKit



class LearnTableViewCell: UITableViewCell {
    
    let userDefaults = UserDefaults.standard
    var subtheme: String = ""
    var cellStates = [IndexPath: Bool]()

    
    @IBOutlet var menuName: UILabel!
    
    
    private let checkmarkImageView = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            commonInit()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Установка видимости изображения галочки в зависимости от isSelected свойства ячейки
            accessoryView?.isHidden = !selected
            checkmarkImageView.isHidden = !selected
        }

        private func commonInit() {
            let menuName = UILabel()
            addSubview(menuName)

            // Configure menuName constraints
            menuName.translatesAutoresizingMaskIntoConstraints = false
            menuName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
            menuName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

            self.menuName = menuName

            // Установка размера изображения и добавление его в accessoryView ячейки
            checkmarkImageView.bounds.size = CGSize(width: 25, height: 25)
            accessoryView = checkmarkImageView
        }

        func configure(subtheme: String) {
            menuName?.text = subtheme
        }
    
    
    }
