require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "should get home" do
    get root_url
    assert_response :success
    
    assert_select 'title', 'SUBCULTURE MUSIC'
    assert_select 'h1', 'Welcome to SUBCULTURE MUSIC'
    assert_select 'p', 'This is a webiste for people who love and interesting in Rock music.This site allows users to create theirs own playlist and add a songs from theirs favourite artists.'
    
    end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_template layout: 'application'
    assert_select 'title', 'SUBCULTURE MUSIC'
    assert_select 'h1', 'Contact Us'
    assert_select 'p', 'Fill the form below to contact us'
    
    end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select 'title', 'SUBCULTURE MUSIC'
    assert_select 'h1', 'About This Website'
    assert_select 'h3', 'This is website is a project for COM2025 Web Applications Development 2021/2022 Coursework from Wish Suharitdamrong.To develop an interactive web application using Ruby on rails.'
      
    end
    
  test "should post request contact but no email" do
    post request_contact_url
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
    end  

  test "should post request contact" do
    post request_contact_url, params:
    {name: "Matthew", email: "matthew@me.com",
    telephone: "1234567890", message: "Hello"}
    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
      end  

end

  
  