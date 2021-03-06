//
//  OTMTableViewController.swift
//  OnTheMap
//
//  Created by Terrell Robinson on 3/17/17.
//  Copyright © 2017 TKYO. All rights reserved.
//

import UIKit

class OTMTableViewController: UITableViewController {
    
    //MARK: Properties
    
    let dataSource_otm = DataSource_OTM.sharedDataSource_OTM()
    
    //MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Confirm TableView Delegate
        tableView.delegate = self
        
        // Observe Notifications
        observe()
    }

    //MARK: Helper Methods
    
    func studentLocationsUpdated() {
        
        UIApplication.shared.endIgnoringInteractionEvents()
        
        DispatchQueue.main.async {
            
            UIApplication.shared.endIgnoringInteractionEvents()
            self.tableView.alpha = 1.0
            
        }
        
        tableView.reloadData()
    }
    
    func alertWithError(error: String) {
        
        let alertView = UIAlertController(title: "", message: error, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: AppConstants.AlertActions.dismiss, style: .cancel, handler: nil))
        
        self.present(alertView, animated: true) {
            
            self.view.alpha = 1.0
            
        }
    }
    
    func observe() {
        
        // Observe Notifications
        NotificationCenter.default.addObserver(self, selector: #selector(studentLocationsUpdated), name: NSNotification.Name(rawValue: AppConstants.notifications.studentLocationsPinnedDown), object: nil)
        
    }
    
    //MARK: TableView Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource_otm.studentLocations.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.Identifiers.studentLocationCell) as! StudentLocationCell
        let studentLocation = dataSource_otm.studentLocations[indexPath.row]
        cell.configureStudentLocationCell(studentLocation: studentLocation)
        return cell
    }
    
    //MARK: TableView Delegates
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let studentURL = dataSource_otm.studentLocations[indexPath.row].student.mediaURL
        
        // Check if it exists & proceed accordingly
        if let studentMediaURL = URL(string: studentURL), UIApplication.shared.canOpenURL(studentMediaURL) {
            
            // Open URL
            UIApplication.shared.open(studentMediaURL)
            
        } else {
            
            // Return with Error
            alertWithError(error: AppConstants.Errors.cannotOpenURL)
            
        }
    }
    
}
