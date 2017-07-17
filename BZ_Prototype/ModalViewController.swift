//
//  ModalViewController.swift
//  BZ_Prototype
//
//  Created by caganhawthorne on 6/27/17.
//  Copyright © 2017 Cagan Hawthorne. All rights reserved.
//

import UIKit
import WebKit

class ModalViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    var myURL: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myRequest = URLRequest(url: URL(string: myURL!)!)
        webView.load(myRequest)

        

        // Do any additional setup after loading the view.
    }
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func doneButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
