mutable struct CircularBuffer{T}
    data::Vector{T}
    write_index::Int
    overwrite::Bool

    function CircularBuffer{T}(capacity::Integer) where {T}
        new{T}(Vector{T}(undef, capacity), 1, false)
    end
end

# Extend the push! function for CircularBuffer
function Base.push!(cb::CircularBuffer, item; overwrite::Bool=false)
    if length(cb.data) == 0
        throw(ArgumentError("CircularBuffer is empty"))
    end

    if overwrite
        cb.data[cb.write_index] = item
        cb.write_index = (cb.write_index % length(cb.data)) + 1
    else
        if cb.write_index == 1
            throw(BoundsError("CircularBuffer is full and overwrite is set to false"))
        end
        cb.data[cb.write_index-1] = item
        cb.write_index -= 1
    end
    return cb
end

# Extend the popfirst! function for CircularBuffer
function Base.popfirst!(cb::CircularBuffer)
    if length(cb.data) == 0
        throw(ArgumentError("CircularBuffer is empty"))
    end

    item = cb.data[1]
    cb.data[1:end-1] = cb.data[2:end]
    cb.write_index -= 1
    return item
end

# Extend the empty! function for CircularBuffer
function Base.empty!(cb::CircularBuffer)
    cb.data .= T[]  # Clear all elements
    cb.write_index = 1
    return cb
end


cb = CircularBuffer{Int}(1)
push!(cb, 1) === cb
popfirst!(cb) == 1
@test_throws BoundsError popfirst!(cb)