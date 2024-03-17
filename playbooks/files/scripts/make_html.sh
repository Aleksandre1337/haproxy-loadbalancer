#!/bin/bash

# Create an empty index.html file in the default directory
mkdir -p /var/www/html
cd /var/www/html
touch index.html

# Append the HTML structure to index.html using echo command
echo "<!DOCTYPE html>" >> index.html
echo "<html>" >> index.html
echo "<head>" >> index.html
echo "    <title>Welcome to my server</title>" >> index.html
echo "    <style>" >> index.html
echo "        body {" >> index.html
echo "            font-family: Arial, sans-serif;" >> index.html
echo "            text-align: center;" >> index.html
echo "        }" >> index.html
echo "        h1 {" >> index.html
echo "            color: #333;" >> index.html
echo "        }" >> index.html
echo "        p {" >> index.html
echo "            margin: 10px auto;" >> index.html
echo "            max-width: 600px;" >> index.html
echo "            background-color: #f9f9f9;" >> index.html
echo "            padding: 10px;" >> index.html
echo "            border-radius: 5px;" >> index.html
echo "            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);" >> index.html
echo "        }" >> index.html
echo "    </style>" >> index.html
echo "</head>" >> index.html
echo "<body>" >> index.html
echo "    <h1>Welcome to my server</h1>" >> index.html
echo "    <p style='color: #007bff;'>Hostname: $(hostname)</p>" >> index.html
echo "    <p style='color: #28a745;'>IP Address: $(ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d/ -f1)</p>" >> index.html
echo "</body>" >> index.html
echo "</html>" >> index.html