import Foundation

let input = readLine()!
let values = input.split(separator: " ").map { Int(String($0))! }
let m1 = values[0]
let d1 = values[1]
let m2 = values[2]
let d2 = values[3]

let daysArr = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

solution()

func isBeforeDate() -> Bool {
    if m1 != m2 {
        return m1 < m2 ? false : true
    }

    if d1 != d2 {
        return d1 < d2 ? false : true
    }

    return true
}

func getRemainDays() -> Int {
    var currentMonth = m1
    var currentDay = d1
    var days = 0

    while true {
        if currentMonth == m2 && currentDay == d2 {
            return days
        }
        var nextMonth: Int = currentMonth
        var nextDays: Int = currentDay
        if isBeforeDate() {
            nextDays = currentDay - 1
            if nextDays <= 0 {
                nextMonth -= 1
                nextDays = daysArr[nextMonth]
            }
        } else {
            nextDays = currentDay + 1
            if nextDays > daysArr[currentMonth] {
                nextMonth = currentMonth+1
                nextDays = 1
            }
        }
        currentMonth = nextMonth
        currentDay = nextDays

        days += 1
    }
}

func getdw(elapse: Int) -> String {
    let dwArr = ["Mon", "Tue", "Wed", "Thu" ,"Fri" , "Sat" , "Sun"]
    
    if elapse < 0 {
        return dwArr[dwArr.count+elapse]
    } else {
        return dwArr[elapse]
    }
}

func solution() {
    let elapseDay = getRemainDays()
    let remainDay = elapseDay%7
    print(getdw(elapse: isBeforeDate() ? -remainDay : remainDay))
}