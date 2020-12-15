//
//  MainViewController.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/15.
//

import UIKit


class MainViewController: UITabBarController {
    
    var homeNavController: UINavigationController?
    var uploadNavController: UINavigationController?
    var accountNavController: UINavigationController?
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        adjustColors()
    }
    
    func adjustColors() {
        
        // bottom tab bar 컬러 변경 inverted(반대 색상)
        homeNavController?.tabBarItem.selectedImage = UIImage(systemName: "house.fill")?.withTintColor(UIColor.systemBackground.inverted, renderingMode: UIImage.RenderingMode.alwaysOriginal)
        uploadNavController?.tabBarItem.selectedImage = UIImage(systemName: "plus.circle.fill")?.withTintColor(UIColor.systemBackground.inverted, renderingMode: UIImage.RenderingMode.alwaysOriginal)
        accountNavController?.tabBarItem.selectedImage = UIImage(systemName: "person.circle.fill")?.withTintColor(UIColor.systemBackground.inverted, renderingMode: UIImage.RenderingMode.alwaysOriginal)
        
        if self.traitCollection.userInterfaceStyle == .dark {
            // 다크모드
        } else {
            // 라이트모드
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        homeNavController = UINavigationController(rootViewController: HomeViewController())
        uploadNavController = UINavigationController(rootViewController: UploadViewController())
        accountNavController = UINavigationController(rootViewController: AccountViewController())
        
        homeNavController?.tabBarItem.image = UIImage(systemName: "house")
        uploadNavController?.tabBarItem.image = UIImage(systemName: "plus.circle")
        accountNavController?.tabBarItem.image = UIImage(systemName: "person.circle")
        
        viewControllers = [
            homeNavController!,
            uploadNavController!,
            accountNavController!
        ]
        
        adjustColors()
    }
    
}
