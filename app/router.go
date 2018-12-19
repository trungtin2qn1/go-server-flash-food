package app

import (
	"flash-food/controller"
	"log"

	"github.com/gin-gonic/gin"
)

//InitRouter App Handler Start From Here
func InitRouter() {

	router := gin.Default()

	//router.POST("/shipper/:customer_id", controller.CreateOrderDetail)
	//router.DELETE("/shipper/:customer_id", controller.DeleteOrderDetail)
	router.PUT("/shipper/:shipper_id", controller.UpdateShipper)
	router.GET("/shipper/:shipper_id", controller.GetShipperByID)
	router.POST("/order_detail/:customer_id", controller.CreateOrderDetail)
	router.DELETE("/order_detail/:customer_id", controller.DeleteOrderDetail)
	router.PUT("/order_detail/:customer_id", controller.UpdateOrderDetail)
	router.GET("/order_detail/:order_detail_id", controller.GetOrderDetailByID)
	router.DELETE("/order/:customer_id", controller.DeleteOrder)
	router.PUT("/order/:customer_id", controller.UpdateOrder)
	router.POST("/order/:customer_id", controller.CreateOrder)
	router.GET("/order/:order_id", controller.GetOrderInfoByID)
	router.GET("/customer/:customer_id", controller.GetCustomerInfoByID)
	if err := router.Run(":7020"); err != nil {
		log.Fatal(err)
	}

}
