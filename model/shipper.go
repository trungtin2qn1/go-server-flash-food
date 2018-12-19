package model

import (
	"flash-food/database"
	"flash-food/util"
)

//ShipperTemp ...
type ShipperTemp struct {
	ID       string `json:"id"`
	Name     string `json:"name, omitempty" gorm:"text"`
	Status   string `json:"status, omitempty" gorm:"tinyint(1)"`
	Avatar   string `json:"avatar, omitempty" gorm:"text"`
	UserName string `json:"username, omitempty" gorm:"column:username"`
	Password string `json:"password, omitempty" gorm:"text"`
	Phone    string `json:"phone, omitempty" gorm:"text"`
}

func (shipper *Shipper) convertJSONToOrder() ShipperTemp {
	var shipperTemp ShipperTemp
	shipperTemp.ID = util.ConvertIntToString(shipper.ID)
	shipperTemp.Name = shipper.Name
	shipperTemp.Phone = shipper.Phone
	shipperTemp.Status = util.ConvertIntToString(shipper.Status)
	shipperTemp.UserName = shipper.UserName
	shipperTemp.Password = shipper.Password
	shipperTemp.Avatar = shipper.Avatar
	return shipperTemp
}

//Shipper ...
type Shipper struct {
	ID       int    `json:"id"`
	Name     string `json:"name, omitempty" gorm:"text"`
	Status   int    `json:"status, omitempty" gorm:"tinyint(1)"`
	Avatar   string `json:"avatar, omitempty" gorm:"text"`
	UserName string `json:"username, omitempty" gorm:"column:username"`
	Password string `json:"password, omitempty" gorm:"column:password"`
	Phone    string `json:"phone, omitempty" gorm:"text"`
}

//GetShipperInfoByID ...
func GetShipperInfoByID(shipperID int) (Shipper, error) {
	var shipper Shipper
	db := database.GetDB()
	res := db.Where("id = ?", shipperID).Find(&shipper)
	if res.Error != nil {
		return shipper, res.Error
	}
	return shipper, nil
}

//UpdateShipperInfo ...
func (shipper *Shipper) UpdateShipperInfo(temp Shipper) error {
	shipper.Avatar = temp.Avatar
	shipper.Status = temp.Status
	shipper.Phone = temp.Phone
	shipper.UserName = temp.UserName
	shipper.Password = temp.Password
	shipper.Name = temp.Name
	return shipper.updateAllField(temp)
}

//UpdateShipperElement 1 element
func (shipper *Shipper) UpdateShipperElement(field string, value string) error {
	return shipper.updateField(field, value)
}

//Update 1 field of shippers table
func (shipper *Shipper) updateField(field string, value string) error {
	db := database.GetDB()
	res := db.Model(&shipper).Where("id = ?", shipper.ID).Update(field, value)
	if res.Error != nil {
		//log.Fatal(res.Error)
		return res.Error
	}
	return nil
}

//Update all field of shippers table
func (shipper *Shipper) updateAllField(updateShipper Shipper) error {
	db := database.GetDB()
	res := db.Model(&shipper).Where("id = ?", shipper.ID).Updates(updateShipper)
	if res.Error != nil {
		//log.Fatal(res.Error)
		return res.Error
	}
	return nil
}

//Create Shipper info to Db
func (shipper *Shipper) create() error {
	db := database.GetDB()
	res := db.Create(&shipper)
	if res.Error != nil {
		//log.Fatal(res.Error)
		return res.Error
	}
	return nil
}

//CreateShipper ....
func CreateShipper(avatar string, status int, phone string, userName string, password string, name string) (Shipper, error) {
	var shipper Shipper
	shipper.Avatar = avatar
	shipper.Status = status
	shipper.Phone = phone
	shipper.UserName = userName
	shipper.Password = password
	shipper.Name = name
	err := shipper.create()
	if err != nil {
		//log.Fatal(err)
		return shipper, err
	}
	return shipper, nil
}

//Delete shipper info from Db
func (shipper *Shipper) delete() error {
	db := database.GetDB()
	res := db.Where("id = ?", shipper.ID).Delete(&shipper)
	if res.Error != nil {
		//log.Fatal(res.Error)
		return res.Error
	}
	return nil
}

//DeleteShipper ...
func (shipper *Shipper) DeleteShipper() error {
	// orderDetails, err := GetOrderDetailsByOrderID(order.ID)
	// if err != nil && orderDetails[0].ID == 0 {
	// 	return err
	// }
	// for i := 0; i < len(orderDetails); i++ {
	// 	orderDetails[i].DeleteOrderDetail()
	// }

	return shipper.delete()
}
