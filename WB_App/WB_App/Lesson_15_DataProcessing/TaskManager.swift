// MARK: - Вынес сервис для управления задачками в отдельный объект

final class TaskManager {

    // создание клиентов
    let client1 = Client(id: 1)
    let client2 = Client(id: 2)
    let client3 = Client(id: 3)

    // создание сервера
    let server = Server()
    
    func process() async {
        // добавление клиентов на сервер
        await server.addClient(client1)
        await server.addClient(client2)
        await server.addClient(client3)

        // добавление задач на сервер
        await server.addTask(TaskData(id: 1, data: "task1"))
        await server.addTask(TaskData(id: 2, data: "task2"))

        // распределение задач и получение результатов
        await server.distributeTasks()
        let results = await server.getResults()
        let errors = await server.getErrors()

        print("Results:", results)
        print("Errors:", errors.count)

    }
}
