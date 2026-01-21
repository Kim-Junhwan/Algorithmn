import Foundation

let firstLine = readLine()!.components(separatedBy: " ")
let n = Int(firstLine[0])!
let b = Int(firstLine[1])!
// 선물 , 배송비
var studentInfos: [(Int, Int)] = []

for _ in 0..<n {
    let line = readLine()!.components(separatedBy: " ").map{Int($0)!}
    studentInfos.append((line[0],line[1]))
}

studentInfos = studentInfos.sorted { ($0.0+$0.1) < ($1.0+$1.1) }
var priceSum: [Int] = []
var sum = 0
for i in 0..<studentInfos.count {
    sum += (studentInfos[i].0 + studentInfos[i].1)
    priceSum.append(sum)
}
var answer = 0
for i in 0..<studentInfos.count {
    let salePrice = studentInfos[i].0/2
    let quickCost = studentInfos[i].1
    answer = max(answer, priceSum.indices.firstIndex { idx in
        let threshold = (idx >= i) ? (b + salePrice + quickCost) : b + quickCost
            return priceSum[idx] > threshold
    } ?? n)
}

print(answer)

