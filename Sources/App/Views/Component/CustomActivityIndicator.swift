//
//  CustomActivityIndicator.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 12/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import UIKit

class CustomActivityIndicator: UIView {

    private let replicatorLayer = CAReplicatorLayer()
    private let activityIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue  // Set your desired color
        view.layer.cornerRadius = 10  
        view.isHidden = true
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        replicatorLayer.addSublayer(activityIndicatorView.layer)
        layer.addSublayer(replicatorLayer)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        replicatorLayer.frame = bounds
        activityIndicatorView.frame = CGRect(x: 70, y: 70, width: 20, height: 20) // Set your desired size for the base dot
    }

    func startAnimating() {
        replicatorLayer.isHidden = false
        activityIndicatorView.isHidden = false

        // Set the number of dots
        replicatorLayer.instanceCount = 16

        let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 1)
        rotation.duration = 1
        rotation.fromValue = 0.5
        rotation.toValue = 0
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        replicatorLayer.add(rotation, forKey: "rotationAnimation")

        // Create animation to fade the dots
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = 1.0
        fadeAnimation.toValue = 0.1
        fadeAnimation.duration = 1
        fadeAnimation.repeatCount = .infinity

        // Apply the fade animation to each dot
        replicatorLayer.instanceAlphaOffset = -0.08
        activityIndicatorView.layer.add(fadeAnimation, forKey: "fadeAnimation")

        // Set the angle between each dot
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(-CGFloat.pi / 6, 0, 0, 1)
    }

    func stopAnimating() {
        replicatorLayer.isHidden = true
        replicatorLayer.removeAllAnimations()
    }
}

