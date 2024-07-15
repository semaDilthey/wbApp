
/*
 Придумайте и реализуйте собственную простую хеш-функцию для строк.
 */

extension String {
    
    /// Функция customHasher вычисляет хеш-код строки для массива фиксированного размера
    /// - Returns: hashValue для нашей строки
    func customHasher() -> Int {
        
        // input hashValue, проводим операции над ним
        var hashValue = 0
        
        // Оператор modulus используеся для уменьшения размера, дабы поместить в массив фиксированного размера
        let modulus = 1_000_000
        
        // Простое число для работы с хэш-функция в рамках FNV (https://ru.wikipedia.org/wiki/FNV)
        let constantFNV = 16777619
        
        // Перебираем все символы в строке, переведенной в
        for char in self.unicodeScalars {
            
            // Комбинируем значение ASCII текущего char с текущим хеш-кодом, используя операцию XOR
            hashValue = hashValue ^ Int(char.value)
            // Применяем битовую операцию AND с константой FNV, чтобы избежать коллизий
            hashValue = hashValue &* constantFNV
            // Применяем оператор остатка от деления, чтобы получить хеш-код в пределах заданного диапазона (дабы уменьшить размер массива, в котором хранится хэш-значение)
            hashValue = hashValue % modulus
            
        }
        
        // Возвращаем вычисленный хеш-код
        return hashValue
    }
}

//MARK: - GIVEN

let string = "Hello, world"

//MARK: - RESULT

print(string.customHasher())
