/// Возможные ошибки при обработке задач
enum TaskError: Error {
    case clientUnavailable
    case processingFailed(String)
}
