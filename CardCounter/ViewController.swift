//
//  ViewController.swift
//  CardCounter
//
//  Created by Timon Schmelzer on 13.06.15.
//  Copyright (c) 2015 Timon Schmelzer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var cardCounter = CardCounter()
  
  @IBOutlet var cardLabel: UILabel!
  @IBOutlet var undoAllButton: UIButton!
  @IBOutlet var submitButton: UIButton!
  
  var selectedCardsArray: [UIButton] = []
  
  var screenSize: CGRect = CGRect()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.screenSize = UIScreen.mainScreen().bounds
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func cardClicked(sender: UIButton) {
    var cardName = sender.titleLabel!.text
    let selectedCards = cardCounter.addCardToSelectedCards(cardName!)
    cardLabel.text = "\(selectedCards)"
    addSelectedCard(cardName!)
  }
  
  func addSelectedCard(cardName: String) {
    let newSelectedCard   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    let xPosition = screenSize.midX-50
    let yPosition = screenSize.midY-50
    println("xPosition: \(xPosition), yPosition: \(yPosition)")
    newSelectedCard.frame = CGRectMake(xPosition, yPosition, 100, 100)

    //let viewsDictionary = ["newSelectedCard":newSelectedCard,"cardLabel":cardLabel]
    //let view_constraint_H:NSLayoutConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:[newSelectedCard]-10-[cardLabel]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
    //newSelectedCard.addConstraint(view_constraint_H )
    newSelectedCard.backgroundColor = UIColor.greenColor()
    newSelectedCard.setTitle("Test Button", forState: UIControlState.Normal)
    newSelectedCard.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
    
    self.view.addSubview(newSelectedCard)
    selectedCardsArray.append(newSelectedCard)
  }
  
  func buttonAction(sender:UIButton) {
    println("new button clicked!")
  }
  
  @IBAction func undoAllClicked(sender: UIButton) {
    cardCounter.resetSelectedCards()
    cardLabel.text = ""
  }
  
  @IBAction func submitClicked(sender: UIButton) {
    cardCounter.printSelectedCards()
    let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
    cardLabel.text = "Submitted at \(timestamp)"
  }

}

