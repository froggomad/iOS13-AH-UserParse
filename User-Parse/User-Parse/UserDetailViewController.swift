//
//  UserDetailViewController.swift
//  User-Parse
//
//  Created by Kenny on 1/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    var user: User? {
        didSet {
            //updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let user = user else {fatalError()}
        self.emailLabel.text = user.email
        self.phoneLabel.text = user.phone
        guard let imageData = try? Data(contentsOf: user.picture.large) else {return}
        self.userImage.image = UIImage(data: imageData)
        
        title = user.name.first.capitalized + " " + user.name.last.capitalized
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
