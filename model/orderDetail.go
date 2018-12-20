package model

import (
	"flash-food/database"
)

//OrderDetail ...
type OrderDetail struct {
	ID         int    `json:"id"`
	ProductID  int    `json:"product_id, omitempty" gorm:"column:productId"`
	OrderID    int    `json:"order_id, omitempty" gorm:"column:orderId"`
	CustomerID int    `json:"customer_id, omitempty" gorm:"column:customerId"`
	Price      string `json:"price, omitempty" gorm:"text"`
	Status     int    `json:"status, omitempty" gorm:"tinyint(1)"`
	Amount     int    `json:"amount, omitempty" gorm:"column:amount"`
	Date       string `json:"date, omitempty" gorm:"datetime"`
}

//GetOrderDetailsByOrderID ...
func GetOrderDetailsByOrderID(orderID int) ([]OrderDetail, error) {
	var orderDetail []OrderDetail
	db := database.GetDB()
	res := db.Where("orderId = ?", orderID).Find(&orderDetail)
	if res.Error != nil {
		return orderDetail, res.Error
	}
	return orderDetail, nil
}

//GetOrderDetailByID ...
func GetOrderDetailByID(orderDetailID int) (OrderDetail, error) {
	var orderDetail OrderDetail
	db := database.GetDB()
	res := db.Where("id = ?", orderDetailID).Find(&orderDetail)
	if res.Error != nil {
		return orderDetail, res.Error
	}
	return orderDetail, nil
}

//UpdateOrderDetail ...
func (orderDetail *OrderDetail) UpdateOrderDetail(temp OrderDetail) error {
	orderDetail.ProductID = temp.ProductID
	orderDetail.Status = temp.Status
	orderDetail.Price = temp.Price
	orderDetail.OrderID = temp.OrderID
	orderDetail.Date = temp.Date
	orderDetail.CustomerID = temp.CustomerID
	orderDetail.Amount = temp.Amount
	return orderDetail.updateAllField(temp)
}

//UpdateOrderDetailElement 1 element
func (orderDetail *OrderDetail) UpdateOrderDetailElement(field string, value string) error {
	return orderDetail.updateField(field, value)
}

//Update 1 field of order_details table
func (orderDetail *OrderDetail) updateField(field string, value string) error {
	db := database.GetDB()
	res := db.Model(&orderDetail).Where("id = ?", orderDetail.ID).Update(field, value)
	if res.Error != nil {
		return res.Error
	}
	return nil
}

//Update all field of order_details table
func (orderDetail *OrderDetail) updateAllField(updateOrderDetail OrderDetail) error {
	db := database.GetDB()
	res := db.Model(&orderDetail).Where("id = ?", orderDetail.ID).Updates(updateOrderDetail)
	if res.Error != nil {
		//log.Fatal(res.Error)
		return res.Error
	}
	return nil
}

//Create order detail to Db
func (orderDetail *OrderDetail) create() error {
	db := database.GetDB()
	res := db.Create(&orderDetail)
	if res.Error != nil {
		//log.Fatal(res.Error)
		return res.Error
	}
	return nil
}

//CreateOrderDetail ....
func CreateOrderDetail(customerID int, price string, orderID int, status int, productID int, amount int, date string) (OrderDetail, error) {
	var orderDetail OrderDetail
	orderDetail.CustomerID = customerID
	orderDetail.OrderID = orderID
	orderDetail.ProductID = productID
	orderDetail.Status = status
	orderDetail.Amount = amount
	orderDetail.Date = date
	orderDetail.Price = price
	err := orderDetail.create()
	if err != nil {
		//log.Fatal(err)
		return orderDetail, err
	}
	return orderDetail, nil
}

//Delete order detail from Db
func (orderDetail *OrderDetail) delete() error {
	db := database.GetDB()
	res := db.Where("id = ?", orderDetail.ID).Delete(&orderDetail)
	if res.Error != nil {
		//log.Fatal(res.Error)
		return res.Error
	}
	return nil
}

//DeleteOrderDetail ...
func (orderDetail *OrderDetail) DeleteOrderDetail() error {
	return orderDetail.delete()
}
