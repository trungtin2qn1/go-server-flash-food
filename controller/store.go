package controller

import (
	"flash-food/model"
	"flash-food/util"
	"fmt"

	"github.com/gin-gonic/gin"
)

//GetStoreInfoByID ...
func GetStoreInfoByID(c *gin.Context) {
	temp := c.Request.Header.Get("store_id")
	fmt.Println(temp)
	if temp == "" {
		c.JSON(403, gin.H{
			"message": "Data or data type is invalid",
		})
		return
	}
	storeID, err := util.ConvertStringToInt(temp)
	if err != nil {
		c.JSON(503, gin.H{
			"message": "Server is busy",
		})
		return
	}
	fmt.Println(storeID)
	storeInfo, err := model.GetStoreInfoByID(storeID)
	if err != nil && storeInfo.ID != 0 {
		c.JSON(406, gin.H{
			"message": "This customer is not available in database",
		})
		return
	}
	c.JSON(200, storeInfo)
}
