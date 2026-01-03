import Foundation

let firstLine = readLine()!.split(separator: " ")
let n = Int(firstLine[0])!
let k = Int(firstLine[1])!

var baskets = [(candy: Int, coordinate: Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    let candy = Int(input[0])!
    let coordinate = Int(input[1])!
    baskets.append((candy, coordinate))
}

var arr: [Int] = Array(repeating: 0, count: 101)

for basket in baskets {
    arr[basket.coordinate] += basket.candy
}

var answer = 0
var currentCandy = 0
var isInit = false
for i in k..<101-k{
    if !isInit {
        currentCandy = Array(arr[i-k..<i+k]).reduce(0) { $0 + $1 }
        isInit = true
    } else {
        currentCandy = currentCandy + (arr[i+k] - arr[i-k-1])
    }
    answer = max(answer, currentCandy)
}
print(answer)