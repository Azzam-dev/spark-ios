//
//  FavouriteVC.swift
//  spark
//
//  Created by spark inc on 04/04/1443 AH.
//

import UIKit

class FavouriteVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    


}


extension FavouriteVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as? FavouriteTableViewCell else { return UITableViewCell() }
        
        
        return cell
    }
    
    
    
}
