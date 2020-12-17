//
//  LocationParentTableViewController.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/17.
//

import UIKit


protocol LocationParentTableViewControllerProtocol {
    func changeParent(index: Int)
}


class LocationParentTableViewController: UITableViewController {
    
    let parentLocationList: [String] = [
        "서울", "경기", "인천", "강원", "제주", "대전", "충북", "충남/세종",
        "부산", "울산", "경남", "대구", "경북", "광주", "전남", "전주/전북"
    ]
    
    var delegate: LocationParentTableViewControllerProtocol?
    
    var isInitLoading = true // 첫 번째 테이블뷰 로딩인지 확인 (0번째 select때문)
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .tertiarySystemGroupedBackground
        
        tableView.register(LocationParentCell.self, forCellReuseIdentifier: "parentCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parentLocationList.count
    }
    
    // 셀에 아이템 전달
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parentCell", for: indexPath) as! LocationParentCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        // 매우 불안정, cell 내부에서 자체로 하고 reloadData() 하는게 훨씬 나음
//        let bgColor = UIView()
//        bgColor.backgroundColor = .systemBackground
//        cell.selectedBackgroundView = bgColor
        
        cell.name = parentLocationList[indexPath.row]
        
        // 선택된 셀 selected
        if indexPath.row == selectedIndex { cell.isSelected = true }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 중복 선택 방지
        if indexPath.row == selectedIndex { return }
        
        selectedIndex = indexPath.row
        let cell = tableView.cellForRow(at: indexPath) as! LocationParentCell
        cell.isSelected = true
        tableView.reloadData()
        delegate?.changeParent(index: indexPath.row)
    }
    
    // 선택 해제시
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! LocationParentCell
        cell.isSelected = false
        tableView.reloadData()
    }
    
    // 셀 세팅 끝났으면 맨 첫번째로 child 세팅
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !isInitLoading { return }
        
        if indexPath.row == parentLocationList.count - 1 {
            tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: UITableView.ScrollPosition.top)
            delegate?.changeParent(index: 0)
            isInitLoading = false
        }
    }
}
