//
//  TripPanel.swift
//  Free Taxi
//
//  Created by Fazlik Ziyaev on 22/12/21.
//

import UIKit

class TripPanel: UIViewController {
    
    let carInfoView: UIView = {
        let carInfoView = UIView()
        carInfoView.translatesAutoresizingMaskIntoConstraints = false
        carInfoView.backgroundColor = .white
        
        return carInfoView
    }()
    
    let addressView: UIView = {
        let addressView = UIView()
        addressView.translatesAutoresizingMaskIntoConstraints = false
        addressView.backgroundColor = .white
        
        return addressView
    }()
    
    let horizontalBtnStack: UIStackView = {
        let horizontalBtnStack = UIStackView()
        horizontalBtnStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalBtnStack.axis = .horizontal
        horizontalBtnStack.spacing = 8
        horizontalBtnStack.distribution = .fillEqually
        horizontalBtnStack.backgroundColor = .white
        
        return horizontalBtnStack
    }()
    
    let driverInfoView: UIView = {
        let driverInfoView = UIView()
        driverInfoView.translatesAutoresizingMaskIntoConstraints = false
        driverInfoView.backgroundColor = .white
        
        return driverInfoView
    }()
    
    let driverAccountView: UIView = {
        let driverAccountView = UIView()
        driverAccountView.translatesAutoresizingMaskIntoConstraints = false
        driverAccountView.backgroundColor = .white
        
        return driverAccountView
    }()
    
    let totalDataView: UIView = {
        let totalDataView = UIView()
        totalDataView.translatesAutoresizingMaskIntoConstraints = false
        totalDataView.backgroundColor = .white
        
        return totalDataView
    }()
    
    let totalDataInfo: UIView = {
        let totalDataInfo = UIView()
        totalDataInfo.translatesAutoresizingMaskIntoConstraints = false
        totalDataInfo.backgroundColor = .white
        
        return totalDataInfo
    }()
    
    let costCalculationView: UIView = {
        let costCalculationView = UIView()
        costCalculationView.translatesAutoresizingMaskIntoConstraints = false
        costCalculationView.backgroundColor = .white
        
        return costCalculationView
    }()
    
    let costCalculationInfo: UIView = {
        let costCalculationInfo = UIView()
        costCalculationInfo.translatesAutoresizingMaskIntoConstraints = false
        costCalculationInfo.backgroundColor = .white
        
        return costCalculationInfo
    }()
    
    
    let carNumberView: UIView = {
        let carNumberView = UIView()
        carNumberView.translatesAutoresizingMaskIntoConstraints = false
        carNumberView.backgroundColor = .white
        carNumberView.layer.cornerRadius = 10
        carNumberView.layer.borderWidth = 1
        carNumberView.layer.borderColor = UIColor.lightGray.cgColor
        
        return carNumberView
    }()
    
    let carNumberLabel: UILabel = {
        let carNumberLabel = UILabel()
        carNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        carNumberLabel.textColor = .black
        carNumberLabel.text = "25 L 771 FA"
        carNumberLabel.textAlignment = .center
        carNumberLabel.font = .boldSystemFont(ofSize: 20)
        
        return carNumberLabel
    }()
    
    let carTypeLabel: UILabel = {
        let carTypeLabel = UILabel()
        carTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        carTypeLabel.textColor = .lightGray
        carTypeLabel.text = "Чёрный Chevrolet Malibu"
        carTypeLabel.font = .systemFont(ofSize: 17)
        
        return carTypeLabel
    }()
    
    let line1: UIView = {
        let line1 = UIView()
        line1.translatesAutoresizingMaskIntoConstraints = false
        line1.backgroundColor = .lightGray
        
        return line1
    }()
    
    let line2: UIView = {
        let line2 = UIView()
        line2.translatesAutoresizingMaskIntoConstraints = false
        line2.backgroundColor = .lightGray
        
        return line2
    }()
    
    let line3: UIView = {
        let line3 = UIView()
        line3.translatesAutoresizingMaskIntoConstraints = false
        line3.backgroundColor = .lightGray
        
        return line3
    }()
    
