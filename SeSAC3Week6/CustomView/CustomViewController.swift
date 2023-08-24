//
//  CustomViewController.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/24.
//

import UIKit
import SnapKit

class CustomViewController: UIViewController {
    
    let idTextField = {
        let textField = BlackRadiusTextField()
        
        textField.setupView()
        textField.placeholder = "아이디를 입력해주세요"
        return textField
    }()
    
    let passwordTextField = {
        let textField = BlackRadiusTextField()
        textField.setupView()
        textField.placeholder = "비밀번호를 입력해주세요"
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(idTextField)
        idTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.top.equalTo(idTextField.snp.bottom).offset(50)
        }
        
        
        
       
    }
    
   
}
