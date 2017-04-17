//
//  DKAssetGroupGridLayout.swift
//  DKImagePickerControllerDemo
//
//  Created by ZhangAo on 16/1/17.
//  Copyright © 2016年 ZhangAo. All rights reserved.
//

import UIKit

open class DKAssetGroupGridLayout: UICollectionViewFlowLayout {
	
	open override func prepare() {
		super.prepare()
		
		var minItemWidth: CGFloat = 80
		if UI_USER_INTERFACE_IDIOM() == .pad {
			minItemWidth = 100
		}
		
		let interval: CGFloat = 0
		self.minimumInteritemSpacing = interval
		self.minimumLineSpacing = interval
		
		let contentWidth = self.collectionView!.bounds.width
		
		let itemCount = 3//Int(floor(contentWidth / minItemWidth)) // 3 view layout
		var itemWidth = (contentWidth - interval * (CGFloat(itemCount) - 1)) / CGFloat(itemCount)
		let actualInterval = (contentWidth - CGFloat(itemCount) * itemWidth) / (CGFloat(itemCount) - 1)
		itemWidth += actualInterval - interval
		
        let contentSize = self.collectionView!.bounds.size
        let itemHeight = contentSize.height * (itemWidth / contentSize.width)
        
		let itemSize = CGSize(width: itemWidth, height: itemHeight)
		self.itemSize = itemSize
	}
	
}
