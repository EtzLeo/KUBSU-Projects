//  Для введенного числа построить список всех его простых делителей, причем если введенное число делится на простое число в степени k, 
// то в итоговом списке число должно повторятся раз k. Результирующий список должен быть упорядочен по возрастанию.

open System

// Проверка числа на простоту
let isPrime N =
    let rec isPrime_ currentD =
        if (N % currentD = 0 && currentD <> N) then
            false
        else
            if (currentD > N) then
                true
            else
                isPrime_ (currentD+2)

    match N with
    | 1 -> false
    | 2 -> true
    | _ -> 
        if (N % 2 = 0) then
            false
        else
            isPrime_ 3

[<EntryPoint>]
let main argv =
    printfn "%A" argv
    0 // return an integer exit code
