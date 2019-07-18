//
//  ExtentionHomeVC + UISideMenu.swift
//  Social Network
//
//  Created by Husky on 7/12/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

extension HomeVC: UISideMenuNavigationControllerDelegate {
    func initSideMenu() {
        let menu = MenuVC.init(nibName: "MenuVC", bundle: nil)
        let menuleftNavigationController = UISideMenuNavigationController(rootViewController: menu)
        menuleftNavigationController.isNavigationBarHidden = true
        SideMenuManager.default.menuLeftNavigationController = menuleftNavigationController
        SideMenuManager.default.menuPresentMode = .viewSlideInOut
        SideMenuManager.default.menuWidth = 280
        SideMenuManager.default.menuAnimationPresentDuration = 0.7
        SideMenuManager.default.menuAnimationFadeStrength = 0.1
        SideMenuManager.default.menuFadeStatusBar = false
        //        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view, forMenu: UIRectEdge.init(rawValue: 10))
    }
}
extension HomeVC {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.topHeaderView = self.headerViewTop.constant
        self.locationY = scrollView.contentOffset.y
        self.endScroll = false
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.endScroll {return}
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        self.endScroll = true
        self.endPan(velocity: velocity)
    }
    func endPan(velocity: CGPoint) {
        if velocity.y < -1.5 {
            self.showHeader(true)
        }
        if velocity.y > 0.5 {
            self.showHeader(false)
        }
    }
    func showHeader(_ bool: Bool) {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.3) {
            if bool {
                self.headerViewTop.constant = 0
                self.headerView.alpha = 1
            } else {
                self.headerViewTop.constant = -75
                self.headerView.alpha = 0
            }
            self.view.layoutIfNeeded()
        }
    }
}

extension UIToolbar {
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.lightGray
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        return toolBar
    }
}
