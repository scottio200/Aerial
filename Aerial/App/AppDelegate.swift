//
//  AppDelegate.swift
//  Aerial Test
//
//  Created by John Coates on 10/23/15.
//  Copyright © 2015 John Coates. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    lazy var preferencesWindowController: PreferencesWindowController = PreferencesWindowController()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let objects = objectsFromNib(loadNibNamed: "PreferencesWindow")

        // We need to find the correct window in our nib
        for object in objects {
            if object is NSWindow {
                if (object as! NSWindow).identifier!.rawValue == "preferencesWindow" {
                    setUp(preferencesWindow: (object as! NSWindow))
                }
            }
        }
    }
    
    private func setUp(preferencesWindow window: NSWindow) {
        window.makeKeyAndOrderFront(self)
        window.styleMask = [.closable, .titled, .miniaturizable]
        
        var frame = window.frame
        frame.origin = window.frame.origin
        window.setFrame(frame, display: true)
    }
    
    private func objectsFromNib(loadNibNamed nibName: String) -> [AnyObject] {
        let bundle = Bundle.main
        var topLevelObjects:NSArray? = NSArray()
        bundle.loadNibNamed(NSNib.Name(nibName),
                            owner: preferencesWindowController,
                            topLevelObjects: &topLevelObjects)
       
        return topLevelObjects! as [AnyObject]
    }
}
