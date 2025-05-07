class_name Menu
extends Control

const MAIN_MENU_PATH: String = "uid://csfbqq5q2k233"
const SETTINGS_MENU_PATH: String = "uid://c3peiw5sl8h8y"

static func CREATE_MAIN_MENU() -> Menu:
	var new_main: Menu = load(MAIN_MENU_PATH).instantiate()
	return new_main

static func CREATE_SETTINGS_MENU() -> Menu:
	var new_settings: Menu = load(SETTINGS_MENU_PATH).instantiate()
	return new_settings
