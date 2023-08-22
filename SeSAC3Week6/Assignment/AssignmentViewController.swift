//
//  AssignmentViewController.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/22.
//

import UIKit
import SnapKit

class AssignmentViewController: UIViewController {

    let exampleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayoutAnchor()
       
    }
   
    
    @objc func exampleButtonClicked() {
        present(Example1ViewController(), animated: true)
    }

    func setLayoutAnchor() {
        exampleButton.addTarget(self, action: #selector(exampleButtonClicked), for: .touchUpInside)
        
        view.addSubview(exampleButton)
        
        exampleButton.translatesAutoresizingMaskIntoConstraints = false
        exampleButton.backgroundColor = .blue
        
        NSLayoutConstraint.activate([
            exampleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exampleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            exampleButton.widthAnchor.constraint(equalToConstant: 100),
            exampleButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
        
    }

    

}
