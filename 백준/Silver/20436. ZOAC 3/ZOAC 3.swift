let currentBoard = readLine()!.split(separator: " ").map {String($0)}
let inputWord = readLine()!

let keyboard = [
    ["q","w","e","r","t","y","u","i","o","p"],
    ["a","s","d","f","g","h","j","k","l"],
    ["z","x","c","v","b","n","m"]
]

func solution(sL: String, sR: String, word: String) -> Int{
    var answer = 0
    var left = checkCoordinator(alphabet: sL)
    var right = checkCoordinator(alphabet: sR)
    for item in word {
        let foundCoordinator = checkCoordinator(alphabet: String(item))
        if (foundCoordinator.0 <= 1 && foundCoordinator.1 <= 4) || (foundCoordinator.0 == 2 && foundCoordinator.1 <= 3) {
            answer += abs(left.0-foundCoordinator.0)+abs(left.1-foundCoordinator.1)+1
            left = foundCoordinator
        } else {
            answer += abs(right.0-foundCoordinator.0)+abs(right.1-foundCoordinator.1)+1
            right = foundCoordinator
        }
    }
    return answer
}

func checkCoordinator(alphabet: String) -> (Int, Int) {
    for i in 0..<keyboard.count {
        for j in 0..<keyboard[i].count {
            if keyboard[i][j] == alphabet {
                return (i,j)
            }
        }
    }
    return (0,0)
}

print(solution(sL: currentBoard[0], sR: currentBoard[1], word: inputWord))
