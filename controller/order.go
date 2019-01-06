package controller

import (
	"flash-food/model"
	"flash-food/util"
	"fmt"

	"github.com/gin-gonic/gin"
)

//PickOrder ...
func PickOrder(c *gin.Context) {
	var helpers model.Helpers
	fmt.Println(helpers)
	err := c.ShouldBind(&helpers)
	fmt.Println(helpers)
	if err != nil {
		fmt.Println("Data or data type is invalid")
		c.JSON(403, gin.H{
			"message": "Data or data type is invalid",
		})
		return
	}
	orderID := helpers.OrderID
	orderInfo, err := model.GetOrderInfoByID(orderID)
	if err != nil {
		fmt.Println("Can't get order info from database")
		c.JSON(503, gin.H{
			"message": "Can't get order info from database",
		})
		return
	}
	if orderInfo.ID == 0 {
		fmt.Println("This order info is not available in database")
		c.JSON(406, gin.H{
			"message": "This order info is not available in database",
		})
		return
	}

	shipper, err := model.GetShipperInfoByID(helpers.ShipperID)
	if err != nil && shipper.ID != 0 {
		fmt.Println("Can't get shipper from database")
		c.JSON(503, gin.H{
			"message": "Can't get shipper from database",
		})
		return
	}

	if shipper.ID == 0 {
		fmt.Println("This shipper is not in database")
		c.JSON(406, gin.H{
			"message": "This shipper is not in database",
		})
		return
	}

	if shipper.Status == 1 {
		fmt.Println("This shipper is having an order")
		c.JSON(406, gin.H{
			"message": "This shipper is having an order",
		})
		return
	}

	if orderInfo.Status == 1 {
		fmt.Println("This order has been ordered")
		c.JSON(406, gin.H{
			"message": "This order has been ordered",
		})
		return
	}

	orderInfo.Status = 1
	orderInfo.ShipperID = helpers.ShipperID
	//orderInfo.UpdateOrderElement()
	err = orderInfo.UpdateOrderInfo(orderInfo)
	if err != nil {
		fmt.Println("Can't update order info")
		c.JSON(406, gin.H{
			"message": "Can't update order info",
		})
		return
	}
	err = shipper.UpdateShipperStatus(1)
	if err != nil {
		fmt.Println("Can't update shipper info")
		c.JSON(503, gin.H{
			"message": "Can't update shipper info",
		})
		return
	}

	fmt.Println(shipper)

	c.JSON(200, gin.H{
		"message": "Success",
	})
}

//ConfirmOrder ...
func ConfirmOrder(c *gin.Context) {
	var helpers model.Helpers
	err := c.ShouldBind(&helpers)
	fmt.Println(helpers)
	if err != nil {
		fmt.Println("Data or data type is invalid")
		c.JSON(403, gin.H{
			"message": "Data or data type is invalid",
		})
		return
	}
	orderID := helpers.OrderID
	fmt.Println(orderID)
	orderInfo, err := model.GetOrderInfoByID(orderID)
	if err != nil && orderInfo.ID != 0 {
		fmt.Println("Can't get order info from database")
		c.JSON(503, gin.H{
			"message": "Can't get order info from database",
		})
		return
	}
	if orderInfo.ID == 0 {
		fmt.Println("This order info is not available in database")
		c.JSON(406, gin.H{
			"message": "This order info is not available in database",
		})
		return
	}

	if orderInfo.Status == 0 {
		fmt.Println("This order has not been ordered")
		c.JSON(406, gin.H{
			"message": "This order has not been ordered",
		})
		return
	}

	shipper, err := model.GetShipperInfoByID(helpers.ShipperID)
	if err != nil && shipper.ID != 0 {
		fmt.Println("Can't get shipper info from database")
		c.JSON(503, gin.H{
			"message": "Can't get shipper info from database",
		})
		return
	}

	if shipper.ID == 0 {
		fmt.Println("This shipper is not in database")
		c.JSON(406, gin.H{
			"message": "This shipper is not in database",
		})
		return
	}

	if shipper.Status != 1 {
		fmt.Println("This shipper is not having any orders")
		c.JSON(406, gin.H{
			"message": "This shipper is not having any orders",
		})
		return
	}

	fmt.Println(orderInfo)

	err = orderInfo.UpdateOrderStatus(2)
	if err != nil {
		fmt.Println("Can't update order info")
		c.JSON(503, gin.H{
			"message": "Can't update order info",
		})
		return
	}
	fmt.Println(orderInfo)

	err = shipper.UpdateShipperStatus(0)
	if err != nil {
		fmt.Println("Can't update shipper info")
		c.JSON(503, gin.H{
			"message": "Can't update shipper info",
		})
		return
	}
	fmt.Println(shipper)

	c.JSON(200, gin.H{
		"message": "Success",
	})
}

