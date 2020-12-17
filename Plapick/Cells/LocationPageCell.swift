//
//  LocationPageCell.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/17.
//

import UIKit


class LocationPageCell: UICollectionViewCell {
    
    var viewController: UIViewController?
    
    var viewIndex: Int? {
        didSet {
            if viewIndex == 0 {
                self.viewController = LocationListViewController()
            } else {
                self.viewController = LocationMapViewController()
            }
            
            guard let viewController = self.viewController else { return }
            
            addSubview(viewController.view)
            viewController.view.translatesAutoresizingMaskIntoConstraints = false
            viewController.view.topAnchor.constraint(equalTo: topAnchor).isActive = true
            viewController.view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            viewController.view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            viewController.view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
