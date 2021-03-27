//
//  WebViewController.swift
//  StressManagementApp
//
//  Created by Akhil Suresh on 2021-03-26.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    
    @IBOutlet weak var WebView: WKWebView!
    var url : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        WebView.load(URLRequest(url: URL(string: url!)!))
    }
    

    

}
