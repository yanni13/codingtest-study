import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var temp1 = cards1
    var temp2 = cards2
    
    for i in goal {
        if !temp1.isEmpty && i == temp1[0] {
            temp1.removeFirst()
        } else if !temp2.isEmpty && i == temp2[0] {
            temp2.removeFirst()
        } else {
            return "No"
        }
    }
    return "Yes"
}