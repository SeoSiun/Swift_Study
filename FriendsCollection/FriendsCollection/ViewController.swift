//
//  ViewController.swift
//  FriendsCollection
//
//  Created by 서시언 on 2021/08/25.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
//    var numberOfCell: Int = 10
    let cellIdentifier: String = "cell"
    var friends: [Friend] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.numberOfCell
        return self.friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FriendCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! FriendCollectionViewCell
        
        // tableView에서는 indexPath.row로 쓰는 것과 달리 CollectionViewSms indexPath.item으로 사용
        let friend: Friend = self.friends[indexPath.item]
        
        cell.nameAgeLabel.text = friend.nameAndAge
        cell.addressLabel.text = friend.fullAddress
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.numberOfCell += 1
//        collectionView.reloadData()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let flowLayout: UICollectionViewFlowLayout
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        
        let halfWidth: CGFloat = UIScreen.main.bounds.width / 2.0
        
        // 오토레이아웃을 적용했기 때문에, 이에 따라 셀 사이즈가 가변적임 -> 예상 사이즈
        flowLayout.estimatedItemSize = CGSize(width: halfWidth - 30, height: 90)
        
        self.collectionView.collectionViewLayout = flowLayout
        
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
        
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.collectionView.reloadData()
    }


}

