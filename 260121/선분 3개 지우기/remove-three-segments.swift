import Foundation

let n = Int(readLine()!)!
var segments: [(Int, Int)] = []

for _ in 0..<n {
    let parts = readLine()!.split(separator: " ")
    let a = Int(parts[0])!
    let b = Int(parts[1])!
    segments.append((a, b))
}

var listArr: [Int] = Array(repeating: 0, count: 101)

for segment in segments {
    for i in segment.0...segment.1 {
        listArr[i] += 1
    }
}
var answer = 0
for i in 0..<n {
    var cpListArr = listArr
    for si in segments[i].0...segments[i].1 {
        cpListArr[si] -= 1
    }
    for j in i..<n {
        if i == j {continue}
        var secondCpListArr = cpListArr
        for sj in segments[j].0...segments[j].1 {
            secondCpListArr[sj] -= 1
        }
        for z in j..<n {
            if j == z { continue }
            var thirdCpListArr = secondCpListArr
            for sz in segments[z].0...segments[z].1 {
                thirdCpListArr[sz] -= 1
            }

            let lineCount = thirdCpListArr.filter{ $0 > 1 }.count
            if lineCount == 0 {
                answer += 1
            }
        }
    }
}
print(answer)