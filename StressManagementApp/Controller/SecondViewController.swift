//
//  SecondViewController.swift
//  StressManagementApp
//
//  Created by Akhil Suresh on 2021-03-25.
//

import UIKit

class SecondViewController: UIViewController , UITableViewDelegate , UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var articles: [Article]? = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        fetchArticles()
        
    }
    
    
    @IBAction func btn_StressCheck(_ sender: Any) {
        
        performSegue(withIdentifier: "toStressChecker", sender: nil)
    }
    
    
    func fetchArticles(){
        
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?country=ca&category=health&apiKey=2df3f394b9eb49c7824d131c90d57bd4")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil{
                print("error")
                return
            }
            
            self.articles = [Article]()
            
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                if let articlesFromJson = json["articles"] as? [[String : AnyObject]]{
                    
                    for articleFromJson in articlesFromJson{
                        let article = Article()
                        
                        if let author = articleFromJson["author"] as? String,
                            let title = articleFromJson["title"] as? String,
                            let description  =  articleFromJson["description"] as? String,
                            let url = articleFromJson["url"] as? String,
                            let urlToImage =  articleFromJson["urlToImage"] as? String{
                            
                            article.author = author
                            article.title = title
                            article.desc = description
                            article.url = url
                            article.urlToImage = urlToImage
                            print(urlToImage)
                            
                        }
                        
                        self.articles?.append(article)
                    }
                           
                           
                    }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                } catch {
                print("error parsing")
            }
            
        }
        task.resume()
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! HealthNewsCell
        
        cell.Title.text = self.articles?[indexPath.item].title
        cell.desc.text = self.articles?[indexPath.item].desc
        cell.author.text = self.articles?[indexPath.item].author
       // cell.imageView?.downloadImage(from: (self.articles?[indexPath.item].urlToImage!)!)
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webVc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "web") as! WebViewController
        
        webVc.url = self.articles?[indexPath.item].url
        self.present(webVc, animated: true, completion: nil)
    }



}

extension UIImageView {
    
//    let url: NSURL = NSURL(string: "http://www.example.com/images/image.png")!
//        do {
//            let imgData = try NSData(contentsOfURL: url, options: NSDataReadingOptions())
//            ImageView?.image = UIImage(data: imgData)
//        } catch {
//            print(error)
//        }
    
    func loadImage(from url:String){
        let urlRequest: NSURL = NSURL(string: url)!
               do {
                let imgData = try NSData(contentsOf: urlRequest as URL, options: NSData.ReadingOptions())
                self.image = UIImage(data: imgData as Data)
               } catch {
                print(error.localizedDescription)
               }
    
        
    }
    
    func downloadImage(from url: String){
            
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest){ (data,response,error) in
            
            if error != nil{
                print("error loading the Image")
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        
        task.resume()
    }
    
}

