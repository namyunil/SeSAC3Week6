//
//  Example2ViewController.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/23.
//

import UIKit

class Example2ViewController: UIViewController {

    let topView = UIView()
    let bottomView = UIView()
    let backImageView = UIImageView()
    
    let chattingButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let modifyButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let storyButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "folder.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let settingButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let presentButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "shippingbox.circle.fill"), for: .normal)
            button.tintColor = .white
            return button
        }()
    
    let alamButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bell.circle.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let xButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let profileImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "egon")
        imageView.layer.cornerRadius = 40
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let profileLabel = {
        let label = UILabel()
        label.text = "남윤일"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)
        return label

    }()
    
    let chattingLabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        return label

    }()
    
    let modifyLabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        return label

    }()
    
    let storyLabel =  {
        let label = UILabel()
        label.text = "카카오스토리"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        return label

    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backImageView)
        view.addSubview(topView)
        view.addSubview(bottomView)
        view.addSubview(chattingButton)
        view.addSubview(modifyButton)
        view.addSubview(storyButton)
        view.addSubview(chattingLabel)
        view.addSubview(modifyLabel)
        view.addSubview(storyLabel)
        view.addSubview(settingButton)
        view.addSubview(presentButton)
        view.addSubview(alamButton)
        view.addSubview(xButton)
        view.addSubview(profileImageView)
        view.addSubview(profileLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
       
        backImageView.image = UIImage(named: "blue")
        backImageView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        topView.backgroundColor = .clear
        topView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view)
            make.top.equalTo(view)
            make.height.equalToSuperview().multipliedBy(0.85)
        }
        
        bottomView.backgroundColor = .clear
        bottomView.layer.borderColor = UIColor.white.cgColor
        bottomView.layer.borderWidth = 0.2
        bottomView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view)
            make.bottom.equalTo(view)
            make.top.equalTo(topView.snp.bottom)
        }
        
        chattingButton.snp.makeConstraints { make in
            make.leading.equalTo(bottomView).offset(80)
            make.top.equalTo(bottomView).offset(30)
            
        }
        
        
        modifyButton.snp.makeConstraints { make in
            make.centerX.equalTo(bottomView)
            make.top.equalTo(bottomView.snp.top).offset(30)
            
        }

        
        storyButton.snp.makeConstraints { make in
            make.trailing.equalTo(bottomView.snp.trailing).offset(-80)
            make.top.equalTo(bottomView.snp.top).offset(30)
            
        }
        
        
        chattingLabel.snp.makeConstraints { make in
            make.top.equalTo(chattingButton.snp.bottom).offset(8)
            make.centerX.equalTo(chattingButton)
        }
       
        
        modifyLabel.snp.makeConstraints { make in
            make.top.equalTo(modifyButton.snp.bottom).offset(8)
            make.centerX.equalTo(modifyButton)
        }
        
        
        storyLabel.snp.makeConstraints { make in
            make.top.equalTo(storyButton.snp.bottom).offset(8)
            make.centerX.equalTo(storyButton)
        }
        
        
        
        settingButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        
        presentButton.snp.makeConstraints { make in
            make.trailing.equalTo(settingButton.snp.leading).offset(-8)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        
        alamButton.snp.makeConstraints { make in
            make.trailing.equalTo(presentButton.snp.leading).offset(-8)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        
        xButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        
        profileImageView.snp.makeConstraints { make in
            make.bottom.equalTo(topView).inset(80)
            make.centerX.equalTo(topView)
            make.size.equalTo(100)
        }
        
        
        profileLabel.snp.makeConstraints { make in
            make.centerX.equalTo(profileImageView)
            make.top.equalTo(profileImageView.snp.bottom).offset(18)
        }
        
    }
    
}
