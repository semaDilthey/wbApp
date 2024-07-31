/// актор сервера, который управляет клиентами и распределяет задачи
actor Server {
    private var clients: [Int: Client] = [:]
    private var tasks: [TaskData] = []
    private var results: [String] = []
    private var errors: [TaskError] = []

    /// 1. Добавляет клиента к серверу
    func addClient(_ client: Client) {
        clients[client.id] = client
    }

    /// 2. Добавляет задачу в очередь задач
    func addTask(_ task: TaskData) {
        tasks.append(task)
    }

    /// распределяет задачи между клиентами
    func distributeTasks() async {
           await withTaskGroup(of: Void.self) { taskGroup in
               for task in tasks {
                   if let client = clients.values.randomElement() {
                       taskGroup.addTask {
                           do {
                               let result = try await client.processTask(task)
                               await self.addResult(result)
                           } catch let error as TaskError {
                               await self.addError(error)
                           } catch {
                               await self.addError(.processingFailed("Unknown error: \(error.localizedDescription)"))
                           }
                       }
                   } else {
                       await self.addError(.clientUnavailable)
                   }
               }
           }
       }

    /// Добавляет результат обработки задачи в список результатов
    private func addResult(_ result: String) async {
        results.append(result)
    }

    /// Добавляет ошибку в список ошибок
    private func addError(_ error: TaskError) async {
        errors.append(error)
    }

    /// Возвращает список результатов обработки задач
    func getResults() -> [String] {
        return results
    }

    /// Возвращаем полученные ошибки (если требуется)
    func getErrors() -> [TaskError] {
        return errors
    }
}
