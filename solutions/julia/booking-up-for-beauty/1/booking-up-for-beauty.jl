import Dates

function schedule_appointment(appointment::String)
    fmt = Dates.dateformat"m/d/y H:M:S"
    return Dates.DateTime(appointment, fmt)
end

has_passed(appointment::DateTime) = appointment < Dates.now()

is_afternoon_appointment(appointment::DateTime) = (Dates.hour(appointment) >= 12) && (Dates.hour(appointment) < 18)

function describe(appointment::DateTime)
    formatted = Dates.format(appointment, "E, U d, YYYY \\at HH:MM")
    return "You have an appointment on $formatted"
end

function anniversary_date()
    current_year = Dates.year(Dates.now())
    return Dates.Date(current_year, 9, 15)
end
