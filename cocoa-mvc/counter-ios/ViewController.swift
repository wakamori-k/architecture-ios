//
//  ViewController.swift
//  counter-ios
//
//  Created by 若森和昌 on 2021/11/03.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var myView = View(frame: UIScreen.main.bounds)
    var myModel: Model? {
        didSet {
            registModel()
        }
    }
    
    override func loadView() {
        view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myModel = ModelImpl()
    }
    
    func registModel() {
        myView.countDownButton.addTarget(self,
                                         action: #selector(onCountDownTapped),
                                         for: .touchUpInside)
        myView.countUpButton.addTarget(self,
                                       action: #selector(onCountUpTapped),
                                       for: .touchUpInside)
        
        myModel?.notificationCenter.addObserver(forName: .init(rawValue: "count"),
                                                object: nil,
                                                queue: nil) { [weak self] notification in
            if let count = notification.userInfo?["count"] as? Int {
                self?.myView.label.text = String(count)
            }
        }
    }
    
    @objc func onCountDownTapped() {
        myModel?.countDown()
    }
    
    @objc func onCountUpTapped() {
        myModel?.countUp()
    }
}

