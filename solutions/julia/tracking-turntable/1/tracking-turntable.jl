z(x, y) = complex(x, y)

euler(r, θ) = ℯ^(im * θ) * r

rotate(x, y, θ) = z(x,y) * euler(1, θ) |> reim

function rdisplace(x, y, r)
    θ = atan(y, x)
    x_new = x + r * cos(θ)
    y_new = y + r * sin(θ)
    return x_new, y_new
end

function findsong(x, y, r, θ)
    z = rdisplace(x, y, r)
    rotate(z[1], z[2], θ)
end
