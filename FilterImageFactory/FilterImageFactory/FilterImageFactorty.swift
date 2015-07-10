//
//  ImageFactorty.swift
//  CIFilterDemo
//
//  Created by Mr.Jim on 7/10/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import UIKit

/// 单例模式，滤镜图片工厂
class FilterImageFactory {
    private static var filterImageFactory = FilterImageFactory()
    
    internal static func getFilterImageFactory() -> FilterImageFactory {
        return filterImageFactory
    }
    
    // 原图片
    var inputImage: UIImage!
    
    // 滤镜
    var filter: CIFilter?
    
    // 加工后的图片
    var outputImage: UIImage! {
        
        // 千万别用originalCat.CIImage
        // 原因：This method does not transform a UIImage into a CIImage! It merely points to the CIImage that already backs the UIImage, and your images are not backed by a CIImage, but rather by a CGImage. I’ll explain where a CIImage-backed UIImage comes from in just a moment.
        
        
        if filter != nil {
            let inputCIImage = CIImage(image: inputImage)
            filter!.setValue(inputCIImage, forKey: "inputImage")
            let outputCIImage = filter!.outputImage
            let cgImage = CIContext(options: nil).createCGImage(outputCIImage, fromRect: outputCIImage.extent())
            let uiImage = UIImage(CGImage: cgImage, scale: inputImage.scale, orientation: inputImage.imageOrientation)
             return uiImage
            
        }else {
            return inputImage
        }
       
    }
}
