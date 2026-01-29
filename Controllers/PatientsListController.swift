//
//  ViewController.swift
//  PatientsManager
//
//  Created by Samad Akram on 29/01/2026.
//

import UIKit

class PatientsListController: UIViewController, UITableViewDataSource {
    
    private let patients: [(Name: String, Age: Int, Gender: String, Relation: String)] = [("Sarah Miller", 30, "Female", "Mother"), ("James Miller", 25, "Male", "Father"), ("Robert Bob", 20, "Male", "Self")]
    
    private let PatientsList: UITableView = {
       let tableView = UITableView()
        tableView.rowHeight = 150
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor(named: "AppBackground")
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Patients"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addPatient),
        )
        
        navigationController?.navigationBar.tintColor = .black
        view.backgroundColor = UIColor(named: "AppBackground")
        
        view.addSubview(PatientsList)
        
        PatientsList.register(PatientCardController.self, forCellReuseIdentifier: PatientCardController.identifier)
        
        PatientsList.dataSource = self
        
        setupContraints()
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            PatientsList.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            PatientsList.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            PatientsList.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            PatientsList.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }
    
    @objc func addPatient() {
        print("Add Patient")
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PatientCardController.identifier, for: indexPath) as? PatientCardController else {
            return UITableViewCell()
        }
        
        let patient = patients[indexPath.row]
        cell.configure(name: patient.Name)
        return cell
    }
}

