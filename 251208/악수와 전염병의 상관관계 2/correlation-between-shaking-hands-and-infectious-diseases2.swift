import Foundation

struct Developer {
    var isInfection: Bool
    var remainInfectionCount: Int

    init(_ isInfection: Bool, _ remain: Int) {
        self.isInfection = isInfection
        self.remainInfectionCount = remain
    }
}

let firstLine = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = firstLine[0]
let k = firstLine[1]
let p = firstLine[2]
let t = firstLine[3]

var shakes: [(time: Int, person1: Int, person2: Int)] = []
for _ in 0..<t {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    shakes.append((time: line[0], person1: line[1], person2: line[2]))
}

func solution() {
    let sortedShakes = shakes.sorted { $0.0 < $1.0 }
    var developers: [Developer] = Array(repeating: Developer(false, 0), count: n+1)
    developers[p].isInfection = true
    developers[p].remainInfectionCount = k

    for shake in sortedShakes {
        let a = developers[shake.person1]
        let b = developers[shake.person2]

        //둘다 감염되었을때
        if a.isInfection && b.isInfection {
            developers[shake.person1].remainInfectionCount -= 1
            developers[shake.person2].remainInfectionCount -= 1
        } else if a.isInfection || b.isInfection {
            // a가 감염되었을때
            if a.isInfection, a.remainInfectionCount > 0 {
                developers[shake.person1].remainInfectionCount -= 1

                if !b.isInfection {
                    developers[shake.person2].isInfection = true
                    developers[shake.person2].remainInfectionCount = k
                    continue
                }
            }

            //b가 감염되었을때
            if b.isInfection, b.remainInfectionCount > 0 {
                developers[shake.person2].remainInfectionCount -= 1

                if !a.isInfection {
                    developers[shake.person1].isInfection = true
                    developers[shake.person1].remainInfectionCount = k
                    continue
                }
            }
        } 
    }
    print(developers[1...].map { $0.isInfection ? "1" : "0"}.joined(separator: ""))
}

solution()