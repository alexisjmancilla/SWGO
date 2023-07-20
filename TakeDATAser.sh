#!/bin/bash

serial_port="/dev/ttyACM0"  # Puerto
baud_rate="9600"  # Velocidad
output_file=$(date +"%Y-%m-%d")".csv"  # salida

stty -F "$serial_port" "$baud_rate"

read -r line < "$serial_port" 

if [[ $line =~ ^[0-9,.]+$ ]]; then  # Verificar si la línea tiene el formato adecuado
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")  

  line="$timestamp,$line"

  echo "$line" >> "$output_file" 
else
  echo "Error"
fi

stty -F "$serial_port"  # Restaurar la configuración del puerto serie


