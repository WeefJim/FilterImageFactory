//
//  ViewController.swift
//  CIFilterDemo
//
//  Created by Mr.Jim on 7/10/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        
        let originalCat = UIImage(named: "cat")!
        
    
        let imageViewOriginal = UIImageView(image: originalCat)
        imageViewOriginal.center = CGPointMake(self.view.bounds.width/2.0, self.view.bounds.height/3)
        imageViewOriginal.frame.integerize()
        self.view.addSubview(imageViewOriginal)
        
        
        
        // 创建图片工厂
        let imageFactory = FilterImageFactory.getFilterImageFactory()
        
        // 创建光晕梯度滤镜
        let vignetteFilter = VignetteFilter()
        // 外层光晕半径占总半径的比例，默认值为0.3
        vignetteFilter.vignetteRadiusRatio = 0.15
        
        // 设置图片工厂，输入原图片
        imageFactory.inputImage = originalCat
        
        // 设置图片工厂加工滤镜
        imageFactory.filter = vignetteFilter

        // 输出加工后的图片
        let vignetteImage = imageFactory.outputImage
        
        
        
        let imageViewVignette = UIImageView(image: vignetteImage)
        imageViewVignette.center = CGPointMake(self.view.bounds.width/2.0, self.view.bounds.height * 2/3)
        imageViewVignette.frame.integerize()
        self.view.addSubview(imageViewVignette)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

