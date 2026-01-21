import Foundation

let firstLine = readLine()!.components(separatedBy: " ")
let n = Int(firstLine[0])!
let b = Int(firstLine[1])!

var prices = [Int]()
var quick = [Int]()

for _ in 0..<n {
    let line = readLine()!.components(separatedBy: " ")
    prices.append(Int(line[0])!)
    quick.append(Int(line[1])!)
}

prices = prices.sorted()
var priceSum: [Int] = []
var sum = 0
for i in 0..<prices.count {
    sum += (prices[i]+quick[i])
    priceSum.append(sum)
}
var answer = 0
for i in 0..<prices.count {
    let salePrice = prices[i]/2
    answer = max(answer, priceSum.indices.firstIndex { idx in
        let threshold = (idx >= i) ? (b + salePrice + quick[i]) : b + quick[i]
            return priceSum[idx] > threshold
    } ?? n)
}

print(answer)
