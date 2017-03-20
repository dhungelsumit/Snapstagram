//
//  HomeViewController.swift
//  Instagram
//
//  Created by Sumit Dhungel on 3/12/17.
//  Copyright © 2017 Sumit Dhungel. All rights reserved.
//

import UIKit
import Parse


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var posts = [PFObject]()

    @IBOutlet weak var tablView: UITableView!
    
    func getData(){
        // construct PFQuery
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) -> Void in
            if let posts = posts {
                self.posts = posts
                print("Post is : ", posts)
                // do something with the data fetched
            } else {
                print("Error! : ", error?.localizedDescription)
                // handle error
            }
            self.tablView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablView.delegate = self
        tablView.dataSource = self
        tablView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (self.posts.count)
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! HomeTableViewCell
        let post = posts[indexPath.row]
        let caption = post["caption"] as? String
        let user = post["username"] as? String
        let photoPFFile = post["media"] as? PFFile
        print("PhotoPFFFile is : ", photoPFFile)
        print("Till here working")
        cell.workingImageView.file = photoPFFile
        print("Not working after this")
        cell.workingImageView.loadInBackground()
        
        cell.captionLabel.text = caption
        cell.userLabel.text = user
        return cell

        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
