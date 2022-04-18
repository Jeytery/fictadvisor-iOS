//
//  TeachersViewController.swift
//  FictAdvisor
//
//  Created by Jeytery on 18.04.2022.
//

import UIKit

func TeachersModule() -> TeachersViewController {
    let vc = TeachersViewController()
    vc.presenter = TeachersPresenter()
    return vc
}


class TeachersViewController: UIViewController {
    var presenter: TeachersPresenterInput!
}
