import Foundation

let n = Int(readLine()!)!
var meetingArr: [(Int, Int)] = Array(repeating: (0,0), count: n)
for i in 0..<n {
    let meeting = readLine()!.split(separator: " ").map{Int($0)!}
    meetingArr[i] = (meeting[0], meeting[1])
}

let sortedMeetingArr = meetingArr.sorted { value1, value2 in
    if value1.1 == value2.1 {
        return value1.0 < value2.0
    }
    return value1.1 < value2.1
}

var currentEndTime = 0
var answer = 0

for i in 0..<n {
    let insertMeeting = sortedMeetingArr[i]
    let startTime = insertMeeting.0
    let endTime = insertMeeting.1
    
    if currentEndTime <= startTime {
        answer += 1
        currentEndTime = endTime
    }
}

print(answer)
