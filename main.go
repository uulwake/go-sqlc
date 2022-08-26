package main

import (
	"context"
	"database/sql"
	"fmt"
	"go-sqlc/models/items"
	"log"

	_ "github.com/lib/pq"
)

func main() {
	const (
		host     = "localhost"
		port     = 5432
		user     = "postgres"
		password = "secret"
		dbname   = "go-sql"
	)

	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)

	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err)
	}

	err = db.Ping()
	if err != nil {
		log.Fatalf(err.Error())
	}
	defer db.Close()

	ctx := context.Background()

	ItemRepo := items.New(db)
	itemsData, err := ItemRepo.GetItems(ctx)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(itemsData)

	item, err := ItemRepo.GetItemById(ctx, itemsData[0].ID)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(item)

	itemParam := items.CreateItemParams{Name: "newItem", Qty: 1, Weight: 20.1}
	item, err = ItemRepo.CreateItem(ctx, itemParam)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(item)

	updatedItem := items.UpdateItemByIdParams{ID: item.ID, Name: "updated name", Qty: item.Qty, Weight: item.Weight}

	item, err = ItemRepo.UpdateItemById(ctx, updatedItem)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(item)

	err = ItemRepo.DeleteItemById(ctx, item.ID)
	if err != nil {
		log.Fatal(err)
	}

	total, err := ItemRepo.CountTotalItems(ctx)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(total)

}
