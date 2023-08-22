//
//  ViewController.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/21.
//

import UIKit

//1. 객체 얹이고, 레이아웃 잡고, 아웃렛 연결, 속성 조절

//1. 뷰객체 프로퍼티 선언(클래스 인스턴스 생성)
//2. 명시적으로 루트뷰에 추가(스토리보드상에 원하는 위치에 얹는 것과 동일하다..) (passwordTecxtField.translatesAutoresizingMaskIntoConstraints = false)
//3. 크기와 위치 정의
//4. 속성 정의
// => Frame 한계 ( 다양한 디바이스 사이즈의 등장 )
// => AutoResizingMask, AutoLayout => 스토리보드 대응
// => NSLayoutConstraints => 코드베이스 대응 Autolayout
// 코드에서는 AutoResizingMask가 Default, AutoResizingMask와 AutoLayout은 양립할 수 없다, 스토리보드 상에서는 AutoLayout 설정시 자동으로 AutuResizingMask가 꺼진다..!
// -> 코드 베이스로 대응할 때는 AutoResizingMask 기능을 꺼야한다..!

class ViewController: UIViewController {

    //1. 뷰 객체 프로퍼티 선언
    let emailTextField = UITextField()
    let passwordTecxtField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //2. 명시적으로 루트뷰에 추가
        view.addSubview(emailTextField)
        view.addSubview(passwordTecxtField)
        passwordTecxtField.translatesAutoresizingMaskIntoConstraints = false
        
        //3. 크기와 위치 정의
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
        
       
       
        
        //1.
        emailTextField.backgroundColor = .lightGray
        emailTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .numberPad
        emailTextField.placeholder = "닉네임을 입력해주세요"
        
        NSLayoutConstraint(item: passwordTecxtField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50).isActive = true
        // .isActive = true / 레이아웃 활성화
        
        NSLayoutConstraint(item: passwordTecxtField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
        
        NSLayoutConstraint(item: passwordTecxtField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
        
        NSLayoutConstraint(item: passwordTecxtField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50).isActive = true
        
        passwordTecxtField.backgroundColor = .brown
    }


}

