#!/bin/bash

BASE_URL="http://localhost:5120"

# Funktion zur formatierten Ausgabe mit jq
function format_output() {
  if command -v jq &> /dev/null; then
    echo "$1" | jq
  else
    echo "$1" | sed 's/,/,\n  /g; s/{/{\n  /g; s/}/\n}/g'
  fi
}

# Benutzerfunktionen
function get_users() {
  response=$(curl -s -X GET "$BASE_URL/users")
  format_output "$response"
}

function create_user() {
  echo "Name des Benutzers:"
  read name
  echo "Email des Benutzers:"
  read email
  echo "Passwort des Benutzers:"
  read password

  if [[ -z "$name" || -z "$email" || -z "$password" ]]; then
    echo "❌ Fehler: Alle Felder müssen ausgefüllt sein!"
    return
  fi

  json_data="{\"name\":\"$name\", \"email\":\"$email\", \"password\":\"$password\"}"
  response=$(curl -s -X POST "$BASE_URL/users" -H "Content-Type: application/json" -d "$json_data")
  format_output "$response"
}

function get_user_by_id() {
  echo "ID des Benutzers:"
  read user_id

  if [[ -z "$user_id" ]]; then
    echo "❌ Fehler: Benutzer-ID darf nicht leer sein!"
    return
  fi

  response=$(curl -s -X GET "$BASE_URL/users/$user_id")
  format_output "$response"
}

function update_user() {
  echo "ID des Benutzers, den du ändern möchtest:"
  read user_id
  echo "Neuer Name:"
  read name
  echo "Neue Email:"
  read email

  if [[ -z "$user_id" || -z "$name" || -z "$email" ]]; then
    echo "❌ Fehler: Alle Felder müssen ausgefüllt sein!"
    return
  fi

  json_data="{\"name\":\"$name\", \"email\":\"$email\"}"
  response=$(curl -s -X PUT "$BASE_URL/users/$user_id" -H "Content-Type: application/json" -d "$json_data")
  format_output "$response"
}

function delete_user() {
  echo "ID des Benutzers, den du löschen möchtest:"
  read user_id

  if [[ -z "$user_id" ]]; then
    echo "❌ Fehler: Benutzer-ID darf nicht leer sein!"
    return
  fi

  response=$(curl -s -X DELETE "$BASE_URL/users/$user_id")
  format_output "$response"
}

# Kategoriefunktionen
function get_categories() {
  response=$(curl -s -X GET "$BASE_URL/categories")
  format_output "$response"
}

function create_category() {
  echo "Name der Kategorie:"
  read category_name

  if [[ -z "$category_name" ]]; then
    echo "❌ Fehler: Kategoriename darf nicht leer sein!"
    return
  fi

  json_data="{\"name\":\"$category_name\"}"
  response=$(curl -s -X POST "$BASE_URL/categories" -H "Content-Type: application/json" -d "$json_data")
  format_output "$response"
}

function get_category_by_id() {
  echo "ID der Kategorie:"
  read category_id

  if [[ -z "$category_id" ]]; then
    echo "❌ Fehler: Kategorie-ID darf nicht leer sein!"
    return
  fi

  response=$(curl -s -X GET "$BASE_URL/categories/$category_id")
  format_output "$response"
}

function update_category() {
  echo "ID der Kategorie, die du ändern möchtest:"
  read category_id
  echo "Neuer Kategoriename:"
  read category_name

  if [[ -z "$category_id" || -z "$category_name" ]]; then
    echo "❌ Fehler: Alle Felder müssen ausgefüllt sein!"
    return
  fi

  json_data="{\"name\":\"$category_name\"}"
  response=$(curl -s -X PUT "$BASE_URL/categories/$category_id" -H "Content-Type: application/json" -d "$json_data")
  format_output "$response"
}

function delete_category() {
  echo "ID der Kategorie, die du löschen möchtest:"
  read category_id

  if [[ -z "$category_id" ]]; then
    echo "❌ Fehler: Kategorie-ID darf nicht leer sein!"
    return
  fi

  response=$(curl -s -X DELETE "$BASE_URL/categories/$category_id")
  format_output "$response"
}

# Produktfunktionen
function get_products() {
  response=$(curl -s -X GET "$BASE_URL/products")
  format_output "$response"
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

  if [[ -z "$product_name" || -z "$description" || -z "$price" || -z "$category_id" ]]; then
    echo "❌ Fehler: Alle Felder müssen ausgefüllt sein!"
    return
  fi

  json_data="{\"name\":\"$product_name\", \"description\":\"$description\", \"price\":$price, \"categoryId\":$category_id}"
  response=$(curl -s -X POST "$BASE_URL/products" -H "Content-Type: application/json" -d "$json_data")
  format_output "$response"
}

function get_product_by_id() {
  echo "ID des Produkts:"
  read product_id

  if [[ -z "$product_id" ]]; then
    echo "❌ Fehler: Produkt-ID darf nicht leer sein!"
    return
  fi

  response=$(curl -s -X GET "$BASE_URL/products/$product_id")
  format_output "$response"
}

