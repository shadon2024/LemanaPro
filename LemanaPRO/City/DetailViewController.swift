//
//  DetailViewController.swift
//  LemanaPRO
//
//  Created by Admin on 21.02.2025.
//

import UIKit

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Убираем текст кнопки "Назад"
        
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "Здесь можно показать товары города"
        label.textAlignment = .center
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
