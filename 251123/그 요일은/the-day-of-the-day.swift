import Foundation

let input = readLine()!
let tokens = input.split(separator: " ")
let m1 = Int(tokens[0])!
let d1 = Int(tokens[1])!
let m2 = Int(tokens[2])!
let d2 = Int(tokens[3])!
let a = readLine()!

let days = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let wdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "sun"]

func isBeforeDate() -> Bool {
    if m1 != m2 {
        return m1 > m2
    } else {
        return d1 > d2
    }
}

func getRemainDay() -> Int {
    var startMonth = isBeforeDate() ? m2 : m1
    var startDay = isBeforeDate() ? d2 : d1

    let endMonth = isBeforeDate() ? m1 : m2
    let endDay = isBeforeDate() ? d1 : d2

    var count = 0

    while true {
        if startMonth == endMonth && startDay == endDay {
            return count
        }

        var nextMonth = startMonth
        var nextDay = startDay+1

        if nextDay > days[startMonth] {
            nextDay = 1
            nextMonth += 1
        }

        startMonth = nextMonth
        startDay = nextDay

        count += 1
    }
}

func getAnswer() {
    if !isBeforeDate() {
        var currentDay = 0
        var count = 0

        for i in 0..<getRemainDay() {
            if wdays[currentDay] == a {
                count += 1
            }
            currentDay = (currentDay+1)%6
        }
        print(count)
        return
    } else {
        var currentDay = 0
        var count = 0

        for i in stride(from: currentDay, to: 0, by: -1) {
            if wdays[currentDay] == a {
                count += 1
            }
            currentDay = currentDay-1 < 0 ? 6 : currentDay-1
        }
        print(count)
    }
}

getAnswer()

