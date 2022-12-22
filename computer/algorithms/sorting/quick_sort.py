def quick_sort(arr):
    if len(arr) <= 1:
        return arr
    pivot = arr[len(arr) // 2]
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    return quick_sort(left) + middle + quick_sort(right)


if __name__ == "__main__":
    def test_quick_sort():
        assert quick_sort([3, 6, 8, 10, 1, 2, 1]) == [1, 1, 2, 3, 6, 8, 10]
        assert quick_sort([1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5]
        assert quick_sort([5, 4, 3, 2, 1]) == [1, 2, 3, 4, 5]
        assert quick_sort([]) == []
        assert quick_sort([1]) == [1]
        assert quick_sort([1, 1, 1, 1]) == [1, 1, 1, 1]

    test_quick_sort()
