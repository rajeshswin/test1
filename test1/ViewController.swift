//
//  ViewController.swift
//  test1
//
//  Created by Rajesh  on 25/10/23.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    var newsItems: [ResultObj] = []
    var itemsPerPage = 20
    var isFetchingData = false // To prevent multiple API calls while one is in progress

    @IBOutlet weak var tblData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.callApi(intVal: itemsPerPage)
    }


    func callApi(intVal: Int) {
        let urlStr = String(format: URLConstants.urlFormat, "\(intVal)")
        APIClass().apiGetRequest(url: urlStr) { res in
            debugPrint(res)
            self.newsItems = res
            self.tblData.reloadData()
        }
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        let newsItem = newsItems[indexPath.row]
        
        cell.lblTitle.text = newsItem.title
        cell.lblDesc.text = newsItem.summary
        
        // Load the image from image_url using Alamofire
        AF.request(newsItem.imageURL).responseData { response in
            if let data = response.data {
                cell.newsImageView.image = UIImage(data: data)
            }
        }
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let screenHeight = scrollView.frame.height
        
        // Check if the user has scrolled to the bottom and if we're not already fetching data
        if contentOffsetY > contentHeight - screenHeight, !isFetchingData {
            self.itemsPerPage += 20
            self.callApi(intVal: itemsPerPage)
        }
    }

}

 
