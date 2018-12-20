package controller

import (
	"flash-food/model"
	"flash-food/util"

	"github.com/gin-gonic/gin"
)

//GetCustomerInfoByID ...
func GetCustomerInfoByID(c *gin.Context) {
	temp := c.Query("customer_id")
	if temp == "" {
		c.JSON(403, gin.H{
			"message": "Data or data type is invalid",
		})
		return
	}
	customerID, err := util.ConvertStringToInt(temp)
	if err != nil {
		c.JSON(503, gin.H{
			"message": "Server is busy",
		})
		return
	}
	customerInfo, err := model.GetCustomerInfoByID(customerID)
	if err != nil && customerInfo.ID != 0 {
		c.JSON(406, gin.H{
			"message": "This customer is not available in database",
		})
		return
	}
	c.JSON(200, customerInfo)
}
