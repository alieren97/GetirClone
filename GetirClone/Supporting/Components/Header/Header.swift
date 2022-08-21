//
//  Header.swift
//  GetirClone
//
//  Created by Ali Eren on 20.08.2022.
//

import Foundation
import UIKit
import SnapKit


final class HeaderView: UIView {
    
    public init(frame: CGRect, title: String) {
        self.headerTitleLabel.text = title
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    // init from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy private var headerTitle: UIView = {
       let view = UIView()
        view.backgroundColor = .purple
        view.addSubview(headerTitleLabel)
        return view
    }()
    
    var headerTitleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    lazy private var headerAddress: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        view.addSubview(headerTimeLabel)
        view.addSubview(headerSubContainerView)
        return view
    }()
    
    lazy var headerTimeLabel: UILabel = {
       let label = UILabel()
        label.text = "10dk"
        return label
    }()
    lazy var headerSubContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        view.addSubview(headerHomeIcon)
        view.addSubview(headerHomeTitle)
        view.addSubview(headerHomeAddress)
        return view
    }()
    
    private lazy var headerHomeIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "house.fill")
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var headerHomeTitle: UILabel = {
        let label = UILabel()
        label.text = "Home"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var headerHomeAddress: UILabel = {
        let label = UILabel()
        label.text = "Gürsel sok. No:56 3"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    func setupView() {
        addSubview(headerTitle)
        addSubview(headerAddress)
    }
    
    func setupLayout() {
        
        headerTitle.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(90)
        }
        
        headerTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
        
        headerAddress.snp.makeConstraints { make in
            make.top.equalTo(headerTitle.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(50)
        }
        setupAddressLayout()
    }
    
    func setupAddressLayout() {
        headerTimeLabel.snp.makeConstraints { make in
            make.leading.equalTo(headerSubContainerView.snp.trailing).offset(30)
            make.centerY.equalToSuperview()
        }
        
        headerSubContainerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width / 1.35)
        }
        
        headerHomeIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(30)
        }
        
        headerHomeTitle.snp.makeConstraints { make in
            make.leading.equalTo(headerHomeIcon.snp.trailing).offset(15)
            make.top.bottom.equalToSuperview().inset(10)
        }
        
        headerHomeAddress.snp.makeConstraints { make in
            make.leading.equalTo(headerHomeTitle.snp.trailing).offset(15)
            make.top.bottom.equalToSuperview().inset(10)
            
        }
    }
    
}
