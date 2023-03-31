//
//  UIImageExtensions.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 31.03.23.
//

import UIKit

extension UIImage {
    //TODO!!!!!!
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: width)// height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
