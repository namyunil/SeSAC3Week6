//
//  GenericViewController.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/24.
//

import UIKit
import SnapKit

class GenericViewController: UIViewController {

    let sampleLabel = UILabel()
    let sampleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown

        view.addSubview(sampleLabel)
        sampleLabel.backgroundColor = .yellow
        configureBorder(view: sampleLabel)
        sampleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(sampleButton)
        sampleButton.backgroundColor = .green
        configureBorder(view: sampleButton)
        sampleButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(sampleLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        let generic = sum(a: 3.344, b: 4.666)
        let generic2 = sum(a: 22, b: 88)
        
        let value = sumInt(a: 3, b: 7)
        print(value)
        
        let value2 = sumDouble(a: 3.5, b: 7.7)
        print(value2)
        
        
        
    }
    

    

}
