package controller

import (
	"flash-food/model"
	"flash-food/util"
	"fmt"

	"github.com/gin-gonic/gin"
)

//GetOrderDetailByID ...
func GetOrderDetailByID(c *gin.Context) {
	//token := c.Request.Header.Get("token")
	temp := c.Param("order_detail_id")
	if temp == "" {
		c.JSON(403, gin.H{
			"message": "Data or data type is invalid",
		})
		return
	}
	orderDetailID, e := util.ConvertStringToInt(temp)
	if e != nil {
		c.JSON(503, gin.H{
			"message": "Server is busy",
		})
		return
	}
	orderDetail, err := model.GetOrderDetailByID(orderDetailID)
	if err != nil {
		c.JSON(503, gin.H{
			"message": "Can't get order detail from database",
		})
		return
	}
	if orderDetail.ID == 0 {
		c.JSON(406, gin.H{
			"message": "This order detail is not available in database",
		})
		return
	}
	c.JSON(200, orderDetail)
}

//CreateOrderDetail ...
func CreateOrderDetail(c *gin.Context) {
	customerID := c.Param("customer_id")
	if customerID == "" {
		c.JSON(403, gin.H{
			"message": "This customer is not available",
		})
		return
	}
	var orderDetail model.OrderDetail
	err := c.ShouldBind(&orderDetail)
	if err != nil {
		fmt.Println(err)
		c.JSON(406, gin.H{
			"message": "Data or datatype is invalid",
		})
		return
	}
	newOrderDetail, err := model.CreateOrderDetail(orderDetail.CustomerID, orderDetail.Price, orderDetail.OrderID, orderDetail.Status, orderDetail.ProductID, orderDetail.Amount, orderDetail.Date)
	if err != nil {
		c.JSON(503, gin.H{
			"message": "Can't create this order detail",
		})
		return
	}
	c.JSON(200, newOrderDetail)
}

//UpdateOrderDetail ...
func UpdateOrderDetail(c *gin.Context) {
	customerID := c.Param("customer_id")
	if customerID == "" {
		c.JSON(403, gin.H{
			"message": "This customer is not available",
		})
		return
	}
	var newOrderDetail model.OrderDetail
	err := c.ShouldBind(&newOrderDetail)
	if err != nil {
		c.JSON(406, gin.H{
			"message": "Data or datatype is invalid",
		})
		return
	}
	orderDetail, err := model.GetOrderDetailByID(newOrderDetail.ID)
	if err != nil {
		c.JSON(503, gin.H{
			"message": "Can't create this order detail",
		})
		return
	}
	if orderDetail.ID == 0 {
		c.JSON(406, gin.H{
			"message": "This order detail is not available",
		})
		return
	}
	err = orderDetail.UpdateOrderDetail(newOrderDetail)
	if err != nil {
		c.JSON(503, gin.H{
			"message": "Can't update order detail",
		})
		return
	}
	c.JSON(200, newOrderDetail)
}

//DeleteOrderDetail ...
func DeleteOrderDetail(c *gin.Context) {
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
	orderDetailID := helpers.OrderDetailID
	orderDetail, err := model.GetOrderInfoByID(orderDetailID)
	if err != nil && orderDetail.ID != 0 {
		c.JSON(503, gin.H{
			"message": "Can't get order detail from database",
		})
		return
	}
	if orderDetail.ID == 0 {
		c.JSON(403, gin.H{
			"message": "This order detail is not in database",
		})
		return
	}
	err = orderDetail.DeleteOrder()
	if err != nil {
		c.JSON(503, gin.H{
			"message": "Can't delete this order detail",
		})
		return
	}
	c.JSON(200, gin.H{
		"message": "Success",
	})
}
