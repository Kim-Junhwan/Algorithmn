import Foundation

let firstLine = readLine()!.components(separatedBy: " ")
let n = Int(firstLine[0])!
let b = Int(firstLine[1])!
var studentInfos: [(gift: Int, shipping: Int)] = []

for _ in 0..<n {
    let line = readLine()!.components(separatedBy: " ").map{Int($0)!}
    studentInfos.append((line[0], line[1]))
}

// 1. 기본적으로 (선물+배송비)가 싼 순서대로 정렬해둡니다. (그리디 접근)
let sortedInfos = studentInfos.sorted { ($0.gift + $0.shipping) < ($1.gift + $1.shipping) }

var maxCount = 0

// 2. 어느 학생의 선물을 반값으로 할지 결정 (모든 경우의 수 탐색)
for i in 0..<n {
    var remainBudget = b
    var count = 0
    
    // i번째 학생을 할인받아 먼저 구매한다고 가정
    let discountedPrice = (sortedInfos[i].gift / 2) + sortedInfos[i].shipping
    
    if discountedPrice <= remainBudget {
        remainBudget -= discountedPrice
        count = 1
        
        // 나머지 학생들을 싼 순서대로 구매
        for j in 0..<n {
            if i == j { continue } // 이미 산 학생은 제외
            
            let currentPrice = sortedInfos[j].gift + sortedInfos[j].shipping
            if remainBudget >= currentPrice {
                remainBudget -= currentPrice
                count += 1
            } else {
                break // 예산 초과 시 중단
            }
        }
    }
    maxCount = max(maxCount, count)
}

print(maxCount)
