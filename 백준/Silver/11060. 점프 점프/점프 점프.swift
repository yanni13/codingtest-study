import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

func bfsJump(_ arr: [Int], n: Int) -> Int {
    var visited = [Bool](repeating: false, count: n)
    var queue: [(index: Int, jumps: Int)] = [(0, 0)]
    visited[0] = true

    while !queue.isEmpty {
        let (current, count) = queue.removeFirst()

        if current == n - 1 {
            return count
        }

        let end = min(current + arr[current], n - 1)
        if current + 1 <= end {
            for next in (current + 1)...end {
                if !visited[next] {
                    visited[next] = true
                    queue.append((next, count + 1))
                }
            }
        }
    }

    return -1
}

print(bfsJump(arr, n: n))
