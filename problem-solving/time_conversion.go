package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strconv"
	"strings"
)

/*
 * Complete the timeConversion function below.
 */
func timeConversion(s string) string {
	t := strings.Split(s, ":")
	if strings.Contains(t[2], "AM") && t[0] == "12" {
		t[0] = "00"
	} else if strings.Contains(t[2], "PM") {
		hr, _ := strconv.Atoi(t[0])
		if hr > 0 && hr < 12 {
			hr += 12
			t[0] = strconv.Itoa(hr)
		}
	}
	t[2] = strings.Replace(t[2], "AM", "", 1)
	t[2] = strings.Replace(t[2], "PM", "", 1)
	return strings.Join(t, ":")
}

func main() {
	reader := bufio.NewReaderSize(os.Stdin, 1024*1024)

	outputFile, err := os.Create(os.Getenv("OUTPUT_PATH"))
	checkError(err)

	defer outputFile.Close()

	writer := bufio.NewWriterSize(outputFile, 1024*1024)

	s := readLine(reader)

	result := timeConversion(s)

	fmt.Fprintf(writer, "%s\n", result)

	writer.Flush()
}

func readLine(reader *bufio.Reader) string {
	str, _, err := reader.ReadLine()
	if err == io.EOF {
		return ""
	}

	return strings.TrimRight(string(str), "\r\n")
}

func checkError(err error) {
	if err != nil {
		panic(err)
	}
}
