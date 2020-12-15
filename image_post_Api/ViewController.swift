//
//  ViewController.swift
//  image_post_Api
//
//  Created by MAC on 15/12/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class ViewController: UIViewController {
    
    var arr_category_id = [String]()
    var arr_category_first_name = [String]()
    var arr_category_last_name = [String]()
    var arr_category_email = [String]()
    var arr_category_avatar = [String]()
    
    @IBOutlet weak var tblview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            
        let myurl = "https://reqres.in/api/users"
        
        AF.request(myurl, method: .get).responseJSON { (myresponse) in
            switch myresponse.result {
            case .success:
                print(myresponse.result)
                
                let myresult = try?JSON(data: myresponse.data!)
                print(myresult!["data"])
               
                let resultarray = myresult!["data"]
               
                self.arr_category_first_name.removeAll()
                self.arr_category_last_name.removeAll()
                self.arr_category_email.removeAll()
                self.arr_category_avatar.removeAll()     
                
                for i in resultarray.arrayValue  {
                    let id = i["id"].stringValue
                    let emails = i["email"].stringValue
                    
                    
                    self.arr_category_id.append(i[id].stringValue)
                    self.arr_category_first_name.append(i["last_name"].stringValue)
                    self.arr_category_last_name.append(i["last_name"].stringValue)
                    
                    
                    
                    self.arr_category_email.append(emails)
                    
                    self.arr_category_last_name.append(i["last_name"].stringValue)
                    self.arr_category_avatar.append(i["avatar"].stringValue)
                    
                    
                }
                
                self.tblview.reloadData()
//                let myresult =
//                for i in
                
                
                break
            case .failure:
                break
            }
        }
    }


}

extension ViewController: UITableViewDelegate,  UITableViewDataSource   {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_category_id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! oneTableViewCell
        cell.firstname.text = arr_category_first_name[indexPath.row]
        cell.lastname.text = arr_category_last_name[indexPath.row]

        cell.emails.text = arr_category_email[indexPath.row]
        let urlimages = arr_category_avatar[indexPath.row]
        
        AF.request(urlimages).responseImage { response in
           
            cell.imgview.image = response.value
        }
//

//        AF.request(urlimages).responseImage { (response) in
//
//            if response.result != nil {
//                DispatchQueue.main.async {
//                    cell.imgview.image = response
//                }
//            }
//            if let imagess = response.result
//            {
//                DispatchQueue.main.async {
//                    cell.imgview.image = imagess
//                }
//            }
//        }



        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}
