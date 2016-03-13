//
//  UIViewExtension.swift
//  3D
//
//  Created by Mango on 15/12/7.
//  Copyright © 2015年 Mango. All rights reserved.
//

import UIKit

//MARK: UIView

public extension UIView{
    
    public var width: CGFloat {
        get { return self.frame.size.width }
        set { self.frame.size.width = newValue }
    }
    
    public var height: CGFloat {
        get { return self.frame.size.height }
        set { self.frame.size.height = newValue }
    }
    
    public var top: CGFloat {
        get { return self.frame.origin.y }
        set { self.frame.origin.y = newValue }
    }
    public var right: CGFloat {
        get { return self.frame.origin.x + self.width }
        set { self.frame.origin.x = newValue - self.width }
    }
    public var bottom: CGFloat {
        get { return self.frame.origin.y + self.height }
        set { self.frame.origin.y = newValue - self.height }
    }
    public var left: CGFloat {
        get { return self.frame.origin.x }
        set { self.frame.origin.x = newValue }
    }
    
    public var centerX: CGFloat{
        get { return self.center.x }
        set { self.center = CGPoint(x: newValue,y: self.centerY) }
    }
    public var centerY: CGFloat {
        get { return self.center.y }
        set { self.center = CGPoint(x: self.centerX,y: newValue) }
    }
    
    public var origin: CGPoint {
        set { self.frame.origin = newValue }
        get { return self.frame.origin }
    }
    public var size: CGSize {
        set { self.frame.size = newValue }
        get { return self.frame.size }
    }
}

public extension UIView {
    public var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while let responder = parentResponder {
            parentResponder = responder.nextResponder()
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

//MARK: CGAffineTransform
public extension CGAffineTransform {
    public var angle:CGFloat { return atan2(self.b,self.a) }
}

//MARK: CGPoint
public func CGPointGetDistance(point1:CGPoint, _ point2:CGPoint) -> CGFloat {
    let fx = point2.x - point1.x;
    let fy = point2.y - point1.y;
    
    return sqrt((fx*fx + fy*fy));
}

//MARK: CGRect
public extension CGRect {
    public func scaled(sx: CGFloat, _ sy: CGFloat) -> CGRect {
        return CGRectMake(self.origin.x * sx, self.origin.y * sy, self.width * sx, self.height * sy);
    }
}

//MARK: UITableView,UITableViewCell,UICollectionView,UICollectionViewCell

public extension UITableView{
    public func registerClass(cellType:UITableViewCell.Type){
        registerClass(cellType, forCellReuseIdentifier: cellType.defaultReuseIdentifier)
    }
}

public extension UITableViewCell{
    public static var defaultReuseIdentifier:String{
        return String(self)
    }
}

public extension UICollectionView{
    public func registerClass(cellType:UICollectionViewCell.Type){
        registerClass(cellType, forCellWithReuseIdentifier: cellType.defaultReuseIdentifier)
    }
}

public extension UICollectionViewCell{
    public static var defaultReuseIdentifier:String{
        return String(self)
    }
}