//
//  ProfileVC.swift
//  spark
//
//  Created by spark inc on 04/04/1443 AH.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var planets: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset.top = 60
        tableView.contentInset.bottom = 60
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        planets[2].frame.origin.y = 120
        planets[1].frame.origin.y = -20
        planets[0].frame.origin.y = -80
        UIView.animate(withDuration: 3, delay: 0, options: [.repeat,.autoreverse]) {
            self.planets[2].frame.origin.y += 10
            self.planets[1].frame.origin.y += 15
            self.planets[0].frame.origin.y += 25
        }
    }
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}
