// Basic Dependencies
var express = require('express');
// var methodOverride = require('method-override'); // use for put and delete methods
var bodyParser = require('body-parser');
var path = require('path');

var app = express();
var PORT = process.env.PORT || 3000;

////////////////////////////////////////////////////////
// Selenium
selenium = require('selenium-webdriver');

chrome = require('selenium-webdriver/chrome');
path = require('chromedriver').path;

service = new chrome.ServiceBuilder(path).build();
chrome.setDefaultService(service);

var driver = new selenium.Builder()
	.withCapabilities(selenium.Capabilities.chrome())
	.build();
////////////////////////////////////////////////////////

//BP
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.text());
app.use(bodyParser.json({ type: "application/vnd.api+json" }));


driver.get('https://www.google.com/').then(function(){
	driver.findElement(selenium.By.xpath('//*[@id="lst-ib"]')).sendKeys("Selenium")
	driver.findElement(selenium.By.xpath('//*[@id="tsf"]/div[2]/div[3]/center/input[1]')).submit(); 	
})
