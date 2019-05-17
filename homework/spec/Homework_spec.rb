require 'spec_helper'
require './Homework.rb'
tests = [
  {
    time: '12:04 AM',
    minutes: -40,
    answer: '11:24 PM'
  },
  {
    time: '3:11 PM',
    minutes: -240,
    answer: '11:11 AM'
  },
  {
    time: '11:55 PM',
    minutes: 6,
    answer: '12:01 AM'
  },
  {
    time: '12:00 AM',
    minutes: 1440,
    answer: '12:00 AM'
  },
  {
    time: '09:43 AM',
    minutes: -27,
    answer: '9:16 AM'
  },
  {
    time: '1:23 AM',
    minutes: 720,
    answer: '1:23 PM'
  }
]

tests.each do |test|
  RSpec.describe Homework do
    it "Returns time: #{test[:answer]}" do
      expect(Homework::addMinutes(test[:time], test[:minutes])).to eq(test[:answer])
    end
  end
end
