//
//  ButtonAssignmentViewController.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/23.
//

import UIKit
import SnapKit

class ButtonAssignmentViewController: UIViewController {

    
    let locationButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("위치", for: .normal)
        button.addTarget(self, action: #selector(locationButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(locationButton)
        locationButton.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.bottom.equalTo(view)
            make.centerX.equalTo(view)
        }
    
    }
    
    @objc func locationButtonClicked() {
        let vc = LocationAssignmentViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
        
    }


}
