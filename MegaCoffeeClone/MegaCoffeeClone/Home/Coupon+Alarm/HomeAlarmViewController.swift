//
//  HomeAlarmViewController.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/11/07.
//

import UIKit

class HomeAlarmViewController: UIViewController {
    
    @IBOutlet weak var HomeAlarmTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "HomeAlarmTableViewCell", bundle: nil)
        
        HomeAlarmTableView.register(nib, forCellReuseIdentifier: "MemberTableViewCell")

    }
   

}
extension HomeAlarmViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = HomeAlarmTableView.dequeueReusableCell(withIdentifier: "HomeAlarmTableViewCell") as? HomeAlarmTableViewCell else {return UITableViewCell() }
        return cell
    }
    
    
}
