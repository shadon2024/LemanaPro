//
//  CatalogCell.swift
//  LemanaPRO
//
//  Created by Admin on 23.02.2025.
//

import UIKit

// Кастомная ячейка для каталога

//class CatalogCell: UICollectionViewCell {
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
//        label.numberOfLines = 2
//        return label
//    }()
//
//    private let iconImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.tintColor = .black
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupCell()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupCell() {
//        contentView.layer.cornerRadius = 4
//        contentView.layer.borderColor = UIColor.lightGray.cgColor
//        //contentView.layer.borderWidth = 1
//
//        contentView.addSubview(iconImageView)
//        contentView.addSubview(titleLabel)
//
//        titleLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(10)
//            make.leading.equalTo(16)
//            //make.width.height.equalTo(24)
//        }
//
//        iconImageView.snp.makeConstraints { make in
//            //make.top.equalTo(titleLabel.snp.bottom).offset(76)
//            make.trailing.equalTo(-16)
//            make.bottom.equalTo(-16)
//            make.width.height.equalTo(40)
//        }
//    }
//
//    func configure(with item: HomeViewController.CatalogItem, isLast: Bool = false) {
//        titleLabel.text = item.title
//        iconImageView.image = item.icon
//
//    }
//}


class CatalogCell: UICollectionViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        contentView.layer.cornerRadius = 4
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        //contentView.layer.borderWidth = 1
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        
        // Начальные ограничения для всех ячеек
        updateConstraintsForLast(isLast: false)
    }
    
    private func updateConstraintsForLast(isLast: Bool) {
        if isLast {
            // Ограничения для последней ячейки
            titleLabel.snp.remakeConstraints { make in
                make.bottom.equalTo(-35)
                make.centerX.equalToSuperview()
            }
            
            iconImageView.snp.remakeConstraints { make in
                make.top.equalTo(35) // Увеличиваем отступ сверху
                make.centerX.equalToSuperview()
                make.width.height.equalTo(40)          // Увеличиваем размер иконки
            }
        } else {
            // Ограничения для всех остальных ячеек
            titleLabel.snp.remakeConstraints { make in
                make.top.equalToSuperview().offset(10)
                make.leading.equalTo(16)
            }
            
            iconImageView.snp.remakeConstraints { make in
                make.trailing.equalTo(-16)
                make.bottom.equalTo(-16)
                make.width.height.equalTo(50)
            }
        }
        
        // Принудительно обновляем layout
        contentView.layoutIfNeeded()
    }
    
    func configure(with item: HomeViewController.CatalogItem, isLast: Bool = false) {
        
        
        
        titleLabel.text = item.title
        iconImageView.image = item.icon ?? UIImage(systemName: "questionmark")
        
        
        
        // Обновляем ограничения в зависимости от того, последняя ли ячейка
        updateConstraintsForLast(isLast: isLast)
    }
}