function update_product() {
  echo "ID des Produkts, das du ändern möchtest:"
  read product_id
  echo "Neuer Produktname:"
  read product_name
  echo "Neue Produktbeschreibung:"
  read description
  echo "Neuer Preis:"
  read price
  echo "Neue Kategorie-ID:"
  read category_id

  if [[ -z "$product_id" || -z "$product_name" || -z "$description" || -z "$price" || -z "$category_id" ]]; then
    echo "❌ Fehler: Alle Felder müssen ausgefüllt sein!"
    return
  fi

  json_data="{\"name\":\"$product_name\", \"description\":\"$description\", \"price\":$price, \"categoryId\":$category_id}"
  response=$(curl -s -X PUT "$BASE_URL/products/$product_id" -H "Content-Type: application/json" -d "$json_data")
  format_output "$response"
}

function delete_product() {
  echo "ID des Produkts, das du löschen möchtest:"
  read product_id

  if [[ -z "$product_id" ]]; then
    echo "❌ Fehler: Produkt-ID darf nicht leer sein!"
    return
  fi

  response=$(curl -s -X DELETE "$BASE_URL/products/$product_id")
  format_output "$response"
}

# Bestellfunktionen
function get_orders() {
  response=$(curl -s -X GET "$BASE_URL/orders")
  format_output "$response"
}

function create_order() {
  echo "User ID für Bestellung:"
  read user_id
  echo "Produkt ID:"
  read product_id
  echo "Anzahl:"
  read quantity

  if [[ -z "$user_id" || -z "$product_id" || -z "$quantity" ]]; then
    echo "❌ Fehler: Alle Felder müssen ausgefüllt sein!"
    return
  fi

  total=$((quantity * 100))
  json_data="{\"userId\":$user_id, \"products\":[{\"productId\":$product_id, \"quantity\":$quantity}], \"total\":$total}"
  response=$(curl -s -X POST "$BASE_URL/orders" -H "Content-Type: application/json" -d "$json_data")
  format_output "$response"
}

function get_order_by_id() {
  echo "ID der Bestellung:"
  read order_id

  if [[ -z "$order_id" ]]; then
    echo "❌ Fehler: Bestellungs-ID darf nicht leer sein!"
    return
  fi

  response=$(curl -s -X GET "$BASE_URL/orders/$order_id")
  format_output "$response"
}

function update_order() {
  echo "ID der Bestellung, die du ändern möchtest:"
  read order_id
  echo "Neue User ID:"
  read user_id
  echo "Neue Produkte (als JSON-Array):"
  read products
  echo "Neuer Gesamtpreis:"
  read total

  if [[ -z "$order_id" || -z "$user_id" || -z "$products" || -z "$total" ]]; then
    echo "❌ Fehler: Alle Felder müssen ausgefüllt sein!"
    return
  fi

  json_data="{\"userId\":$user_id, \"products\":$products, \"total\":$total}"
  response=$(curl -s -X PUT "$BASE_URL/orders/$order_id" -H "Content-Type: application/json" -d "$json_data")
  format_output "$response"
}

function delete_order() {
  echo "ID der Bestellung, die du löschen möchtest:"
  read order_id

  if [[ -z "$order_id" ]]; then
    echo "❌ Fehler: Bestellungs-ID darf nicht leer sein!"
    return
  fi

  response=$(curl -s -X DELETE "$BASE_URL/orders/$order_id")
  format_output "$response"
}

# Menü
function show_menu() {
  echo "-----------------------------------"
  echo " 🛒 API Test Menü"
  echo "-----------------------------------"
  echo "1. Alle Benutzer anzeigen"
  echo "2. Neuen Benutzer erstellen"
  echo "3. Benutzer per ID anzeigen"
  echo "4. Benutzer ändern"
  echo "5. Benutzer löschen"
  echo "6. Alle Kategorien anzeigen"
  echo "7. Neue Kategorie erstellen"
  echo "8. Kategorie per ID anzeigen"
  echo "9. Kategorie ändern"
  echo "10. Kategorie löschen"
  echo "11. Alle Produkte anzeigen"
  echo "12. Neues Produkt erstellen"
  echo "13. Produkt per ID anzeigen"
  echo "14. Produkt ändern"
  echo "15. Produkt löschen"
  echo "16. Alle Bestellungen anzeigen"
  echo "17. Neue Bestellung erstellen"
  echo "18. Bestellung per ID anzeigen"
  echo "19. Bestellung ändern"
  echo "20. Bestellung löschen"
  echo "21. Beenden"
  echo "-----------------------------------"
  echo "Wähle eine Option (1-21):"
}

# Hauptprogramm
while true; do
  show_menu
  read choice
  case $choice in
    1) get_users ;;
    2) create_user ;;
    3) get_user_by_id ;;
    4) update_user ;;
    5) delete_user ;;
    6) get_categories ;;
    7) create_category ;;
    8) get_category_by_id ;;
    9) update_category ;;
    10) delete_category ;;
    11) get_products ;;
    12) create_product ;;
    13) get_product_by_id ;;
    14) update_product ;;
    15) delete_product ;;
    16) get_orders ;;
    17) create_order ;;
    18) get_order_by_id ;;
    19) update_order ;;
    20) delete_order ;;
    21) echo "Beende das Skript"; exit ;;
    *) echo "❌ Ungültige Eingabe! Bitte eine Zahl zwischen 1 und 21 wählen." ;;
  esac
  echo ""
done