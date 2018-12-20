package model

import "flash-food/database"

//Customer ...
type Customer struct {
	ID       int    `json:"id"`
	Phone    string `json:"phone, omitempty" gorm:"text"`
	Address  string `json:"address, omitempty" gorm:"text"`
	Name     string `json:"name, omitempty" gorm:"text"`
	Avatar   string `json:"avatar, omitempty" gorm:"text"`
	Email    string `json:"email, omitempty" gorm:"unique"`
	Password string `json:"-" gorm:"-"`
	Token    string `json:"token, omitempty" gorm:"text"`
}

//GetCustomerInfoByID ...
func GetCustomerInfoByID(customerID int) (Customer, error) {
	var customerInfo Customer
	db := database.GetDB()
	res := db.Where("id = ?", customerID).Find(&customerInfo)
	if res.Error != nil {
		return customerInfo, res.Error
	}
	return customerInfo, nil
}
