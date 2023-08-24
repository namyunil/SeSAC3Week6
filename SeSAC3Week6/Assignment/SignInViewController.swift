//
//  SignInViewController.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/24.
//

import UIKit

class SignInViewController: UIViewController {

    
    let jackflixLabel = {
        let label = UILabel()
        label.text = "JACKFLIX"
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    let emailTextField = {
        let textField = SignInTextField()
        textField.setupView(string: "이메일 주소 또는 전화번호")
        return textField
    }()
    
    let passwordTextField = {
        let textField = SignInTextField()
        textField.setupView(string: "비밀번호")
        return textField
    }()
    
    let nicknameTextField = {
        let textField = SignInTextField()
        textField.setupView(string: "닉네임")
        return textField
    }()
    
    let locationTextField = {
        let textField = SignInTextField()
        textField.setupView(string: "위치")
        return textField
    }()
    
    let codeTextField = {
        let textField = SignInTextField()
        textField.setupView(string: "추천 코드 입력")
        return textField
    }()
    
    let signInButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let infoButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("추가 정보 입력", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 13)
        return button
    }()
    
    let switchButton = {
        let switchButton = UISwitch()
        switchButton.isOn = true
        switchButton.onTintColor = .red
        switchButton.thumbTintColor = .red
        return switchButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(chevronClicked))
        
        view.addSubview(jackflixLabel)
        jackflixLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(18)
        }

        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(0.7)
            make.height.equalTo(30)
            make.top.equalTo(jackflixLabel.snp.bottom).offset(80)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(0.7)
            make.height.equalTo(30)
            make.top.equalTo(emailTextField.snp.bottom).offset(18)
        }
        view.addSubview(nicknameTextField)
        nicknameTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(0.7)
            make.height.equalTo(30)
            make.top.equalTo(passwordTextField.snp.bottom).offset(18)
        }
        
        view.addSubview(locationTextField)
        locationTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(0.7)
            make.height.equalTo(30)
            make.top.equalTo(nicknameTextField.snp.bottom).offset(18)
        }
        
        view.addSubview(codeTextField)
        codeTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(0.7)
            make.height.equalTo(30)
            make.top.equalTo(locationTextField.snp.bottom).offset(18)
        }
        
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(0.7)
            make.height.equalTo(45)
            make.top.equalTo(codeTextField.snp.bottom).offset(18)
        }
        
        view.addSubview(infoButton)
        infoButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(28)
            make.leading.equalTo(signInButton.snp.leading)
        }
        
        view.addSubview(switchButton)
        switchButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(28)
            make.trailing.equalTo(signInButton.snp.trailing)
        }
    }
    
    
    
    
    @objc func chevronClicked() {
        dismiss(animated: true)
    }

    

}
