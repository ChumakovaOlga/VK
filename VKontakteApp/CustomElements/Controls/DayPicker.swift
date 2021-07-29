//
//  DayPicker.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 17.07.2021.
//

import UIKit


class DayPicker: UIControl {
    var selectedDay: Day? = nil {
        didSet{
            self.updateSelectedDay()
            self.sendActions(for: .valueChanged)
        }
    }
    
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder sDecoder: NSCoder) {
        super.init(coder: sDecoder)
        self.setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    private func setupView() {
        for day in Day.allDays {
            let button = UIButton(type: .system)
            button.setTitle(day.title, for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectDay(_ :)), for: .touchUpInside)
            self.buttons.append(button)
        }
        stackView =  UIStackView(arrangedSubviews: self.buttons)
        
        self.addSubview(stackView)
        
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    @objc private func selectDay(_ sender: UIButton) {
        guard let index = self.buttons.firstIndex(of: sender) else {return}
        guard let day = Day(rawValue: index) else {return}
        self.selectedDay = day
    }
    private func updateSelectedDay() {
        for(index, button) in self.buttons.enumerated() {
            guard let day = Day(rawValue: index) else { continue }
            button.isSelected = day == self.selectedDay
        }
    }
}
enum Day: Int {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    static let allDays: [Day] = [monday, tuesday, wednesday, thursday, friday, saturday, sunday]
    
    var title: String {
        switch self {
            case .monday: return "MO"
            case .tuesday: return "TU"
            case .wednesday: return "WE"
            case .thursday: return "TH"
            case .friday: return "FR"
            case .saturday: return "ST"
            case .sunday: return "SU"
        }
    }
}
