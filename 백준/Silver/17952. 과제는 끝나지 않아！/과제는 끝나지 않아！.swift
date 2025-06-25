import Foundation

let N = Int(readLine()!)!
var stack: [(score: Int, time: Int)] = [] // 스택 형태로 구현해야 함
var result: Int = 0
var remainTime: [Int:Int] = [:]

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map {Int($0)!}
    if input[0] == 1 {
        stack.append((input[1], input[2]-1))
        if stack.last!.time == 0 {
            result += stack.removeLast().score
        }
        
    } else {
        if !stack.isEmpty {
            stack[stack.count - 1].time -= 1
            if stack.last!.time == 0 {
                result += stack.removeLast().score
            }
        }
    }
}

print(result)