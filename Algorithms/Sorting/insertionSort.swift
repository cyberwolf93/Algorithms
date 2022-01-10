import Foundation


func insertionSort(_ arr: inout [Int]) {
    if arr.count <= 1 {
        return
    }

    var size = 1
    var i = size
    var key = 0
    while (size < arr.count) {
        i = size
        key = arr[i]
        while(i > 0 && arr[i - 1] > key) {
            arr[i] = arr[i-1]
            i -= 1
        }
        arr[i] = key
        size += 1
    }

}

func main() {
    var arr = [64, 34, 25, 12, 100, 22, 11, 90]
    insertionSort(&arr)
    print(arr)
}
main()