//
//  MainCategoryView.swift
//  GetirClone
//
//  Created by Ali Eren on 14.08.2022.
//

import Foundation
import UIKit
import SnapKit

class MainCategoryView:UIView,Layoutable {
    let urls: [String] = [
        "image1",
        "image2",
        "image3"
    ]
    
    lazy var headerContainerView: UIView = {
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
    
    private lazy var sliderView: UIView = {
        let view = UIView()
        view.addSubview(carousel)
        return view
    }()
    
    lazy var carousel: Carousel = {
        let carousel = Carousel(frame: .zero, urls: urls)
        carousel.backgroundColor = .white
        return carousel
    }()
    
    private lazy var searchView: UIView = {
        let view = UIView()
        view.addSubview(searchViewLabel)
        view.addSubview(searchTextField)
        view.backgroundColor = .white
        return view
    }()
    
    lazy var searchViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Merhaba Elif"
        return label
    }()
    
    lazy var searchTextField: UISearchTextField = {
        let searchTextField = UISearchTextField()
        searchTextField.backgroundColor = .white
        searchTextField.placeholder = "Getir'de ara"
        searchTextField.layer.borderWidth = 2
        searchTextField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        return searchTextField
    }()
    
    private lazy var categoriesView: UIView = {
        let view = UIView()
        view.addSubview(getirCategory)
        view.addSubview(getirYemekCategory)
        view.addSubview(getirCarsiCategory)
        view.addSubview(getirBuyukCategory)
        view.addSubview(getirSuCategory)
        return view
    }()
    
    
    lazy var getirCategory: CategoryCellView = {
        let view = CategoryCellView(frame: .zero, category: Category(title: "getir", titleImage: "getirLogo"),isLarge: true)
    
        return view
    }()
    
    lazy var getirYemekCategory: CategoryCellView = {
        let view = CategoryCellView(frame: .zero, category: Category(title: "getiryemek", titleImage: "getirLogo"),isLarge: false)
        return view
    }()
    
    lazy var getirCarsiCategory: CategoryCellView = {
        let view = CategoryCellView(frame: .zero, category: Category(title: "getircarsi", titleImage: "getirLogo"),isLarge: false)
        return view
    }()
    
    lazy var getirBuyukCategory: CategoryCellView = {
        let view = CategoryCellView(frame: .zero, category: Category(title: "getirbüyük", titleImage: "getirLogo"),isLarge: false)
        return view
    }()
    
    lazy var getirSuCategory: CategoryCellView = {
        let view = CategoryCellView(frame: .zero, category: Category(title: "getirsu", titleImage: "getirLogo"),isLarge: false)
        return view
    }()
    
    func setupViews() {
        addSubview(headerContainerView)
        addSubview(sliderView)
        addSubview(searchView)
        addSubview(categoriesView)
        
    }
    
    func setupLayout() {
        headerContainerView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(70)
        }
        
        setupHeaderViewLayout()
        
        sliderView.snp.makeConstraints { make in
            make.top.equalTo(headerContainerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(225)
        }
        
        carousel.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        searchView.snp.makeConstraints { make in
            make.top.equalTo(sliderView.snp.bottom).offset(0)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        
        setupSearchViewLayout()
        
        setupCategoriesLayout()
        
    }
    
    
    func setupHeaderViewLayout() {
        
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
    
    func setupSearchViewLayout() {
        searchViewLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview()
        }
        
        searchTextField.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.leading.equalTo(searchViewLabel.snp.trailing).offset(10)
            make.bottom.top.equalToSuperview().inset(30)
            make.width.equalTo(200)
        }
    }
    
    func setupCategoriesLayout() {
        
        categoriesView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(60)
            make.bottom.trailing.leading.equalToSuperview()
        }
        
        getirCategory.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(30)
            make.width.equalTo(UIScreen.main.bounds.width / 2.4)
            make.height.equalTo(UIScreen.main.bounds.height / 5)
            
        }
        
        getirYemekCategory.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(30)
            make.width.equalTo(UIScreen.main.bounds.width / 2.5)
            make.height.equalTo(UIScreen.main.bounds.height / 10)
            
        }
        
        getirCarsiCategory.snp.makeConstraints { make in
            make.top.equalTo(getirYemekCategory.snp.bottom).offset(5)
            make.trailing.equalToSuperview().inset(30)
            make.width.equalTo(UIScreen.main.bounds.width / 2.5)
            make.height.equalTo(UIScreen.main.bounds.height / 10)
            
        }
        
        getirBuyukCategory.snp.makeConstraints { make in
            make.top.equalTo(getirCategory.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(30)
            make.width.equalTo(UIScreen.main.bounds.width / 2.5)
            make.height.equalTo(UIScreen.main.bounds.height / 10)
            
        }
        
        getirSuCategory.snp.makeConstraints { make in
            make.top.equalTo(getirCarsiCategory.snp.bottom).offset(5)
            make.trailing.equalToSuperview().inset(30)
            make.width.equalTo(UIScreen.main.bounds.width / 2.5)
            make.height.equalTo(UIScreen.main.bounds.height / 10)
            
        }
    }
    
}
