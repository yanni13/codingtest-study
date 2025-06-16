let N = Int(readLine()!)!

var color = [[Int]]()

for _ in 0..<N {
    let map = readLine()!.split(separator: " ").map { Int($0)! }
    color.append(map)
}

var cache = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)


for i in 0..<3 {
    cache[0][i] = color[0][i]
}

// 각 집에서의 색을 정할 때, 이전집과 같은 색은 선택할 수 없음
// 이전 집에서 가능한 다른 두색 중 최소비용을 더 해야 함
for i in 1..<N {
    cache[i][0] += min(cache[i-1][1], cache[i-1][2]) + color[i][0]
    cache[i][1] += min(cache[i-1][0], cache[i-1][2]) + color[i][1]
    cache[i][2] += min(cache[i-1][0], cache[i-1][1]) + color[i][2]
}

// 마지막 집의 색깔의 상관없이 최솟값을 반환
print(cache[N-1].min()!)