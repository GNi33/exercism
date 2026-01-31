orbital_periods = Dict(
    "Mercury" => 0.2408467,
    "Venus" => 0.61519726,
    "Earth" => 1.0,
    "Mars" => 1.8808158,
    "Jupiter" => 11.862615,
    "Saturn" => 29.447498,
    "Uranus" => 84.016846,
    "Neptune" => 164.79132
)

const seconds_in_earth_year = 3.154e+7

seconds_to_years(seconds) = seconds / seconds_in_earth_year

onEarth(seconds) = seconds_to_years(seconds) / orbital_periods["Earth"]
onMercury(seconds) = seconds_to_years(seconds) / orbital_periods["Mercury"]
onVenus(seconds) = seconds_to_years(seconds) / orbital_periods["Venus"]
onMars(seconds) = seconds_to_years(seconds) / orbital_periods["Mars"]
onJupiter(seconds) = seconds_to_years(seconds) / orbital_periods["Jupiter"]
onSaturn(seconds) = seconds_to_years(seconds) / orbital_periods["Saturn"]
onUranus(seconds) = seconds_to_years(seconds) / orbital_periods["Uranus"]
onNeptune(seconds) = seconds_to_years(seconds) / orbital_periods["Neptune"]
