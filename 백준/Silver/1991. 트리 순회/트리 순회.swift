//
//  main.swift
//  Algorithmn
//
//  Created by JunHwan Kim on 6/17/25.
//

import Foundation

let n = Int(readLine()!)!

var tree: [[Int]] = Array(repeating: Array(repeating: -1, count: 2), count: 26+1)

func charToNumber(_ char: Character) -> Int? {
    let asciiValue = Int(char.asciiValue ?? 0)
    if asciiValue >= 65 && asciiValue <= 90 { // A~Z: 27~52
        return asciiValue - 64
    } else {
        return nil // 알파벳이 아닌 경우 nil 반환
    }
}


for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { charToNumber(Character(String($0))) ?? -1 }
    tree[input[0]][0] = input[1]
    tree[input[0]][1] = input[2]
}


func solution() {
    func pre() {
        var answer = ""
        
        func detect(_ index: Int) {
            let left = tree[index][0]
            let right = tree[index][1]
            answer += String(UnicodeScalar(index + 64)!)
            if left != -1 {
                detect(left)
            }
            if right != -1 {
                detect(right)
            }
        }
        detect(1)
        print(answer)
    }
    
    func middle() {
        var answer = ""
        
        func detect(_ index: Int) {
            let left = tree[index][0]
            let right = tree[index][1]
            
            if left != -1 {
                detect(left)
            }
            answer += String(UnicodeScalar(index + 64)!)
            if right != -1 {
                detect(right)
            }
        }
        detect(1)
        print(answer)
    }
    
    func final() {
        var answer = ""
        
        func detect(_ index: Int) {
            let left = tree[index][0]
            let right = tree[index][1]
            
            if left != -1 {
                detect(left)
            }
            if right != -1 {
                detect(right)
            }
            answer += String(UnicodeScalar(index + 64)!)
        }
        detect(1)
        print(answer)
    }
    
    pre()
    middle()
    final()
}

solution()
