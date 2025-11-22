import Foundation

let inputLine = readLine()!
let numbers = inputLine.split(separator: " ").map { Int(String($0))! }
let a = numbers[0]
let b = numbers[1]
let c = numbers[2]


func solution() {
var minutes = -(11*60+11)
var currentDay = 11
while true {
    if currentDay == a {
        minutes += ((b*60) + c)
        break
    }

    currentDay += 1

    minutes += 24 * 60
}

print(minutes > 0 ? minutes : -1)
}