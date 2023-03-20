//
//  ConciergeLoginViewController.swift
//  Techl-Neo
//
//  Created by 문정호 on 2023/03/20.
//

import UIKit

class ConciergeLoginViewController: BaseVC {
    //MARK: - Properties
    let conciergeLoginView = ConciergeLoginView()
    
    //MARK: - LifeCycle
    override func loadView() {
        self.view = conciergeLoginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    //MARK: - configure
    
    override func configure() {
    }
    
    //MARK: - setNavigationBar
    override func setNavigationBar() {
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
