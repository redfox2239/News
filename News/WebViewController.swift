//
//  WebViewController.swift
//  News
//
//  Created by 原田 礼朗 on 2018/04/14.
//  Copyright © 2018年 reo harada. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var newsWebView: WKWebView!
    var newsURL: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // URLを設定する
        let urlString = newsURL
        // URLをiPhone用に翻訳する
        let url = URL(string: urlString)
        // URLからwebページをリクエストして取得する
        let request = URLRequest(url: url!)
        // newsWebViewに表示する
        newsWebView.load(request)
    }

}
