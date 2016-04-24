//
//  ViewController.swift
//  Test MDWamp with Thruway Router
//
//  Created by Dmitry Zarva on 24/04/16.
//  Copyright © 2016 Dmitry Zarva. All rights reserved.
//

import UIKit
import MDWamp

class ViewController: UIViewController, MDWampClientDelegate {

    @IBOutlet var connectButton: UIButton!
    @IBOutlet var hostnameField: UITextField!
    @IBOutlet var portField: UITextField!
    var mdwamp: MDWamp?
    
    @IBAction func toggleWampConnect(sender: UIButton) {
        print("Toggle connect button clicked")
        if mdwamp == nil {
            let hostname = hostnameField.text ?? "127.0.0.1"
            let port = portField.text ?? "9090"
            let url = "ws://\(hostname):\(port)"
            
            mdwamp = MDWamp(transport: MDWampTransportWebSocket(server: NSURL(string: url), protocolVersions: [kMDWampProtocolWamp2json]), realm: "realm1", delegate: self)
        }
        
        if let wamp = mdwamp {
            if wamp.isConnected() {
                wamp.disconnect()
                mdwamp = nil
            } else {
                wamp.connect()
            }
        }
    }
    
    func mdwamp(wamp: MDWamp!, sessionEstablished info: [NSObject : AnyObject]!) {
        print("Session Established: \(info)")
        connectButton.setTitle("Disconnect", forState: .Normal)
    }
    
    func mdwamp(wamp: MDWamp!, closedSession code: Int, reason: String!, details: [NSObject : AnyObject]!) {
        print("Closed Session: \(code) \(reason), \(details)")
        connectButton.setTitle("Connect", forState: .Normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

