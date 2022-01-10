import Foundation

func swap(arr: inout [Int],_ a: Int,_ b: Int) {
    let temp = arr[a]
    arr[a] = arr[b]
    arr[b] = temp
}

func bubbleSort(_ arr: inout [Int]) {

    var swapped = false // for optimization purpose 
    for i in 0...arr.count-2 {
        swapped = false // for optimization purpose 
        for j in 0...(arr.count - i - 2) {
            if arr[j] > arr[j+1] {
                swap(arr: &arr,j, j+1)
                swapped = true // for optimization purpose 
            }
        }

        if (!swapped) { // for optimization purpose 
            break
        }
    }

}

func main() {
    var arr = [64, 34, 25, 12, 100, 22, 11, 90]
    bubbleSort(&arr)
    print(arr)
}
main()