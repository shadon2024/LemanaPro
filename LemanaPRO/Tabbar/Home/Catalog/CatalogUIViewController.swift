//
//  KatalogUIViewController.swift
//  LemanaPRO
//
//  Created by Admin on 25.02.2025.
//

import UIKit
import SnapKit

class CatalogUIViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Устанавливаем цвет фона
        view.backgroundColor = .white
        
        // Сначала добавляем UI элементы, затем задаём ограничения
        setupUI()
        setupConstraints()
    }
    
    // MARK: - UI Elements
    
    private let catalogLabel: UILabel = {
        let label = UILabel()
        label.text = "Каталог"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        view.addSubview(catalogLabel)
        // Не нужно отключать translatesAutoresizingMaskIntoConstraints для view контроллера
        // catalogLabel.translatesAutoresizingMaskIntoConstraints = false не требуется, так как SnapKit делает это автоматически
    }
    
    private func setupConstraints() {
        catalogLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20) // Привязка к safeArea с отступом 20
            make.leading.equalToSuperview().offset(16)                    // Отступ слева от superview
            // Опционально добавляем ширину и высоту, если нужно
            // make.height.equalTo(24)
            // make.width.equalTo(100) // Или используйте intrinsicContentSize лейбла
        }
    }
}
