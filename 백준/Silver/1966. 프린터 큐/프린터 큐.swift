import Foundation

let testCaseCount = Int(readLine()!)!


var result: [Int] = []

for _ in 0..<testCaseCount {
    let input = readLine()!.split(separator: " ").map {Int($0)!}
    let N = input[0]
    let M = input[1]
    
    let priority = readLine()!.split(separator: " ").map {Int($0)!}
    var queue = [(index: Int, priority: Int)]()

    for (j,p) in priority.enumerated() {
        queue.append((index: j, priority: p))
    }
    
    var count = 0

    while !queue.isEmpty {
        let current = queue.removeFirst()
        let maxPriority = queue.map { $0.priority }.max() ?? 0

        if current.priority < maxPriority {
            queue.append(current)
        } else {
            count += 1
            if current.index == M {
                result.append(count)
                break
            }
        }
    }


}

for i in result {
    print(i)
}
