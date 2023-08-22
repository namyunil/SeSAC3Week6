//
//  Example1ViewController.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/22.
//

import UIKit
import SnapKit

class Example1ViewController: UIViewController {

    let grayView = UIView()
    let titleTextField = UITextField()
    let dateTextField = UITextField()
    let whiteView = UIView()
    let tapGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .white
        

        
        
        view.addSubview(grayView)
        grayView.backgroundColor = .gray
        grayView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.height.equalTo(180)
        }
        
        view.addSubview(titleTextField)
        titleTextField.placeholder = "제목을 입력해주세요"
        titleTextField.textAlignment = .center
        
        titleTextField.layer.borderWidth = 1
        titleTextField.layer.borderColor = UIColor.black.cgColor
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp_bottomMargin).offset(20)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.height.equalTo(50)
        }
        
        //코드로 키보드 내리기 구현해보자..!
        view.addSubview(dateTextField)
        dateTextField.placeholder = "날짜를 입력해주세요"
        dateTextField.keyboardType = .numberPad
        dateTextField.textAlignment = .center
        dateTextField.endEditing(true)
        dateTextField.layer.borderWidth = 1
        dateTextField.layer.borderColor = UIColor.black.cgColor
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp_bottomMargin).offset(20)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.height.equalTo(50)
        }
        
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.layer.borderColor = UIColor.black.cgColor
        whiteView.layer.borderWidth = 1
        whiteView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.top.equalTo(dateTextField.snp_bottomMargin).offset(20)
        }
        
    }
    
    

}
