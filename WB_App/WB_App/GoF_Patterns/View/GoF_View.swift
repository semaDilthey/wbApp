import SwiftUI

struct GoF_View: View {
    
    @EnvironmentObject var viewModel : GoF_ViewModel
    @State var showAddScreen = false
    
    var body: some View {
        VStack {
            
            // ADD EXERCISE BUTTON
            addNewExerciseButton
            
            // LIST OF EXERCISES
            exercisesList
        }
        .task {
            await viewModel.fetchExercises()
        }
    }
    
    private var addNewExerciseButton: some View {
        HStack {
            Spacer()
            Button {
                showAddScreen.toggle()
            } label: {
                Text("Add exercise")
            }
        }
        .padding()
        .sheet(isPresented: $showAddScreen) {
            AddNewExerciseView()
                .environmentObject(viewModel)
        }
    }
    
    private var exercisesList: some View {
        ForEach(viewModel.exercises, id: \.self) { exercise in
            VStack {
                Form {
                    Section {
                        Text(exercise.name)
                        Text(exercise.description)
                    }
                    
                    // DELETE BUTTON
                    Button(action: {
                        Task {
                            await viewModel.deleteExercise(id: exercise.id)
                        }
                    }, label: {
                        Text("Delete excercise")
                    })
                }
                .scrollDisabled(false)
            }
        }
    }
}

fileprivate struct AddNewExerciseView: View {
    
    @EnvironmentObject var viewModel : GoF_ViewModel
    
    @State private var exercise : GoF_Exercise = .init()
    @State private var pose : GoF_Exercise.Pose = .init()
    
    var body: some View {
        VStack {
            Form {
                textFieldSection(title: excerciseText.name, 
                                 placeHolder: excerciseText.desctiption,
                                 binding: $exercise.name)
                textFieldSection(title: descrtiptionText.name, 
                                 placeHolder: descrtiptionText.desctiption,
                                 binding: $exercise.description)
                textFieldSection(title: poseFiller.name, 
                                 placeHolder: poseFiller.desctiption,
                                 binding: $pose.description)
            }
        }
        .padding()
        .onDisappear {
            withAnimation {
                saveChanges()
            }
        }
    }
    
    private func textFieldSection(title: String,
                                  placeHolder: String,
                                  binding: Binding<String>) -> some View {
        Section {
            Text(title)
            ZStack {
                if pose.description.isEmpty {
                    Text(placeHolder)
                        .foregroundStyle(.secondary.opacity(0.4))
                }
                TextEditor(text: binding)
                    .offset(y: 8)
            }
        }
    }
    
    private func saveChanges() {
        exercise.poses = [pose]
        viewModel.exercises.append(exercise)
    }
    
    private var excerciseText : (name: String, desctiption: String) {
        return ("Exercise name", "Enter name")
    }
    
    private var descrtiptionText : (name: String, desctiption: String) {
        return ("Exercise description", "Enter desctiption")
    }
    
    private var poseFiller : (name: String, desctiption: String) {
        return ("Pose name", "Pose description")
    }
    
}


#Preview {
    GoF_View()
}

