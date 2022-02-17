//
//  ViewController.swift
//  GCD
//
//  Created by Nathaniel Whittington on 2/16/22.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var img3: UIImageView!
   
    @IBOutlet weak var img4: UIImageView!
    
   
    
    let str_url1 = "https://images.pexels.com/photos/736230/pexels-photo-736230.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
    
    let str_url2 = "https://www.google.com/search?q=dogs&sxsrf=APq-WBu3rbELhXhk4wAc9J_lQg8OXhjh7g:1645114946699&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiHo4zgkof2AhWIJzQIHSl7CxkQ_AUoAXoECAIQAw&biw=1440&bih=789&dpr=2#imgrc=OyQGKst6Lara3M"
    
    let str_url3 = "https://www.google.com/search?q=dogs&sxsrf=APq-WBu3rbELhXhk4wAc9J_lQg8OXhjh7g:1645114946699&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiHo4zgkof2AhWIJzQIHSl7CxkQ_AUoAXoECAIQAw&biw=1440&bih=789&dpr=2#imgrc=sbbc4P-cFNmHEM"
    
    let str_url4 = "https://www.google.com/search?q=dogs&sxsrf=APq-WBu3rbELhXhk4wAc9J_lQg8OXhjh7g:1645114946699&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiHo4zgkof2AhWIJzQIHSl7CxkQ_AUoAXoECAIQAw&biw=1440&bih=789&dpr=2#imgrc=y7-l1LKrhJJZUM"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dg = DispatchGroup()
        
        let concurrentQueue = DispatchQueue(label: "Concerruent", attributes: .concurrent)
        
        dg.enter()
        concurrentQueue.async {
            self.downloadImage(strUrl: self.str_url1, img: self.img1, queue: concurrentQueue)
            dg.leave()
        }
        
    
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        
    }

    
    func downloadImage(strUrl:String, img : UIImageView, queue: DispatchQueue = .global()){
        let url = URL(string: strUrl)!
        
        queue.async {
            
            let urlData = NSData(contentsOf: url)!
            let newImage = UIImage(data: urlData as Data)
            
            DispatchQueue.main.async {
                img.image = newImage
            }
            
        }
        
       
       
        
        
        
        
        
    }
    
    
    
    
}

