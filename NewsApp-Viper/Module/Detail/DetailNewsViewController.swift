//
//  DetailNewsViewController.swift
//  NewsApp-Viper
//
//  Created by Naratama on 29/07/23.
//

import UIKit
import WebKit

class DetailNewsViewController: BaseViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    var data: [String: Any]?
    private var detailNews: NewsModel?
    private var detialSourceNews: SourcesNewsModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        unwrapData()
        setupWebView()
    }

    private func setupView() {
        headerView.dropShadow()
    }
    
    private func unwrapData() {
        if let data = data {
            if let detailNews = data["news"] as? NewsModel {
                self.detailNews = detailNews
                self.titleLbl.text = "News Detail"
            }
            
            if let detialSourceNews = data["sourceNews"] as? SourcesNewsModel {
                self.detialSourceNews = detialSourceNews
                self.titleLbl.text = "Source News Detail"
            }
        }
    }
    
    private func setupWebView() {
        self.webView.navigationDelegate = self

        var detailUrl: String = ""
        
        if let urlNews = detailNews?.url {
            detailUrl = urlNews
        } else if let urlSourceNews = detialSourceNews?.url {
            detailUrl = urlSourceNews
        }
        
        if let url = URL(string: detailUrl) {
            showLoading(self.webView)
            webView.load(URLRequest(url: url))
        }
    }
}

extension DetailNewsViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.hideLoading(self.webView)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.hideLoading(self.webView)
        self.showAlertView(message: error.localizedDescription) { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.hideLoading(self.webView)
        self.showAlertView(message: error.localizedDescription) { [weak self] in
            self?.dismiss(animated: true)
        }
    }
}
