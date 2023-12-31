//
//  Extension.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import UIKit

extension UIView {
    
    func roundedCorner(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
    }
    
    func dropShadow(opacity: Float = 0.05, height: CGFloat = 4) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: 0, height: height)
        self.layer.shadowRadius = 4
        
        self.layer.rasterizationScale = UIScreen.main.scale
        self.layer.shouldRasterize = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func addBorder(width: CGFloat, color: CGColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
    
    func setButton(width: CGFloat, color: CGColor, cornerRadius: CGFloat, backgroundColor: CGColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color
        self.layer.cornerRadius = cornerRadius
        self.layer.backgroundColor = backgroundColor
    }
}

extension String {
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let date = dateFormatter.date(from: self) ?? Date()

        let dateFormatterFinal = DateFormatter()
        dateFormatterFinal.dateFormat = "dd/MM/yyyy - HH:mm"

        return dateFormatterFinal.string(from: date) + "h"
    }
}

extension UIViewController {
    func showAlertView(message: String = "", successBlock: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "Info", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            successBlock?()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        
        return controller
    }
}
