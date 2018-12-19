package database

import (
	"flash-food/util"
	"fmt"
	"log"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

var db *gorm.DB

//Init ...
func Init() {
	dbUser := util.GetEnv("MYSQL_DB_USER", "root")
	dbPassword := util.GetEnv("MYSQL_DB_PASSWORD", "123123")
	dbName := util.GetEnv("MYSQL_DB_NAME", "flashfood")

	dbinfo := fmt.Sprintf("%s:%s@/%s?charset=utf8&parseTime=True&loc=Local",
		dbUser, dbPassword, dbName)

	var err error
	db, err = ConnectDB(dbinfo)
	if err != nil {
		log.Fatal(err)
	}
}

//ConnectDB ...
func ConnectDB(dbinfo string) (*gorm.DB, error) {
	db, err := gorm.Open("mysql", dbinfo)
	if err != nil {
		log.Fatal(err)
		return nil, err
	}
	return db, nil
}

//GetDB ...
func GetDB() *gorm.DB {
	return db
}

//CloseDB before close application
func CloseDB() {
	db.Close()
	db = nil
}
