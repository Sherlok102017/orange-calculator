package com.example.orangecalculator

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast

class MainActivity : AppCompatActivity() {
    
    private lateinit var display: TextView
    private var currentNumber = "0"
    private var previousNumber = 0.0
    private var operation = ""
    private var newNumber = true
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        
        display = findViewById(R.id.display)
        display.text = currentNumber
    }
    
    fun onNumberClick(view: android.view.View) {
        val button = view as Button
        val number = button.text.toString()
        
        if (newNumber) {
            currentNumber = number
            newNumber = false
        } else {
            if (currentNumber == "0" && number != ".") {
                currentNumber = number
            } else {
                currentNumber += number
            }
        }
        
        display.text = currentNumber
    }
    
    fun onOperatorClick(view: android.view.View) {
        val button = view as Button
        val operator = button.text.toString()
        
        if (operation.isNotEmpty() && !newNumber) {
            calculateResult()
        }
        
        previousNumber = currentNumber.toDoubleOrNull() ?: 0.0
        operation = operator
        newNumber = true
        
        // Показываем операцию на дисплее
        display.text = "$previousNumber $operation"
    }
    
    fun onEqualsClick(view: android.view.View) {
        if (operation.isNotEmpty() && !newNumber) {
            calculateResult()
            operation = ""
        }
    }
    
    fun onClearClick(view: android.view.View) {
        currentNumber = "0"
        previousNumber = 0.0
        operation = ""
        newNumber = true
        display.text = currentNumber
    }
    
    fun onDotClick(view: android.view.View) {
        if (!currentNumber.contains(".")) {
            currentNumber += "."
            display.text = currentNumber
        }
    }
    
    fun onPlusMinusClick(view: android.view.View) {
        if (currentNumber != "0") {
            if (currentNumber.startsWith("-")) {
                currentNumber = currentNumber.substring(1)
            } else {
                currentNumber = "-$currentNumber"
            }
            display.text = currentNumber
        }
    }
    
    private fun calculateResult() {
        val current = currentNumber.toDoubleOrNull() ?: 0.0
        
        val result = when (operation) {
            "+" -> previousNumber + current
            "-" -> previousNumber - current
            "×" -> previousNumber * current
            "÷" -> {
                if (current == 0.0) {
                    Toast.makeText(this, "Деление на ноль невозможно!", Toast.LENGTH_SHORT).show()
                    return
                }
                previousNumber / current
            }
            else -> current
        }
        
        currentNumber = if (result.toLong().toDouble() == result) {
            result.toLong().toString()
        } else {
            String.format("%.8f", result).trimEnd('0').trimEnd('.')
        }
        
        display.text = currentNumber
        newNumber = true
    }
}
