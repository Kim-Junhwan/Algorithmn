let topingNum = Int(readLine()!)!
var dowAndTopingPrice = readLine()!.split(separator: " ").map {Int($0)!}
var topingCalArr: [Int] = []
var dowCal = Int(readLine()!)!

for _ in 0..<topingNum {
    let topingCal = Int(readLine()!)!
    topingCalArr.append(topingCal)
}

topingCalArr.sort {$0 > $1}

for item in 0..<topingNum {
    if (dowCal/dowAndTopingPrice[0]) < (topingCalArr[item]/dowAndTopingPrice[1]) {
        dowCal += topingCalArr[item]
        dowAndTopingPrice[0] += dowAndTopingPrice[1]
    }
}
print(dowCal/dowAndTopingPrice[0])
