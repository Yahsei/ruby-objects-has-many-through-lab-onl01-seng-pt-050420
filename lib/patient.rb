class Patient
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(doctor, date)
    Appointment.new(doctor, date, self)
  end

  def appointments
    Appointment.all.select { |x| x.patient == self  }
  end

  def doctors
    appointments.map { |y| y.doctor }
  end
end