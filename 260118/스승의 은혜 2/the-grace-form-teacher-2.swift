let firstLine = readLine()!.split(separator: " ")
let n = Int(firstLine[0])!
let b = Int(firstLine[1])!
var prices = [Int]()
for _ in 0..<n {
    let price = Int(readLine()!)!
    prices.append(price)
}

prices = prices.sorted()
var priceSum: [Int] = []
var sum = 0 
for i in 0..<prices.count {
    sum += prices[i]
    priceSum.append(sum)
}
var answer = 0
for i in 0..<prices.count {
    let salePrice = prices[i]/2
    answer = max(answer, priceSum.firstIndex { $0 > b+salePrice } ?? n)
}

print(answer)