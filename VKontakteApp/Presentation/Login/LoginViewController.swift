//
//  LoginViewController.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 08.07.2021.

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var titleImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private var progressView: UIProgressView!
    @IBOutlet private var progressLabel: UILabel!
    @IBOutlet var button: UIButton!
    @IBOutlet private weak var loginLabel: UILabel!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    private var interactivAnimation: UIViewPropertyAnimator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
        progressView.setProgress(0, animated: true)
        button.isHidden = true
        button.alpha = 0
        setViews()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(propertyAnimator(_:)))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func updateProgressView() {
        if progressView.progress != 1 {
            self.progressView.progress += 2/10
        } else {
            self.button.isHidden = false
            UIView.animate(withDuration: 0.4, animations: {() -> Void in
                self.button.alpha = 1
            })
            self.progressLabel.text = "finished"
        }
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        //Второе - когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {//когда view уже на экране
        super.viewDidAppear(animated)
        animateView(titleLabel)
        followAnimation()
        pathAnimation()

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //Отписываемся от уведомлений о клавиатуре
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
           if identifier == "moveToMain" {
            //Получаем текст логина
            guard
                let login = loginTextField.text,
                let password = passwordTextField.text
            else {
                print("Login or password are equal nil")
                showErrorAlert(message: "nothing is written")
                return false
            }
            
            //Проверяем, верны ли они
            if login == "" && password == "" {
                print("authorization succeeded")
                return true
            } else {
                showErrorAlert(message: "empty fields or wrong login or password ")
                print("authorization failed")
                return false
            }
        }
        showErrorAlert(message: "wrong segue identifier")
        return false
    }
    
    @IBAction private func loginButtonPressed(_ sender: UIButton) {
        print("loginButtonPressed")
    }
    
    //Когда клавиатура появляется
    
    @objc private func keyboardWasShown(notification: Notification) {
        //Получаем размер клавиатуры
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        //Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    //Когда клавиатура исчезает
    
    @objc private func keyboardWillBeHidden(notification: Notification) {
        //Устанавливаем отступ внизу UIScrollView, равный 0
        
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    @objc private func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    private func setViews() {
        loginLabel.text = "Login"
        passwordLabel.text = "Password"

        loginButton.setTitle("Log in", for: .normal)
        loginButton.layer.cornerRadius = 8
        loginButton.backgroundColor = .gray
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
    }
    //создание alert
    private func showErrorAlert(message: String) {
        
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel) {_ in
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
}
extension LoginViewController {
    
    func animateView(_ view: UIView) {
        view.alpha = 0
        
        UIView.animateKeyframes(withDuration: 2,
                                delay: 1,
                                options: []) {
            
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.5) {
                view.frame.origin.y += 100//опустили вниз
            }
                                    
                                    
            UIView.addKeyframe(withRelativeStartTime: 0.5,
                                relativeDuration: 0.5) {
                view.frame.origin.y -= 80//
            }
                             
            UIView.addKeyframe(withRelativeStartTime: 0,
                                relativeDuration: 0.75) {
                view.alpha = 1
            }
        }
    }
    
    func followAnimation() {

        let labelX = loginLabel.frame.midX
        let labelY = loginLabel.frame.midY
        let path = UIBezierPath()
        path.move(to: CGPoint(x: labelX, y: labelY))
        path.addLine(to: CGPoint(x: labelX + 50, y: labelY))
        path.addLine(to: CGPoint(x: labelX + 50, y: labelY + 60))
        path.addLine(to: CGPoint(x: labelX, y: labelY + 60))
        path.close()

        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = path.cgPath
        animation.speed = 0.1
        animation.repeatCount = .infinity

        loginLabel.layer.add(animation, forKey: nil)
    }
    
     func pathAnimation() {

             let cloudView = UIView()

             view.addSubview(cloudView)
             cloudView.translatesAutoresizingMaskIntoConstraints = false

             NSLayoutConstraint.activate([
                 cloudView.centerXAnchor.constraint(equalTo: titleImageView.centerXAnchor),
                 cloudView.centerYAnchor.constraint(equalTo: titleImageView.centerYAnchor),
                 cloudView.widthAnchor.constraint(equalToConstant: 120),
                 cloudView.heightAnchor.constraint(equalToConstant: 70)
             ])

             let path = UIBezierPath()
             path.move(to: CGPoint(x: 10, y: 60))
             path.addQuadCurve(to: CGPoint(x: 20, y: 40), controlPoint: CGPoint(x: 5, y: 50))//добавлены арки
             path.addQuadCurve(to: CGPoint(x: 40, y: 20), controlPoint: CGPoint(x: 20, y: 20))
             path.addQuadCurve(to: CGPoint(x: 70, y: 20), controlPoint: CGPoint(x: 55, y: 0))
             path.addQuadCurve(to: CGPoint(x: 80, y: 30), controlPoint: CGPoint(x: 80, y: 20))
             path.addQuadCurve(to: CGPoint(x: 110, y: 60), controlPoint: CGPoint(x: 110, y: 30))
             path.close()


             let layerAnimation = CAShapeLayer()//слой для анимации
         
             layerAnimation.path = path.cgPath
             layerAnimation.strokeColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
             layerAnimation.fillColor = UIColor.clear.cgColor
             layerAnimation.lineWidth = 8
             layerAnimation.lineCap = .round

             cloudView.layer.addSublayer(layerAnimation)
 //здесь начинается анимация:
         //1
             let pathAnimationEnd = CABasicAnimation(keyPath: "strokeEnd")
             pathAnimationEnd.fromValue = 0
             pathAnimationEnd.toValue = 1
             pathAnimationEnd.duration = 2
             pathAnimationEnd.fillMode = .both
             pathAnimationEnd.isRemovedOnCompletion = false
             layerAnimation.add(pathAnimationEnd, forKey: nil)
          //2
             let pathAnimationStart = CABasicAnimation(keyPath: "strokeStart")
             pathAnimationStart.fromValue = 0
             pathAnimationStart.toValue = 1
             pathAnimationStart.duration = 2
             pathAnimationStart.fillMode = .both
             pathAnimationStart.isRemovedOnCompletion = false
             pathAnimationStart.beginTime = 1

             let animationGroup = CAAnimationGroup()
             animationGroup.duration = 3
             animationGroup.fillMode = CAMediaTimingFillMode.backwards
             animationGroup.animations = [pathAnimationEnd, pathAnimationStart]
             animationGroup.repeatCount = .infinity
             layerAnimation.add(animationGroup, forKey: nil)

         }
    @objc func propertyAnimator(_ panRecognizer: UIPanGestureRecognizer) {
        switch panRecognizer.state {
        case .began:
            interactivAnimation = UIViewPropertyAnimator(
                duration: 1,
                curve: .easeInOut,
                animations: {
                    self.passwordTextField.transform = CGAffineTransform(translationX: 100, y: 0)
                })
            interactivAnimation.addCompletion { (_) in
                UIView.animate(withDuration: 1) {
                    self.passwordTextField.transform = .identity
                }
            }
            interactivAnimation.pauseAnimation()
        case .changed:
            let transitionX = panRecognizer.translation(in: self.view).x
            interactivAnimation.fractionComplete = transitionX / 100
        case .ended:
            interactivAnimation.continueAnimation(
                withTimingParameters: nil,
                durationFactor: 0)
        default:
            return
        }
    }
}
