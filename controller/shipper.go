package controller

import (
	"flash-food/model"
	"flash-food/util"
	"fmt"

	"github.com/gin-gonic/gin"
)

//GetShipperByID ...
func GetShipperByID(c *gin.Context) {
	//token := c.Request.Header.Get("token")
	temp := c.Request.Header.Get("shipper_id")
	if temp == "" {
		c.JSON(403, gin.H{
			"message": "Data or data type is invalid",
		})
		return
	}
	shipperID, e := util.ConvertStringToInt(temp)
	if e != nil {
		c.JSON(503, gin.H{
			"message": "Server is busy",
		})
		return
	}
	shipper, err := model.GetShipperInfoByID(shipperID)
	if err != nil && shipper.ID != 0 {
		c.JSON(503, gin.H{
			"message": "Can't get shipper info from database",
		})
		return
	}
	if shipper.ID == 0 {
		c.JSON(406, gin.H{
			"message": "This shipper is not available in database",
		})
		return
	}
	c.JSON(200, shipper)
}

//CreateShipper ...
func CreateShipper(c *gin.Context) {
	var shipper model.Shipper
	err := c.ShouldBind(&shipper)
	if err != nil {
		c.JSON(406, gin.H{
			"message": "Data or datatype is invalid",
		})
		return
	}
	newShipper, err := model.CreateShipper(shipper.Avatar, shipper.Status, shipper.Phone, shipper.UserName, shipper.Password, shipper.Name)
	if err != nil {
		c.JSON(503, gin.H{
			"message": "Can't create this shipper",
		})
		return
	}
	c.JSON(200, newShipper)
}

//UpdateShipper ...
func UpdateShipper(c *gin.Context) {
	// shipperID := c.Param("shipper_id")
	// if shipperID == "" {
	// 	c.JSON(403, gin.H{
	// 		"message": "This customer is not available",
	// 	})
	// 	return
	// }
	var newShipper model.Shipper
	err := c.ShouldBind(&newShipper)
	fmt.Println(newShipper)
	if err != nil {
		fmt.Println(err)
		c.JSON(406, gin.H{
			"message": "Data or datatype is invalid",
		})
		return
	}
	fmt.Println(newShipper)
	shipper, err := model.GetShipperInfoByID(newShipper.ID)
	if err != nil && shipper.ID != 0 {
		c.JSON(503, gin.H{
			"message": "Can't get old shipper info",
		})
		return
	}
	if shipper.ID == 0 {
		c.JSON(406, gin.H{
			"message": "This shipper is not available",
		})
		return
	}
	err = shipper.UpdateShipperInfo(newShipper)
	if err != nil {
		c.JSON(503, gin.H{
			"message": "Can't update shipper",
		})
		return
	}
	fmt.Println(newShipper)
	c.JSON(200, newShipper)
}

//DeleteShipper ...
func DeleteShipper(c *gin.Context) {
	//order_id
	var helpers model.Helpers
	err := c.ShouldBind(&helpers)
	if err != nil {
		c.JSON(406, gin.H{
			"message": "Data or data type is invalid",
		})
		return
	}
	shipperID := helpers.ShipperID
	shipper, err := model.GetShipperInfoByID(shipperID)
	if err != nil && shipper.ID != 0 {
		c.JSON(503, gin.H{
			"message": "Can't get shipper from database",
		})
		return
	}
	if shipper.ID == 0 {
		c.JSON(403, gin.H{
			"message": "This shipper is not in database",
		})
		return
	}
	err = shipper.DeleteShipper()
	if err != nil {
		c.JSON(503, gin.H{
			"message": "Can't delete this shipper",
		})
		return
	}
	c.JSON(200, gin.H{
		"message": "Success",
	})
}
