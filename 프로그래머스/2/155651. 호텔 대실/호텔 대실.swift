import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var timeline = Array(repeating: 0, count: 24 * 60 + 10 + 1) // 최대 시간 + 청소시간

    for times in book_time {
        let start = timeStringToMinutes(times[0])
        let end = timeStringToMinutes(times[1]) + 10

        for i in start..<end {
            timeline[i] += 1
        }
    }

    return timeline.max()!
}


func timeStringToMinutes(_ time: String) -> Int {
    let parts = time.split(separator: ":").map { Int($0)! }
    return parts[0] * 60 + parts[1]
}