import Foundation

func timeToString(_ time: String) -> Int {
    let parts = time.split(separator: ":").map { Int($0)! } 
    return parts[0] * 60 + parts[1]
}

func solution(_ book_time:[[String]]) -> Int {
    let times = book_time.map {time -> (Int, Int) in 
        let startTime = timeToString(time[0])
        let endTime = timeToString(time[1]) + 10
        return (startTime, endTime) }
    
    let sortedTime = times.sorted {$0.0 < $1.0}
    
    var rooms: [Int] = []

    for (start, end) in sortedTime {
        if let index = rooms.firstIndex(where: {$0<=start}) {
            rooms[index] = end
        } else {
            rooms.append(end)
        }
        rooms.sort()

    }
    return rooms.count
}