//
//  SnapViewController.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/22.
//

import UIKit
import SnapKit

/*
 addSubView의 위치 - 뷰의 계층 관계..! 누가 위 아래에 있는가?
 superView - 상위 뷰..!
 offset / inset
 RTL(Right To Left) - leading,trailing과 left,right의 차이점은 현지화의 대응(ex. 아랍어의 경우 leading,trailing으로 대응해야 반영이 된다..! left, right로는 대응 불가)
 */


class SnapViewController: UIViewController {
    
    let redView = UIView()
    let whiteView = UIView()
    let blueView = UIView()
    let yellowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(blueView)
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { make in
            make.size.equalTo(200)
            //make.width.height.equalTo(200)
            //make.width.equalTo(200)
            //make.height.equalTo(200)
            
            make.center.equalTo(view)
            //make.centerX.centerY.equalTo(view)
            //make.centerX.equalTo(view)
            //make.centerY.equalTo(view)
        }
        
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
            
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            //make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            //make.leading.equalTo(view.safeAreaLayoutGuide)
            //make.trailing.equalTo(view.safeAreaLayoutGuide)
            
        }
       
        //view.addSubview(yellowView)
        // addSubview의 순서대로 객체가 올라간다..! 따라서 순서가 바뀐다면? 가장 먼저 addSubView(yellowView)가 실행된다면 whiteView 아래에 있어 나타나지 않는다..!
        // 뷰 계층을 파악하고 해야한다..! 자주 실수하는 부분..!
        blueView.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints { make in
            make.size.equalTo(150)
            
            make.edges.equalTo(blueView).inset(50)
            //offset: 특정 방향으로 밀어주는, inset: 안쪽으로 들어오는
            //make.leading.trailing.top.bottom.equalToSuperview()
            //make.leading.top.equalToSuperview()
        }
        
    }
    
    
    
}
