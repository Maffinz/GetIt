//
//  ViewController.swift
//  GetUpYo
//
//  Created by William Hernandez on 2/28/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a navigation bar and add it to the bottom of the screen
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 44, width: UIScreen.main.bounds.width, height: 44))
        view.addSubview(navBar)
        
        // Create navigation bar items
        let firstItem = UIBarButtonItem(title: "Button 1", style: .plain, target: self, action: #selector(button1Tapped))
        let secondItem = UIBarButtonItem(title: "Button 2", style: .plain, target: self, action: #selector(button2Tapped))
        let thirdItem = UIBarButtonItem(title: "Button 3", style: .plain, target: self, action: #selector(button3Tapped))
        
        // Add navigation bar items to the navigation bar
        let navItems = UINavigationItem()
        navItems.leftBarButtonItems = [firstItem, secondItem, thirdItem]
        navBar.setItems([navItems], animated: false)
    }
    
    // Button actions
    @objc func button1Tapped() {
        print("Button 1 tapped")
    }
    
    @objc func button2Tapped() {
        print("Button 2 tapped")
    }
    
    @objc func button3Tapped() {
        print("Button 3 tapped")
    }

}
