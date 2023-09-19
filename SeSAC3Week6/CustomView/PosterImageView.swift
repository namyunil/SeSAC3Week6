//
//  PosterImageView.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/25.
//

import UIKit

class PosterImageView: UIImageView {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureView() {
        print(frame.width, frame)
        backgroundColor = .yellow
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        clipsToBounds = true
        //layer.cornerRadius = frame.width / 2
        //뷰가 그려지는 순서에 따라서 다르게 나오기때문에.. -> 사각형으로 나오는..
    }
    
    //imageView의 하위뷰인 UIImage에 적용되는 메서드
    override func layoutSubviews() { // 업데이트가 필요할 때, 여러번 호출될 수 있는..!
        super.layoutSubviews()
        print("layoutSubView", frame.width, frame)
        layer.cornerRadius = frame.width / 2
    }
    
}



