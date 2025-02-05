#!/bin/bash

BASE_URL="http://localhost:5120"

function create_user() {
  echo "Name des Benutzers:"
  read name
  echo "Email des Benutzers:"
  read email
  echo "Passwort des Benutzers:"
  read password
  
  curl -X POST "$BASE_URL/users" \
    -H "Content-Type: application/json" \
    -d "{\"name\": \"$name\", \"email\": \"$email\", \"password\": \"$password\"}"
}

function get_users() {
  curl -X GET "$BASE_URL/users"
}

function delete_user() {
  echo "ID des Benutzers, den du löschen möchtest:"
  read user_id
  curl -X DELETE "$BASE_URL/users/$user_id"
}

function create_category() {
  echo "Name der Kategorie:"
  read category_name
  
  curl -X POST "$BASE_URL/categories" \
    -H "Content-Type: application/json" \
    -d "{\"name\": \"$category_name\"}"
}

function get_categories() {
  curl -X GET "$BASE_URL/categories"
}

function create_product() {
  echo "Produktname:"
  read product_name
  echo "Produktbeschreibung:"
  read description
  echo "Preis:"
  read price
  echo "Kategorie-ID:"
  read category_id
  
  curl -X POST "$BASE_URL/products" \
    -H "Content-Type: application/json" \
    -d "{\"name\": \"$product_name\", \"description\": \"$description\", \"price\": $price, \"categoryId\": $category_id}"
}

function get_products() {
  curl -X GET "$BASE_URL/products"
}

function create_order() {
  echo "User ID für Bestellung:"
  read user_id
  echo "Produkt ID:"
  read product_id
  echo "Anzahl:"
  read quantity
  
  curl -X POST "$BASE_URL/orders" \
    -H "Content-Type: application/json" \
    -d "{\"userId\": $user_id, \"products\": [{\"productId\": $product_id, \"quantity\": $quantity}]}"
}

function get_orders() {
  curl -X GET "$BASE_URL/orders"
}

function show_menu() {
  echo "-----------------------------------"
  echo " API Test Menü"
  echo "-----------------------------------"
  echo "1. Neuen Benutzer erstellen"
  echo "2. Alle Benutzer anzeigen"
  echo "3. Benutzer löschen"
  echo "4. Neue Kategorie erstellen"
  echo "5. Alle Kategorien anzeigen"
  echo "6. Neues Produkt erstellen"
  echo "7. Alle Produkte anzeigen"
  echo "8. Neue Bestellung aufgeben"
  echo "9. Alle Bestellungen anzeigen"
  echo "10. Beenden"
  echo "-----------------------------------"
  echo "Wähle eine Option (1-10):"
}

while true; do
  show_menu
  read choice
  case $choice in
    1) create_user ;;
    2) get_users ;;
    3) delete_user ;;
    4) create_category ;;
    5) get_categories ;;
    6) create_product ;;
    7) get_products ;;
    8) create_order ;;
    9) get_orders ;;
    10) echo "Beende das Skript"; exit ;;
    *) echo "Ungültige Eingabe! Bitte eine Zahl zwischen 1 und 10 wählen." ;;
  esac
  echo ""
done