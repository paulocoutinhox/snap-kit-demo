//
//  ViewController.swift
//  SnapKitDemo
//
//  Created by Paulo Coutinho on 19/08/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let content = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(content)
        content.backgroundColor = .red
        content.snp.makeConstraints {
            $0.width.height.equalTo(50)
            $0.center.equalToSuperview()
        }
    }


}

