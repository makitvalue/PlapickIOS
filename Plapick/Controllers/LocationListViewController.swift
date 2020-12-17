//
//  LocationListViewController.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/17.
//

import UIKit


class LocationListViewController: UIViewController {
    
    lazy var parentTableViewController: LocationParentTableViewController = {
        let tableViewController = LocationParentTableViewController()
        tableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        return tableViewController
    }()
    
    lazy var childTableViewController: LocationChildTableViewController = {
        let tableViewController = LocationChildTableViewController()
        tableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        return tableViewController
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(parentTableViewController.view)
        parentTableViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        parentTableViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        parentTableViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        parentTableViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        parentTableViewController.delegate = self
        
        view.addSubview(separatorView)
        separatorView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        separatorView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: parentTableViewController.view.trailingAnchor).isActive = true
        
        view.addSubview(childTableViewController.view)
        childTableViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        childTableViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        childTableViewController.view.leadingAnchor.constraint(equalTo: parentTableViewController.view.trailingAnchor).isActive = true
        childTableViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
}


extension LocationListViewController: LocationParentTableViewControllerProtocol {
    func changeParent(index: Int) {
        childTableViewController.selectedParentIndex = index
    }
}
