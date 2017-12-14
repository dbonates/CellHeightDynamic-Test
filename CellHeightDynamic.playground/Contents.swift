//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport


class NiceTableView: UITableViewController {
    
    
    var textos = [String]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func loadView() {
        
        let v = UITableView(frame: .zero, style: .plain)
        
        v.delegate = self
        v.dataSource = self
        v.separatorStyle = .none
        self.view = v
    
        v.register(NiceCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let tFile = Bundle.main.path(forResource: "Textos", ofType: "txt") else { return }
        
        
        do {
        let textSentences = try String.init(contentsOfFile: tFile)
            
            let sentencesArray = textSentences.split(separator: "\n")
            
            self.textos = sentencesArray.map { "\($0)" }
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! NiceCell
        cell.setupInfo(textos[indexPath.row])
        
        return cell
    }
    
    
    
}

PlaygroundPage.current.liveView = NiceTableView()

