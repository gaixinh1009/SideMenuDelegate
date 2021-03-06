//
//  ViewController.swift
//  SlideMenuDelegate
//
//  Created by Vũ on 1/21/19.
//  Copyright © 2019 Vũ. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, HandlerSideMenuDelegate {
    
    

    @IBOutlet weak var leadingContainerView: NSLayoutConstraint!
    @IBOutlet weak var slideMenuView: UIView!
    @IBOutlet weak var coverButton: UIButton!
    
    var isOpenMenu = false {
        didSet {
            UIView.animate(withDuration: 0.35) {
            self.leadingContainerView.constant = self.isOpenMenu ? 0 : -self.slideMenuView.bounds.width
                self.coverButton.alpha = self.isOpenMenu ? 1 : 0
                self.view.layoutIfNeeded()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sender = segue.destination as? UINavigationController
        let mainVC = sender?.topViewController as? MainViewController
        mainVC?.delegate = self
    }
  
    
    
    override func viewDidAppear(_ animated: Bool) {
        isOpenMenu = false
        
    }

    // TODO : 1.
    @IBAction func clickCoverButton(_ sender: UIButton) {
        isOpenMenu = !isOpenMenu
        
    }
    
}

