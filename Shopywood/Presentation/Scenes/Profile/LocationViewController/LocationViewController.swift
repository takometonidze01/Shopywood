//
//  LocationViewController.swift
//  Shopywood
//
//  Created by CodergirlTM on 25.07.21.
//

import UIKit
import CoreData
import MapKit


class LocationViewController: BaseViewController {
    var locations:[Location] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(class: LocationItemCell.self)
        tableView.reloadData()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.black
        getLocations()
        tableView.reloadData()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func addLocation(_ sender: Any) {
        let vc = MapViewController.instantiateFromStoryboard()
        vc.tableVC = self
        vc.locations = locations
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getLocations() {
        let context = getContext()
        
        do {
            locations = try context.fetch(Location.fetchRequest()) as! [Location]
        }
        catch {
            print("fetch error in Table View")
        }
    }
    
    // Clears the locationTable in local data
    func deleteAtIndexLocationTable(at:Int) {
        let context = getContext()
        let location = locations[at]
        locations.remove(at: at)
        context.delete(location)
        saveContext()
    }
    
    func clearLocations() {
        let context = getContext()
        
        for each in locations {
            context.delete(each)
        }

        saveContext()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MapViewController.instantiateFromStoryboard()
        vc.rowLocation = locations[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

func getContext() -> NSManagedObjectContext{
    // set up the context for core data
    return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}

func saveContext() {
    do{
        try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.save()
    }
    catch {
        print("Could not save Core Data")
    }
}



// MARK: - UITableView Data Source
extension LocationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(class: LocationItemCell.self, for: indexPath)
        let location = locations[indexPath.row]
        cell.locationLabel.text = location.address
        return cell
    }
    
    
}