    let line4: UIView = {
        let line4 = UIView()
        line4.translatesAutoresizingMaskIntoConstraints = false
        line4.backgroundColor = .lightGray
        
        return line4
    }()
    
    let line5: UIView = {
        let line5 = UIView()
        line5.translatesAutoresizingMaskIntoConstraints = false
        line5.backgroundColor = .lightGray
        
        return line5
    }()
    
    
    let carImage: UIImageView = {
        let carImage = UIImageView(image: UIImage(named: "car_malibu"))
        carImage.translatesAutoresizingMaskIntoConstraints = false
        
        return carImage
    }()
    
    let fromImage: UIImageView =  {
        let fromImage = UIImageView()
        fromImage.translatesAutoresizingMaskIntoConstraints = false
        fromImage.image = UIImage(named: "from_icon")
        return fromImage
    }()
    
    let whereImage: UIImageView =  {
        let whereImage = UIImageView()
        whereImage.translatesAutoresizingMaskIntoConstraints = false
        whereImage.image = UIImage(named: "where_icon")
        return whereImage
    }()
    
    let fromLabel: UILabel = {
        let fromLabel = UILabel()
        fromLabel.translatesAutoresizingMaskIntoConstraints = false
        fromLabel.textColor = .black
        fromLabel.text = "улица Sharof Rashidov, Ташкент"
        fromLabel.font = .systemFont(ofSize: 17)
        
        return fromLabel
    }()
    
    let whereLabel: UILabel = {
        let whereLabel = UILabel()
        whereLabel.translatesAutoresizingMaskIntoConstraints = false
        whereLabel.textColor = .black
        whereLabel.text = "5a улица Асадуллы Ходжаева"
        whereLabel.font = .systemFont(ofSize: 17)
        
        return whereLabel
    }()
    
    let btnHelp: UIImageView = {
        let btnHelp = UIImageView()
        btnHelp.translatesAutoresizingMaskIntoConstraints = false
        btnHelp.image = UIImage(named: "btn_help")
        
        
        return btnHelp
    }()
    
    let btnRepeat: UIImageView = {
        let btnRepeat = UIImageView()
        btnRepeat.translatesAutoresizingMaskIntoConstraints = false
        btnRepeat.image = UIImage(named: "btn_repeat")
        
        
        return btnRepeat
    }()
    
    let btnCall: UIImageView = {
        let btnCall = UIImageView()
        btnCall.translatesAutoresizingMaskIntoConstraints = false
        btnCall.image = UIImage(named: "btn_call")
        
        
        return btnCall
    }()
    
    let driverLabel: UILabel = {
        let driverLabel = UILabel()
        driverLabel.translatesAutoresizingMaskIntoConstraints = false
        driverLabel.textColor = .black
        driverLabel.text = "Водитель"
        driverLabel.font = .boldSystemFont(ofSize: 22)
        
        return driverLabel
    }()
    
    let driverImage: UIImageView = {
        let driverImage = UIImageView()
        driverImage.translatesAutoresizingMaskIntoConstraints = false
        driverImage.image = UIImage(named: "me")
        driverImage.layer.borderWidth = 1
        driverImage.layer.masksToBounds = false
        driverImage.layer.borderColor = UIColor.black.cgColor
        driverImage.layer.cornerRadius = 30
        driverImage.clipsToBounds = true

        return driverImage
    }()
    
    let driverName: UILabel = {
        let driverName = UILabel()
        driverName.translatesAutoresizingMaskIntoConstraints = false
        driverName.textColor = .black
        driverName.text = "Fazliddin Ziyaev"
        driverName.font = .boldSystemFont(ofSize: 20)
        
        return driverName
    }()

    let ratingLabel: UILabel = {
        let ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.textColor = .lightGray
        ratingLabel.text = "Рейтинг: "
        ratingLabel.font = .systemFont(ofSize: 14)
        
        return ratingLabel
    }()
    
    let ratingNumber: UILabel = {
        let ratingNumber = UILabel()
        ratingNumber.translatesAutoresizingMaskIntoConstraints = false
        ratingNumber.textColor = .black
        ratingNumber.text = "5"
        ratingNumber.font = .boldSystemFont(ofSize: 14)
        
        return ratingNumber
    }()
    
