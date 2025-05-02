//
//  Constants.swift
//  RecipeApp
//
//  Created by West Agile Labs on 08/04/25.
//
import UIKit

let appColor = UIColor(red: 249/255, green: 147/255, blue: 1.0/255, alpha: 1)

let screenHeight = UIScreen.main.bounds.height;

func dynamicFont(ofSize factor: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
    return UIFont.systemFont(ofSize: screenHeight * factor, weight: weight)
}
