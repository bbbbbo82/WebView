//
//  ViewController.swift
//  WebviewTest02
//
//  Created by D7703_23 on 2019. 9. 9..
//  Copyright © 2019년 D7703_23. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var searchBar: UISearchBar!
   
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        // viewDidLoad : 프로그램 실행 후 제일 먼저 실행
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // UISearchBarDelegate 객체와 UIViewController 객체를 연결
        searchBar.delegate = self
        
        let request = URLRequest(url: URL(string:"http://www.google.com")!)
        webView.load(request)
    }
    
    @IBAction func backAction(_ sender: Any) {
        if self.webView.canGoBack {
            self.webView.goBack()
        }
    }
    
    @IBAction func forwardAction(_ sender: Any) {
        if self.webView.canGoForward {
            self.webView.goForward()
        }
    }
    
    // SearchBarDelegate Method 호출
    // called when keyboard search button pressed
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        let inputURL = searchBar.text
        let request = URLRequest(url: URL(string: inputURL!)!)
        webView.load(request)
        
    }
    
    // WKNavigationDelegate Method 호출
    // 웹 받기 시작할때
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
    // 웹 받는 것 끝났을때
    func webView(_ webView:WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isSpringLoaded = webView.canGoForward
        
    }
}

