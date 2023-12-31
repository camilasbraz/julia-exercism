function sieve(limit)
    # Inicializa todos como primos
    primes = Bool[true for _ in 1:limit]
    # O número 1 não é primo
    primes[1] = false

    for num in 2:limit
        if primes[num]
            for multiple in 2*num:num:limit
                # Marca os múltiplos como não primos
                primes[multiple] = false
            end
        end
    end
    # Inicializa um array vazio para armazenar os primos encontrados
    prime_numbers = Int[]
    for (idx, is_prime) in enumerate(primes)
        if is_prime
            # Adiciona números primos ao array
            push!(prime_numbers, idx)
        end
    end

    return prime_numbers
end


limit = 233
primes = sieve(limit)
println("Prime numbers up to $limit: ", primes)

sieve(1) == []
sieve(13) == [2, 3, 5, 7, 11, 13]