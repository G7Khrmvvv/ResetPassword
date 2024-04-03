//
//  ViewController.swift
//  ResetPassword
//
//  Created by imac on 03.04.2024.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private let header = UILabel()
    
    private let question = UILabel()
    
    private let logoIm = UIImageView(image: UIImage(named: "Logo"))
    
    private let colorButton = UIColor(hex: "#FDEBDB")
    
    private let line = UIView()

    private lazy var emailButton: UIButton = {
        let button = UIButton()
        var conf = UIButton.Configuration.plain()

        conf.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0)
        conf.baseForegroundColor = .black
        conf.background.backgroundColor = colorButton
        conf.image = UIImage(named: "SMS")
        conf.imagePlacement = .leading
        conf.imagePadding = 16
        conf.title = "Continue with email"
        
        button.configuration = conf
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.contentHorizontalAlignment = .leading
        
        return button
    }()
    
    private lazy var mobileButton: UIButton = {
        
        let button = UIButton()
        var conf = UIButton.Configuration.plain()
        
        conf.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0)
        conf.background.backgroundColor = colorButton
        conf.image = UIImage(named: "Call")
        conf.imagePlacement = .leading
        conf.baseForegroundColor = .black
        conf.title = "Continue with mobile"
        conf.imagePadding = 16
        
        button.configuration = conf
        button.layer.cornerRadius = 20
        button.contentHorizontalAlignment = .leading
        button.clipsToBounds = true

        return button
    }()
    
    private lazy var secretQuestionButton: UIButton = {
        
        let button = UIButton()
        var conf = UIButton.Configuration.plain()
        
        conf.baseForegroundColor = .black
        conf.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0)
        conf.image = UIImage(named: "Chat")
        conf.imagePadding = 16
        conf.background.backgroundColor = colorButton
        conf.title = "Continue with secret question"
        
        button.configuration = conf
        button.clipsToBounds = true
        button.contentHorizontalAlignment = .leading
        button.layer.cornerRadius = 20
        
        return button
    }()
    
    private lazy var policiesButton: UIButton = {
        
        let button = UIButton()
        
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: UIColor(hex: "#FB8500"),
            .font: UIFont.systemFont(ofSize: 14, weight: .regular)
            ]
        
        let attributedTitle = NSAttributedString(string: "Policies and Terms of condition", attributes: titleAttributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    
    private lazy var helpButton: UIButton = {
        let button = UIButton()
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: UIColor.black
        ]
        
        let attributedTitle = NSAttributedString(string: "Help", attributes: titleAttributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupLayout()
        setupAppearance()
        setupData()
    }
}

private extension ViewController {
    func embedViews() {
        [
         logoIm,
         header,
         question,
         line,
         emailButton,
         mobileButton,
         secretQuestionButton,
         policiesButton,
         helpButton
        ].forEach{ view.addSubview($0) }
    }
}
private extension ViewController {
    private func setupLayout() {
        logoIm.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(30)
            $0.centerX.equalToSuperview()
        }
    
        header.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoIm.snp.bottom).offset(85)
        }
        
        line.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoIm.snp.bottom).offset(130)
            $0.height.equalTo(1)
            $0.horizontalEdges.equalToSuperview().inset(25)
        }
        
        question.snp.makeConstraints {
            $0.top.equalTo(line.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(25)
        }
        
        emailButton.snp.makeConstraints {
            $0.top.equalTo(question.snp.bottom).offset(50)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(40)
        }
        
        mobileButton.snp.makeConstraints {
            $0.top.equalTo(emailButton.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(40)
        }
        
        secretQuestionButton.snp.makeConstraints {
            $0.top.equalTo(mobileButton.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(40)
        }
        
        policiesButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(55)
        }
        
        helpButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(25)
            $0.centerX.equalToSuperview()
        }
    }
}

private extension ViewController {
    func setupAppearance() {
        view.backgroundColor = .white
        
        logoIm.contentMode = .scaleAspectFill
        
        header.font = .systemFont(ofSize: 24, weight: .regular)
        header.textColor = .black
        
        question.font = .systemFont(ofSize: 14, weight: .light)
        question.textColor = .black
        question.numberOfLines = 0
        
        line.backgroundColor = UIColor(hex: "#FB8500")
    }
}


private extension ViewController {
    func setupData() {
        
        header.text = "Reset your password"
        
        question.text = """
        Which method you want to use  to reset your
        password.
        """
    }
}
