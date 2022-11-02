let inp = readLine()!.split(separator: " " ).map{Int(String($0))!}
let N = inp[0], M = inp[1]
var  list = [(Int,Int)]()
for _ in 0..<N {
    let q = readLine()!.split(separator: " " ).map{Int(String($0))!}
    list.append((q[0],q[1]))
}
list.sort(by: {$0.1 == $1.1 ? $0.0 > $1.0 : $0.1 < $1.1})

var beforeCost = 0
var match = 0
var sum = 0
var ans = Int.max
for i in 0..<N {
    sum += list[i].0
    if beforeCost != list[i].1 {
        if sum >= M {
            ans = min(ans,list[i].1)
        }
        beforeCost = list[i].1
        match = 1
    }else {
        if sum >= M {
            ans = min(ans,list[i].1+beforeCost*match)
        }
        match += 1
    }
}
print(ans == Int.max ? -1 : ans )

