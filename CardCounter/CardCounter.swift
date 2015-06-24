//
//  CardCounter.swift
//  CardCounter
//
//  Created by Timon Schmelzer on 19.06.15.
//  Copyright (c) 2015 Timon Schmelzer. All rights reserved.
//

import Foundation

class CardCounter {
  var withNines = false
  var maxSelectedCards = 12 // set this correctly
  var selectedCards: [String] = []
  
  func checkForDouble(cardName: String) -> Bool {
    var cnt = 0
    for card in selectedCards {
      if card == cardName {cnt++}
    }
    if cnt > 1 {
      println("Warning: Card \(cardName) already two times in selected cards!")
      return false
    }
    return true
  }
  
  func checkForMaximumOfCards() -> Bool {
    if selectedCards.count > maxSelectedCards-1 {
      println("Warning: You have selected too many cards! Maximum: \(maxSelectedCards)")
      return false
    }
    return true
  }
  
  func addCardToSelectedCards(cardName: String) -> [String] {
    if (checkForDouble(cardName) && checkForMaximumOfCards()) {
      var cnt = 0
      let rawCard = CardOrder[cardName]
      while cnt < selectedCards.count {
        if (rawCard < CardOrder[selectedCards[cnt]]) {break}
        else {cnt++}
      }
      insertCardAt(cnt, cardName: cardName)
    }
    return selectedCards
  }
  
  func insertCardAt(position: Int, cardName: String) -> [String] {
    selectedCards.insert(cardName, atIndex: position)
    return selectedCards
  }
  
  func resetSelectedCards() {
    selectedCards = []
  }
  
  func printSelectedCards() {
    println("Your selected cards are: \(selectedCards)")
  }
}