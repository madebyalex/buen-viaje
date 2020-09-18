//
//  ViewController.swift
//  buen-viaje
//
//  Created by Alexander on 12.09.2020.
//  Copyright © 2020 Alexander Nuzhnyi. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var vacations = [Vacation]()
    var selectedVacation: Vacation?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Vacation Packages"
        vacations = demoData
        
        let loginVC = LoginVC()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.contentInset.top = 16
        tableView.register(UINib(nibName: "VacationCell", bundle: nil), forCellReuseIdentifier: "VacationCell")
    }
    
    @IBAction func userBtnClicked  (_ sender: Any) {
        
        let userSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let logout = UIAlertAction(title: "Logout", style: .default) { (action) in
            let loginVC = LoginVC()
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true)
        }
        
        let manageCards = UIAlertAction(title: "Manage Credit Card", style: .default) { (action) in
            // Display Stripe Widget
        }
        
        let manageBanks = UIAlertAction(title: "Manage Bank Accounts", style: .default) { (action) in
            // Manage Bank Accounts
        }
        
        let close = UIAlertAction(title: "Close", style: .cancel)
        
        userSheet.addAction(manageCards)
        userSheet.addAction(manageBanks)
        userSheet.addAction(logout)
        userSheet.addAction(close)
        
        present(userSheet, animated: true)
        
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vacations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VacationCell", for: indexPath) as! VacationCell
        cell.configureCell(vacation: vacations[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedVacation = vacations[indexPath.row]
        
        performSegue(withIdentifier: "toVacationDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! VacationDetailsVC
        destination.vacation = selectedVacation
        
    }

}

