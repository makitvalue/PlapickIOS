//
//  HotPlaItemView.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/16.
//

import UIKit


class HotPlaItemView: UIView {
    
    var pagerWidth: CGFloat?
    var hotPlaItemImageViewList: [HotPlaItemImageView] = []
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var likeImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "heart")
        iv.tintColor = .systemRed
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var pickImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "camera")
        iv.tintColor = .systemOrange
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var pickLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        view.addSubview(pickLabel)
        pickLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pickLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(pickImageView)
        pickImageView.trailingAnchor.constraint(equalTo: pickLabel.leadingAnchor, constant: -5).isActive = true
        pickImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(likeLabel)
        likeLabel.trailingAnchor.constraint(equalTo: pickImageView.leadingAnchor, constant: -10).isActive = true
        likeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(likeImageView)
        likeImageView.trailingAnchor.constraint(equalTo: likeLabel.leadingAnchor, constant: -5).isActive = true
        likeImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var topLine: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = hotPlaItemImageViewList.count
        
        // 이거 안해주면 pageControl에 패딩이 잡혀있음
        if #available(iOS 14.0, *) {
            pc.backgroundStyle = .minimal
            pc.allowsContinuousInteraction = false
        }
        
        pc.isEnabled = false // clickable
        pc.pageIndicatorTintColor = .separator
        
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        adjustColors()
    }
    func adjustColors() {
        if self.traitCollection.userInterfaceStyle == .dark {
            // 다크모드
            pageControl.currentPageIndicatorTintColor = .white
        } else {
            // 라이트모드
            pageControl.currentPageIndicatorTintColor = .black
        }
    }
    
    init(pagerWidth: CGFloat, pagerHeight: CGFloat, hotPla: HotPla) {
        super.init(frame: CGRect.zero)
        
        self.pagerWidth = pagerWidth
        
        nameLabel.text = hotPla.name
        likeLabel.text = String(hotPla.likeCount!)
        pickLabel.text = String(hotPla.pickCount!)
        addressLabel.text = hotPla.address
        
        let imageUrlList: [String] = hotPla.imageUrlList!
        for urlString in imageUrlList {
            hotPlaItemImageViewList.append(HotPlaItemImageView(urlString: urlString))
        }
        
        addSubview(headerView)
        headerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        headerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        addSubview(addressLabel)
        addressLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 5).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: pagerHeight).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    
        addSubview(pageControl)
        pageControl.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        if #available(iOS 14.0, *) {
            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10).isActive = true
            pageControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        } else {
            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            pageControl.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        }
        
        addSubview(topLine)
        topLine.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        topLine.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        topLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        addSubview(bottomLine)
        bottomLine.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        bottomLine.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        scrollView.contentSize = CGSize(width: pagerWidth * CGFloat(hotPlaItemImageViewList.count), height: pagerHeight)
        
        for (i, hotPlaItemImageView) in hotPlaItemImageViewList.enumerated() {
            scrollView.addSubview(hotPlaItemImageView)
            hotPlaItemImageView.frame = CGRect(x: pagerWidth * CGFloat(i), y: 0, width: pagerWidth, height: pagerHeight)
        }
        
        adjustColors()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension HotPlaItemView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / pagerWidth!)
        pageControl.currentPage = Int(pageIndex)
    }
}
