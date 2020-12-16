//
//  GallaryItemGroupView.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/16.
//

import UIKit


class GallaryItemGroupView: UIView {
    
    var gallaryItemList: [GallaryItem]?
    
    @objc func cell1Tapped() {
        guard let gallaryItemList = self.gallaryItemList else { return }
        
        let id = gallaryItemList[0].id
        
        print(String(id!))
    }
    @objc func cell2Tapped() {
        guard let gallaryItemList = self.gallaryItemList else { return }
        
        let id = gallaryItemList[1].id
        
        print(String(id!))
    }
    @objc func cell3Tapped() {
        guard let gallaryItemList = self.gallaryItemList else { return }
        
        let id = gallaryItemList[2].id
        
        print(String(id!))
    }
    
    init(gallaryItemGroup: GallaryItemGroup, cellSize: CGFloat, spacing: CGFloat) {
        super.init(frame: CGRect.zero)
        
        self.gallaryItemList = gallaryItemGroup.gallaryItemList
        
        guard let gallaryItemList = self.gallaryItemList else { return }
        
        let gallaryItem1 = gallaryItemList[0]
        let gallaryItem2 = gallaryItemList[1]
        let gallaryItem3 = gallaryItemList[2]
        
        let cell1 = UIView()
        let cell2 = UIView()
        let cell3 = UIView()
        
        cell1.translatesAutoresizingMaskIntoConstraints = false
        cell2.translatesAutoresizingMaskIntoConstraints = false
        cell3.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(cell1)
        addSubview(cell2)
        addSubview(cell3)
        
        cell2.widthAnchor.constraint(equalToConstant: cellSize).isActive = true
        cell2.heightAnchor.constraint(equalToConstant: cellSize).isActive = true
        cell3.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        switch gallaryItemGroup.type {
        case "N":
            heightAnchor.constraint(equalToConstant: cellSize).isActive = true
            configureNormalView(cell1: cell1, cell2: cell2, cell3: cell3, cellSize: cellSize, spacing: spacing)
        case "L":
            heightAnchor.constraint(equalToConstant: (cellSize * 2) + spacing).isActive = true
            configureLeftView(cell1: cell1, cell2: cell2, cell3: cell3, cellSize: cellSize, spacing: spacing)
        case "R":
            heightAnchor.constraint(equalToConstant: (cellSize * 2) + spacing).isActive = true
            configureRightView(cell1: cell1, cell2: cell2, cell3: cell3, cellSize: cellSize, spacing: spacing)
        default: break
        }
        
        cell1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cell1Tapped)))
        cell2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cell2Tapped)))
        cell3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cell3Tapped)))
        
        let imageView1 = UIImageView()
        let imageView2 = UIImageView()
        let imageView3 = UIImageView()
        
        imageView1.contentMode = .scaleAspectFill
        imageView2.contentMode = .scaleAspectFill
        imageView3.contentMode = .scaleAspectFill
        
        imageView1.clipsToBounds = true
        imageView2.clipsToBounds = true
        imageView3.clipsToBounds = true
        
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        
        cell1.addSubview(imageView1)
        cell2.addSubview(imageView2)
        cell3.addSubview(imageView3)
        
        imageView1.load(urlString: gallaryItem1.imageUrl!)
        imageView2.load(urlString: gallaryItem2.imageUrl!)
        imageView3.load(urlString: gallaryItem3.imageUrl!)
        
        imageView1.topAnchor.constraint(equalTo: cell1.topAnchor).isActive = true
        imageView1.bottomAnchor.constraint(equalTo: cell1.bottomAnchor).isActive = true
        imageView1.leadingAnchor.constraint(equalTo: cell1.leadingAnchor).isActive = true
        imageView1.trailingAnchor.constraint(equalTo: cell1.trailingAnchor).isActive = true
        
        imageView2.topAnchor.constraint(equalTo: cell2.topAnchor).isActive = true
        imageView2.bottomAnchor.constraint(equalTo: cell2.bottomAnchor).isActive = true
        imageView2.leadingAnchor.constraint(equalTo: cell2.leadingAnchor).isActive = true
        imageView2.trailingAnchor.constraint(equalTo: cell2.trailingAnchor).isActive = true
        
        imageView3.topAnchor.constraint(equalTo: cell3.topAnchor).isActive = true
        imageView3.bottomAnchor.constraint(equalTo: cell3.bottomAnchor).isActive = true
        imageView3.leadingAnchor.constraint(equalTo: cell3.leadingAnchor).isActive = true
        imageView3.trailingAnchor.constraint(equalTo: cell3.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureNormalView(cell1: UIView, cell2: UIView, cell3: UIView, cellSize: CGFloat, spacing: CGFloat) {
        
        cell1.widthAnchor.constraint(equalToConstant: cellSize).isActive = true
        cell1.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        cell2.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        cell3.widthAnchor.constraint(equalToConstant: cellSize).isActive = true
        cell3.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    func configureLeftView(cell1: UIView, cell2: UIView, cell3: UIView, cellSize: CGFloat, spacing: CGFloat) {
        
        cell1.widthAnchor.constraint(equalToConstant: (cellSize * 2) + spacing).isActive = true
        cell1.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        cell2.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        cell3.widthAnchor.constraint(equalToConstant: cellSize).isActive = true
        cell3.heightAnchor.constraint(equalToConstant: cellSize).isActive = true
        cell3.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func configureRightView(cell1: UIView, cell2: UIView, cell3: UIView, cellSize: CGFloat, spacing: CGFloat) {
        
        cell1.widthAnchor.constraint(equalToConstant: cellSize).isActive = true
        cell1.heightAnchor.constraint(equalToConstant: cellSize).isActive = true
        
        cell2.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        cell3.widthAnchor.constraint(equalToConstant: (cellSize * 2) + spacing).isActive = true
        cell3.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
}
