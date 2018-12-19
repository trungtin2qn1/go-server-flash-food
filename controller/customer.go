package controller

import (
	"flash-food/model"

	"github.com/gin-gonic/gin"
)

//GetCustomerInfoByID ...
func GetCustomerInfoByID(c *gin.Context) {
	customerID := c.Param("customer_id")
	if customerID == "" {
		c.JSON(403, gin.H{
			"message": "Data or data type is invalid",
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
