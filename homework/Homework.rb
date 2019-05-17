module Homework
  def self.isValidTimeFormat?(time)
    time.match(/((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AP][M]))/)
  end

  def self.convertTimeToMinutes(time)
    hourMinute = time.split(' ')[0].split(':')
    hour = hourMinute[0].to_i
    minute = hourMinute[1].to_i
    am_pm = time.split(' ').last
    if hour == 12 && am_pm == 'AM'
      newHour = hour - 12
    elsif hour.between?(1,11) && am_pm == 'PM'
      newHour = hour + 12
    else
      newHour = hour
    end
    (newHour * 60) + minute
  end

  # This method is a little odd looking as it has to
  # take into account running into the next/previous day.
  # We only allow one day of add/subtract since there is
  # no reference to the date and any return that had a 
  # difference of > +- 24 hours would be useless.
  def self.convertMinutestoAMPM(minutes)
    if minutes > 0
      minutes <= 720 ? am_pm = 'AM' : am_pm = 'PM'
      if minutes > 1440
        if am_pm == 'PM'
          am_pm = 'AM'
        elsif am_pm == 'AM'
            am_pm = 'PM'
        end
      end
      hour = minutes / 60
      hour = hour % 12 if hour > 12
      hour = 12 if hour == 0
      hour = -hour if hour < 0
      minute = minutes % 60
      minute = "0#{minute}" if minute < 10
      "#{hour}:#{minute} #{am_pm}"
    else
      self.convertMinutestoAMPM(1440 + minutes)
    end
  end

  def self.addMinutes(time, minutesToAdd)
    if isValidTimeFormat?(time) && minutesToAdd.abs <= 1440
      return time if minutesToAdd == 0 || minutesToAdd == 1440 || minutesToAdd == -1440
      self.convertMinutestoAMPM(self.convertTimeToMinutes(time) + minutesToAdd)
    else
      puts 'The time format is invalid or you are trying to add/subtract more than a 1440 minutes (1 day) from the given time.'
    end
  end
end
