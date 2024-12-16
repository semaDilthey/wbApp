import Foundation

/*
 Observer
 Из документации об "ObservableObject" - A type of object with a publisher that emits before the object has changed. Т.е. по сути является встроенным обсервером, объект вью модели наблюдается и все подписанные на на него через @StateObject объекты реагируют на изменения
 */
@MainActor
final class GoF_ViewModel: ObservableObject {
    
    @Published var exercises : [GoF_Exercise] = []
    
    private var dataBase : Persistable

    init(dataBase: Persistable = GoF_ExercisesStore.shared) {
        self.dataBase = dataBase
    }
    
    func fetchExercises() async {
        self.exercises = await dataBase.fetchAllExercises()
    }
    
    func deleteExercise(id: UUID) async {
        await dataBase.deleteExercise(id: id)
        await fetchExercises()
    }
}