    let ratingStar: UIImageView = {
        let ratingStar = UIImageView()
        ratingStar.image = UIImage(named: "yellow_star")
        ratingStar.translatesAutoresizingMaskIntoConstraints = false
        
        return ratingStar
    }()
    
    let tripsLabel: UILabel = {
        let tripsLabel = UILabel()
        tripsLabel.translatesAutoresizingMaskIntoConstraints = false
        tripsLabel.textColor = .lightGray
        tripsLabel.text = "Поездки: "
        tripsLabel.font = .systemFont(ofSize: 14)
        
        return tripsLabel
    }()
    
    let tripsNumber: UILabel = {
        let tripsNumber = UILabel()
        tripsNumber.translatesAutoresizingMaskIntoConstraints = false
        tripsNumber.textColor = .black
        tripsNumber.text = "1932"
        tripsNumber.font = .boldSystemFont(ofSize: 14)
        
        return tripsNumber
    }()
    
    let totalDataLabel: UILabel = {
        let totalData = UILabel()
        totalData.translatesAutoresizingMaskIntoConstraints = false
        totalData.textColor = .black
        totalData.text = "Общие данные"
        totalData.font = .boldSystemFont(ofSize: 22)
        
        return totalData
    }()
    
    let rate: UILabel = {
        let rate = UILabel()
        rate.translatesAutoresizingMaskIntoConstraints = false
        rate.textColor = .lightGray
        rate.text = "Тариф"
        rate.font = .boldSystemFont(ofSize: 15)
        
        return rate
    }()
    
    let rateType: UILabel = {
        let rateType = UILabel()
        rateType.translatesAutoresizingMaskIntoConstraints = false
        rateType.textColor = .black
        rateType.text = "Бизнес"
        rateType.font = .boldSystemFont(ofSize: 15)
        
        return rateType
    }()
    
    let paymentMethod: UILabel = {
        let paymentMethod = UILabel()
        paymentMethod.translatesAutoresizingMaskIntoConstraints = false
        paymentMethod.textColor = .lightGray
        paymentMethod.text = "Способ оплаты"
        paymentMethod.font = .boldSystemFont(ofSize: 15)
        
        return paymentMethod
    }()
    
    let paymentMethodType: UILabel = {
        let paymentMethodType = UILabel()
        paymentMethodType.translatesAutoresizingMaskIntoConstraints = false
        paymentMethodType.textColor = .black
        paymentMethodType.text = "Наличными"
        paymentMethodType.font = .boldSystemFont(ofSize: 15)
        
        return paymentMethodType
    }()
    
    let moneyImage: UIImageView = {
        let moneyImage = UIImageView()
        moneyImage.translatesAutoresizingMaskIntoConstraints = false
        moneyImage.image = UIImage(named: "money")
        
        return moneyImage
    }()
    
    let orderNumber: UILabel = {
        let orderNumber = UILabel()
        orderNumber.translatesAutoresizingMaskIntoConstraints = false
        orderNumber.textColor = .lightGray
        orderNumber.text = "Заказ №"
        orderNumber.font = .boldSystemFont(ofSize: 15)
        
        return orderNumber
    }()
    
    let orderNumberValue: UILabel = {
        let orderNumberValue = UILabel()
        orderNumberValue.translatesAutoresizingMaskIntoConstraints = false
        orderNumberValue.textColor = .black
        orderNumberValue.text = "3917866"
        orderNumberValue.font = .boldSystemFont(ofSize: 15)
        
        return orderNumberValue
    }()
    
    let timeOfTrip: UILabel = {
        let timeOfTrip = UILabel()
        timeOfTrip.translatesAutoresizingMaskIntoConstraints = false
        timeOfTrip.textColor = .lightGray
        timeOfTrip.text = "Дата и время поездки"
        timeOfTrip.font = .boldSystemFont(ofSize: 15)
        
        return timeOfTrip
    }()
    
