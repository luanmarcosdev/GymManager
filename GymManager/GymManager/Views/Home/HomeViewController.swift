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
    var homeViewModel: HomeViewModel?
    var idUserOn: String?
    var user: User?
    
    override func loadView() {
        self.homeView = HomeView()
        self.view = self.homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.homeView?.setDelegate(delegate: self, collectionViewDelegate: self, collectionViewDataSource: self)
        
        self.homeViewModel = HomeViewModel()
        
        let uid = self.homeViewModel?.getUserOn()
        self.idUserOn = uid
        
        Task {
            if let idUser = self.idUserOn {
                await self.homeViewModel?.getUserData(uid: idUser, onSucess: { user in
                    self.user = user
                    print(user)
                    
                    guard let user = self.user,
                          let nameLabel = self.homeView?.titleLabel,
                          let goalDescription = self.homeView?.emphasisSubtitleGoalLabel,
                          let completedGoal = self.homeView?.emphasisNumberLabel else {return}
                    
                    DispatchQueue.main.async {
                        self.homeViewModel?.updateUserScreen(for: user, nameLabel: nameLabel, goalDescription: goalDescription, completedGoal: completedGoal)
                    }
                })
            }
        }
        
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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeWorksheetCollectionViewCell.identifier, for: indexPath) as! HomeWorksheetCollectionViewCell
        
        if let user = user {
            
            if user.worksheets.isEmpty {
                cell.worksheetButton.setImage(UIImage(named: "Card1"), for: .normal)
                cell.worksheetTitleLabel.text = "teste"
            } else {
                print("to do")
            }
            
        }
        
        return cell
    }
    
}

