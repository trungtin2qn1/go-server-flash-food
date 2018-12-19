package util

import "strconv"

//ConvertIntToString ...
func ConvertIntToString(x int) string {
	res := strconv.Itoa(x)
	return res
}

//ConvertStringToInt ...
func ConvertStringToInt(str string) (int, error) {
	number, err := strconv.Atoi(str)
	if err != nil {
		return number, err
	}
	return number, nil
}
