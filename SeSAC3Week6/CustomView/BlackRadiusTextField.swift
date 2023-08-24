//
//  BlackRadiusTextField.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/24.
//

import UIKit

//공통적으로 여러 화면에서 사용되는 디자인 요소들을 묶어서 사용..! -> 재활용해서 사용할 수 있는.. -> 디자인 시스템
class BlackRadiusTextField: UITextField {
    
    
    //UI 요소 -> x,y축 / 넓이,높이가 있어 CGrect..로 추론..
    //Interface Builder를 사용하지 않고, UIView를 상속 받은 Custom Class를 코드로 구성할 때 사용되는 초기화 구문
    override init(frame: CGRect) { // UIView에서 온 init
        super.init(frame: frame)
        setupView()
    }
    
    //NSCoding
    //XIB -> NIB 변환 과정에서 객체 생성 시 필요한 init 구문 (storyboard)
    //Interface Builder에서 생성된 뷰들이 초기화될 때 실행되는 구문!
    //코드 베이스로 작성될 때는 init? ( 실패 가능한 init?) 으로 사용하여 실패 처리를 해야한다..!
    required init?(coder: NSCoder) { // NSCoding(protocol)에서 온 init
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        borderStyle = .none
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        textColor = .black
        textAlignment = .center
        font = .boldSystemFont(ofSize: 15)
    }

}


protocol ExampleProtocol {
    init(name: String)
}

class Mobile: ExampleProtocol {
    
    //required: 프로토콜에서 생성된 경우 사용하는 키워드
    //Required Initializer
    required init(name: String) { // required -> protocol에서 온..! override는 superclass에서 온..!
        
    }
    
    
    
}
