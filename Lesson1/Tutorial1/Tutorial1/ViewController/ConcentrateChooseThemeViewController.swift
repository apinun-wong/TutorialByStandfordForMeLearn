//
//  ConcentrateChooseThemeViewController.swift
//  Tutorial1
//
//  Created by Apinun Wongintawang on 4/7/19.
//  Copyright © 2019 Apinun Wongintawang. All rights reserved.
//

import UIKit

class ConcentrateChooseThemeViewController: UIViewController, UISplitViewControllerDelegate {
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    let themes = [
        "Sports" : "⚾️🎾🏐🏉🎱⚽️🏀🏸🏒🏑",
        "Animals" : "🐱🐭🐹🐰🦊🐻🐼🐶🐨🐯",
        "Faces" : "😀😃😄😁😆😅😂🤣☺️😊😇"
    ]
    
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
        } else if let  cvc = lastConcentrateViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
            
            navigationController?.pushViewController(cvc, animated: true)
        } else {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ConcentrateViewController {
            if cvc.theme == nil {
                return true
            }
        }
        
        return false
    }
    
    private var splitViewDetailConcentrationViewController: ConcentrateViewController? {
        return splitViewController?.viewControllers.last as? ConcentrateViewController
    }
    
    private var lastConcentrateViewController: ConcentrateViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let button = sender as? UIButton {
                if let themeName = button.currentTitle,
                    let theme = themes[themeName]{
                    if let cvc = segue.destination as? ConcentrateViewController {
                        cvc.theme = theme
                        lastConcentrateViewController = cvc
                    }
                }
            }
        }
    }
 

}
