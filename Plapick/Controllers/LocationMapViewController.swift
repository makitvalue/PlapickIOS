//
//  LocationMapViewController.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/17.
//

import UIKit


class LocationMapViewController: UIViewController {
    
    lazy var locationButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.backgroundColor = UIColor.systemBackground
        button.setTitle("이 위치에서 찾기", for: UIControl.State.normal)
        button.setTitleColor(UIColor.systemBackground.inverted, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor // 그림자 색
        button.layer.shadowOpacity = 0.5 // 그림자 진한정도?
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0) // 그림자 방향?
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var centerLocationView: UIView = {
        let view = UIView()
        
        let scopeImageView = UIImageView()
        scopeImageView.image = UIImage(systemName: "scope")
        scopeImageView.contentMode = .scaleAspectFill
        scopeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage(systemName: "arrowtriangle.down.fill")
        arrowImageView.contentMode = .scaleAspectFill
//        arrowImageView.transform = arrowImageView.transform.rotated(by: .pi) // 180도 회전
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scopeImageView)
        scopeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scopeImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        scopeImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        scopeImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(arrowImageView)
        arrowImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        arrowImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
        arrowImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        adjustColors()
    }
    func adjustColors() {
        locationButton.setTitleColor(UIColor.systemBackground.inverted, for: UIControl.State.normal)
        if self.traitCollection.userInterfaceStyle == .dark {
        } else {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        view.addSubview(centerLocationView)
        centerLocationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerLocationView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(locationButton)
        locationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        locationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        locationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        locationButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        adjustColors()
    }
    
}
