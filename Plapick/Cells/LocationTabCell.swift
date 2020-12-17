//
//  LocationTabCell.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/17.
//

import UIKit


class LocationTabCell: UICollectionViewCell {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            adjustColors()
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        adjustColors()
    }
    func adjustColors() {
        label.font = isSelected ? UIFont.boldSystemFont(ofSize: 18) : UIFont.systemFont(ofSize: 18)
        if self.traitCollection.userInterfaceStyle == .dark {
            label.textColor = isSelected ? .white : .lightGray
        } else {
            label.textColor = isSelected ? .black : .lightGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        addSubview(label)
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        adjustColors()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
