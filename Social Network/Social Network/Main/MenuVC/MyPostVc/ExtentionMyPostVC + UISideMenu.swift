//
//  ExtentionMyPostVC + UISideMenu.swift
//  Social Network
//
//  Created by Husky on 8/9/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

extension MyPostVC: UISideMenuNavigationControllerDelegate {
    func initSideMenu() {
        let menu = MenuVC.init(nibName: "MenuVC", bundle: nil)
        let menuleftNavigationController = UISideMenuNavigationController(rootViewController: menu)
        menuleftNavigationController.isNavigationBarHidden = true
        SideMenuManager.default.leftMenuNavigationController = menuleftNavigationController
        SideMenuManager.default.menuPresentMode = .viewSlideOutMenuIn
        SideMenuManager.default.menuWidth = 280
        SideMenuManager.default.menuAnimationPresentDuration = 0.7
        SideMenuManager.default.menuAnimationFadeStrength = 0.1
        SideMenuManager.default.menuFadeStatusBar = false
        //        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view, forMenu: UIRectEdge.init(rawValue: 10))
    }
}
extension MyPostVC {
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
