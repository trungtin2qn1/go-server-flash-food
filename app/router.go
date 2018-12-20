package app

import (
	"flash-food/controller"
	"log"

	"github.com/gin-gonic/gin"
)

//InitRouter App Handler Start From Here
func InitRouter() {

	//gin.SetMode(gin.ReleaseMode)

	router := gin.Default()

	router.GET("/order_detail/order_id", controller.GetAllOrderDetail)
	router.GET("/order/all", controller.GetAllFreeOrder)
	router.GET("/store", controller.GetStoreInfoByID)
	router.PUT("/shipper", controller.UpdateShipper)
	router.GET("/shipper", controller.GetShipperByID)
	router.POST("/order_detail", controller.CreateOrderDetail)
	router.DELETE("/order_detail", controller.DeleteOrderDetail)
	router.PUT("/order_detail", controller.UpdateOrderDetail)
	router.GET("/order_detail", controller.GetOrderDetailByID)
	router.DELETE("/order", controller.DeleteOrder)
	router.PUT("/order", controller.UpdateOrder)
	router.POST("/order", controller.CreateOrder)
	router.GET("/order", controller.GetOrderInfoByID)
	router.GET("/customer", controller.GetCustomerInfoByID)
	if err := router.Run(":7020"); err != nil {
		log.Fatal(err)
	}

}
