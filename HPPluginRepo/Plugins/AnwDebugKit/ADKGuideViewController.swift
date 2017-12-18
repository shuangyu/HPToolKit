//
//  ADKGuideViewController.swift
//  AnwDebugKitDemo
//
//  Created by Hu, Peng on 02/11/2017.
//  Copyright © 2017 Hu, Peng. All rights reserved.
//

import UIKit
import WebKit

class ADKGuideViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
    @IBAction func dismissBtnClicked(_ sender: Any) {
        ADKFloatingButton.shrink()
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let guideFilePath = Bundle.main.path(forResource: "guide", ofType: "html")
        let htmlStr = try! String.init(contentsOfFile: guideFilePath!)
        webview.loadHTMLString(htmlStr, baseURL: nil)
    }
}