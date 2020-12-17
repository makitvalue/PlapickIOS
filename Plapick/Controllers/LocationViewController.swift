//
//  LocationViewController.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/17.
//

import UIKit


class LocationViewController: UIViewController {
    
    var collectionView: UICollectionView?
    
    lazy var locationTabView: LocationTabView = {
        let view = LocationTabView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.sizeToFit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "지역에서 플레이스 찾기"
        
        view.addSubview(locationTabView)
        locationTabView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        locationTabView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        locationTabView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        locationTabView.delegate = self
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: collectionViewLayout)
        
        guard let collectionView = self.collectionView else { return }
        
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.isPagingEnabled = true // 페이징 뷰 (한 cell씩 페이지 넘기듯이 보이는거일듯, 어차피 스크롤 막아서 작동할 일 없음)
        collectionView.isScrollEnabled = false // 스크롤 막기
        
        collectionView.register(LocationPageCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: locationTabView.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension LocationViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LocationPageCell
        cell.viewIndex = indexPath.row
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
}


extension LocationViewController: UICollectionViewDelegateFlowLayout {
    // 셀 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
    


extension LocationViewController: LocationTabViewProtocol {
    func selectTabBar(scrollTo index: Int) {
        collectionView?.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
    }
}
