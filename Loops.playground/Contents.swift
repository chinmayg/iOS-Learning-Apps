//: Playground - noun: a place where people can play
import UIKit

let arrOfNum = [1,5,3,6,2,7,23,34]

var sum = 0

for number in arrOfNum {
    sum += number
}

print(sum)

for number in 1...10 {
    print(number)
}

for number in 1..<10 {
    print(number)
}

for number in 1...10 where number % 2 == 0 {
    print(number)
}
