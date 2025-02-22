//
//  ViewController.swift
//  LemanaPRO
//
//  Created by Admin on 15.02.2025.
//

import UIKit

class ViewController: UIViewController {
    
    // Создаем imageView для картинки заставки
    private let splashImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "homekit") // замените на имя своей картинки
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // Создаем label для текста
    private let splashLabel: UILabel = {
        let label = UILabel()
        label.text = "ANZUR_home"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        // Добавляем subviews
        view.addSubview(splashImageView)
        view.addSubview(splashLabel)
        
        // Настраиваем автолейаут
        NSLayoutConstraint.activate([
            // Центрируем картинку
            splashImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splashImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            splashImageView.widthAnchor.constraint(equalToConstant: 120),
            splashImageView.heightAnchor.constraint(equalToConstant: 120),
            
            // Размещаем текст ниже картинки
            splashLabel.topAnchor.constraint(equalTo: splashImageView.bottomAnchor, constant: 20),
            splashLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // После задержки в 5 секунды переходим на главный экран
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            print("Переход")
            self.showMainViewController()
        }
    }
    
    private func showMainViewController() {
        let mainVC = MainTabBarController() // убедитесь, что MainViewController существует
        mainVC.modalTransitionStyle = .crossDissolve
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true, completion: nil)
    }
}

