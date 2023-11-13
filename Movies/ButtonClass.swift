//
//  ButtonClass.swift
//  Movies
//
//  Created by EmreYiğit on 9.11.2023.
//

import UIKit

class ButtonClass: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        setTitle("Trailer", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
