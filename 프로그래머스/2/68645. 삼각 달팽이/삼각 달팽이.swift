import Foundation

func solution(_ n:Int) -> [Int] {
    var answer = Array(repeating: [Int](), count: n)
    for i in 0..<n {
        answer[i] = Array(repeating: 0, count: i + 1)
    }
    
    var x = -1, y = 0
    var num = 1
    
    for i in 0..<n {
        for _ in i..<n {
            if i%3 == 0 {
                x += 1
            } else if i % 3 == 1 {
                y += 1
            } else {
                x -= 1
                y -= 1
            }
            answer[x][y] = num
            num += 1
        }
    }
    return answer.flatMap { $0 }
}