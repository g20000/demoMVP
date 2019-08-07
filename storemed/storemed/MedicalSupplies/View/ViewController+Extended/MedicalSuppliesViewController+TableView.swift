//
//  MedicalSuppliesViewController+TableView.swift
//  storemed
//
//  Created by pragmus on 05/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

extension MedicalSuppliesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (items != nil) ? items!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "Cell")!
    }
    
}
