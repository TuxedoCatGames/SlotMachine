//
//  SlotLogic.swift
//  SlotMachine
//
//  Created by Bob Keifer on 12/18/14.
//  Copyright (c) 2014 BitFountain. All rights reserved.
//

import Foundation

class SlotLogic {
    
    class func unpackSlots(slots: [[Slot]]) -> [[Slot]] {
        
        var row1: [Slot] = []
        var row2: [Slot] = []
        var row3: [Slot] = []
        
        for slotArrary in slots {
            
            for var index = 0; index < slotArrary.count; index++ {
             
                let slot = slotArrary[index]
                
                if index == 0 {
                    row1.append(slot)
                } else if index == 1 {
                    row2.append(slot)
                } else {
                    row3.append(slot)
                }
            }
        }
        
        var slotsInRows: [[Slot]] = [row1, row2, row3]
        
        return slotsInRows
    }
    
    class func computeWinnings(slots: [[Slot]]) -> Int {
        
        var slotsInRows = unpackSlots(slots)
        var winnings = 0
        
        var flushCount = 0
        var threeOfAKindCount = 0
        var straightCount = 0
        
        for row in slotsInRows {
            
            if checkFlush(row) {
                
                winnings++
                flushCount++
            }
            
            if checkStraight(row) {
                
                winnings++
                straightCount++
            }
            
            if checkThreeOfAKind(row) {
                
                winnings += 3
                threeOfAKindCount++
            }
        }
        
        //royal flush if all rows are flushes
        if flushCount == slots.count {
            winnings += 15
        }
        
        //all rows are straights
        if straightCount == slots.count {
            winnings += 1000
        }
        
        //all rows 3 of a kind
        if threeOfAKindCount == slots.count {
            
            winnings += 50
        }
        
        return winnings
    }
    
    class func checkFlush(row: [Slot]) -> Bool {
        
        var reds = 0
        var blacks = 0
        
        for slot in row {
            
            if slot.isRed {
                reds++
            } else {
                blacks++
            }
        }
        
        if (reds == row.count || blacks == row.count) {
            
            println("Flush")
            return true
        }
        
        return false
    }
    
    class func checkStraight(row: [Slot]) -> Bool {
        
        var up = true
        var down = true
        var firstValue = row[0].value
        
        for var index = 1; index < row.count; index++ {
                
            if row[index].value != firstValue + index {
                
                up = false
            }
            
            if row[index].value != firstValue - index {
                
                down = false
            }
        }
        
        if (up || down) {
            
            println("Straight")
            return true
        }
        
        return false
    }
    
    class func checkThreeOfAKind(row: [Slot]) -> Bool {
        
        for var index = 1; index < row.count; index++ {
            
            if row[index].value != row[index - 1].value {
                
                return false
            }
        }
        
        println("Three of a Kind")
        return true
    }
}



