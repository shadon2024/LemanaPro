//
//  SceneDelegate.swift
//  LemanaPRO
//
//  Created by Admin on 15.02.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
//        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
//        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//        guard let _ = (scene as? UIWindowScene) else { return }
//    }
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        let window = UIWindow(windowScene: windowScene)
//        window.backgroundColor = .red  // Устанавливаем красный фон для окна
//        window.rootViewController = ViewController()  // Ваш начальный контроллер
//        self.window = window
//        window.makeKeyAndVisible()
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .red  // Устанавливаем красный фон для окна
        // Оборачиваем ViewController в UINavigationController:
        window.rootViewController = UINavigationController(rootViewController: MainTabBarController())
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//
//    var window: UIWindow?
//
//
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//
//
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        let window = UIWindow(windowScene: windowScene)
//        self.window = window
//
//
//        window.makeKeyAndVisible()
//    }
//
//
//    func showTabBar() {
//
//        // Создаем изображение нужного размера
//        //let imageSize = CGSize(width: 30, height: 30) // Примерный размер изображения
//        let imageHome = UIImage(systemName: "list.bullet.circle.fill")//?.resize(targetSize: imageSize)
//        let imagePerson = UIImage(systemName: "person.crop.circle")//?.resize(targetSize: imageSize)
//        let imageHistory = UIImage(systemName: "archivebox.circle")//?.resize(targetSize: imageSize)
//        let imageUsers = UIImage(systemName: "person.2.circle.fill")//?.resize(targetSize: imageSize)
//        //let imageUsersTest = UIImage(systemName: "list.bullet.circle")//?.resize(targetSize: imageSize)
//
//
//
//
//        // Создание контроллеров для вкладок
//        let homeTabVC = HomeViewController()
//        let homeNavController = UINavigationController(rootViewController: homeTabVC)
//        homeNavController.tabBarItem.title = "Task"
//        homeNavController.tabBarItem.image = imageHome
//
//        let personTabVC = PersonViewController()
//        let personNavController = UINavigationController(rootViewController: personTabVC)
//        personNavController.tabBarItem.title = "Profile"
//        personNavController.tabBarItem.image = imagePerson
//
//        let historyTabVC = HistoryViewController()
//        let historyController = UINavigationController(rootViewController: historyTabVC)
//        historyController.tabBarItem.title = "History"
//        historyController.tabBarItem.image = imageHistory
//
//        let usersTabVC = UsersViewController()
//        let usersController = UINavigationController(rootViewController: usersTabVC)
//        usersController.tabBarItem.title = "Users"
//        usersController.tabBarItem.image = imageUsers
//
//
//
//
//        // Установка размера изображения
//        homeNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        personNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        historyController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        usersController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//
//        // Создание TabBarController
//        let tabBarController = UITabBarController()
//
//        // Настройка шрифта для отдельного UITabBarItem
//        let fontAttributes = [
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .semibold),
//            NSAttributedString.Key.foregroundColor: UIColor.systemBlue
//        ]
//        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
//
//        // Установка контроллеров во вкладки TabBarController
//        tabBarController.viewControllers = [homeNavController, historyController, usersController, personNavController]
//
//        // Установка цвета фона таббара
//        tabBarController.tabBar.barTintColor = .systemGray5
//
//        // Установка акцентного цвета таббара
//        tabBarController.tabBar.tintColor = .systemBlue
//
//        // Установка таббара как корневого контроллера окна
//        window?.rootViewController = tabBarController
//    }
//
//    func userLoggedIn() {
//        showTabBar()
//    }
//
//    func userRegistered() {
//        showTabBar()
//    }
//
//
//
//    func sceneDidDisconnect(_ scene: UIScene) {
//        // Called as the scene is being released by the system.
//        // This occurs shortly after the scene enters the background, or when its session is discarded.
//        // Release any resources associated with this scene that can be re-created the next time the scene connects.
//        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
//    }
//
//    func sceneDidBecomeActive(_ scene: UIScene) {
//        // Called when the scene has moved from an inactive state to an active state.
//        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
//    }
//
//    func sceneWillResignActive(_ scene: UIScene) {
//        // Called when the scene will move from an active state to an inactive state.
//        // This may occur due to temporary interruptions (ex. an incoming phone call).
//    }
//
//    func sceneWillEnterForeground(_ scene: UIScene) {
//        // Called as the scene transitions from the background to the foreground.
//        // Use this method to undo the changes made on entering the background.
//    }
//
//    func sceneDidEnterBackground(_ scene: UIScene) {
//        // Called as the scene transitions from the foreground to the background.
//        // Use this method to save data, release shared resources, and store enough scene-specific state information
//        // to restore the scene back to its current state.
//
//        // Save changes in the application's managed object context when the application transitions to the background.
//        //(UIApplication.shared.delegate as? AppDelegate)?.saveContext()
//    }
//
//
//
//}
//
//
//extension UIImage {
//    func resize(targetSize: CGSize) -> UIImage? {
//        let size = self.size
//
//        let widthRatio  = targetSize.width  / size.width
//        let heightRatio = targetSize.height / size.height
//
//        let newSize: CGSize
//        if widthRatio > heightRatio {
//            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
//        } else {
//            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
//        }
//
//        let rect = CGRect(origin: .zero, size: newSize)
//
//        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
//        defer { UIGraphicsEndImageContext() }
//        self.draw(in: rect)
//
//        return UIGraphicsGetImageFromCurrentImageContext()
//    }
//}
