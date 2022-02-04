//
//  ViewController.swift
//  ProvaApp
//
//  Created by michael.sanelli on 31/01/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newExercise()
        // Do any additional setup after loading the view.
    }

    typealias Alunno = (nome: String, genre: String, age: Int)
    
    func calculateAverage(values: [Alunno], filterGenre: String) -> Int {
                
        let filtered = values.filter({$0.genre == filterGenre})
        
        return filtered.map({$0.age}).reduce(0){$0+$1} / values.count
    }
    
    func createValues() -> [Alunno] {
        var values : [Alunno] = []
        let genre = ["f","m"]
        let names = ["Zoey", "Chloe", "Amani", "Amaia"]
        
        for _ in 0...10 {
            values.append(Alunno(names.randomElement()!, genre.randomElement()!, Int.random(in: 0...50)))
        }
        return values
    }
    
    func calculateAverageAge() {
        //let alunni : [Alunno] = [Alunno("a","f",30), Alunno("b","m",30)]
        let alunni: [Alunno] = createValues()
        
        let averageF = calculateAverage(values: alunni, filterGenre: "f")
        let averageM = calculateAverage(values: alunni, filterGenre: "m")
        print(averageF)
        print(averageM)
        
    }
    
    enum Gendre : CaseIterable {
        case Female
        case Male
    }
    
    class Student {
        var name : String
        var age : Int
        var gendre : Gendre
        
        init(name : String, age : Int, gendre : Gendre) {
            self.name = name
            self.age = age
            self.gendre = gendre
        }
    }
    
    class School {
        private var students : [Student] = []
        
        init() {}
        init(students : [Student]) {
            self.students = students
        }
        
        func addAlunno(student: Student) {
            self.students.append(student)
        }
        
        func getStudents() -> [Student] {
            return students
        }
        
        func calcAverage(gendre: Gendre) -> Float {
            let filtered = self.students.filter({$0.gendre == gendre})
            let average = ((Float)(filtered.map({$0.age}).reduce(0) {$0 + $1})) / ((Float)(filtered.count))
            return average
        }
    }
    
    func newExercise() {
        let students: [Student] = createValuesC()
        let school = School(students: students)
        
        let averageF = school.calcAverage(gendre: Gendre.Female)
        let averageM = school.calcAverage(gendre: Gendre.Male)
        print(averageF)
        print(averageM)
    }
    
    func createValuesC() -> [Student] {
        var values : [Student] = []
        let names = ["Zoey", "Chloe", "Amani", "Amaia"]
        
        for _ in 0...10 {
            values.append(Student(name: names.randomElement()!, age: Int.random(in: 0...50), gendre: Gendre.allCases.randomElement()!))
        }
        return values
    }

}

