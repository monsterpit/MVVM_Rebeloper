//
//  ViewController.swift
//  MVVM_Rebeloper
//
//  Created by MB on 8/11/19.
//  Copyright © 2019 MB. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    //setting up view properrties with view
    var viewModel : RootViewModel!{
        didSet{
            view.backgroundColor = viewModel.user.backgroundColor
            navigationItem.title = "\(viewModel.user.name) , \(viewModel.user.age)"
        }
    }
    
    
    lazy var label : UILabel = {
        let label = UILabel()
        label.text = "Tap 'Fetch' to retrieve the message"
        return label
    }()
    
    lazy var activityIndicator : UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .gray)
       // view.isHidden = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupNavigationView()
        setupViews()
        
        //setting Up view Model
        let user = User(name: "Vikas", age: 24, backgroundColor: .orange)
      //  let user = User(name: "Vikas", age: 24, backgroundColor: .purple)
        viewModel = RootViewModel(user: user)
    }

    
    fileprivate func setupNavigationView(){
        
        navigationItem.title = "Vikas , 24 "
        
        
        
        let resetBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetBarButtonItemTapped))
        let fetchBarButtonItem = UIBarButtonItem(title: "Fetch", style: .done, target: self, action: #selector(fetchBarButtonItemTapped))

        navigationItem.setLeftBarButton(resetBarButtonItem, animated: false)
        navigationItem.setRightBarButton(fetchBarButtonItem, animated: false)
    }
    
    @objc
    fileprivate func resetBarButtonItemTapped(){
        label.text = "Tap 'Fetch' to retrieve the message"
    }
    
    @objc
    fileprivate func fetchBarButtonItemTapped(){
       // label.text = "Fetching"
        
        activityIndicator.startAnimating()
        
        //Normal DispatchQueue
        /*
        DispatchQueue.global(qos: .background).async {
            let result = "3"
            
            let delay : Double = 3
            let time : DispatchTime = DispatchTime.now() + delay
            
            //executes after 3 seconds
            DispatchQueue.main.asyncAfter(deadline: time, execute: { [unowned self] in
                self.label.text = "Fetching \(result)"
            })
        }
 
         */
        
        //Using DispatchQueuehelpere custom class
        DispatchQueueHelper.delay(bySeconds: 3.0, dispatchLevel: .background) {
            let result = "Hello there"
            DispatchQueueHelper.delay(bySeconds: 0, completion: { [unowned self] in
                self.label.text = result
                self.activityIndicator.stopAnimating()
            })
        }
        
        
    }
    
    
    fileprivate func setupViews(){
        
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        view.addSubview(label)
        view.addSubview(activityIndicator)
        
        
        
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: label.superview, attribute: .centerX, multiplier: 1, constant: 0).isActive = true

        NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: label.superview, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
       
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: activityIndicator, attribute: .bottom, relatedBy: .equal, toItem: label, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        
        NSLayoutConstraint(item: activityIndicator, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator.superview, attribute: .centerX, multiplier: 1, constant: 0).isActive = true

        
    }

}

