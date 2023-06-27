# Black: 0
# Brown: 1
# Red: 2
# Orange: 3
# Yellow: 4
# Green: 5
# Blue: 6
# Violet: 7
# Grey: 8
# White: 9
# concatenar os dois primeiros e o ultimo é o numero de zeros no final

# Versao com o pacote DataFrame

using Pkg
Pkg.add("DataFrames")
using DataFrames

color_value_df = DataFrame("color_df" => ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"],
                 "value_df" => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

function label(colors)
    label = ""
    for i in eachindex(colors)
        color_aux = colors[i]
        df_aux = filter(row -> row.color_df == color_aux, color_value_df)
        value = df_aux.value_df[1]
        if i == 3
            add_zeros = "0" ^ Int(value)
            label = label * add_zeros
        else
        label = string(label, value)
        end
    end
    return label
end


label(["orange", "orange", "black"])


# Versao sem o pacote DataFrame

color_df = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
value_df = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

function label(colors)
    label = ""
    for i in eachindex(colors)
        color_aux = colors[i]
        idx = findfirst(isequal(color_aux), color_df)
        value = value_df[idx]
        if i == 3
            add_zeros = "0" ^ Int(value)
            label = label * add_zeros
        else
            label = string(label, value)
        end
    end 
    label_value = parse(Int64,label)
    if label_value % 1000 == 0
        label_kilo = floor(label_value / 1000)
        return string(trunc(Int,label_kilo), " kiloohms")
    end
    return label * " ohms"
end

label(["red", "black", "red"])
