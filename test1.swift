import Foundation
import Numerics

// Data of experiments in JSON format
let jsonData = """
{
    "Experiment Data": [
        {"Experiment ID": "EXP001", "Measured pH Level": 7.4},
        {"Experiment ID": "EXP002", "Measured pH Level": 7.2},
        {"Experiment ID": "EXP003", "Measured pH Level": 8.5},
        {"Experiment ID": "EXP004", "Measured pH Level": 7.1},
        {"Experiment ID": "EXP005", "Measured pH Level": 7.3},
        {"Experiment ID": "EXP006", "Measured pH Level": 7.5},
        {"Experiment ID": "EXP007", "Measured pH Level": 7.2},
        {"Experiment ID": "EXP008", "Measured pH Level": 8.1},
        {"Experiment ID": "EXP009", "Measured pH Level": 7.3},
        {"Experiment ID": "EXP010", "Measured pH Level": 7.0}
    ]
}
"""

// Load the JSON data
struct Experiment: Codable {
    let ExperimentID: String
    let MeasuredPHLevel: Double

    enum CodingKeys: String, CodingKey {
        case ExperimentID = "Experiment ID"
        case MeasuredPHLevel = "Measured pH Level"
    }
}

struct ExperimentData: Codable {
    let ExperimentData: [Experiment]

    enum CodingKeys: String, CodingKey {
        case ExperimentData = "Experiment Data"
    }
}

guard let data = jsonData.data(using: .utf8),
      let experimentData = try? JSONDecoder().decode(ExperimentData.self, from: data) else {
    fatalError("Failed to parse JSON data")
}

// Extract the values of the measured pH levels
let phLevels = experimentData.ExperimentData.map { $0.MeasuredPHLevel }

// Compute descriptive statistics
func mean(_ values: [Double]) -> Double {
    return values.reduce(0, +) / Double(values.count)
}

func variance(_ values: [Double], mean: Double) -> Double {
    return values.reduce(0) { $0 + pow($1 - mean, 2) } / Double(values.count)
}

func standardDeviation(_ variance: Double) -> Double {
    return sqrt(variance)
}

let meanValue = mean(phLevels)
let varianceValue = variance(phLevels, mean: meanValue)
let stdDevValue = standardDeviation(varianceValue)
let minValue = phLevels.min()!
let maxValue = phLevels.max()!
let countValue = Double(phLevels.count)

let descriptiveStats: [String: Double] = [
    "mean": meanValue,
    "stdDev": stdDevValue,
    "min": minValue,
    "max": maxValue,
    "count": countValue,
    "variance": varianceValue
]

// Show the stats values
for (key, value) in descriptiveStats {
    print("\(key): \(value)")
}
