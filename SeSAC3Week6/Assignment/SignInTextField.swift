//
//  SignInTextField.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/25.
//

import UIKit

class SignInTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(string: String) {
        backgroundColor = .gray
        textAlignment = .center
        borderStyle = .none
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: UIColor.white])
        font = .systemFont(ofSize: 13)
        layer.cornerRadius = 8
        
    }
}
