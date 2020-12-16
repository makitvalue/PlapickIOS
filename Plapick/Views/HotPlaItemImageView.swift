//
//  HotPlaItemImageView.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/16.
//

import UIKit


class HotPlaItemImageView: UIImageView {
    
    init(urlString: String) {
        super.init(frame: CGRect.zero)
        
        load(urlString: urlString)
        
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
