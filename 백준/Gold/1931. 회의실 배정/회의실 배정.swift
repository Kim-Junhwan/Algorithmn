import Foundation

let n = Int(readLine()!)!
var timeArr: [(Int, Int)] = []
for _ in 0..<n {
    let pair = readLine()!.split(separator: " ").map{Int($0)!}
    timeArr.append((pair[0], pair[1]))
}

func solution() {
    let sortedTimeArr = timeArr.sorted { first, second in
        if (first.1 == second.1) {
            return first.0 < second.0
        }
        return first.1 < second.1
    }
    var currentEndTime = 0
    var count = 0
    for item in sortedTimeArr {
        if item.0 >= currentEndTime {
            count += 1
            currentEndTime = item.1
        }
    }
    print(count)
}

solution()
