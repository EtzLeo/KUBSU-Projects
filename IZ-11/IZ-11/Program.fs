//Разработать  программу,  реализующую  простые  вычис-ление над двумя действительными числами (сложения, вычита-ния, деления, умножения). 
//Учесть все возможные ошибки.

open System
open System.Windows.Forms

let form = new Form(Width=300, Height=500, Text="Калькулятор", StartPosition = FormStartPosition.CenterScreen)

let leftTextBox = new TextBox(Width=100, Height=50, Top=200, Left=10)
form.Controls.Add(leftTextBox)

let rightTextBox = new TextBox(Width=100, Height=50, Top=200, Left=180)
form.Controls.Add(rightTextBox)

let addButton = new Button(Width=50, Height=50, Top=200, Left=120, Text="+")
form.Controls.Add(addButton)

let subButton = new Button(Width=50, Height=50, Top=250, Left=120, Text="-")
form.Controls.Add(subButton)

let divButton = new Button(Width=50, Height=50, Top=150, Left=120, Text="/")
form.Controls.Add(divButton)

let mulButton = new Button(Width=50, Height=50, Top=100, Left=120, Text="*")
form.Controls.Add(mulButton)


let addCallback left right =
    try
        let leftD = Double.Parse left
        let rightD = Double.Parse right
        MessageBox.Show("Сумма равна " + (leftD + rightD).ToString()) |> ignore

    with
    | _ -> MessageBox.Show("Ошибка ввода!") |> ignore
    0
addButton.Click.Add(fun _ -> addCallback leftTextBox.Text rightTextBox.Text |> ignore)

let mulCallback left right =
    try
        let leftD = Double.Parse left
        let rightD = Double.Parse right
        MessageBox.Show("Произведение равно " + (leftD * rightD).ToString()) |> ignore

    with
    | _ -> MessageBox.Show("Ошибка ввода!") |> ignore
    0
mulButton.Click.Add(fun _ -> mulCallback leftTextBox.Text rightTextBox.Text |> ignore)

let divCallback left right =
    try
        let leftD = Double.Parse left
        let rightD = Double.Parse right

        if (Math.Abs(rightD) < Double.Epsilon) then
            MessageBox.Show("Правый операнд не может быть нулем!") |> ignore
        else
            MessageBox.Show("Частное равно " + (leftD / rightD).ToString()) |> ignore

    with
    | _ -> MessageBox.Show("Ошибка ввода!") |> ignore
    0
divButton.Click.Add(fun _ -> divCallback leftTextBox.Text rightTextBox.Text |> ignore)

let subCallback left right =
    try
        let leftD = Double.Parse left
        let rightD = Double.Parse right
        MessageBox.Show("Разность равна " + (leftD - rightD).ToString()) |> ignore

    with
    | _ -> MessageBox.Show("Ошибка ввода!") |> ignore
    0
subButton.Click.Add(fun _ -> subCallback leftTextBox.Text rightTextBox.Text |> ignore)

do Application.Run(form)
