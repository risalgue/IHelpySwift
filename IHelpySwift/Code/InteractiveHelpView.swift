//
//  InteractiveHelpView.swift
//  HelpInView
//
//  Created by Reinier Isalgue on 3/19/19.
//  Copyright © 2019 Reinier Isalgue. All rights reserved.
//

import Foundation
import UIKit

class InteractiveHelpView: UIView {
    var objectView: UIView?
    var path: UIBezierPath!
    var path1: UIBezierPath!
    var helpText: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isMultipleTouchEnabled = false
        self.backgroundColor = .clear
    }
    override func draw(_ rect: CGRect) {
        //         Initialize the path.
        path = UIBezierPath()
        
        // Specify the point that the path should start get drawn.
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        
        // Create a line between the starting point and the bottom-left side of the view.
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        
        // Create the bottom line (bottom-left to bottom-right).
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        
        // Create the vertical line from the bottom-right to the top-right side.
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        
        // Close the path. This will create the last line automatically.
        path.close()
        
        if let objView = self.objectView {
            //Calculate de origin of the object in the root screen
            let originOnScreen = objView.superview!.convert(objView.frame.origin, to: nil)
            
            var frame = objView.frame
            frame.size.height += 16
            frame.size.width += 16
            frame.origin = originOnScreen
            frame.origin.x -= 8
            frame.origin.y -= 8
            path1 = UIBezierPath(roundedRect: frame, cornerRadius: 8.0)
            let clipPath = UIBezierPath(rect: CGRect.infinite)
            clipPath.append(path1)
            
            clipPath.usesEvenOddFillRule = true
            
            if let currentContext = UIGraphicsGetCurrentContext() {
                currentContext.saveGState()
                clipPath.addClip()
                UIColor(white: 0, alpha: 0.45).setFill()
                self.path.fill()
                currentContext.restoreGState()
            }
        }
    }
}
