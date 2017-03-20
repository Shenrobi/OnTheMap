//
//  StudentLocationCell.swift
//  OnTheMap
//
//  Created by Terrell Robinson on 3/17/17.
//  Copyright © 2017 TKYO. All rights reserved.
//

import UIKit

class StudentLocationCell: UITableViewCell {

    //MARK: IBOutlets
    
    @IBOutlet weak var pinImage: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var mediaURL: UILabel!
    
    func configureStudentLocationCell(studentLocation: StudentLocationModel) {
        
        pinImage.image = #imageLiteral(resourceName: "pin")
        fullName.text = studentLocation.student.fullName
        mediaURL.text = studentLocation.student.mediaURL
        
    }

}
