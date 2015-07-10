//
//  MyVignetteFilter.swift
//  CIFilterDemo
//
//  Created by Mr.Jim on 7/10/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import UIKit

/// 自定义光晕滤镜类
class VignetteFilter: CIFilter {
    
    var inputImage: CIImage!
    
    // 外层光晕半径占总半径的比例
    var vignetteRadiusRatio: CGFloat = 0.3
    
    override var outputImage: CIImage! {
        return self.makeOutputCIImage()
    }
    

    private func makeOutputCIImage() -> CIImage {
        
        // 获取输入image的extent，类似frame
        let inputExtent = inputImage.extent()
        
        // 创建梯度渐变滤镜
        let gradFilter = CIFilter(name: "CIRadialGradient")
        // 以图片中心为梯度出发点
        let center = CIVector(x: inputExtent.width/2.0, y: inputExtent.height/2.0)
        // 总共黑色部分半径
        let totalRadius = min(inputExtent.width, inputExtent.height)/2
        // 白色部分半径
        let vignetteRadius = totalRadius * (1 - vignetteRadiusRatio)
        gradFilter.setValue(center, forKey: "inputCenter")
        gradFilter.setValue(vignetteRadius, forKey: "inputRadius0")
        gradFilter.setValue(totalRadius, forKey: "inputRadius1")
        
        // gradImage作为混合模式中输入image的蒙版
        let gradImage = gradFilter.outputImage
        
        // 创建混合模式蒙版滤镜
        let blendFilter = CIFilter(name: "CIBlendWithMask")
        blendFilter.setValue(inputImage, forKey: "inputImage")
        blendFilter.setValue(gradImage, forKey: "inputMaskImage")
        return blendFilter.outputImage
    }
    
    
    
   
}
