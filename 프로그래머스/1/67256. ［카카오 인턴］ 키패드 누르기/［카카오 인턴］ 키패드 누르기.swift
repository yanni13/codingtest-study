import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    enum KeypadHand {
        case left
        case right
    }
    
    var result = ""
    var leftHand = 10
    var rightHand = 12
    
    for i in numbers {
        let number = i == 0 ? 11 : i
        var tapHand: KeypadHand = .left
        
        switch number {
        case 1, 4, 7:
            tapHand = .left
            
        case 3, 6, 9:
            tapHand = .right
            
        case 2, 5 ,8, 11:
            let leftTemp = abs(number - leftHand)
            let rightTemp = abs(number - rightHand)
            
            let leftDistance = (leftTemp / 3) + (leftTemp % 3)
            let rightDistance = (rightTemp / 3) + (rightTemp % 3)
            
            if leftDistance == rightDistance {
                tapHand = hand == "left" ? .left : .right
            } else {
                tapHand = leftDistance < rightDistance ? .left : .right
            }
            
        default:
            break
        }
        if tapHand == .left {
            result.append("L")
            leftHand = number
        } else {
            result.append("R")
            rightHand = number
        }
    }
    return result
}