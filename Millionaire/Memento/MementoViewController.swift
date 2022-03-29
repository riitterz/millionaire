//
//  MementoViewController.swift
//  Millionaire
//
//  Created by Macbook on 29.03.2022.
//

import UIKit

struct Record: Codable {
    let date: Date
    let score: Int
}

final class RecordsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "records"
    
    func save(records: [Record]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Record].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}

class MementoViewController: UIViewController {
    
    let recordsCaretaker = RecordsCaretaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let records = [Record(date: Date(), score: 123), Record(date: Date().addingTimeInterval(1), score: 456)]
        
        recordsCaretaker.save(records: records)
        
        let retrivedRecords = recordsCaretaker.retrieveRecords()
        
        print(retrivedRecords)
    }
    
}
