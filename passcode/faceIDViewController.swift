//
//  faceIDViewController.swift
//  passcode
//
//  Created by 林家宇 on 2020/7/24.
//

import UIKit
import LocalAuthentication

class faceIDViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var stateView: UIView!
    @IBOutlet var faceIDLabel: UILabel!
    
    /// An authentication context stored at class scope so it's available for use during UI updates.
    var context = LAContext()

    /// The available states of being logged in or not.
    enum AuthenticationState {
        case loggedin, loggedout
    }

    /// The current authentication state.
    var state = AuthenticationState.loggedout {

        // Update the UI on a change.
        didSet {
            loginButton.isHighlighted = state == .loggedin
            // The button text changes on highlight.
            stateView.backgroundColor = state == .loggedin ? .green : .red

            // FaceID runs right away on evaluation, so you might want to warn the user.
            //  In this app, show a special Face ID prompt if the user is logged out, but
            //  only if the device supports that kind of authentication.
            faceIDLabel.isHidden = (state == .loggedin) || (context.biometryType != .faceID)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // The biometryType, which affects this app's UI when state changes, is only meaningful
        //  after running canEvaluatePolicy. But make sure not to run this test from inside a
        //  policy evaluation callback (for example, don't put next line in the state's didSet
        //  method, which is triggered as a result of the state change made in the callback),
        //  because that might result in deadlock.
        context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)

        // Set the initial app state. This impacts the initial state of the UI as well.
        state = .loggedout
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        if state == .loggedin {

            // Log out immediately.
            state = .loggedout

        } else {

            // Get a fresh context for each login. If you use the same context on multiple attempts
            //  (by commenting out the next line), then a previously successful authentication
            //  causes the next policy evaluation to succeed without testing biometry again.
            //  That's usually not what you want.
            context = LAContext()

            context.localizedCancelTitle = "Enter Username/Password"

            // First check if we have the needed hardware support.
            var error: NSError?
            if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {

                let reason = "Log in to your account"
                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in

                    if success {

                        // Move to the main thread because a state update triggers UI changes.
                        DispatchQueue.main.async { [unowned self] in
                            self.state = .loggedin
                            //跳轉頁面
                            self.performSegue(withIdentifier: "loginSegue", sender: self)
                        }
                        


                    } else {
                        print(error?.localizedDescription ?? "Failed to authenticate")

                        // Fall back to a asking for username and password.
                        // ...
                    }
                }
            } else {
                print(error?.localizedDescription ?? "Can't evaluate policy")

                // Fall back to a asking for username and password.
                // ...
            }
        }
    }
    
    
}
