//
//  HomeViewController.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/15.
//

import UIKit


class HomeViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.contentSize = CGSize(width: view.frame.width, height: 1000)
        
        return view
    }()
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        adjustColors()
    }
    
    func adjustColors() {
        if self.traitCollection.userInterfaceStyle == .dark {
            // 다크모드
            navigationItem.rightBarButtonItem?.tintColor = .white
        } else {
            // 라이트모드
            navigationItem.rightBarButtonItem?.tintColor = .black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "플래픽"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        adjustColors()
    }
    
}
