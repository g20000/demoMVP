//
//  MedicalSuppliesPresenter.swift
//  storemed
//
//  Created by pragmus on 02/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class MedicalSuppliesPresenter: NSObject, MedicalSuppliesInteractorOutput {

    weak var view: MedicalSuppliesView?
    weak var interactor: MedicalSuppliesInteractorInput?
    
}
