//
//  ViewController.swift
//  webViewApp
//
//  Created by KartRocket iOSOne on 06/09/19.
//  Copyright © 2019 CodesRoom. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate , UISearchBarDelegate{
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var ActInd: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://www.google.com/")
        let request = URLRequest(url: url!)
        webView.load(request)
        webView.addSubview(ActInd)
        
        ActInd.startAnimating()
        webView.navigationDelegate = self
        ActInd.hidesWhenStopped = true
        
    }
    
    @IBAction func back(_ sender: Any) {
        if webView.canGoBack {
        webView.goBack()
            
    }
        
        
    }
    @IBAction func forward(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
        
    }
    
    @IBAction func refresh(_ sender: Any) {
        
        webView.reload()
    }
    
    
    @IBAction func stop(_ sender: Any) {
           webView.stopLoading()
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        ActInd.startAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        
        
        ActInd.stopAnimating()
        
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        
        ActInd.stopAnimating()
        
    }
    
    // function for search bar enabling...
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        let url = URL(string: "https://\(searchBar.text!)")
        let request = URLRequest(url: url!)
        webView.load(request)
    }

    
}

                   // you need to add the "webkit framework" for the WKWebView //
    //   go to libraries in general option and "press + button" to add the framework //
