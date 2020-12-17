//
//  UploadViewController.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/15.
//

import UIKit


class UploadViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "새로운 게시물"
    }
    
}
