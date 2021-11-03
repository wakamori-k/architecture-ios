//
//  View.swift
//  counter-ios
//
//  Created by 若森和昌 on 2021/11/03.
//

import Foundation
import UIKit

final class View: UIView {
    var label: UILabel!
    var countDownButton: UIButton!
    var countUpButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .white

        label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height/2))
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40)
        
        countDownButton = UIButton(frame: CGRect(x: 0, y: frame.height/2, width: frame.width/2, height: frame.height/2))
        countDownButton.setTitle("-", for: .normal)
        countDownButton.setTitleColor(.black, for: .normal)
        countDownButton.titleLabel?.font = UIFont.systemFont(ofSize: 60)
        
        countUpButton = UIButton(frame: CGRect(x: frame.width/2, y: frame.height/2, width: frame.width/2, height: frame.height/2))
        countUpButton.setTitle("+", for: .normal)
        countUpButton.setTitleColor(.black, for: .normal)
        countUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 60)
        
        addSubview(label)
        addSubview(countDownButton)
        addSubview(countUpButton)
    }
}
