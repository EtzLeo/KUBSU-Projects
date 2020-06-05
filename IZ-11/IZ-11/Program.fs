//Разработать  программу,  реализующую  простые  вычис-ление над двумя действительными числами (сложения, вычита-ния, деления, умножения). 
//Учесть все возможные ошибки.

open System
open System.Windows.Forms

let form = new Form(Width=300, Height=500, Text="Калькулятор")

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



do Application.Run(form)
