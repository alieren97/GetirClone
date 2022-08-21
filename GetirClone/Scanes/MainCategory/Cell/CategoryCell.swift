//
//  CategoryCell.swift
//  GetirClone
//
//  Created by Ali Eren on 17.08.2022.
//

import Foundation
import SnapKit
import UIKit

class CategoryCellView: UIView {
    
    var isLarge: Bool = false
    
    private lazy var cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.backgroundColor = .lightGray
        view.addSubview(categoryLabel)
        view.addSubview(categoryImageView)

        return view
    }()
    
    var categoryLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var button: UIButton = {
       let button = UIButton()
        return button
    }()
    
    var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    public init(frame: CGRect, category: Category ,isLarge: Bool) {
        self.categoryLabel.text = category.title
        self.categoryImageView.image = UIImage(named: category.titleImage)
        self.isLarge = isLarge
        super.init(frame: frame)
        setupView()
        setupLayout()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(cellView)
    }
    
    func setupLayout() {
        cellView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        categoryLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(15)
        }
        
        categoryImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
            make.width.height.equalTo(isLarge == true ? 65 : 35)
        }
    }
}
