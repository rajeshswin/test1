//
//  ApiRequestViewModel.swift
//  test1
//
//  Created by Rajesh  on 25/10/23.
//

import Foundation
import UIKit


class APIClass {
    
    func apiGetRequest(url: String, completion: @escaping ([ResultObj]) -> ()) {
        NetworkManager.shared.makeGetRequest(url: url, responseType: DataResponse.self) { result in
            switch result {
            case .success(let responseData):
                completion(responseData.results)
                break
                // Handle the successful response (responseData)
            case .failure(let error):
                completion(.init())
                break
                // Handle the error (error)
            }
        }
    }
    
  
}

class NewsCell : UITableViewCell {
    
    @IBOutlet var newsImageView: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDesc: UILabel!
    
    
}
