import Foundation

protocol Persistable: AnyObject {
    func createExercise(_ exercise : GoF_Exercise) async
    func fetchAllExercises() async -> [GoF_Exercise]
    func deleteExercise(id: UUID) async
}

//Актор - Singleton. Имитирует сервис по работе с базой данных

actor GoF_ExercisesStore: ObservableObject, Persistable {
    
    static let shared : GoF_ExercisesStore = .init()
    
    private init() {}
    
    private var dataBase : [GoF_Exercise] = GoF_Exercise.mockData
    
    func createExercise(_ exercise : GoF_Exercise) {
        dataBase.append(exercise)
    }
    
    func fetchAllExercises() -> [GoF_Exercise] {
        dataBase
    }
    
    func deleteExercise(id: UUID) {
        dataBase.removeAll { $0.id == id }
    }
}
