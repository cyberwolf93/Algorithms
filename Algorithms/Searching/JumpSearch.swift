import Foundation

func JumpSearch(arr: [Int], target: Int) -> Int {

    var m = Int(Double(arr.count).squareRoot())

    var i = 0
    var size = -1
    while(i < arr.count) {
        if (arr[i] == target) {
            return i
        }

        if (arr[i] > target) {
            size = i - 1
            break
        }

        i += m
    }

    while (size > 0 && m > 0) {
        if arr[size] == target {
            return size
        }

        size -= 1
        m -= 1
    }

    return -1

}

func main() {
    let arr = [1, 2, 3,4 ,5 ,6 ,7 ,8,9, 10]
    print( "10 is: \(JumpSearch(arr: arr, target: 10))")
    print("====================================")
    print( "1 is: \(JumpSearch(arr: arr, target: 1))")
    print("====================================")
    print( "4 is: \(JumpSearch(arr: arr, target: 4))")
    print("====================================")
    print( "11 is: \(JumpSearch(arr: arr, target: 11))")
    
}


main()