    let timeOfTripValue: UILabel = {
        let timeOfTripValue = UILabel()
        timeOfTripValue.translatesAutoresizingMaskIntoConstraints = false
        timeOfTripValue.textColor = .black
        timeOfTripValue.text = "29 Август, 19:20"
        timeOfTripValue.font = .boldSystemFont(ofSize: 15)
        
        return timeOfTripValue
    }()
    
    let timeOfTravel: UILabel = {
        let timeOfTravel = UILabel()
        timeOfTravel.translatesAutoresizingMaskIntoConstraints = false
        timeOfTravel.textColor = .lightGray
        timeOfTravel.text = "Продолжительность поездки"
        timeOfTravel.font = .boldSystemFont(ofSize: 15)
        
        return timeOfTravel
    }()
    
    let timeOfTravelValue: UILabel = {
        let timeOfTravelValue = UILabel()
        timeOfTravelValue.translatesAutoresizingMaskIntoConstraints = false
        timeOfTravelValue.textColor = .black
        timeOfTravelValue.text = "00:45"
        timeOfTravelValue.font = .boldSystemFont(ofSize: 15)
        
        return timeOfTravelValue
    }()
    
    let costCalculationLabel: UILabel = {
        let costCalculationLabel = UILabel()
        costCalculationLabel.translatesAutoresizingMaskIntoConstraints = false
        costCalculationLabel.textColor = .black
        costCalculationLabel.text = "Расчёт стоимости"
        costCalculationLabel.font = .boldSystemFont(ofSize: 22)
        
        return costCalculationLabel
    }()
    
    let minAmount: UILabel = {
        let minAmount = UILabel()
        minAmount.translatesAutoresizingMaskIntoConstraints = false
        minAmount.textColor = .lightGray
        minAmount.text = "Минимальная сумма"
        minAmount.font = .boldSystemFont(ofSize: 15)
        
        return minAmount
    }()
    
    let minAmountValue: UILabel = {
        let minAmountValue = UILabel()
        minAmountValue.translatesAutoresizingMaskIntoConstraints = false
        minAmountValue.textColor = .black
        minAmountValue.text = "10,000 UZS"
        minAmountValue.font = .boldSystemFont(ofSize: 15)
        
        return minAmountValue
    }()
    
    let tripAmount: UILabel = {
        let tripAmount = UILabel()
        tripAmount.translatesAutoresizingMaskIntoConstraints = false
        tripAmount.textColor = .lightGray
        tripAmount.text = "Сумма поездки"
        tripAmount.font = .boldSystemFont(ofSize: 15)
        
        return tripAmount
    }()
    
    let tripAmountValue: UILabel = {
        let tripAmountValue = UILabel()
        tripAmountValue.translatesAutoresizingMaskIntoConstraints = false
        tripAmountValue.textColor = .black
        tripAmountValue.text = "31,645 UZS"
        tripAmountValue.font = .boldSystemFont(ofSize: 15)
        
        return tripAmountValue
    }()
    
    let amountOfWaitng: UILabel = {
        let amountOfWaitng = UILabel()
        amountOfWaitng.translatesAutoresizingMaskIntoConstraints = false
        amountOfWaitng.textColor = .lightGray
        amountOfWaitng.text = "Цена ожидании"
        amountOfWaitng.font = .boldSystemFont(ofSize: 15)
        
        return amountOfWaitng
    }()
    
    let amountOfWaitngValue: UILabel = {
        let amountOfWaitngValue = UILabel()
        amountOfWaitngValue.translatesAutoresizingMaskIntoConstraints = false
        amountOfWaitngValue.textColor = .black
        amountOfWaitngValue.text = "0 UZS"
        amountOfWaitngValue.font = .boldSystemFont(ofSize: 15)
        
        return amountOfWaitngValue
    }()
    
    let totalPrice: UILabel = {
        let totalPrice = UILabel()
        totalPrice.translatesAutoresizingMaskIntoConstraints = false
        totalPrice.textColor = .black
        totalPrice.text = "Итого"
        totalPrice.font = .boldSystemFont(ofSize: 24)
        
        return totalPrice
    }()
    
