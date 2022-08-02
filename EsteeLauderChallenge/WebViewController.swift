//
//  WebViewController.swift
//  EsteeLauderChallenge
//
//  Created by Harshitha Jeyakumar on 8/2/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet var webView: UIView!
    
    var webPlayer: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let webConfiguration = WKWebViewConfiguration()
                webConfiguration.allowsInlineMediaPlayback = true
                
                DispatchQueue.main.async {
                    self.webPlayer = WKWebView(frame: self.webView.bounds, configuration: webConfiguration)
                    self.webView.addSubview(self.webPlayer)
                    
                    guard let videoURL = URL(string: "https://open.spotify.com/embed/playlist/49Vl9IfT7x7i0TXF4L1qsQ?utm_source=generator") else { return }
                    let request = URLRequest(url: videoURL)
                    self.webPlayer.load(request)
                }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
