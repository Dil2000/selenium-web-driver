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

after ->
  @driver.quit()

describe 'Webdriver tutorial', ->
  this.timeout(45000);
  beforeEach ->
    @driver.get 'http://bites.goodeggs.com/posts/selenium-webdriver-nodejs-tutorial/'

  it 'has the title of the post in the window\'s title', ->
    expect(@driver.getTitle()).to.eventually.contain 'Getting started with Selenium Webdriver for node.js'

  it 'has publication date', ->
    text = @driver.findElement(linkText: 'Max Edmands').getText()
    expect(text).to.eventually.equal 'Max Edmands'

  it 'links back to the homepage', ->
    @driver.findElement(linkText: 'Jonah Williams').click()
    expect(@driver.getCurrentUrl()).to.eventually.equal 'https://team.goodeggs.com/@jonah_goodeggs'