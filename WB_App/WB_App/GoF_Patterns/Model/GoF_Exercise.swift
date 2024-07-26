import Foundation

struct GoF_Exercise: Hashable {
    var id: UUID
    var name: String
    var description: String
    var poses: [Pose]
    
    struct Pose: Hashable {
        var name: String
        var description: String
        
        init(name: String, description: String) {
            self.name = name
            self.description = description
        }
        
        init() {
            self.name = ""
            self.description = ""
        }
    }
    
    init(id: UUID, name: String, description: String, poses: [Pose]) {
        self.id = id
        self.name = name
        self.description = description
        self.poses = poses
    }
    
    init() {
        self.id = UUID()
        self.name = ""
        self.description = ""
        self.poses = [Pose()]
    }
}

extension GoF_Exercise {
    
    static var mockData: [Self] {
        let strengthPoses: [Pose] = [
            .init(name: "Plank", description: "Lie face down, lift your body off the ground, and hold the position."),
            .init(name: "Push-Up", description: "Start in a plank position, then lower your body and push back up."),
            .init(name: "Squat", description: "Stand with feet shoulder-width apart, bend your knees, and lower your hips.")
        ]

        let exercises: [Self] = [
            .init(id: UUID(), name: "Strength Exercise 1", description: "Build muscle strength with these poses.", poses: strengthPoses),
            .init(id: UUID(), name: "Strength Exercise 2", description: "Increase your muscle power and endurance.", poses: strengthPoses),
            .init(id: UUID(), name: "Strength Exercise 3", description: "Strengthen your muscles with these effective poses.", poses: strengthPoses),
            .init(id: UUID(), name: "Strength Exercise 4", description: "Improve your muscle strength and tone.", poses: strengthPoses),
            .init(id: UUID(), name: "Strength Exercise 5", description: "Build strong muscles with these exercises.", poses: strengthPoses),
            .init(id: UUID(), name: "Strength Exercise 6", description: "Enhance your muscle strength and endurance.", poses: strengthPoses)
        ]

        return exercises
    }
}
