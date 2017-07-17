//
//  WebViewController.swift
//  BZ_Prototype
//
//  Created by caganhawthorne on 6/12/17.
//  Copyright © 2017 Cagan Hawthorne. All rights reserved.
//

import UIKit
import WebKit
import Mapbox

class WebViewController: UIViewController, WKUIDelegate, MGLMapViewDelegate {

    var annotation: MGLPointAnnotation!
    var webView: WKWebView!
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: "https://stage.czs.org/Brookfield-ZOO/Plan-Your-Visit/Information")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        

        
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        if(webView.canGoBack){
            webView.goBack()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
