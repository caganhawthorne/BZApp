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
        print(myURL)
        if let theURL = URL(string: (myURL)!)
        {
            let myRequest = URLRequest(url: theURL)
            print(myURL)
            webView.load(myRequest)
        }
        self.setNavigationBar()

        // Do any additional setup after loading the view.
    }
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height * 0.09))
        let navItem = UINavigationItem(title: "")
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(doneButtonPressed))
        let backItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.reply, target: nil, action: #selector(backButtonPressed))
        navItem.rightBarButtonItem = doneItem
        navItem.leftBarButtonItem = backItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func backButtonPressed() {
        if(webView.canGoBack){
            webView.goBack()
        }
    }
    
     func doneButtonPressed() {
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
