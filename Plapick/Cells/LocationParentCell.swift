//
//  LocationParentCell.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/17.
//

import UIKit


class LocationParentCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    
    override var isSelected: Bool {
        didSet {
            adjustColors()
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        adjustColors()
    }
    func adjustColors() {
        backgroundColor = isSelected ? .systemBackground : .tertiarySystemGroupedBackground
        if self.traitCollection.userInterfaceStyle == .dark {
            nameLabel.textColor = isSelected ? .white : .lightGray
        } else {
            nameLabel.textColor = isSelected ? .black : .lightGray
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .tertiarySystemGroupedBackground
        
        addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        
        adjustColors()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
