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
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let friend: Friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.name.full
        cell.detailTextLabel?.text = friend.email
        cell.imageView?.image = nil
        
        DispatchQueue.global().async {
            guard let imageURL: URL = URL(string: friend.picture.thumbnail) else { return }
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                // 다운로드하는 동안 스크롤하면 인덱스가 바뀔 수 있으니까 인덱스가 같을 때만 설정해줌
                if let index: IndexPath = tableView.indexPath(for: cell){
                    if index.row == indexPath.row {
                        cell.imageView?.image = UIImage(data: imageData)
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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url: URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else {
            return
        }
        
        let session: URLSession = URLSession(configuration: .default)
        let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, respond: URLResponse?, error: Error?) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {return}
            
            do {
                let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                self.friends = apiResponse.results
                // reloadData는 메인쓰레드에서 실행해야함. -> 이렇게 백그라운드에서 하면 데이터가 안나옴
                // self.tableView.reloadData()
                
                // main에서 해야하는건 디스패치 큐에 넣기
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch(let err) {
                print(err.localizedDescription)
            }
        }
        
        dataTask.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

