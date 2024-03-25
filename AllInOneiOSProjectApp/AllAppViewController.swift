//
//  AllAppViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 14/04/23.
//

import UIKit

class AllAppViewController: UIViewController {

    
    @IBOutlet weak var allAppListTableView: UITableView!
    
    var allAppsNameArray = ["All UI Element List","Colour Picker","Audio and Vedio Players","All Alerts","PageControllerWithScrollView","GradientView","Date Picker","Activity Indicator","ShowAnyWebsiteOnIphone","HTML to Swift Converter","All Mapkit Functions","Stepper and SwitchButton","Custom Indicator","All Animations"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allAppListTableView.dataSource = self
        allAppListTableView.delegate = self
        
    }

}
extension AllAppViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allAppsNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllAppListCell", for: indexPath) as! AllAppListCell
        cell.selectionStyle = .none
        cell.appNameLabel.textColor = .random()
        cell.appNameLabel.text = allAppsNameArray[indexPath.row]
        return cell
    }
    
    
}
extension AllAppViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewControllers = ["AllUIIementsListViewController","ColourPickerViewController", "AudioVideoPlayerViewController", "AlertsViewController", "PageControlViewController", "GradientViewViewController", "DatePickerViewController", "ActivityIndicatorViewController","ShowWebsiteViewController","HTMLToSwiftConverterViewController","AllMapKitViewController","SwitchAndStepperViewController","CustomActivityIndicatorViewController","CoreAnimationAllViewController"]
            
        guard indexPath.row < viewControllers.count else {
            print("Nothing Selected")
            return
        }

        let selectedViewController = viewControllers[indexPath.row]
        switch indexPath.row {
//        case 3:
//            let newViewController = PageControlViewController()
//            guard let window = UIApplication.shared.windows.first else {
//                return
//            }
//            window.rootViewController = newViewController
//            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
//                window.rootViewController = newViewController
//            }, completion: nil)
        default:
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: selectedViewController)
            if let viewController = viewController {
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}
