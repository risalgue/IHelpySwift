//
//  HelpViewContainer.swift
//  HelpInView
//
//  Created by Reinier Isalgue on 3/19/19.
//  Copyright © 2019 Reinier Isalgue. All rights reserved.
//

import UIKit
protocol HelpDelegate {
    func CloseHelp(helpPos: Int)
}
class HelpViewContainer: UIViewController {
    var objectView: UIView?
    @IBOutlet weak var helpLb: UILabel!
    @IBOutlet weak var topMargin: NSLayoutConstraint!
    
    @IBOutlet weak var leftMargin: NSLayoutConstraint!
    @IBOutlet weak var rightMargin: NSLayoutConstraint!
    @IBOutlet weak var bottomMargin: NSLayoutConstraint!
    
    //Objects for global storage that can be storage help object and help text
    static var objectsHelp: [UIView] = []
    static var textHelp: [String] = []
    
    //custom color for help Label
    static var helpTextColor: UIColor = #colorLiteral(red: 0.1980366409, green: 0.1980422437, blue: 0.1980392635, alpha: 1)
    static var helpBackgroundColor: UIColor = #colorLiteral(red: 1, green: 0.9754636884, blue: 0.7565579414, alpha: 1)
    
    var delegate: HelpDelegate?
    var pos: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(HideMe))
        self.view.addGestureRecognizer(tapGR)
        self.helpLb.textColor = HelpViewContainer.helpTextColor
        self.helpLb.backgroundColor = HelpViewContainer.helpBackgroundColor
    }
    
    @objc func HideMe() {
        self.dismiss(animated: true) {
            if self.pos != nil {
                self.delegate?.CloseHelp(helpPos: self.pos! + 1)
            }
        }
    }
    func addBackGroundLayer() {
        let asistView = InteractiveHelpView(frame: self.view.frame)
        asistView.objectView = self.objectView
        self.view.addSubview(asistView)
        self.view.sendSubviewToBack(asistView)
    }
    func RezizeLb() {
        if let relativeFrame = self.objectView?.frame, let originOnScreen = self.objectView?.superview?.convert(relativeFrame.origin, to: nil) {
            if originOnScreen.x < self.view.frame.width / 2 {
                rightMargin.constant = 100
                leftMargin.constant = 32
            }
            else {
                leftMargin.constant = 100
                rightMargin.constant = 32
            }
            //            self.view.setNeedsDisplay()
            if originOnScreen.y < self.view.frame.height / 2 {
                topMargin.constant = originOnScreen.y + relativeFrame.height
            }
            else {
                topMargin.priority = UILayoutPriority.defaultLow
                bottomMargin.priority = .defaultHigh
                bottomMargin.constant = self.view.frame.maxY - originOnScreen.y + 16
            }
        }
    }
}
