var inputNum = Int(readLine()!)!
var meetingArr: [Meeting] = []
struct Meeting {
    let startTime: Int
    let endTime: Int
}

for _ in 0..<inputNum {
    let meeting = readLine()!.split(separator: " ").map {Int($0)!}
    meetingArr.append(Meeting(startTime: meeting[0], endTime: meeting[1]))
}

solution(mettingArr: sortArr(mettingArr: meetingArr))

func solution(mettingArr: [Meeting]) {
    var currentStartTime = 0
    var currentEndTime = 0
    var count = 0
    for item in mettingArr {
        if item.startTime >= currentEndTime {
            count += 1
            currentStartTime = item.startTime
            currentEndTime = item.endTime
        }
    }
    print(count)
}

func sortArr(mettingArr: [Meeting]) -> [Meeting] {
    let sortedMettingArr = mettingArr.sorted { n1, n2 in
        if n1.endTime == n2.endTime {
            return n1.startTime < n2.startTime
        } else {
            return n1.endTime < n2.endTime
        }
    }
    return sortedMettingArr
}
