//
//  webViewController.swift
//  aboutMe
//
//  Created by 김수완 on 2020/07/24.
//  Copyright © 2020 김수완. All rights reserved.
//

import UIKit
import WebKit

class webViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    public var position: Int = 0
    public var SNSes: [sns] = []
   
    @IBOutlet weak var wv: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let U = SNSes[position]
        
        loadUrl(U.url)
    }
    
    func loadUrl(_ url : String){
        let request = URLRequest(url: URL(string: url)!)
        
        wv.load(request)
        
        wv.uiDelegate = self
        wv.navigationDelegate = self
    }
}
