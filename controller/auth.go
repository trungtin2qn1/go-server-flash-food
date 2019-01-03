package controller

import (
	"flash-food/model"
	"fmt"

	"github.com/gin-gonic/gin"
)

//SignIn ...
func SignIn(c *gin.Context) {
	var test model.Shipper
	err := c.ShouldBind(&test)
	fmt.Println(test)
	if err != nil {
		fmt.Println("Data or data type is invalid")
		c.JSON(403, gin.H{
			"message": "Data or data type is invalid",
		})
		return
	}
	shipper, err := model.GetShipperInfoByUserName(test.UserName)
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
	if shipper.Password != test.Password {
		c.JSON(406, gin.H{
			"message": "Your password is wrong",
		})
		return
	}
	c.JSON(200, shipper)
}

//SignUp ...
func SignUp(c *gin.Context) {
	var test model.Shipper
	err := c.ShouldBind(&test)
	if err != nil {
		fmt.Println("Data or data type is invalid")
		c.JSON(403, gin.H{
			"message": "Data or data type is invalid",
		})
		return
	}
	shipper, err := model.CreateShipper("", 0, "", test.UserName, test.Password, "")
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
	c.JSON(200, shipper)
}
