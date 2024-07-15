import UIKit

/*
 4. Dictionary:
 Создайте словарь, где ключами будут строки (названия городов), а значениями — целые числа (их население).
 Добавьте несколько пар ключ-значение в словарь.
 Удалите одну пару ключ-значение.
 Обновите значение для одного из ключей.
 Получите значение для одного из ключей.
 Отправка результатов:
 */


//MARK: - Создаем словарь город : население

var dictionary = [
    "Братск" : 180_000,
    "Питер" : 10_000_000,
    "Красноярск" : 1_150_000
]

fileprivate func printDict(topic: String, dictionary : [String: Int]) {
    print("\n\(topic):\n")
    for (key, value) in dictionary {
        print("\(key) : \(value)")
    }
}

printDict(topic: "Словарь на начало работы", dictionary: dictionary)

//MARK: - Добавляем несколько пар в словарь

dictionary["Сан-Марино"] = 1_000
dictionary["Сочи"] = 450_000

printDict(topic: "Словарь после добавления `Сочи`, `Сан-Марино`", dictionary: dictionary)

//MARK: - Удаляем одну пару ключ-значение

dictionary["Сочи"] = nil

printDict(topic: "Словарь после удаления `Сочи`", dictionary: dictionary)

//MARK: - Обновляем значение для одного из значений

dictionary["Сан-Марино"] = 2_000

printDict(topic: "Словарь обновления `Сан-Марино`", dictionary: dictionary)

//MARK: - Получаем значение для одного из ключей

print("\n \(String(describing: dictionary["Братск"]))")



