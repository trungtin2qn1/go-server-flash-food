package main

import (
	"flash-food/app"
	"flash-food/database"
)

func main() {
	database.Init()
	app.InitRouter()
}
