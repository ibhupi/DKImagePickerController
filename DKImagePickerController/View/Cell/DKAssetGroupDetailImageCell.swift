//
//  DKAssetGroupDetailImageCell.swift
//  DKImagePickerController
//
//  Created by ZhangAo on 07/12/2016.
//  Copyright © 2016 ZhangAo. All rights reserved.
//

import UIKit

class DKAssetGroupDetailImageCell: DKAssetGroupDetailBaseCell {
    
    class override func cellReuseIdentifier() -> String {
        return "DKImageAssetIdentifier"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.thumbnailImageView.frame = self.bounds
        self.thumbnailImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.contentView.addSubview(self.thumbnailImageView)
        
        self.checkView.frame = self.bounds
        self.checkView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.checkView.checkLabel.font = UIFont.boldSystemFont(ofSize: 14)
        self.checkView.checkLabel.textColor = UIColor.black
        self.contentView.addSubview(self.checkView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class DKImageCheckView: UIView {
        
        internal lazy var checkLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .left
            label.autoresizingMask = [.flexibleLeftMargin, .flexibleWidth, .flexibleHeight, .flexibleBottomMargin]
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            if self.checkLabel.superview == nil && self.superview != nil {
                checkLabel.translatesAutoresizingMaskIntoConstraints = false
                self.addSubview(checkLabel)
                self.addConstraint(NSLayoutConstraint(item: checkLabel,
                                                      attribute: .rightMargin,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .rightMargin,
                                                      multiplier: 1,
                                                      constant: 0))
                self.addConstraint(NSLayoutConstraint(item: checkLabel,
                                                      attribute: .topMargin,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .topMargin,
                                                      multiplier: 1,
                                                      constant: 0))
                let selectedColor = (self.window?.tintColor ?? UIColor.white).withAlphaComponent(0.9)
                self.layer.borderColor = selectedColor.cgColor
                self.layer.borderWidth = 3
                checkLabel.backgroundColor = selectedColor
                checkLabel.layer.cornerRadius = 2
                checkLabel.layer.masksToBounds = true
            }
        }
        
    } /* DKImageCheckView */
    
    override var thumbnailImage: UIImage? {
        didSet {
            self.thumbnailImageView.image = self.thumbnailImage
        }
    }
    override var index: Int {
        didSet {
            self.checkView.checkLabel.text =  " \(self.index + 1) "
        }
    }
    
    fileprivate lazy var thumbnailImageView: UIImageView = {
        let thumbnailImageView = UIImageView()
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.clipsToBounds = true
        
        return thumbnailImageView
    }()
    
    fileprivate let checkView = DKImageCheckView()
    
    override var isSelected: Bool {
        didSet {
            checkView.isHidden = !super.isSelected
        }
    }
    
} /* DKAssetGroupDetailCell */
