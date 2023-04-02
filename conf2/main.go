package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strings"

	prompt "github.com/c-bata/go-prompt"
)

func main() {
	s := prompt.New(
		executor,
		completer,
		prompt.OptionTitle("config-sync"),
		prompt.OptionPrefix(">>> "),
	)
	s.Run()
}

func executor(in string) {
	switch in {
	case "pull":
		pullConfigs()
	case "push":
		pushConfigs()
	default:
		if strings.HasPrefix(in, "replace ") {
			username := strings.TrimPrefix(in, "replace ")
			replaceUsername(username)
		} else {
			fmt.Println("Invalid command. Type 'help' to see available commands.")
		}
	}
}

func completer(d prompt.Document) []prompt.Suggest {
	s := []prompt.Suggest{
		{Text: "pull", Description: "Pull configs from git repository"},
		{Text: "push", Description: "Push configs to git repository"},
		{Text: "replace", Description: "Replace username in all text files"},
		{Text: "help", Description: "Show available commands"},
	}
	return prompt.FilterHasPrefix(s, d.GetWordBeforeCursor(), true)
}

func pullConfigs() {
	fmt.Println("Pulling configs from git repository...")
	// TODO: Implement pullConfigs function
}

func pushConfigs() {
	fmt.Println("Pushing configs to git repository...")
	// TODO: Implement pushConfigs function
}

func replaceUsername(username string) {
	fmt.Printf("Replacing username with '%s'...\n", username)
	files, err := ioutil.ReadDir(".")
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	for _, file := range files {
		if strings.HasSuffix(file.Name(), ".txt") {
			data, err := ioutil.ReadFile(file.Name())
			if err != nil {
				fmt.Println(err)
				continue
			}
			newData := strings.Replace(string(data), "det", username, -1)
			err = ioutil.WriteFile(file.Name(), []byte(newData), 0644)
			if err != nil {
				fmt.Println(err)
				continue
			}
		}
	}
	fmt.Printf("'%s' replaced with '%s' in all text files.\n", "det", username)
}
