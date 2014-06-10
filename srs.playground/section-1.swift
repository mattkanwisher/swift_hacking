// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
let MAX_QUALITY = 5
var QUALITY_SUBTRACTOR:Double = 5
let E_FACTOR_FLOOR  = 1.3

struct Card {
    var eFactor: Double
    var count = 0
    var interval = 0
}

/**
The algorithm is inspired by the SuperMemo 2 algorithm:
* http://www.supermemo.com/english/ol/sm2.htm
*
* copied from https://code.google.com/p/quiz-me/source/browse/src/com/marzhillstudios/quizme/algorithm/TestMe.java?r=0311e4e4d36b75cb643df33a7f167f65a7207443
*/
func scoreCard(inout card:Card, quality:Int) {
    var qFactor: Double = QUALITY_SUBTRACTOR - Double(quality)
    var newFactor: Double = card.eFactor + (0.1 - qFactor * (0.08 + qFactor * 0.02))
    if (newFactor < E_FACTOR_FLOOR) {
        newFactor = E_FACTOR_FLOOR
    }
    card.eFactor = newFactor
}

func calcuateInterval(inout card:Card) {
    if (card.eFactor < 3) {
        card.count = 1
    }
    var count = card.count
    var interval = 1
    if (count == 2) {
        interval = 6
    } else if (count > 2) {
        var d:CDouble = Double(card.interval) * card.eFactor
        interval =  Int(round(d))
    }
    card.interval = interval
}


var c =  Card(eFactor:0, count:0, interval:1)

scoreCard(&c, 2)

calcuateInterval(&c)

