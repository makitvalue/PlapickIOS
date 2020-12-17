//
//  RecommendViewController.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/17.
//

import UIKit


class RecommendViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "추천 게시물"
    }
    
}
