// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.15.0

package items

import ()

type Item struct {
	ID     int32   `json:"id"`
	Name   string  `json:"name"`
	Qty    int32   `json:"qty"`
	Weight float64 `json:"weight"`
}
