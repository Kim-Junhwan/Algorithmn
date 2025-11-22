let input = readLine()!.split(separator: " ").map { Int($0)! }
let m1 = input[0]
let d1 = input[1]
let m2 = input[2]
let d2 = input[3]

let month = [0,31,28,31,30,31,30,31,31,30,31,30,31]
var answer = 1
var currentMonth = m1
var currentDay = d1

while true {

    if currentMonth == m2 && currentDay == d2 {
        break
    }

    let nextDay = currentDay + 1
    
    let maxDay = month[currentMonth]

    if maxDay < nextDay {
        currentMonth += 1
        currentDay = 1
    } else {
    currentDay = nextDay
    }
    answer += 1
}

print(answer)