//
//  ViewController.swift
//  SSDemo
//
//  Created by BCM on 2018/12/22.
//  Copyright © 2018年 BCM. All rights reserved.
//

import UIKit
import PotatsoBase

import PotatsoModel
import PotatsoLibrary


class ViewController: UIViewController {
    let upstreamProxy = Proxy()
    let statusLabel = UILabel()
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        view.addSubview(statusLabel)
        statusLabel.text = "----"
        
        
        let nn = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") 
        
        let bt = UIButton()
        view.addSubview(bt)
        bt.backgroundColor = .blue
        bt.frame = CGRect(x: 50, y: 100, width: 200, height: 40)
        bt.addTarget(self, action: #selector(connect), for: .touchUpInside)
  
        
        upstreamProxy.type = .Shadowsocks
        upstreamProxy.name = "SSR-name"
        upstreamProxy.host = "202.166.140.145"
        upstreamProxy.port = 10238
        upstreamProxy.authscheme = "rc4-md5"
        upstreamProxy.user = nil
        upstreamProxy.password = "teddysun.com"
        
        
        
        
        //        upstreamProxy.type = .ShadowsocksR
        //        upstreamProxy.name = "SSR-name"
        //        upstreamProxy.host = "45.255.126.40"
        //        upstreamProxy.port = 880
        //        upstreamProxy.authscheme = "none"
        //        upstreamProxy.user = nil
        //        upstreamProxy.password = "bcmbcm880"
        //        upstreamProxy.ota = false
        //        upstreamProxy.ssrProtocol = "auth_chain_a"
        //        upstreamProxy.ssrObfs = "plain"
        //        upstreamProxy.ssrObfsParam = "10000"
        
        //        upstreamProxy.type = .ShadowsocksR
        //        upstreamProxy.name = "SSR-name"
        //        upstreamProxy.host = "45.255.126.40"
        //        upstreamProxy.port = 888
        //        upstreamProxy.authscheme = "chacha20"
        //        upstreamProxy.user = nil
        //        upstreamProxy.password = "bcmbcm888"
        //        upstreamProxy.ota = false
        //        upstreamProxy.ssrProtocol = "auth_aes128_md5"
        //        upstreamProxy.ssrObfs = "plain"
        //        upstreamProxy.ssrObfsParam = "10000"
        
        do {
            try DBUtils.add(upstreamProxy)
        }catch {
            
        }
        
        try? ConfigurationGroup.changeProxy(forGroupId: Manager.sharedManager.defaultConfigGroup.uuid, proxyId: self.upstreamProxy.uuid)
        
    }
    
    
    
    @objc
    func connect() {
        
        
        
        Manager.sharedManager.switchVPN()
        
        
    }
}

