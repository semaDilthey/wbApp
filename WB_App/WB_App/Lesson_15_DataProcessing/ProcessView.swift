import SwiftUI

struct ProcessView: View {

    private var taskManager : TaskManager = .init()

    var body: some View {
        VStack {
            Text("Hello buddy")
        }
        .background(.white)
        .task {
            await taskManager.process()
        }
    }
}
