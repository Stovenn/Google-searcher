require 'pry'
require 'watir'
require 'open-uri'

browser = Watir::Browser.new(:firefox)
browser.goto 'google.com'
search_bar = browser.text_field(class: 'gsfi')
search_bar.set("Yare yare!")

#méthode de la barre d'entrée
#search_bar.send_keys(:enter)

#méthode du clic
submit_button = browser.button(type:"submit")
submit_button.click

browser.driver.manage.timeouts.implicit_wait = 3
search_result_h3s = browser.h3s(class:"LC20lb")
search_result_h3s.each {|h3| p h3.text }

p "Méfait accompli, fermeture du browser"
browser.close
