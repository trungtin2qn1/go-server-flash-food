package model

import (
	"flash-food/database"
	"flash-food/util"
	"time"
)

type OrderTemp struct {
	ID              string    `json:"id"`
	CustomerID      string    `json:"customer_id, omitempty" gorm:"column:customerId"`
	ShipperID       string    `json:"shipper_id, omitempty" gorm:"column:shipperId"`
	Date            time.Time `json:"date, omitempty" gorm:"datetime"`
	Status          string    `json:"status, omitempty" gorm:"tinyint(1)"`
	SumPrice        string    `json:"sum_price, omitempty" gorm:"text"`
	AddressCustomer string    `json:"address_customer, omitempty" gorm:"text"`
	Phone           string    `json:"phone, omitempty" gorm:"text"`
	StoreID         string    `json:"store_id, omitempty" gorm:"column:storeId"`
}

func (order *Order) convertJSONToOrder() OrderTemp {
	var orderTemp OrderTemp
	orderTemp.ID = util.ConvertIntToString(order.ID)
	orderTemp.Date = order.Date
	orderTemp.Phone = order.Phone
	orderTemp.Status = util.ConvertIntToString(order.Status)
	orderTemp.SumPrice = order.SumPrice
	orderTemp.StoreID = util.ConvertIntToString(order.StoreID)
	orderTemp.ShipperID = util.ConvertIntToString(order.ShipperID)
	orderTemp.AddressCustomer = order.AddressCustomer
	orderTemp.CustomerID = util.ConvertIntToString(order.CustomerID)
	return orderTemp
}

//Order ...
type Order struct {
	ID              int       `json:"id"`
	CustomerID      int       `json:"customer_id, omitempty" gorm:"column:customerId"`
	ShipperID       int       `json:"shipper_id, omitempty" gorm:"column:shipperId"`
	Date            time.Time `json:"date, omitempty" gorm:"datetime"`
	Status          int       `json:"status, omitempty" gorm:"tinyint(1)"`
	SumPrice        string    `json:"sum_price, omitempty" gorm:"text"`
	AddressCustomer string    `json:"address_customer, omitempty" gorm:"text"`
	Phone           string    `json:"phone, omitempty" gorm:"text"`
	StoreID         int       `json:"store_id, omitempty" gorm:"column:storeId"`
}

//GetOrderInfoByID ...
func GetOrderInfoByID(orderID int) (Order, error) {
	var order Order
	db := database.GetDB()
	res := db.Where("id = ?", orderID).Find(&order)
	if res.Error != nil {
		return order, res.Error
	}
	return order, nil
}

//UpdateOrderInfo ...
func (order *Order) UpdateOrderInfo(temp Order) error {
	order.AddressCustomer = temp.AddressCustomer
	order.CustomerID = temp.CustomerID
	order.Date = temp.Date
	order.Phone = temp.Phone
	order.ShipperID = temp.ShipperID
	order.Status = temp.Status
	order.StoreID = temp.StoreID
	order.SumPrice = temp.SumPrice
	return order.updateAllField(temp)
}

//UpdateOrderElement 1 element
func (order *Order) UpdateOrderElement(field string, value string) error {
	return order.updateField(field, value)
}

//Update 1 field of orders table
func (order *Order) updateField(field string, value string) error {
	db := database.GetDB()
	res := db.Model(&order).Where("id = ?", order.ID).Update(field, value)
	if res.Error != nil {
		//log.Fatal(res.Error)
		return res.Error
	}
	return nil
}

//Update all field of orders table
func (order *Order) updateAllField(updateOrder Order) error {
	db := database.GetDB()
	res := db.Model(&order).Where("id = ?", order.ID).Updates(updateOrder)
	if res.Error != nil {
		//log.Fatal(res.Error)
		return res.Error
	}
	return nil
}

//Create order info to Db
func (order *Order) create() error {
	db := database.GetDB()
	res := db.Create(&order)
	if res.Error != nil {
		//log.Fatal(res.Error)
		return res.Error
	}
	return nil
}

//CreateOrder ....
func CreateOrder(customerID int, sumPrice string, storeID int, status int, shipperID int, phone string, addressCustomer string, date time.Time) (Order, error) {
	var order Order
	order.CustomerID = customerID
	order.SumPrice = sumPrice
	order.StoreID = storeID
	order.Status = status
	order.ShipperID = shipperID
	order.Phone = phone
	order.Date = date
	order.AddressCustomer = addressCustomer
	err := order.create()
	if err != nil {
		//log.Fatal(err)
		return order, err
	}
	return order, nil
}

//Delete order info from Db
func (order *Order) delete() error {
	db := database.GetDB()
	res := db.Where("id = ?", order.ID).Delete(&order)
	if res.Error != nil {
		//log.Fatal(res.Error)
		return res.Error
	}
	return nil
}

//DeleteOrder ...
func (order *Order) DeleteOrder() error {
	orderDetails, err := GetOrderDetailsByOrderID(order.ID)
	if err != nil && orderDetails[0].ID == 0 {
		return err
	}
	for i := 0; i < len(orderDetails); i++ {
		orderDetails[i].DeleteOrderDetail()
	}

	return order.delete()
}
