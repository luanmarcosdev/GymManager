//
//  HomeViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeView?
    
    var coordinator: HomeCoordinator?
    
    override func loadView() {
        self.homeView = HomeView()
        self.view = self.homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeView?.setDelegate(delegate: self)
    }

}

extension HomeViewController: HomeViewDelegate {
    func actionUserButton() {
        print("tapped user button")
    }
    
    func actionAddWorksheets() {
        print("tapped addWorksheets")
    }
    
    func actionEditGoal() {
        print("tapped edit goal")
    }
    
    func actionAddActivity() {
        print("tapped add activity")
    }
    
    func actionAssessments() {
        print("tapped assessments")
    }
    
    
}
