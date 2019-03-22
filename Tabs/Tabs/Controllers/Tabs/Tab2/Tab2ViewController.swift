
import UIKit

class Tab2ViewController: UIViewController {

    private let rows = 5
    private let colorBlack = UIColor.red
    private let colorGreen = UIColor.green

    weak var tabsDelegate: TabsComponentDelegate?
    weak var tabsDataSource: TabsComponentDataSource?

    private let tableView = UITableView(frame: .zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupHierarchy()
        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.delegate = self
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        tableView.delegate = nil
    }

    private func setupViews() {

        automaticallyAdjustsScrollViewInsets = false

        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
    }

    private func setupHierarchy() {

        view.addSubview(tableView)
    }

    private func setupConstraints() {

        tableView.pinToSuperviewEdges()
    }
}

extension Tab2ViewController: TabsChildComponent {

    var viewController: UIViewController {

        return self
    }

    func reset() {

        tabsDelegate = nil
        tableView.delegate = nil
        tableView.setContentOffset(.zero, animated: false)
    }
}

extension Tab2ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return rows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        cell.textLabel?.text = indexPath.row.description

        let percentage = CGFloat(indexPath.row) / CGFloat(rows - 1)
        cell.backgroundColor = fadeFromColor(colorBlack, toColor:colorGreen, withPercentage:percentage)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height = tabsDataSource?.heightForTopComponent() ?? 0
        return height
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension Tab2ViewController: UITableViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        tabsDelegate?.scrollDidScroll(offset: scrollView.contentOffset.y)
    }
}
