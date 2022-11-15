let nm = readLine()!.split(separator: " ").map { Int($0)! }
var cardArr = readLine()!.split(separator: " ").map { Int($0)! }

for _ in 0..<nm[1] {
    let firstIndex = cardArr.firstIndex(of: cardArr.min()!)!
    let smallOneNum = cardArr[firstIndex]
    cardArr.remove(at: firstIndex)
    let thirdIndex = cardArr.firstIndex(of: cardArr.min()!)!
    let smallTwoNum = cardArr[thirdIndex]
    cardArr.remove(at: thirdIndex)
    cardArr.append(smallOneNum+smallTwoNum)
    cardArr.append(smallOneNum+smallTwoNum)
}

print(cardArr.reduce(0, { $0 + $1 }))
