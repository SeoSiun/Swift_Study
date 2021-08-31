//
//  ViewController.swift
//  Networking
//
//  Created by 서시언 on 2021/08/28.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "friendCell"
    var friends: [Friend] = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FriendTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! FriendTableViewCell
        
        let friend: Friend = self.friends[indexPath.row]
        
        cell.titleLabel?.text = friend.name.full
        cell.subTitleLabel?.text = friend.email
        cell.friendImageView?.image = nil
        
        DispatchQueue.global().async {
            guard let imageURL: URL = URL(string: friend.picture.thumbnail) else { return }
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                // 다운로드하는 동안 스크롤하면 인덱스가 바뀔 수 있으니까 인덱스가 같을 때만 설정해줌
                if let index: IndexPath = tableView.indexPath(for: cell){
                    if index.row == indexPath.row {
                        cell.friendImageView?.image = UIImage(data: imageData)
                        cell.setNeedsLayout()
                        cell.layoutIfNeeded()
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    @objc func didReceiveFreindsNotification(_ noti: Notification) {
        
        guard let friends: [Friend] = noti.userInfo?["friends"] as? [Friend] else {
            return
        }
        
        self.friends = friends
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        requestFriends()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveFreindsNotification(_:)), name: DidReceiveFriendsNotification, object: nil)
    }


}

