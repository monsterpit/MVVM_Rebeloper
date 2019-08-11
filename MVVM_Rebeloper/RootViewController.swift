//
//  ViewController.swift
//  MVVM_Rebeloper
//
//  Created by MB on 8/11/19.
//  Copyright © 2019 MB. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

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
        label.text = "Fetching"
    }
    
    fileprivate func setupViews(){
        
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        view.addSubview(label)
        view.addSubview(activityIndicator)
        
        
        
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: label.superview, attribute: .centerX, multiplier: 1, constant: 0).isActive = true

        NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: label.superview, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
       
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: activityIndicator, attribute: .bottom, relatedBy: .equal, toItem: activityIndicator.superview, attribute: .bottom, multiplier: 1, constant: -150).isActive = true
        
        NSLayoutConstraint(item: activityIndicator, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator.superview, attribute: .centerX, multiplier: 1, constant: 0).isActive = true

        
    }

}

