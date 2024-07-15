
/*
 1. Напишите функцию на Swift, которая принимает строку и возвращает её хеш, используя встроенную функцию hash().
 */


/// Функция для получение хэш-значения строки
/// - Parameter string: input string
/// - Returns: хэш value
func getHashValue(_ string: String) -> Int {
    return string.hashValue
}

/// Result
let string = "Custom string"


//MARK: - CHECK RESULT

getHashValue(string) // expml: "6 062 812 496 873 626 127"
