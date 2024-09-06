import Foundation

struct Task {
    var title: String
    var description: String
    var priority: Int
    var isCompleted: Bool
}

// Error types for the task management functions
enum TaskError: Error {
    case emptyTitle
    case emptyDescription
    case invalidPriority
    case duplicateTitle
    case taskNotFound
}

var tasks: [Task] = []

/// create a task and add it to the task list.
///
/// - Inputs(parameters):
///   - title: The title of the task.
///   - description: The description of the task.
///   - priority: The priority of the task (1 to 5).
/// - Throws: An error of type `TaskError` if any of the parameters are invalid.
func addTask(title: String, description: String, priority: Int) throws {
    // Ensure the task title is not empty
    guard !title.isEmpty else {
        throw TaskError.emptyTitle
    }
    
    // check if the task description is not empty
    guard !description.isEmpty else {
        throw TaskError.emptyDescription
    }
    
    // check if the priority is within the range
    guard (1...5).contains(priority) else {
        throw TaskError.invalidPriority
    }
    
    // check if the task title is not a duplicate
    guard !tasks.contains(where: { $0.title == title }) else {
        throw TaskError.duplicateTitle
    }
    
    // Add the task to the list
    let task = Task(title: title, description: description, priority: priority, isCompleted: false)
    tasks.append(task)
    print("Task \(title) has been added.")
}

/// Displays all tasks in the task list, sorted by priority.
/// - Inputs(parameters):
///     sortBy: The criterion to sort the tasks by "priority".
func displayTasks(sortedBy sortBy: String) {
    let sortedTasks: [Task]
    switch sortBy {
    case "priority":
        sortedTasks = tasks.sorted(by: { $0.priority < $1.priority })
    default:
        sortedTasks = tasks
    }
    
    print("Task List:")
    for task in sortedTasks {
        print("Title: \(task.title), Description: \(task.description), Priority: \(task.priority), Completed: \(task.isCompleted)")
    }
}

/// Removes a task from the task list by title.
///
/// - Inputs(parameters): 
///     title: The title of the task to be removed.
/// - Throws: An error of type `TaskError` if the task is not found.
func removeTask(title: String) throws {
    // check if the task title exists in the list
    guard let index = tasks.firstIndex(where: { $0.title == title }) else {
        throw TaskError.taskNotFound
    }
    
    // Remove the task from the list
    tasks.remove(at: index)
    print("Task \(title) has been removed.")
}

/// Finds a task in the task list by title.
///
/// - Inputs(parameters): 
///     title: The title of the task to find.
/// - Returns: The task if found, or nil if not found.
func findTask(title: String) -> Task? {
    return tasks.first(where: { $0.title == title })
}

/// Updates a task's details.
///
/// - Inputs(parameters):
///   - title: The title of the task to update.
///   - newDescription: The new description of the task.
///   - newPriority: The new priority of the task.
/// - Throws: An error of type `TaskError` if the task is not found or if the new details are invalid.
func updateTask(title: String, newDescription: String, newPriority: Int) throws {
    // check if the task title exists in the list
    guard let index = tasks.firstIndex(where: { $0.title == title }) else {
        throw TaskError.taskNotFound
    }
    
    // check if the new description is not empty
    guard !newDescription.isEmpty else {
        throw TaskError.emptyDescription
    }
    
    // check if the new priority is within the valid range
    guard (1...5).contains(newPriority) else {
        throw TaskError.invalidPriority
    }
    
    // Update the task details
    tasks[index].description = newDescription
    tasks[index].priority = newPriority
    print("Task \(title) has been updated.")
}

/// Marks a task as completed.
///
/// - Inputs(parameters): 
///     title: The title of the task to be marked as completed.
/// - Throws: An error of type `TaskError` if the task is not found.
func completeTask(title: String) throws {
    // Ensure the task title exists in the list
    guard let index = tasks.firstIndex(where: { $0.title == title }) else {
        throw TaskError.taskNotFound
    }
    
    // Mark the task as completed
    tasks[index].isCompleted = true
    print("Task \(title) has been marked as completed.")
}

// Test cases
do {
    try addTask(title: "Task 1", description: "Finish the Task by end of the day", priority: 1)
    try addTask(title: "Homework", description: "Finish the Task by end of the day", priority: 1)
    try addTask(title: "shopping", description: "clothes, accessories", priority: 2)
    displayTasks(sortedBy: "priority")
    if let task = findTask(title: "shopping") {
        print("Task 'shopping' found: Description: \(task.description), Priority: \(task.priority), Completed: \(task.isCompleted)")
    }
    try updateTask(title: "shopping", newDescription: "clothes, accessories, and Cheese", newPriority: 3)
    try updateTask(title: "Homework", newDescription: "updated Task", newPriority: 2)

    try completeTask(title: "Task 1")
    try removeTask(title: "shopping")
    displayTasks(sortedBy: "priority")
} catch {
    print("Failed to manage tasks: \(error)")
}
