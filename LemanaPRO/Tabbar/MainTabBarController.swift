//
//  MainTabBarController.swift
//  LemanaPRO
//
//  Created by Admin on 17.02.2025.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 15.0, *) {
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground() // или configureWithDefaultBackground()
                appearance.backgroundColor = UIColor.white // нужный цвет
                tabBar.standardAppearance = appearance
                tabBar.scrollEdgeAppearance = appearance
            } else {
                tabBar.barTintColor = UIColor.red
                tabBar.isTranslucent = false
            }
        
        
        // Создаем первый контроллер
        let firstVC = HomeViewController() // замените на ваш класс
        firstVC.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "magnifyingglass"), tag: 0)

        // Создаем второй контроллер
        let secondVC = MyListViewController() // замените на ваш класс
        secondVC.tabBarItem = UITabBarItem(title: "Мой список", image: UIImage(systemName: "bookmark"), tag: 1)
        
        // Создаем третый контроллер
        let threeVC = StoriesViewController() // замените на ваш класс
        threeVC.tabBarItem = UITabBarItem(title: "Магазины", image: UIImage(systemName: "house"), tag: 2)
        
        // Создаем третый контроллер
        let fourVC = UsersViewController() // замените на ваш класс
        fourVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 3)
        
        // Создаем третый контроллер
        let fiveVC = AccountViewController() // замените на ваш класс
        fiveVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "cart"), tag: 4)

        // Добавляем контроллеры в таббар
        self.viewControllers = [firstVC, secondVC, threeVC, fourVC, fiveVC]
        
//        func showTabBar() {
//
//            // Создаем изображение нужного размера
//            //let imageSize = CGSize(width: 30, height: 30) // Примерный размер изображения
//            let imageHome = UIImage(systemName: "list.bullet.circle.fill")//?.resize(targetSize: imageSize)
//            let imagePerson = UIImage(systemName: "person.crop.circle")//?.resize(targetSize: imageSize)
//            let imageHistory = UIImage(systemName: "archivebox.circle")//?.resize(targetSize: imageSize)
//            let imageUsers = UIImage(systemName: "person.2.circle.fill")//?.resize(targetSize: imageSize)
//            //let imageUsersTest = UIImage(systemName: "list.bullet.circle")//?.resize(targetSize: imageSize)
//
//
//
//
//            // Создание контроллеров для вкладок
//            let homeTabVC = HomeViewController()
//            let homeNavController = UINavigationController(rootViewController: homeTabVC)
//            homeNavController.tabBarItem.title = "Task"
//            homeNavController.tabBarItem.image = imageHome
//
//            let personTabVC = PersonViewController()
//            let personNavController = UINavigationController(rootViewController: personTabVC)
//            personNavController.tabBarItem.title = "Profile"
//            personNavController.tabBarItem.image = imagePerson
//
//            let historyTabVC = HistoryViewController()
//            let historyController = UINavigationController(rootViewController: historyTabVC)
//            historyController.tabBarItem.title = "History"
//            historyController.tabBarItem.image = imageHistory
//
//            let usersTabVC = UsersViewController()
//            let usersController = UINavigationController(rootViewController: usersTabVC)
//            usersController.tabBarItem.title = "Users"
//            usersController.tabBarItem.image = imageUsers
//
//
//
//
//            // Установка размера изображения
//            homeNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//            personNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//            historyController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//            usersController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//
//            // Создание TabBarController
//            let tabBarController = UITabBarController()
//
//            // Настройка шрифта для отдельного UITabBarItem
//            let fontAttributes = [
//                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .semibold),
//                NSAttributedString.Key.foregroundColor: UIColor.systemBlue
//            ]
//            UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
//
//            // Установка контроллеров во вкладки TabBarController
//            self.viewControllers = [firstVC, secondVC]
//
//            // Установка цвета фона таббара
//            tabBarController.tabBar.barTintColor = .systemGray5
//
//            // Установка акцентного цвета таббара
//            tabBarController.tabBar.tintColor = .systemBlue
//
//            // Установка таббара как корневого контроллера окна
//            //window?.rootViewController = tabBarController
//        }
        
        
        
        
        
        
        
        
    }


    
}


extension UIImage {
    func resize(targetSize: CGSize) -> UIImage? {
        let size = self.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        let newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        let rect = CGRect(origin: .zero, size: newSize)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        defer { UIGraphicsEndImageContext() }
        self.draw(in: rect)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
