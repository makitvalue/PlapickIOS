//
//  GallaryItemGroup.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/16.
//

import Foundation


struct GallaryItemGroup: Codable {
    var gallaryItemList: [GallaryItem]?
    var type: String? // N, L, R
}
