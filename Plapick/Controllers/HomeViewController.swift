//
//  HomeViewController.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/15.
//

import UIKit


class HomeViewController: UIViewController {
    
    var gallaryItemGroupList: [GallaryItemGroup]?
    var hotPlaList: [HotPla]?
    
    lazy var recentPickLabel: UIView = {
        let label = UILabel()
        label.text = "Recent Pick"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var gallaryView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var hotPlaLabel: UILabel = {
        let label = UILabel()
        label.text = "Hot Pla!"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var hotPlaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.refreshControl = UIRefreshControl()
        view.refreshControl?.addTarget(self, action: #selector(refreshed), for: UIControl.Event.valueChanged)
        
        view.addSubview(recentPickLabel)
        recentPickLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        recentPickLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(gallaryView)
        gallaryView.topAnchor.constraint(equalTo: recentPickLabel.bottomAnchor, constant: 40).isActive = true
        gallaryView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        view.addSubview(hotPlaLabel)
        hotPlaLabel.topAnchor.constraint(equalTo: gallaryView.bottomAnchor, constant: 60).isActive = true
        hotPlaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        hotPlaLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        view.addSubview(hotPlaView)
        hotPlaView.topAnchor.constraint(equalTo: hotPlaLabel.bottomAnchor, constant: 40).isActive = true
        hotPlaView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        hotPlaView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    @objc func refreshed() {
        print("refreshed")
        
        scrollView.refreshControl?.endRefreshing()
//        scrollView.refreshControl?.isRefreshing // Bool
    }
    
    
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
        
        view.backgroundColor = .systemBackground
        
        // 타이틀 세팅
        // Large title 스크롤된 상태로 탭 이동했다 돌아오면 Large title이 유지되는데
        // 이때 Large title 자체에 백그라운드를 심어줘서 어색하지 않도록 함
        navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "플레픽"
//        navigationController?.hidesBarsOnSwipe = true // 매직;
//        navigationController?.hidesBarsOnTap = true
        // navigationController.hides 보면 신기한거 많음
        
        // 네비게이션 우측에 검색버튼
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
        
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        let iuImageUrl1 = "http://plapick.com/admin/img/sample_iu_1.jpg"
        let iuImageUrl2 = "http://plapick.com/admin/img/sample_iu_3.jpg"
        let iuImageUrl3 = "http://plapick.com/admin/img/sample_iu_5.jpg"
        
        // TODO: http로 만들 배열임
        gallaryItemGroupList = [
            GallaryItemGroup(gallaryItemList: [
                GallaryItem(id: 1, imageUrl: iuImageUrl1),
                GallaryItem(id: 2, imageUrl: iuImageUrl2),
                GallaryItem(id: 3, imageUrl: iuImageUrl3)
            ], type: "N"),
            GallaryItemGroup(gallaryItemList: [
                GallaryItem(id: 4, imageUrl: iuImageUrl1),
                GallaryItem(id: 5, imageUrl: iuImageUrl2),
                GallaryItem(id: 6, imageUrl: iuImageUrl3)
            ], type: "L"),
            GallaryItemGroup(gallaryItemList: [
                GallaryItem(id: 7, imageUrl: iuImageUrl1),
                GallaryItem(id: 8, imageUrl: iuImageUrl2),
                GallaryItem(id: 9, imageUrl: iuImageUrl3)
            ], type: "N"),
            GallaryItemGroup(gallaryItemList: [
                GallaryItem(id: 10, imageUrl: iuImageUrl1),
                GallaryItem(id: 11, imageUrl: iuImageUrl2),
                GallaryItem(id: 12, imageUrl: iuImageUrl3)
            ], type: "R"),
            GallaryItemGroup(gallaryItemList: [
                GallaryItem(id: 13, imageUrl: iuImageUrl1),
                GallaryItem(id: 14, imageUrl: iuImageUrl2),
                GallaryItem(id: 15, imageUrl: iuImageUrl3)
            ], type: "N")
        ]
        configureGallaryView()
        
        hotPlaList = [
            HotPla(id: 1, name: "아침고요수목원", address: "경기 가평군 상면 수목원로 432", likeCount: 166, pickCount: 166, imageUrlList: [iuImageUrl1, iuImageUrl2, iuImageUrl3, iuImageUrl1, iuImageUrl2, iuImageUrl3, iuImageUrl1, iuImageUrl2, iuImageUrl3, iuImageUrl1, iuImageUrl2, iuImageUrl3, iuImageUrl1]),
            HotPla(id: 2, name: "아침고요수목원", address: "경기 가평군 상면 수목원로 432", likeCount: 166, pickCount: 166, imageUrlList: [iuImageUrl1, iuImageUrl2, iuImageUrl3]),
            HotPla(id: 3, name: "아침고요수목원", address: "경기 가평군 상면 수목원로 432", likeCount: 166, pickCount: 166, imageUrlList: [iuImageUrl1, iuImageUrl2, iuImageUrl3])
        ]
        configureHotPlaView()
        
        adjustColors()
    }
    
    
    func configureGallaryView() {
        guard let gallaryItemGroupList = self.gallaryItemGroupList else { return }
        
        let spacing: CGFloat = 1
        
        // 갤러리 아이템 그룹 뷰 세팅
        var gallaryItemGroupViewList: [GallaryItemGroupView] = []
        for gallaryItemGroup in gallaryItemGroupList {
            gallaryItemGroupViewList.append(GallaryItemGroupView(gallaryItemGroup: gallaryItemGroup, cellSize: (view.frame.size.width / 3) - (spacing * 2/3), spacing: spacing))
        }
        
        for (i, gallaryItemGroupView) in gallaryItemGroupViewList.enumerated() {
            gallaryItemGroupView.translatesAutoresizingMaskIntoConstraints = false
            gallaryView.addSubview(gallaryItemGroupView)
            
            gallaryItemGroupView.widthAnchor.constraint(equalTo: gallaryView.widthAnchor).isActive = true
            
            // topAnchor index별 세팅
            if i == 0 {
                gallaryItemGroupView.topAnchor.constraint(equalTo: gallaryView.topAnchor).isActive = true
            } else {
                gallaryItemGroupView.topAnchor.constraint(equalTo: gallaryItemGroupViewList[i - 1].bottomAnchor, constant: spacing).isActive = true
                
                // 마지막 친구는 bottomAnchor 세팅해줘야 함
                if i == gallaryItemGroupViewList.count - 1 {
                    gallaryItemGroupView.bottomAnchor.constraint(equalTo: gallaryView.bottomAnchor).isActive = true
                }
            }
        }
    }
    
    
    func configureHotPlaView() {
        guard let hotPlaList = self.hotPlaList else { return }
        
        var hotPlaItemViewList: [HotPlaItemView] = []
        for hotPla in hotPlaList {
            hotPlaItemViewList.append(HotPlaItemView(pagerWidth: view.frame.size.width, pagerHeight: 280, hotPla: hotPla))
        }
        
        for (i, hotPlaItemView) in hotPlaItemViewList.enumerated() {
            hotPlaItemView.translatesAutoresizingMaskIntoConstraints = false
            hotPlaView.addSubview(hotPlaItemView)
            
            hotPlaItemView.widthAnchor.constraint(equalTo: hotPlaView.widthAnchor).isActive = true
        
            if i == 0 {
                hotPlaItemView.topAnchor.constraint(equalTo: hotPlaView.topAnchor).isActive = true
            } else {
                hotPlaItemView.topAnchor.constraint(equalTo: hotPlaItemViewList[i - 1].bottomAnchor, constant: 40).isActive = true
                if i == hotPlaItemViewList.count - 1 {
                    hotPlaItemView.bottomAnchor.constraint(equalTo: hotPlaView.bottomAnchor).isActive = true
                }
            }
        }
    }
    
}
