//
//  NetflixAssignmentViewController.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/24.
//

import UIKit
import SnapKit

class NetflixAssignmentViewController: UIViewController {
    
    
    let topView = UIView()
    let bottomView = UIView()
    
    let posterImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "egon")
        return imageView
    }()
    
    let backgroundImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    let tvProgramButton = {
        let button = UIButton()
        button.setTitle("TV 프로그램", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        return button
    }()
    
    let movieButton = {
        let button = UIButton()
        button.setTitle("영화", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        return button
    }()
    
    let likeButton = {
        let button = UIButton()
        button.setTitle("내가 찜한 콘텐츠", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        return button
    }()
    
    let logoButton = {
        let button = UIButton()
        button.setTitle("N", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 50)
        return button
    }()
    
    let checkButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "check"), for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 20)
        return button
    }()
    
    let playButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "play_normal"), for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(playButtonClicked), for: .touchUpInside)
        return button
    }()
    
    let infoButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "info"), for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 20)
        return button
    }()
    
    let likeLabel =  {
        let label = UILabel()
        label.text = "내가 찜한 컨텐츠"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    let infoLabel =  {
        let label = UILabel()
        label.text = "정보"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    let previewLabel = {
        let label = UILabel()
        label.text = "미리보기"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    let firstButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.setImage(UIImage(named: "1"), for: .normal)
        button.layer.cornerRadius = 40
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    let secondButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.setImage(UIImage(named: "2"), for: .normal)
        button.layer.borderColor = UIColor.systemMint.cgColor
        button.layer.cornerRadius = 35
        button.layer.borderWidth = 2
        button.contentMode = .scaleAspectFill
        return button
    }()
    
    let thirdButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.setImage(UIImage(named: "3"), for: .normal)
        button.layer.cornerRadius = 40
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        view.addSubview(topView)
        topView.backgroundColor = .blue
        topView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view)
            make.top.equalTo(view)
            make.height.equalTo(view).multipliedBy(0.8)
        }
        
        view.addSubview(bottomView)
        bottomView.backgroundColor = .brown
        bottomView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view)
            make.bottom.equalTo(view)
            make.top.equalTo(topView.snp.bottom)
        }
        
        view.addSubview(posterImageView)
        posterImageView.snp.makeConstraints { make in
            make.edges.equalTo(topView)
        }
        
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalTo(topView)
        }
        

        view.addSubview(likeButton)
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(28)
            make.trailing.equalTo(view).inset(30)
        }
        
        view.addSubview(movieButton)
        movieButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(28)
            make.trailing.equalTo(likeButton.snp.leading).offset(-28)
        }
        
        view.addSubview(tvProgramButton)
        tvProgramButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(28)
            make.trailing.equalTo(movieButton.snp.leading).offset(-28)
        }
        
        view.addSubview(logoButton)
        logoButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view).offset(8)
        }

        view.addSubview(playButton)
        playButton.snp.makeConstraints { make in
            make.bottom.equalTo(topView).inset(38)
            make.centerX.equalTo(topView)
        }
        
        view.addSubview(checkButton)
        checkButton.snp.makeConstraints { make in
            make.bottom.equalTo(topView).inset(38)
            make.trailing.equalTo(playButton.snp.leading).offset(-70)
        }
        
        view.addSubview(infoButton)
        infoButton.snp.makeConstraints { make in
            make.bottom.equalTo(topView).inset(38)
            make.leading.equalTo(playButton.snp.trailing).offset(70)
        }
        
        view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.centerX.equalTo(infoButton)
            make.top.equalTo(infoButton.snp.bottom)
        }
        
        view.addSubview(likeLabel)
        likeLabel.snp.makeConstraints { make in
            make.centerX.equalTo(checkButton)
            make.top.equalTo(checkButton.snp.bottom)
        }
        
        view.addSubview(previewLabel)
        previewLabel.snp.makeConstraints { make in
            make.top.equalTo(bottomView).offset(8)
            make.leading.equalTo(bottomView).offset(8)
        }
        
        view.addSubview(secondButton)
        secondButton.snp.makeConstraints { make in
            make.centerX.equalTo(bottomView)
            make.bottom.equalTo(bottomView.snp.bottom).inset(20)
            make.size.equalTo(bottomView.snp.height).multipliedBy(0.7)
            
            
        }
        
        view.addSubview(firstButton)
        firstButton.snp.makeConstraints { make in
            make.bottom.equalTo(bottomView.snp.bottom).inset(20)
            make.size.equalTo(bottomView.snp.height).multipliedBy(0.7)
            make.leading.equalTo(bottomView).offset(8)
        }
        
        view.addSubview(thirdButton)
        thirdButton.snp.makeConstraints { make in
            make.bottom.equalTo(bottomView.snp.bottom).inset(20)
            make.size.equalTo(bottomView.snp.height).multipliedBy(0.7)
            make.trailing.equalTo(bottomView).offset(-8)
        }
    }
    
    
    
    @objc func playButtonClicked() {
        playButton.setImage(UIImage(named: "play_highlighted"), for: .highlighted)
        
        let nav = UINavigationController(rootViewController: SignInViewController())
        nav.modalPresentationStyle = .fullScreen
        
        present(nav, animated: true)
    }
}
