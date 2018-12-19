package controller

import (
	"flash-food/model"
	"flash-food/util"
	"fmt"

	"github.com/gin-gonic/gin"
)

//GetOrderInfoByID ...
func GetOrderInfoByID(c *gin.Context) {
	//token := c.Request.Header.Get("token")
	temp := c.Query("order_id")
	if temp == "" {
		c.JSON(403, gin.H{
			"message": "Data or data type is invalid",
		})
		return
	}
	orderID, e := util.ConvertStringToInt(temp)
	if e != nil {
		c.JSON(503, gin.H{
			"message": "Server is busy",
		})
		return
	}
	orderInfo, err := model.GetOrderInfoByID(orderID)
	if err != nil {
		c.JSON(503, gin.H{
			"message": "Can't get order info from database",
		})
		return
	}
	if orderInfo.ID == 0 {
		c.JSON(406, gin.H{
			"message": "This order info is not available in database",
		})
		return
	}
	c.JSON(200, orderInfo)
}

//CreateOrder ...
func CreateOrder(c *gin.Context) {
	customerID := c.Param("customer_id")
	if customerID == "" {
		c.JSON(403, gin.H{
			"message": "This customer is not available",
		})
		return
	}
	var order model.Order
	err := c.ShouldBind(&order)
	if err != nil {
		fmt.Println(err)
		c.JSON(406, gin.H{
			"message": "Data or datatype is invalid",
		})
		return
	}
	orderInfo, err := model.CreateOrder(order.CustomerID, order.SumPrice, order.StoreID, order.Status, order.ShipperID, order.Phone, order.AddressCustomer, order.Date)
	if err != nil {
		c.JSON(503, gin.H{
			"message": "Can't create this order",
		})
		return
	}
	c.JSON(200, orderInfo)
}

//UpdateOrder ...
func UpdateOrder(c *gin.Context) {
	customerID := c.Param("customer_id")
	if customerID == "" {
		c.JSON(403, gin.H{
			"message": "This customer is not available",
		})
		return
	}
	var newOrder model.Order
	err := c.ShouldBind(&newOrder)
	if err != nil {
		c.JSON(406, gin.H{
			"message": "Data or datatype is invalid",
		})
		return
	}
	orderInfo, err := model.GetOrderInfoByID(newOrder.ID)
	if err != nil {
		c.JSON(503, gin.H{
			"message": "Can't create this order",
		})
		return
	}
	if orderInfo.ID == 0 {
		c.JSON(406, gin.H{
			"message": "This order is not available",
		})
		return
	}
	err = orderInfo.UpdateOrderInfo(newOrder)
	if err != nil {
		c.JSON(503, gin.H{
			"message": "Can't update order info",
		})
		return
	}
	c.JSON(200, newOrder)
}

//DeleteOrder ...
func DeleteOrder(c *gin.Context) {
	customerID := c.Param("customer_id")
	if customerID == "" {
		c.JSON(403, gin.H{
			"message": "Data or data type is invalid",
		})
		return
	}
	//order_id
	var helpers model.Helpers
	err := c.ShouldBind(&helpers)
	if err != nil {
		c.JSON(406, gin.H{
			"message": "Data or data type is invalid",
		})
		return
	}
	orderID := helpers.OrderID
	orderInfo, err := model.GetOrderInfoByID(orderID)
	if err != nil && orderInfo.ID != 0 {
		c.JSON(503, gin.H{
			"message": "Can't get order info from database",
		})
		return
	}
	if orderInfo.ID == 0 {
		c.JSON(403, gin.H{
			"message": "This order is not in database",
		})
		return
	}
	err = orderInfo.DeleteOrder()
	if err != nil {
		c.JSON(503, gin.H{
			"message": "Can't delete this order",
		})
		return
	}
	c.JSON(200, gin.H{
		"message": "Success",
	})
}
