//
//  TextViewController.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {
    
    
    //1.
    
//        let photoImageView = setImageView() // 초기화 시점이 맞지 않아 오류가 발생 -> 초기화와 관계없는 type method로 선언하면 해결..!
//
//        static func setImageView() -> UIImageView {
//            let view = UIImageView()
//            view.backgroundColor = .systemMint
//            view.contentMode = .scaleAspectFill
//            return view
//        }
    
    
    //** 이름 없는 함수인 closure를 넣자..!
    let photoImageView = { // lazy에 대한 필요성도 없어진다..!
        let view = UIImageView()
        view.backgroundColor = .systemMint
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let titleTextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    //2. 초기화 시점 미루기 -> 뷰 객체마다 함수가 필요하기때문에 객체가 늘어난다면 함수도 늘어남 -> 매번 이름 짓기 힘듦 -> 이름 없는 함수를 넣자..!
    //====
    //lazy var photoImageView = setImageView()
    
    //    func setImageView() -> UIImageView { // 초기화와 상관 없는 type method로 선언..!
    //        let view = UIImageView()
    //        view.backgroundColor = .systemMint
    //        view.contentMode = .scaleAspectFill
    //        return view
    //    }
    //====
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //1. 객체가 적을 경우에 일반적으로..!
        view.addSubview(photoImageView)
        view.addSubview(titleTextField)
        
//        //2. 객체가 많아지면 동일한 코드를 여러번 반복해서 적는 것 보다 반복문을 활용하는 것..!
//        for item in [photoImageView, titleTextField] {
//            view.addSubview(item)
//        }
//
//        //3-1. for - each문을 활용할 수 있다..!
//        [photoImageView, titleTextField].forEach { item in
//            view.addSubview(item)
//        }
//        //3-2. 아규먼트 축약형..!
//        [photoImageView, titleTextField].forEach {
//            view.addSubview($0)
//        }
        
        
        
        //addSubview 이후에 레이아웃을 잡아야하므로 논리적 순서를 고려하자..!
        setupConstraints()
    }
        
        //자주 수정할 코드랑 아닌 코드를 구분해보자..!
        func setupConstraints() {
            
            photoImageView.snp.makeConstraints { make in
                make.height.equalTo(view).multipliedBy(0.3)
                
                make.top.trailing.leading.equalTo(view.safeAreaLayoutGuide)
                //make.top.equalTo(view)
                //make.trailing.equalTo(view)
                //make.leading.equalTo(view)
            }
            
            
            titleTextField.snp.makeConstraints { make in
                make.top.equalTo(photoImageView.snp.bottom).offset(20)
                make.leadingMargin.equalTo(20)
                //make.leading.equalTo(view).inset(20)
                make.trailingMargin.equalTo(-20)
                make.height.equalTo(50)
            }
            
        }
    
    
    
}
