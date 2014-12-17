//
//  ViewController.swift
//  SlotMachine
//
//  Created by Bob Keifer on 12/17/14.
//  Copyright (c) 2014 BitFountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - properties
    
    //views
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    //labels
    var titleLabel:UILabel!
    
    var creditsLabel:UILabel!
    var betLabel:UILabel!
    var winnerPaidLabel:UILabel!
    var creditsTitleLabel:UILabel!
    var betTitleLabel:UILabel!
    var winnerPaidTitleLabel:UILabel!
    
    //buttons
    var resetButton:UIButton!
    var betOneButton:UIButton!
    var betMaxButton:UIButton!
    var spinButton:UIButton!
    
    var slots:[[Slot]] = []
    
    // MARK: - constants

    let marginForView:CGFloat = 10.0
    let marginForSlot:CGFloat = 2.0
    
    let sixth:CGFloat = 1.0 / 6.0
    let third:CGFloat = 1.0 / 3.0
    let half:CGFloat = 1.0 / 2.0
    let eighth:CGFloat = 1.0 / 8.0
    
    let numberOfContainers = 3
    let numberOfSlots = 3
    
    // MARK: - view functions

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
        setupThirdContainer(self.thirdContainer)
        setupFourthContainer(self.fourthContainer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - helper functions
    
    func setupContainerViews() {
        
        self.firstContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + marginForView, y: self.view.bounds.origin.y, width: self.view.bounds.width - (marginForView * 2), height: self.view.bounds.height * sixth))
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer)
        
        self.secondContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + marginForView, y: self.firstContainer.frame.height, width: self.view.bounds.width - (marginForView * 2), height: self.view.bounds.height * (3 * sixth)))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + marginForView, y: self.firstContainer.frame.height + self.secondContainer.frame.height, width: self.view.bounds.width - (marginForView * 2), height: self.view.bounds.height * sixth))
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + marginForView, y: self.firstContainer.frame.height + self.secondContainer.frame.height + self.thirdContainer.frame.height, width: self.view.bounds.width - (marginForView * 2), height: self.view.bounds.height * sixth))
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.fourthContainer)
    }

    func setupFirstContainer(containerView: UIView) {
        
        self.titleLabel = UILabel()
        self.titleLabel.text = "Super Slots"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        containerView.addSubview(self.titleLabel)
    }

    func setupSecondContainer(containerView: UIView) {
        
        //remove any existing subviews
        for view in containerView.subviews {
            view.removeFromSuperview()
        }
        
        //create subviews for slots
        for var containerNumber = 0; containerNumber < numberOfContainers; containerNumber++ {
            
            for var slotNumber = 0; slotNumber < numberOfSlots; slotNumber++ {
                
                var slot:Slot
                var slotImageView = UIImageView()
                
                if slots.count != 0 {
                    
                    let slotContainer = slots[containerNumber]
                    slot = slotContainer[slotNumber]
                    slotImageView.image = slot.image
                } else {
                    slotImageView.image = UIImage(named: "Ace")
                }
                
                slotImageView.backgroundColor = UIColor.yellowColor()
                slotImageView.frame = CGRect(x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * third), y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * third), width: (containerView.bounds.width * third) - marginForSlot, height: (containerView.bounds.height * third) - marginForSlot)
                containerView.addSubview(slotImageView)
            }
        }
    }
    
    func setupThirdContainer(containerView: UIView) {
        
        self.creditsLabel = UILabel()
        self.creditsLabel.text = "000000"
        self.creditsLabel.textColor = UIColor.redColor()
        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.creditsLabel.sizeToFit()
        self.creditsLabel.center = CGPoint(x: containerView.frame.width * sixth, y: containerView.frame.height * third)
        self.creditsLabel.textAlignment = NSTextAlignment.Center
        containerView.addSubview(self.creditsLabel)
        
        self.betLabel = UILabel()
        self.betLabel.text = "0000"
        self.betLabel.textColor = UIColor.redColor()
        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.betLabel.sizeToFit()
        self.betLabel.center = CGPoint(x: containerView.frame.width * sixth * 3, y: containerView.frame.height * third)
        self.betLabel.textAlignment = NSTextAlignment.Center
        containerView.addSubview(self.betLabel)
        
        self.winnerPaidLabel = UILabel()
        self.winnerPaidLabel.text = "000000"
        self.winnerPaidLabel.textColor = UIColor.redColor()
        self.winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center = CGPoint(x: containerView.frame.width * sixth * 5, y: containerView.frame.height * third)
        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center
        containerView.addSubview(self.winnerPaidLabel)
        
        self.creditsTitleLabel = UILabel()
        self.creditsTitleLabel.text = "Credits"
        self.creditsTitleLabel.textColor = UIColor.blackColor()
        self.creditsTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.creditsTitleLabel.sizeToFit()
        self.creditsTitleLabel.center = CGPoint(x: containerView.frame.width * sixth, y: containerView.frame.height * third * 2)
        containerView.addSubview(self.creditsTitleLabel)
        
        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "Bet"
        self.betTitleLabel.textColor = UIColor.blackColor()
        self.betTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPoint(x: containerView.frame.width * sixth * 3, y: containerView.frame.height * third * 2)
        containerView.addSubview(self.betTitleLabel)
        
        self.winnerPaidTitleLabel = UILabel()
        self.winnerPaidTitleLabel.text = "Winner Paid"
        self.winnerPaidTitleLabel.textColor = UIColor.blackColor()
        self.winnerPaidTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.winnerPaidTitleLabel.sizeToFit()
        self.winnerPaidTitleLabel.center = CGPoint(x: containerView.frame.width * sixth * 5, y: containerView.frame.height * third * 2)
        containerView.addSubview(self.winnerPaidTitleLabel)
    }
    
    func setupFourthContainer(containerView: UIView) {
        
        self.resetButton = UIButton()
        self.resetButton.setTitle(" Reset ", forState: UIControlState.Normal)
        self.resetButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.resetButton.backgroundColor = UIColor.lightGrayColor()
        self.resetButton.sizeToFit()
        self.resetButton.center = CGPoint(x: containerView.frame.width * eighth, y: containerView.frame.height * half)
        self.resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.resetButton)
        
        self.betOneButton = UIButton()
        self.betOneButton.setTitle(" Bet One ", forState: UIControlState.Normal)
        self.betOneButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.betOneButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.betOneButton.backgroundColor = UIColor.greenColor()
        self.betOneButton.sizeToFit()
        self.betOneButton.center = CGPoint(x: containerView.frame.width * eighth * 3, y: containerView.frame.height * half)
        self.betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betOneButton)
        
        self.betMaxButton = UIButton()
        self.betMaxButton.setTitle(" Bet Max ", forState: UIControlState.Normal)
        self.betMaxButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.betMaxButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.betMaxButton.backgroundColor = UIColor.redColor()
        self.betMaxButton.sizeToFit()
        self.betMaxButton.center = CGPoint(x: containerView.frame.width * eighth * 5, y: containerView.frame.height * half)
        self.betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betMaxButton)
        
        self.spinButton = UIButton()
        self.spinButton.setTitle(" Spin ", forState: UIControlState.Normal)
        self.spinButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.spinButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
        self.spinButton.backgroundColor = UIColor.blueColor()
        self.spinButton.sizeToFit()
        self.spinButton.center = CGPoint(x: containerView.frame.width * eighth * 7, y: containerView.frame.height * half)
        self.spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.spinButton)
    }
    
    // MARK: - IBActions
    
    func resetButtonPressed(button: UIButton) {
        
        
    }
    
    func betOneButtonPressed(button: UIButton) {
        
        
    }
    
    func betMaxButtonPressed(button: UIButton) {
        
        
    }
    
    func spinButtonPressed(button: UIButton) {
        
        slots = Factory.createSlots()
        setupSecondContainer(self.secondContainer)
    }
}

