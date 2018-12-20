package model

import "flash-food/database"

//Store ...
type Store struct {
	ID       int    `json:"id"`
	Avatar   string `json:"avatar, omitempty" gorm:"text"`
	City     string `json:"city, omitempty" gorm:"text"`
	District string `json:"district, omitempty" gorm:"text"`
	Name     string `json:"name, omitempty" gorm:"text"`
	Password string `json:"-" gorm:"-"`
	Phone    string `json:"phone, omitempty" gorm:"text"`
	Revenue  string `json:"revenue, omitempty" gorm:"text"`
	Street   string `json:"street, omitempty" gorm:"text"`
	Type     string `json:"type, omitempty" gorm:"text"`
	UserName string `json:"user_name, omitempty" gorm:"text"`
}

//GetStoreInfoByID ...
func GetStoreInfoByID(storeID int) (Store, error) {
	var store Store
	db := database.GetDB()
	res := db.Where("id = ?", storeID).Find(&store)
	if res.Error != nil {
		return store, res.Error
	}
	return store, nil
}
