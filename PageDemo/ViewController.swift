//
//  ViewController.swift
//  PageDemo
//
//  Created by Ortwin Gentz on 16.08.23.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet var label: UILabel?
	
	override var title: String? {
		didSet {
			label?.text = title
		}
	}
}

