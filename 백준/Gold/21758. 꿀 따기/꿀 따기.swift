let count = Int(readLine()!)!
let honey = readLine()!.split(separator: " ").map {Int($0)!}
var sumArr: [Int] = []
var sum = 0
var anwer = 0
for item in honey {
    sum += item
    sumArr.append(sum)
}

for beeHome in 1..<count-1 {
    anwer = max(anwer, (sumArr[beeHome]-honey[0] + sumArr[count-1]-sumArr[beeHome-1]-honey[count-1]))
}
for bee in 1..<count-1 {
    anwer = max(anwer, sumArr[count-1]-honey[0]-honey[bee]+sumArr[count-1]-sumArr[bee])
}
for bee in 1..<count-1 {
    anwer = max(anwer, sumArr[count-1]-honey[count-1]-honey[bee]+sumArr[bee-1])
}
print(anwer)
