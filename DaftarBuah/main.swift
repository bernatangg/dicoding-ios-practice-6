//
//  main.swift
//  DaftarBuah
//
//  Created by Bernadietta Anggie on 08/04/20.
//  Copyright © 2020 Bernadietta Anggie. All rights reserved.
//

import Foundation

var listFruits = [String]()
var isRunning = true

func getInput(message: String) -> String? {
    print(message, terminator: ": ");
    return readLine()
}

func getInputInt(message: String) -> Int? {
    if let inputString = getInput(message: message) {
        return Int(inputString)
    } else {
        return nil
    }
}

func showAllFruits() {
    if listFruits.isEmpty {
        print("There are no items in the list yet")
    } else {
        for (index, value) in listFruits.enumerated() {
            print("[\(index + 1) \(value)")
        }
    }
}

func insertFruit() {
    if let name = getInput(message: "Insert the name of the fruit") {
        listFruits.append(name)
    } else {
        insertFruit()
        print("Input is invalid")
    }
}

func editFruit() {
    showAllFruits()
    print("----------------------------------")
    if let position = getInputInt(message: "Select the position of fruit to be replaced"), position<=listFruits.count && position>0, let name = getInput(message: "Insert the name of the fruit") {
        listFruits[position-1] = name
    } else {
        editFruit()
        print("Input is invalid")
    }
}

func deleteFrurits() {
    showAllFruits()
    if let position = getInputInt(message: "Select the position of fruit to be deleted"), position<=listFruits.count && position>0 {
        listFruits.remove(at: position-1)
    } else {
        deleteFrurits()
        print("Input is invalid")
    }
}

func showMenu() {
    print("Welcome to Dicoding Market!")
    print("---------------MENU---------------")
    print("[1] Show all fruits")
    print("[2] Add fruit item")
    print("[3] Edit fruit item")
    print("[4] Delete fruit item")
    print("[5] Exit")
    
    if let position = getInputInt(message: "Please select the menu above"), position<=5 && position>0 {
        print("----------------------------------")
        switch position {
        case 1:
            showAllFruits()
            break
        case 2:
            insertFruit()
            break
        case 3:
            editFruit()
            break
        case 4:
            deleteFrurits()
            break
        case 5:
            isRunning = false
            print("Thank you, please come again!")
            break
        default:
            print("Your choice is wrong")
        }
    } else {
        print("Menu items is invalid")
    }
    print("----------------------------------")
}

while isRunning {
    showMenu()
}
