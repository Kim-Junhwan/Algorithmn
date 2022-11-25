let nm = readLine()!.split(separator: " ").map {Int($0)!}
var bulbArr: [[Bool]] = []
for _ in 0..<nm[0] {
    var bulbs = readLine()!
    let bulbsStatus: [Bool] = Array((bulbs).map({ bulb in
        if bulb == "1" {
            return true
        } else {
            return false
        }
    }))
    bulbArr.append(bulbsStatus)
}
let k = Int(readLine()!)!
var answer = 0
for item in 0..<nm[0] {
    var falseCount = 0
    for num in bulbArr[item] {
        if !num {
            falseCount += 1
        }
    }
    var sameBulbsCount = 0
    if falseCount <= k {
        if falseCount % 2 == k % 2 {
            for compareBulbs in 0..<nm[0] {
                if bulbArr[item] == bulbArr[compareBulbs] {
                    sameBulbsCount += 1
                }
            }
        }
    }
    answer = max(answer, sameBulbsCount)
}
print(answer)
