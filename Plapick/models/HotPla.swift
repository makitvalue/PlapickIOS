//
//  HotPla.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/16.
//

import Foundation


struct HotPla: Codable {
    var id: Int?
    var name: String?
    var address: String?
    var likeCount: Int?
    var pickCount: Int?
    var imageUrlList: [String]?
}
