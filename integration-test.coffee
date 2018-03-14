selenium = require 'selenium-webdriver'
chai = require 'chai'
chai.use require 'chai-as-promised'
expect = chai.expect

chrome = require('selenium-webdriver/chrome');
path = require('chromedriver').path;

service = new chrome.ServiceBuilder(path).build();
chrome.setDefaultService(service);


before ->
  @timeout 10000
  @driver = new selenium.Builder()
    .withCapabilities(selenium.Capabilities.chrome())
    .build()
  @driver.getWindowHandle()

# after ->
#   @driver.quit() // When uses this command window closes automatically. Cannot see whats going on testing mode. Activate this in production.

# describe 'Webdriver tutorial', ->
#   this.timeout(45000);
#   beforeEach ->
#     @driver.get 'http://bites.goodeggs.com/posts/selenium-webdriver-nodejs-tutorial/'

#   it 'has the title of the post in the window\'s title', ->
#     expect(@driver.getTitle()).to.eventually.contain 'Getting started with Selenium Webdriver for node.js'

#   it 'has publication date', ->
#     text = @driver.findElement(linkText: 'Max Edmands').getText()
#     expect(text).to.eventually.equal 'Max Edmands'

#   it 'links back to the homepage', ->
#     @driver.findElement(linkText: 'Jonah Williams').click()
#     expect(@driver.getCurrentUrl()).to.eventually.equal 'https://team.goodeggs.com/getting-started-with-selenium-webdriver-for-node-js-f262a00c52e1'

describe 'google Testing', ->
  this.timeout(45000);
  beforeEach ->
    @driver.get 'https://www.google.com/'

  it 'Search an Item', ->
    @driver.findElement(xpath: '//*[@id="lst-ib"]').sendKeys("Selenium");
    @driver.findElement(xpath: '//*[@id="tsf"]/div[2]/div[3]/center/input[1]').submit();
    expect(@driver.getCurrentUrl()).to.eventually.equal 'https://www.google.com/search?source=hp&ei=IhKpWsDcKe2h_QbOhYigCw&q=Selenium&oq=Selenium&gs_l=psy-ab.3..0j0i131k1j0l6j0i131k1j0.909535.910622.0.910804.16.10.0.0.0.0.99.725.8.10.0....0...1.1.64.psy-ab..6.8.723.0..46j0i46k1.54.7A2Camlv_Ik'



