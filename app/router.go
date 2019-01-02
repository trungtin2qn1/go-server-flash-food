package app

import (
	"flash-food/controller"
	"fmt"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/gorilla/websocket"
)

var wsupgrader = websocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
}

func wsTestHandler(w http.ResponseWriter, r *http.Request) {
	conn, err := wsupgrader.Upgrade(w, r, nil)
	if err != nil {
		fmt.Println("Failed to set websocket upgrade: %+v", err)
		return
	}

	for {
		t, msg, err := conn.ReadMessage()
		if err != nil {
			break
		}
		conn.WriteMessage(t, msg)
	}
}

func wshandler(w http.ResponseWriter, r *http.Request) {
	conn, err := wsupgrader.Upgrade(w, r, nil)
	if err != nil {
		fmt.Println("Failed to set websocket upgrade: %+v", err)
		return
	}

	for {
		t, msg, err := conn.ReadMessage()
		if err != nil {
			break
		}
		conn.WriteMessage(t, msg)
	}
}

//InitRouter App Handler Start From Here
func InitRouter() {

	//gin.SetMode(gin.ReleaseMode)

	router := gin.Default()

	router.LoadHTMLFiles("index.html")

	router.GET("/", func(c *gin.Context) {
		c.HTML(200, "index.html", nil)
	})

	router.GET("/ws", func(c *gin.Context) {
		wshandler(c.Writer, c.Request)
	})

	router.GET("/test", func(c *gin.Context) {
		wsTestHandler(c.Writer, c.Request)
	})

	router.DELETE("/confirm_order", controller.ConfirmOrder)
	router.PUT("/reject_order", controller.RejectOrder)
	router.PUT("/pick_order", controller.PickOrder)
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
