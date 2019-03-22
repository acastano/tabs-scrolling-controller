import UIKit
import Foundation

protocol TabsChildComponent {

    var viewController: UIViewController { get }
    var tabsDelegate: TabsComponentDelegate? { get set }
    var tabsDataSource: TabsComponentDataSource? { get set }

    func reset()
}