//RejectOrder ...
func RejectOrder(c *gin.Context) {
	var helpers model.Helpers
	err := c.ShouldBind(&helpers)
	fmt.Println(helpers)
	if err != nil {
		fmt.Println("Data or data type is invalid")
		c.JSON(403, gin.H{
			"message": "Data or data type is invalid",
		})
		return
	}
	orderID := helpers.OrderID
	orderInfo, err := model.GetOrderInfoByID(orderID)
	if err != nil {
		fmt.Println("Can't get order info from database")
		c.JSON(503, gin.H{
			"message": "Can't get order info from database",
		})
		return
	}
	if orderInfo.ID == 0 {
		fmt.Println("This order info is not available in database")
		c.JSON(406, gin.H{
			"message": "This order info is not available in database",
		})
		return
	}

	if orderInfo.Status == 0 {
		fmt.Println("This order has not been ordered")
		c.JSON(406, gin.H{
			"message": "This order has not been ordered",
		})
		return
	}

	shipper, err := model.GetShipperInfoByID(helpers.ShipperID)
	if err != nil && shipper.ID != 0 {
		fmt.Println("Can't get shipper info from database")
		c.JSON(503, gin.H{
			"message": "Can't get shipper info from database",
		})
		return
	}

	fmt.Println(shipper)

	if shipper.ID == 0 {
		fmt.Println("This shipper is not in database")
		c.JSON(406, gin.H{
			"message": "This shipper is not in database",
		})
		return
	}

	if shipper.Status != 1 {
		fmt.Println("This shipper is not having any orders")
		c.JSON(406, gin.H{
			"message": "This shipper is not having any orders",
		})
		return
	}

	err = orderInfo.UpdateOrderStatus(0)
	if err != nil {
		fmt.Println("Can't update order info")
		c.JSON(503, gin.H{
			"message": "Can't update order info",
		})
		return
	}
	fmt.Println(orderInfo)

	err = shipper.UpdateShipperStatus(0)
	if err != nil {
		fmt.Println("Can't update shipper info")
		c.JSON(503, gin.H{
			"message": "Can't update shipper info",
		})
		return
	}

	c.JSON(200, gin.H{
		"message": "Success",
	})
}

//GetAllFreeOrder ...
func GetAllFreeOrder(c *gin.Context) {
	orders, err := model.GetAllFreeOrder()
	if err != nil && len(orders) != 0 {
		c.JSON(503, gin.H{
			"message": "Can't get orders from database",
		})
		return
	}
	type FreeOrder struct {
		OrderID      int    `json:"order_id, omitempty"`
		From         string `json:"from, omitempty"`
		To           string `json:"to, omitempty"`
		CustomerName string `json:"customer_name, omitempty"`
		StoreName    string `json:"store_name, omitempty"`
	}
	type FreeOrders struct {
		FreeOrders []FreeOrder `json:"free_orders, omitempty"`
	}
	var freeOrders []FreeOrder
	for i := 0; i < len(orders); i++ {
		var freeOrder FreeOrder
		freeOrder.OrderID = orders[i].ID
		store, err := model.GetStoreInfoByID(orders[i].StoreID)
		if err != nil && store.ID != 0 {
			c.JSON(503, gin.H{
				"message": "Can't get order from database",
			})
			return
		}
		freeOrder.From = store.Street + " " + store.District + " " + store.City
		freeOrder.StoreName = store.Name
		customer, err := model.GetCustomerInfoByID(orders[i].CustomerID)
		if err != nil && customer.ID != 0 {
			c.JSON(503, gin.H{
				"message": "Can't get order from database",
			})
			return
		}
		freeOrder.To = orders[i].AddressCustomer
		freeOrder.CustomerName = customer.Name
		freeOrders = append(freeOrders, freeOrder)
	}
	var res FreeOrders
	res.FreeOrders = freeOrders
	fmt.Println(res)
	c.JSON(200, res)
}

//GetOrderInfoByID ...
func GetOrderInfoByID(c *gin.Context) {
	//token := c.Request.Header.Get("token")
	temp := c.Request.Header.Get("order_id")
	if temp == "" {
		fmt.Println("Data or data type is invalid")
		c.JSON(403, gin.H{
			"message": "Data or data type is invalid",
		})
		return
	}
	orderID, e := util.ConvertStringToInt(temp)
	if e != nil {
		fmt.Println("Server is busy")
		c.JSON(503, gin.H{
			"message": "Server is busy",
		})
		return
	}
	orderInfo, err := model.GetOrderInfoByID(orderID)
	if err != nil && orderInfo.ID != 0 {
		fmt.Println("Can't get order info from database")
		c.JSON(503, gin.H{
			"message": "Can't get order info from database",
		})
		return
	}
	if orderInfo.ID == 0 {
		fmt.Println("This order info is not available in database")
		c.JSON(406, gin.H{
			"message": "This order info is not available in database",
		})
		return
	}
	c.JSON(200, orderInfo)
}

//CreateOrder ...
func CreateOrder(c *gin.Context) {
	// customerID := c.Query("customer_id")
	// if customerID == "" {
	// 	c.JSON(403, gin.H{
	// 		"message": "This customer is not available",
	// 	})
	// 	return
	// }
	var order model.Order
	err := c.ShouldBind(&order)
	fmt.Println(order)
	if err != nil {
		fmt.Println(err)
		c.JSON(406, gin.H{
			"message": "Data or datatype is invalid",
		})
		return
	}
	orderInfo, err := model.CreateOrder(order.CustomerID, order.SumPrice, order.StoreID, order.Status, order.ShipperID, order.Phone, order.AddressCustomer, order.Date, order.PromotionCode, order.Rate)
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
	// customerID := c.Param("customer_id")
	// if customerID == "" {
	// 	c.JSON(403, gin.H{
	// 		"message": "This customer is not available",
	// 	})
	// 	return
	// }
	var newOrder model.Order
	err := c.ShouldBind(&newOrder)
	if err != nil {
		c.JSON(406, gin.H{
			"message": "Data or datatype is invalid",
		})
		return
	}
	orderInfo, err := model.GetOrderInfoByID(newOrder.ID)
	if err != nil && orderInfo.ID != 0 {
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
	// customerID := c.Param("customer_id")
	// if customerID == "" {
	// 	c.JSON(403, gin.H{
	// 		"message": "Data or data type is invalid",
	// 	})
	// 	return
	// }
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
	fmt.Println(orderID)
	orderInfo, err := model.GetOrderInfoByID(orderID)
	if err != nil && orderInfo.ID != 0 {
		c.JSON(503, gin.H{
			"message": "Can't get order info from database",
		})
		return
	}
	fmt.Println(orderInfo)
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
