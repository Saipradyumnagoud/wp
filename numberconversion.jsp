<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Number to Words Conversion</title>
</head>
<body>
    <h1>Number to Words Conversion</h1>
    
    <%!
        // Function to convert number to words
        public String numberToWords(int number) {
            // Array containing words for numbers 0 to 19
            String[] units = { "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten",
                    "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen",
                    "Nineteen" };
            // Array containing words for multiples of 10
            String[] tens = { "", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };
    
            if (number < 20) {
                return units[number];
            }
    
            if (number < 100) {
                return tens[number / 10] + ((number % 10 != 0) ? " " : "") + units[number % 10];
            }
    
            if (number < 1000) {
                return units[number / 100] + " Hundred" + ((number % 100 != 0) ? " " : "") + numberToWords(number % 100);
            }
    
            if (number < 1000000) {
                return numberToWords(number / 1000) + " Thousand" + ((number % 1000 != 0) ? " " : "") + numberToWords(number % 1000);
            }
    
            if (number < 1000000000) {
                return numberToWords(number / 1000000) + " Million" + ((number % 1000000 != 0) ? " " : "") + numberToWords(number % 1000000);
            }
    
            return "";
        }
    %>
    
    <% 
        int inputNumber = 546; // Change this to the number you want to convert
        String numberInWords = numberToWords(inputNumber);
    %>
    
    <p>Number: <%= inputNumber %></p>
    <p>Number in Words: <%= numberInWords %></p>
</body>
</html>
