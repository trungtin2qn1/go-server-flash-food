package model

import "flash-food/database"

type Product struct {
	ID          int    `json:"id"`
	Name        string `json:"name, omitempty" gorm:"text"`
	Price       string `json:"price, omitempty" gorm:"text"`
	StoreID     int    `json:"store_id, omitempty" gorm:"column:storeId"`
	Description string `json:"description, omitempty" gorm:"text"`
	Avatar      string `json:"avatar, omitempty" gorm:"text"`
	Type        string `json:"type, omitempty" gorm:"text"`
	Amount      int    `json:"amount, omitempty" gorm:"column:amount"`
}

//GetProductByID ...
func GetProductByID(productID int) (Product, error) {
	var product Product
	db := database.GetDB()
	res := db.Where("id = ?", productID).Find(&product)
	if res.Error != nil {
		return product, res.Error
	}
	return product, nil
}
