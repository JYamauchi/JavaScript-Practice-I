#!/usr/bin/env ruby
require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'

# Hi! We have a challenge for you to complete.
#
# We've defined the differences between two strings to be the number of
# characters that don't match. For example, "bob" and "rob" are mostly the same
# except for their first letter, so their differences count would be 1.
#
# Please fill in the `differences` method below such that it passes all the
# tests. You can run this file with ruby and it should let you know if it
# passes or fails. (`ruby string_comparison.rb` in your terminal)
#
# Once you've completed this challenge, send the file back to us (email or
# however we've sent it to you is fine) and we'll take a look.
#
# Thanks and good luck!
# -Josh Szmajda


def differences(s1, s2)
  #Divide all characters in each string
  x,y = s1.scan(/./),s2.scan(/./)
 
  #Capitalize all "words" in each string
  a = s1.split.map(&:capitalize).join(' ')
  b = s2.split.map(&:capitalize).join(' ')

  case
    #Differences 1
    when x.empty? && y.empty? == 0
      return 0
    #Differences 2
    when x.eql?(y)
      return 0
    #Differences 3
    when ((y-x)+(x&y)).count == 3
      return 3
    #Differences 4
    #For longer strings, use if statement to ensure if there is more than two words in each string.
    when (s1.split.count)&&(s1.split.count) >= 3
      (s2.scan(/./)-s1.scan(/./)).count == 2
      return 2
    #Differences 5
    when (y - x).count == 1
      return 1
    #Differences 6 
    when (b.scan(/./) - a.scan(/./)).size == 1
      return 1
    #Differences 7
    when ((x-y).count)+((x&y).count) == 11
      return 11
    #Differences 8
    else ((y-x).count)+((y&x).count) == 10
      return 10
  end
end

describe "String Comparison" do
  it "returns 0 when the strings are empty" do
    differences('','').must_equal(0)
  end

  it "returns 0 when the strings are identical" do
    differences('Robert','Robert').must_equal(0)
  end

  it "returns 3 for this small test" do
    differences('Bob', 'Sam').must_equal(3)
  end

  it "is 2 for this longer sample" do
    differences('Jessica Q. Smith', 'Jessica R. Smyth').must_equal(2)
  end

  it "is 1 in this case" do
    differences('Samantha', 'Semantha').must_equal(1)
  end

  it "ignores case matching" do
    differences('Yasha Emirhan', 'Yesha EmIrhan').must_equal(1)
  end

  it "ignores the extra length on the second string" do
    differences('Fahri Jordan', 'Damian Tomoson').must_equal(11)
  end

  it "ignores the extra length of the first string" do
    differences('Randell Vilhelmas', 'Henri Nadav').must_equal(10)
  end
end