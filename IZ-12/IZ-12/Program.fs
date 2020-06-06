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

// Строит заданный список для некоторого числа N
let buildDivs (N:int) =
    // Возвращает список, в котором столько вхождений делителя checkDiv, сколько раз подряд число number на него делится.
    // Например, для 125 и 5 будет возвращено [5, 5, 5], а для взаимно-простых []
    let rec degreeDelToList number (checkDiv:int) tail =
        if (number % checkDiv = 0) then
            degreeDelToList (number / checkDiv) checkDiv (checkDiv::tail)
        else
            tail

    // Перебирает делители и заносит простые и их повторения в список
    let rec buildDivs_ currentDiv (list:int list) =
        match currentDiv with
        | 0 -> list
        | _ -> 
            if (isPrime currentDiv) then
                let t = degreeDelToList N currentDiv []
                buildDivs_ (currentDiv-1) (t @ list)
            else
                buildDivs_ (currentDiv-1) list

    buildDivs_ (N-1) []

[<EntryPoint>]
let main argv =
    let number = Convert.ToInt32(Console.ReadLine())
    printf "%A" (buildDivs number)
    0 // return an integer exit code
