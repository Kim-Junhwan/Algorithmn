import Foundation

let firstLine = readLine()!
let tokens = firstLine.split(separator: " ").map { Int($0)! }
let n = tokens[0]
let m = tokens[1]
let d = tokens[2]
let s = tokens[3]

var info1: [[[Int]]] = Array(repeating: Array(repeating: [], count: m), count: n)
for _ in 0..<d {
    let line = readLine()!
    let parts = line.split(separator: " ").map { Int($0)! }
    let person = parts[0]-1
    let cheese = parts[1]-1
    let time = parts[2]
    info1[person][cheese].append(time)
}

var info2: [(p: Int, t: Int)] = []
for _ in 0..<s {
    let line = readLine()!
    let parts = line.split(separator: " ").map { Int($0)! }
    let person = parts[0]-1
    let time = parts[1]
    info2.append((p: person, t: time))
}

var dropCheese: [Bool] = Array(repeating: false, count: m)

// t시간 이전에 p사람이 cheese를 먹은 지 확인하는 함수
func checkIsEatCheese(_ p: Int, _ t: Int, _ cheese: Int) -> Bool {
    let eatTimeArr = info1[p][cheese]
    for eatTime in eatTimeArr {
        if eatTime < t {
            return true
        }
    }
    return false
}

for cheese in 0..<m {
    
    for sickInfo in info2 {
        // 아픈 경우 아픈 시간 이전에 치즈 먹었는지 체크
        if checkIsEatCheese(sickInfo.p, sickInfo.t, cheese) {
            dropCheese[cheese] = true
        } else {
            dropCheese[cheese] = false
        }
    }
}

for canDropCheese in dropCheese.indices.filter({ dropCheese[$0] }) {
     // 해당 치즈를 먹은 사람 목록
    for sickPerson in info2.map({$0.p}) {
        if info1[sickPerson][canDropCheese].isEmpty {
            dropCheese[canDropCheese] = false
        }
    }
}
var answerPeople: [Int] = []
for i in dropCheese.indices.filter({ dropCheese[$0] }) {
    let cheeseEatPeople = info1.indices.filter { !info1[$0][i].isEmpty }.compactMap{$0}
    answerPeople.append(contentsOf: cheeseEatPeople)
}
let set = Set(answerPeople)
print(set.count)
