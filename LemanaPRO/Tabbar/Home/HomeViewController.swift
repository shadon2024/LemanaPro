//
//  HomeViewController.swift
//  LemanaPRO
//
//  Created by Admin on 17.02.2025.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    // MARK: - UI Elements
    // 1. Создание верхнего заголовочного представления с желтым фоном
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()

    // 2. Кнопка "Показать все" с атрибутированным текстом для отображения города и подписи
    private let showAllButton: UIButton = {
        let button = UIButton(type: .system)
        
        // Позволяем кнопке отображать несколько строк
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .left
        
        // Формируем атрибутированный текст
        let mainText = "Красноярск ▼\n"
        let subText = "Показываем все товары города"
        
        let attributedTitle = NSMutableAttributedString(
            string: mainText,
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: 16),
                .foregroundColor: UIColor.black
            ]
        )
        attributedTitle.append(
            NSAttributedString(
                string: subText,
                attributes: [
                    .font: UIFont.systemFont(ofSize: 14),
                    .foregroundColor: UIColor.black
                ]
            )
        )
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    
    // 3. Поле ввода для поиска с закругленными углами
    private let searchBar: UITextField = {
        let textField = UITextField()
        textField.placeholder = "   Поиск"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        return textField
    }()

    // 4. Кнопка поиска с иконкой лупы
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 6
        return button
    }()

    // 5. Кнопка сканирования QR-кода с соответствующей иконкой
    private let scanButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "qrcode"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 6
        return button
    }()
    
    // 6. Контейнер для активного поиска, изначально скрыт
    private let searchContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isHidden = true
        return view
    }()
        
    // 7. Активное поле поиска с серым фоном
    private let activeSearchBar: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Поиск"
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 8
        return textField
    }()
        
    // 8. Кнопка закрытия поиска с красным текстом
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Закрыть", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.addTarget(self, action: #selector(closeSearch), for: .touchUpInside)
        return button
    }()
        
    // 9. Таблица категорий, изначально скрыта
    private let categoriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        return tableView
    }()

    // 10. Массив категорий для отображения в таблице
    private let categories = ["Обои", "Ламинат", "Линолеум", "Плитка", "Ковролин"]
    
    // 11. Переменная для хранения констрейнта верхнего отступа
    private var headerTopConstraint: Constraint?
    
    // 12. Кнопка каталога с иконкой и границей
    private let catalogButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Каталог", for: .normal)
        button.setTitleColor(.black, for: .normal)
        let icon = UIImage(systemName: "line.3.horizontal")
        button.setImage(icon, for: .normal)
        button.tintColor = .black
        button.semanticContentAttribute = .forceLeftToRight
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        return button
    }()
        
    // 13. Кнопка "Сад" с иконкой листа
    private let gardenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сад", for: .normal)
        button.setTitleColor(.black, for: .normal)
        let icon = UIImage(systemName: "leaf")
        button.setImage(icon, for: .normal)
        button.tintColor = .black
        button.semanticContentAttribute = .forceLeftToRight
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        return button
    }()
        
    // 14. Кнопка "Сантехника" с иконкой капли
    private let plumbingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сантехника", for: .normal)
        button.setTitleColor(.black, for: .normal)
        let icon = UIImage(systemName: "drop")
        button.setImage(icon, for: .normal)
        button.tintColor = .black
        button.semanticContentAttribute = .forceLeftToRight
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    // 15. Кнопка скидок с многострочным текстом и иконкой процента
    private let discountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Скидка на комплекты для ванных", for: .normal)
        button.setTitleColor(.black, for: .normal)
        let icon = UIImage(systemName: "percent")
        button.setImage(icon, for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.titleLabel?.numberOfLines = 2
        button.semanticContentAttribute = .forceLeftToRight
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        return button
    }()
        
    // 16. Кнопка кешбэка с иконкой звезды
    private let cashbackButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Кешбэк до 20% баллами", for: .normal)
        button.setTitleColor(.black, for: .normal)
        let icon = UIImage(systemName: "star.circle")
        button.setImage(icon, for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.titleLabel?.numberOfLines = 2
        button.semanticContentAttribute = .forceLeftToRight
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        return button
    }()
        
    // 17. Кнопка акций с иконкой тега
    private let saleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Тега - це года", for: .normal)
        button.setTitleColor(.black, for: .normal)
        let icon = UIImage(systemName: "tag.fill")
        button.setImage(icon, for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.titleLabel?.numberOfLines = 2
        button.semanticContentAttribute = .forceLeftToRight
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        return button
    }()
        
    // 18. Метка для раздела "Вы смотрели"
    private let recentlyViewedLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы смотрели"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
        
    // 19. Коллекция для отображения недавно просмотренных элементов
    private lazy var recentlyViewedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: 100, height: 100)
            
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.dataSource = self
        return collection
    }()
    
    // 20. Установка размера ячеек коллекции
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }

    // MARK: - Lifecycle
    // 21. Основной метод жизненного цикла для настройки UI и делегатов
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        categoriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        searchBar.delegate = self
    }

    // MARK: - Setup UI
    // 22. Настройка базового интерфейса и добавление всех элементов
    private func setupUI() {
        view.backgroundColor = .white

        headerView.addSubview(showAllButton)

        view.addSubview(headerView)
        view.addSubview(searchBar)
        view.addSubview(searchButton)
        view.addSubview(scanButton)
        
        view.addSubview(searchContainerView)
        searchContainerView.addSubview(activeSearchBar)
        searchContainerView.addSubview(closeButton)
        view.addSubview(categoriesTableView)
        
        [catalogButton, gardenButton, plumbingButton,
         discountButton, cashbackButton, saleButton,
         recentlyViewedLabel, recentlyViewedCollectionView
        ].forEach { view.addSubview($0) }
    }

    // MARK: - Setup Constraints with SnapKit
    // 23. Установка ограничений для всех элементов интерфейса
    private func setupConstraints() {
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-100)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(240)
        }

        showAllButton.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(showAllButton.snp.bottom).offset(20)
            make.leading.equalTo(view).offset(16)
            make.height.equalTo(44)
            make.width.equalTo(300)
        }

        searchButton.snp.makeConstraints { make in
            make.top.equalTo(searchBar).offset(6)
            make.leading.equalTo(searchBar.snp.trailing).offset(-40)
            make.width.height.equalTo(32)
        }

        scanButton.snp.makeConstraints { make in
            make.top.equalTo(searchBar)
            make.trailing.equalTo(view).offset(-16)
            make.width.height.equalTo(40)
        }
        
        searchContainerView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }

        activeSearchBar.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.trailing.equalTo(closeButton.snp.leading).offset(-8)
        }

        closeButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }

        categoriesTableView.snp.makeConstraints { make in
            make.top.equalTo(searchContainerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        catalogButton.snp.makeConstraints { make in
            make.top.equalTo(searchContainerView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(110)
            make.height.equalTo(80)
        }
                
        gardenButton.snp.makeConstraints { make in
            make.top.equalTo(catalogButton)
            make.leading.equalTo(catalogButton.snp.trailing).offset(16)
            make.width.equalTo(110)
            make.height.equalTo(80)
        }
                
        plumbingButton.snp.makeConstraints { make in
            make.top.equalTo(catalogButton)
            make.leading.equalTo(gardenButton.snp.trailing).offset(16)
            make.width.equalTo(110)
            make.height.equalTo(80)
        }
                
        discountButton.snp.makeConstraints { make in
            make.top.equalTo(catalogButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(110)
            make.height.equalTo(80)
        }
                
        cashbackButton.snp.makeConstraints { make in
            make.top.equalTo(discountButton)
            make.leading.equalTo(discountButton.snp.trailing).offset(16)
            make.width.equalTo(110)
            make.height.equalTo(80)
        }
                
        saleButton.snp.makeConstraints { make in
            make.top.equalTo(discountButton)
            make.leading.equalTo(cashbackButton.snp.trailing).offset(16)
            make.width.equalTo(110)
            make.height.equalTo(80)
        }
                
        recentlyViewedLabel.snp.makeConstraints { make in
            make.top.equalTo(discountButton.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
        }
                
        recentlyViewedCollectionView.snp.makeConstraints { make in
            make.top.equalTo(recentlyViewedLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
            
        showAllButton.addTarget(self, action: #selector(cityButtonTapped), for: .touchUpInside)
        scanButton.addTarget(self, action: #selector(scanButtonTapped), for: .touchUpInside)
    }
    
    // 24. Обработчик нажатия кнопки города для перехода на другой экран
    @objc private func cityButtonTapped() {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // 25. Обработчик нажатия кнопки сканирования для открытия сканера QR
    @objc private func scanButtonTapped() {
        let scannerVC = QRScannerViewController()
        scannerVC.modalPresentationStyle = .fullScreen
        present(scannerVC, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    // 26. Закрытие активного поиска и восстановление начального состояния
    @objc private func closeSearch() {
        headerView.isHidden = false
        searchContainerView.isHidden = true
        categoriesTableView.isHidden = true
        searchBar.text = ""
        searchBar.isHidden = false
        searchButton.isHidden = false
        scanButton.isHidden = false

        searchContainerView.snp.remakeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }

        view.layoutIfNeeded()
        view.endEditing(true)
    }
    
    // 27. Обработка начала ввода в поле поиска для активации поиска
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == searchBar {
            headerView.isHidden = true
            searchContainerView.isHidden = false
            categoriesTableView.isHidden = false
            searchBar.isHidden = true
            searchButton.isHidden = true
            scanButton.isHidden = true

            searchContainerView.snp.remakeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-18)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(44)
            }

            view.layoutIfNeeded()
        }
    }

    // MARK: - TableView DataSource & Delegate
    // 28. Количество строк в таблице категорий
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    // 29. Настройка ячеек таблицы категорий
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }

    // 30. Обработка выбора категории из таблицы
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activeSearchBar.text = categories[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    // 31. Количество элементов в коллекции недавно просмотренных
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    // 32. Настройка ячеек коллекции недавно просмотренных
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath)
        cell.backgroundColor = .systemGray4
        return cell
    }
}
