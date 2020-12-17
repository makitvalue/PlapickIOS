//
//  MainViewController.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/15.
//

import UIKit


class MainViewController: UITabBarController {
    
    var homeViewController: UINavigationController?
    var locationViewController: UINavigationController?
    var uploadViewController: UINavigationController?
    var recommendViewController: UINavigationController?
    var accountViewController: UINavigationController?
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        adjustColors()
    }

    func adjustColors() {

        // bottom tab bar 컬러 변경 inverted(반대 색상)
        homeViewController?.tabBarItem.selectedImage = UIImage(systemName: "house.fill")?.withTintColor(UIColor.systemBackground.inverted, renderingMode: UIImage.RenderingMode.alwaysOriginal)
        locationViewController?.tabBarItem.selectedImage = UIImage(systemName: "location.circle.fill")?.withTintColor(UIColor.systemBackground.inverted, renderingMode: UIImage.RenderingMode.alwaysOriginal)
        uploadViewController?.tabBarItem.selectedImage = UIImage(systemName: "plus.circle.fill")?.withTintColor(UIColor.systemBackground.inverted, renderingMode: UIImage.RenderingMode.alwaysOriginal)
        recommendViewController?.tabBarItem.selectedImage = UIImage(systemName: "heart.circle.fill")?.withTintColor(UIColor.systemBackground.inverted, renderingMode: UIImage.RenderingMode.alwaysOriginal)
        accountViewController?.tabBarItem.selectedImage = UIImage(systemName: "person.fill")?.withTintColor(UIColor.systemBackground.inverted, renderingMode: UIImage.RenderingMode.alwaysOriginal)

        if self.traitCollection.userInterfaceStyle == .dark {
            // 다크모드
        } else {
            // 라이트모드
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
//        tabBarController?.tabBar.isHidden = true
        
        homeViewController = UINavigationController(rootViewController: HomeViewController())
        locationViewController = UINavigationController(rootViewController: LocationViewController())
        uploadViewController = UINavigationController(rootViewController: UploadViewController())
        recommendViewController = UINavigationController(rootViewController: RecommendViewController())
        accountViewController = UINavigationController(rootViewController: AccountViewController())
        
        homeViewController?.tabBarItem.image = UIImage(systemName: "house")
        locationViewController?.tabBarItem.image = UIImage(systemName: "location.circle")
        uploadViewController?.tabBarItem.image = UIImage(systemName: "plus.circle")
        recommendViewController?.tabBarItem.image = UIImage(systemName: "heart.circle")
        accountViewController?.tabBarItem.image = UIImage(systemName: "person")
        
        setViewControllers([
            homeViewController!,
            locationViewController!,
            uploadViewController!,
            recommendViewController!,
            accountViewController!
        ], animated: false)
        
        adjustColors()
    }
    
}
