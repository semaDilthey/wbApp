/// Протокол клиента, который обрабатывает задачу и возвращает результат
protocol ClientProtocol {
    func processTask(_ task: TaskProtocol) async throws -> String
}

struct Client: ClientProtocol {
    let id: Int

    // Симуляция обработки задачи с возможной ошибкой
    func processTask(_ task: TaskProtocol) async throws -> String {
        guard !task.data.isEmpty else {
            throw TaskError.processingFailed("Data is empty")
        }
       let result = "Processed \(task.data) by Client \(id)"
       return result
   }
}