    let totalPriceValue: UILabel = {
        let totalPriceValue = UILabel()
        totalPriceValue.translatesAutoresizingMaskIntoConstraints = false
        totalPriceValue.textColor = .black
        totalPriceValue.text = "39,600 UZS"
        totalPriceValue.font = .boldSystemFont(ofSize: 24)
        
        return totalPriceValue
    }()
    
    
//    let btn: UIButton = {
//        let btn = UIButton()
//        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
//
//        return btn
//    }()
//
//    @objc func btnAction(){}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLayouts()
        
    }
    
    func setupLayouts(){
        
        view.addSubview(carInfoView)
        carInfoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        carInfoView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        carInfoView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        carInfoView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        carInfoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        
        
        view.addSubview(addressView)
        addressView.topAnchor.constraint(equalTo: carInfoView.bottomAnchor, constant: 10).isActive = true
        addressView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        addressView.rightAnchor.constraint(equalTo: view.rightAnchor , constant: -10).isActive = true
        addressView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        view.addSubview(horizontalBtnStack)
        horizontalBtnStack.topAnchor.constraint(equalTo: addressView.bottomAnchor , constant: 10).isActive = true
        horizontalBtnStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        horizontalBtnStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        horizontalBtnStack.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        view.addSubview(driverInfoView)
        driverInfoView.topAnchor.constraint(equalTo: horizontalBtnStack.bottomAnchor , constant: 5).isActive = true
        driverInfoView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        driverInfoView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        driverInfoView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(driverAccountView)
        driverAccountView.topAnchor.constraint(equalTo: driverInfoView.bottomAnchor).isActive = true
        driverAccountView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        driverAccountView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        driverAccountView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        view.addSubview(totalDataView)
        totalDataView.topAnchor.constraint(equalTo: driverAccountView.bottomAnchor , constant: 15).isActive = true
        totalDataView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        totalDataView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        totalDataView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(totalDataInfo)
        totalDataInfo.topAnchor.constraint(equalTo: totalDataView.bottomAnchor).isActive = true
        totalDataInfo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        totalDataInfo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        totalDataInfo.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        view.addSubview(costCalculationView)
        costCalculationView.topAnchor.constraint(equalTo: totalDataInfo.bottomAnchor).isActive = true
        costCalculationView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        costCalculationView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        costCalculationView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(costCalculationInfo)
        costCalculationInfo.topAnchor.constraint(equalTo: costCalculationView.bottomAnchor).isActive = true
        costCalculationInfo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        costCalculationInfo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        costCalculationInfo.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        carInfoView.addSubview(carNumberView)
        carNumberView.topAnchor.constraint(equalTo: carInfoView.topAnchor , constant: 15).isActive = true
        carNumberView.leftAnchor.constraint(equalTo: carInfoView.leftAnchor , constant: 10).isActive = true
        carNumberView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        carNumberView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        carNumberView.addSubview(carNumberLabel)
        carNumberLabel.topAnchor.constraint(equalTo: carNumberView.topAnchor).isActive = true
        carNumberLabel.leftAnchor.constraint(equalTo: carNumberView.leftAnchor).isActive = true
        carNumberLabel.rightAnchor.constraint(equalTo: carNumberView.rightAnchor).isActive = true
        carNumberLabel.bottomAnchor.constraint(equalTo: carNumberView.bottomAnchor).isActive = true
        
        
        carInfoView.addSubview(carTypeLabel)
        carTypeLabel.topAnchor.constraint(equalTo: carNumberView.bottomAnchor , constant: 5).isActive = true
        carTypeLabel.leftAnchor.constraint(equalTo: carInfoView.leftAnchor, constant: 10).isActive = true
        
        
        carInfoView.addSubview(line1)
        line1.topAnchor.constraint(equalTo: carTypeLabel.bottomAnchor , constant: 3).isActive = true
        line1.leftAnchor.constraint(equalTo: carInfoView.leftAnchor, constant: 5).isActive = true
        line1.rightAnchor.constraint(equalTo: carInfoView.rightAnchor, constant: -5).isActive = true
        line1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        carInfoView.addSubview(carImage)
        carImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        carImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        carImage.bottomAnchor.constraint(equalTo: line1.topAnchor, constant: -10).isActive = true
        carImage.rightAnchor.constraint(equalTo: carInfoView.rightAnchor , constant: -10).isActive = true

        
        addressView.addSubview(fromImage)
        fromImage.topAnchor.constraint(equalTo: addressView.topAnchor).isActive = true
        fromImage.leftAnchor.constraint(equalTo: addressView.leftAnchor).isActive = true
        fromImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        fromImage.widthAnchor.constraint(equalToConstant: 30).isActive = true

        
        addressView.addSubview(whereImage)
        whereImage.bottomAnchor.constraint(equalTo: addressView.bottomAnchor).isActive = true
        whereImage.leftAnchor.constraint(equalTo: addressView.leftAnchor).isActive = true
        whereImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        whereImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        addressView.addSubview(fromLabel)
        fromLabel.topAnchor.constraint(equalTo: addressView.topAnchor, constant: 3).isActive = true
        fromLabel.leftAnchor.constraint(equalTo: fromImage.rightAnchor, constant: 5).isActive = true
        fromLabel.rightAnchor.constraint(equalTo: addressView.rightAnchor).isActive = true

        
        addressView.addSubview(whereLabel)
        whereLabel.bottomAnchor.constraint(equalTo: addressView.bottomAnchor, constant: -5).isActive = true
        whereLabel.leftAnchor.constraint(equalTo: whereImage.rightAnchor, constant: 5).isActive = true
        whereLabel.rightAnchor.constraint(equalTo: addressView.rightAnchor).isActive = true
        

        horizontalBtnStack.addArrangedSubview(btnHelp)
        horizontalBtnStack.addArrangedSubview(btnRepeat)
        horizontalBtnStack.addArrangedSubview(btnCall)
        
        driverInfoView.addSubview(driverLabel)
        driverLabel.topAnchor.constraint(equalTo: driverInfoView.topAnchor, constant: 10).isActive = true
        driverLabel.leftAnchor.constraint(equalTo: driverInfoView.leftAnchor, constant: 10).isActive = true
        
        driverInfoView.addSubview(line2)
        line2.topAnchor.constraint(equalTo: driverLabel.bottomAnchor, constant: 5).isActive = true
        line2.leftAnchor.constraint(equalTo: driverInfoView.leftAnchor,constant: 5).isActive = true
        line2.rightAnchor.constraint(equalTo: driverInfoView.rightAnchor, constant: -5).isActive = true
        line2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        driverAccountView.addSubview(driverImage)
        driverImage.topAnchor.constraint(equalTo: driverAccountView.topAnchor, constant: 5).isActive = true
        driverImage.leftAnchor.constraint(equalTo: driverAccountView.leftAnchor, constant: 5).isActive = true
        driverImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        driverImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        driverAccountView.addSubview(driverName)
        driverName.topAnchor.constraint(equalTo: driverAccountView.topAnchor, constant: 10).isActive = true
        driverName.leftAnchor.constraint(equalTo: driverImage.rightAnchor, constant: 10).isActive = true
        
        
        driverAccountView.addSubview(ratingLabel)
        ratingLabel.topAnchor.constraint(equalTo: driverName.bottomAnchor, constant: 4).isActive = true
        ratingLabel.leftAnchor.constraint(equalTo: driverImage.rightAnchor, constant: 10).isActive = true
        
        driverAccountView.addSubview(ratingNumber)
        ratingNumber.topAnchor.constraint(equalTo: driverName.bottomAnchor, constant: 4).isActive = true
        ratingNumber.leftAnchor.constraint(equalTo: ratingLabel.rightAnchor).isActive = true
        
        driverAccountView.addSubview(ratingStar)
        ratingStar.topAnchor.constraint(equalTo: driverName.bottomAnchor, constant: 7).isActive = true
        ratingStar.leftAnchor.constraint(equalTo: ratingNumber.rightAnchor, constant: 3).isActive = true
        
        driverAccountView.addSubview(tripsLabel)
        tripsLabel.topAnchor.constraint(equalTo: driverName.bottomAnchor, constant: 4).isActive = true
        tripsLabel.leftAnchor.constraint(equalTo: ratingStar.rightAnchor, constant: 15).isActive = true
        
        driverAccountView.addSubview(tripsNumber)
        tripsNumber.topAnchor.constraint(equalTo: driverName.bottomAnchor, constant: 4).isActive = true
        tripsNumber.leftAnchor.constraint(equalTo: tripsLabel.rightAnchor).isActive = true
        
        totalDataView.addSubview(totalDataLabel)
        totalDataLabel.topAnchor.constraint(equalTo: totalDataView.topAnchor).isActive = true
        totalDataLabel.leftAnchor.constraint(equalTo: driverInfoView.leftAnchor, constant: 10).isActive = true
        
        totalDataView.addSubview(line3)
        line3.topAnchor.constraint(equalTo: totalDataLabel.bottomAnchor, constant: 5).isActive = true
        line3.leftAnchor.constraint(equalTo: totalDataView.leftAnchor,constant: 5).isActive = true
        line3.rightAnchor.constraint(equalTo: totalDataView.rightAnchor, constant: -5).isActive = true
        line3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        totalDataInfo.addSubview(rate)
        rate.topAnchor.constraint(equalTo: totalDataInfo.topAnchor, constant: 5).isActive = true
        rate.leftAnchor.constraint(equalTo: totalDataInfo.leftAnchor, constant: 10).isActive = true
        
        totalDataInfo.addSubview(rateType)
        rateType.topAnchor.constraint(equalTo: totalDataInfo.topAnchor, constant: 5).isActive = true
        rateType.rightAnchor.constraint(equalTo: totalDataInfo.rightAnchor, constant: -10).isActive = true
        
        totalDataInfo.addSubview(paymentMethod)
        paymentMethod.topAnchor.constraint(equalTo: rate.bottomAnchor, constant: 10).isActive = true
        paymentMethod.leftAnchor.constraint(equalTo: totalDataInfo.leftAnchor, constant: 10).isActive = true
        
        totalDataInfo.addSubview(paymentMethodType)
        paymentMethodType.topAnchor.constraint(equalTo: rate.bottomAnchor, constant: 10).isActive = true
        paymentMethodType.rightAnchor.constraint(equalTo: totalDataInfo.rightAnchor, constant: -10).isActive = true
        
        totalDataInfo.addSubview(moneyImage)
        moneyImage.topAnchor.constraint(equalTo: rate.bottomAnchor, constant: 8).isActive = true
        moneyImage.rightAnchor.constraint(equalTo: paymentMethodType.leftAnchor, constant: -10).isActive = true
        moneyImage.heightAnchor.constraint(equalToConstant: 22).isActive = true
        moneyImage.widthAnchor.constraint(equalToConstant: 22).isActive = true
        
        
        totalDataInfo.addSubview(orderNumber)
        orderNumber.topAnchor.constraint(equalTo: paymentMethodType.bottomAnchor, constant: 10).isActive = true
        orderNumber.leftAnchor.constraint(equalTo: totalDataInfo.leftAnchor, constant: 10).isActive = true
        
        totalDataInfo.addSubview(orderNumberValue)
        orderNumberValue.topAnchor.constraint(equalTo: paymentMethodType.bottomAnchor, constant: 10).isActive = true
        orderNumberValue.rightAnchor.constraint(equalTo: totalDataInfo.rightAnchor, constant: -10).isActive = true
        
        
        totalDataInfo.addSubview(timeOfTrip)
        timeOfTrip.topAnchor.constraint(equalTo: orderNumber.bottomAnchor, constant: 10).isActive = true
        timeOfTrip.leftAnchor.constraint(equalTo: totalDataInfo.leftAnchor, constant: 10).isActive = true
        
        totalDataInfo.addSubview(timeOfTripValue)
        timeOfTripValue.topAnchor.constraint(equalTo: orderNumber.bottomAnchor, constant: 10).isActive = true
        timeOfTripValue.rightAnchor.constraint(equalTo: totalDataInfo.rightAnchor, constant: -10).isActive = true
        
        
        totalDataInfo.addSubview(timeOfTravel)
        timeOfTravel.topAnchor.constraint(equalTo: timeOfTrip.bottomAnchor, constant: 10).isActive = true
        timeOfTravel.leftAnchor.constraint(equalTo: totalDataInfo.leftAnchor, constant: 10).isActive = true
        
        totalDataInfo.addSubview(timeOfTravelValue)
        timeOfTravelValue.topAnchor.constraint(equalTo: timeOfTrip.bottomAnchor, constant: 10).isActive = true
        timeOfTravelValue.rightAnchor.constraint(equalTo: totalDataInfo.rightAnchor, constant: -10).isActive = true
    
        costCalculationView.addSubview(costCalculationLabel)
        costCalculationLabel.topAnchor.constraint(equalTo: totalDataInfo.bottomAnchor,constant: 10).isActive = true
        costCalculationLabel.leftAnchor.constraint(equalTo: driverInfoView.leftAnchor, constant: 10).isActive = true

        costCalculationView.addSubview(line4)
        line4.topAnchor.constraint(equalTo: costCalculationLabel.bottomAnchor, constant: 5).isActive = true
        line4.leftAnchor.constraint(equalTo: costCalculationView.leftAnchor,constant: 5).isActive = true
        line4.rightAnchor.constraint(equalTo: costCalculationView.rightAnchor, constant: -5).isActive = true
        line4.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        costCalculationInfo.addSubview(minAmount)
        minAmount.topAnchor.constraint(equalTo: costCalculationInfo.topAnchor).isActive = true
        minAmount.leftAnchor.constraint(equalTo: costCalculationInfo.leftAnchor, constant: 10).isActive = true
        
        costCalculationInfo.addSubview(minAmountValue)
        minAmountValue.topAnchor.constraint(equalTo: costCalculationInfo.topAnchor).isActive = true
        minAmountValue.rightAnchor.constraint(equalTo: costCalculationInfo.rightAnchor, constant: -10).isActive = true
        
        costCalculationInfo.addSubview(tripAmount)
        tripAmount.topAnchor.constraint(equalTo: minAmount.bottomAnchor, constant: 10).isActive = true
        tripAmount.leftAnchor.constraint(equalTo: costCalculationInfo.leftAnchor, constant: 10).isActive = true
        
        costCalculationInfo.addSubview(tripAmountValue)
        tripAmountValue.topAnchor.constraint(equalTo: minAmount.bottomAnchor, constant: 10).isActive = true
        tripAmountValue.rightAnchor.constraint(equalTo: costCalculationInfo.rightAnchor, constant: -10).isActive = true
        
        costCalculationInfo.addSubview(amountOfWaitng)
        amountOfWaitng.topAnchor.constraint(equalTo: tripAmount.bottomAnchor, constant: 10).isActive = true
        amountOfWaitng.leftAnchor.constraint(equalTo: costCalculationInfo.leftAnchor, constant: 10).isActive = true
        
        costCalculationInfo.addSubview(amountOfWaitngValue)
        amountOfWaitngValue.topAnchor.constraint(equalTo: tripAmount.bottomAnchor, constant: 10).isActive = true
        amountOfWaitngValue.rightAnchor.constraint(equalTo: costCalculationInfo.rightAnchor, constant: -10).isActive = true


        costCalculationInfo.addSubview(line5)
        line5.topAnchor.constraint(equalTo: amountOfWaitng.bottomAnchor, constant: 15).isActive = true
        line5.leftAnchor.constraint(equalTo: costCalculationInfo.leftAnchor,constant: 5).isActive = true
        line5.rightAnchor.constraint(equalTo: costCalculationInfo.rightAnchor, constant: -5).isActive = true
        line5.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(totalPrice)
        totalPrice.topAnchor.constraint(equalTo: costCalculationInfo.bottomAnchor).isActive = true
        totalPrice.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        view.addSubview(totalPriceValue)
        totalPriceValue.topAnchor.constraint(equalTo: costCalculationInfo.bottomAnchor).isActive = true
        totalPriceValue.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
}
