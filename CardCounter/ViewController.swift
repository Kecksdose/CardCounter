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
  
  override func viewDidLoad() {
    super.viewDidLoad()
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

