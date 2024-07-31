/// Протокол задачи
protocol TaskProtocol {
    var id: Int { get }
    var data: String { get }
}

/// Структура задачи 
struct TaskData: TaskProtocol {
    let id: Int
    let data: String
}
