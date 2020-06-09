import pyswip
from tkinter import *
from tkinter import messagebox

window = Tk()
window.title("Связывание SWI Prolog и Python")
window.geometry("800x200")
Grid.rowconfigure(window, 0, weight=1)
Grid.columnconfigure(window, 0, weight=1)

# Установка теста задания и кнопки для переходов по ним происходит в функциях setQuestNState.
# Сам текст задания хранится в questLavbel.

questLabel = Label(window, text="125")
questLabel.grid(column=0, row=0)

selectedRadioButton = IntVar()

yesRadioButton = Radiobutton(window,text='Да', value=1, variable=selectedRadioButton)
yesRadioButton.grid(column=0, row=1)

noRadioButton = Radiobutton(window,text='Нет', value=0, variable=selectedRadioButton)
noRadioButton.grid(column=0, row=2)

partialRadioButton = Radiobutton(window,text='Частично', value=2, variable=selectedRadioButton)
partialRadioButton.grid(column=0, row=3)

dontKnownRadioButton = Radiobutton(window,text='Не знаю', value=3, variable=selectedRadioButton)
dontKnownRadioButton.grid(column=0, row=4)

nextQuestButton = Button(window, text="Следующий вопрос")
nextQuestButton.grid(column=0, row=5)

answers = dict()

def getResults():
	answers[7] = selectedRadioButton.get()

	prolog = pyswip.Prolog
	prolog.consult("IZ-7.pl")
	prolog.dynamic("result/1")

	findEnemyArgsString = str()
	findEnemyArgsString += f"{answers[1]}, " if answers[1] != 3 else "Answer1, "
	findEnemyArgsString += f"{answers[2]}, " if answers[2] != 3 else "Answer2, "
	findEnemyArgsString += f"{answers[3]}, " if answers[3] != 3 else "Answer3, "
	findEnemyArgsString += f"{answers[4]}, " if answers[4] != 3 else "Answer4, "
	findEnemyArgsString += f"{answers[5]}, " if answers[5] != 3 else "Answer5, "
	findEnemyArgsString += f"{answers[6]}, " if answers[6] != 3 else "Answer6, "
	findEnemyArgsString += f"{answers[7]}, " if answers[7] != 3 else "Answer7, "

	for i in prolog.query(f"findEnemy({findEnemyArgsString} Enemy)"):
		answer = i["Enemy"].decode('utf-8')

		if messagebox.askyesno("Думаю...", f"Вы загадали {answer}?", icon='warning'):
			messagebox.showinfo("", "Угадал! Выключаюсь")
			exit(0)
	
	else: # for i in prolog.query(f"findEnemy({findEnemyArgsString} Enemy)"):
		yesRadioButton.grid_forget()
		noRadioButton.grid_forget()
		partialRadioButton.grid_forget()
		dontKnownRadioButton.grid_forget()
		nextQuestButton.grid_forget()

		questLabel.configure(text = "Я не знаю, кто это! Введите в поле ниже персонажа и я добавлю его в базу!")
		nameText = StringVar()
		name = Entry(window, textvariable = nameText)
		name.grid(row=1, column=0)
		def confimClick():
			if nameText.get().strip() == "":
				return

			if 3 not in answers.values():
				for i in prolog.query(f"save('newBase.pl', {answers[1]}, {answers[2]}, {answers[3]}, {answers[4]}, {answers[5]}, {answers[6]}, {answers[7]}, '{nameText.get()}')"):
					pass
				messagebox.showinfo("", "База обновлена!")
			else:
				messagebox.showinfo("Из-за наличия нечеткого ответа база не обновлена!")

		confim = Button(window, text="Подтвердить")
		confim.configure(command=confimClick)
		confim.grid(row=2, column=0)

def setQuest7State():
	quest1Text = 'Враг был в классическое террарии? То есть, до версии 1.1\r\n'
	questLabel.configure(text=quest1Text)
	answers[6] = selectedRadioButton.get()
	partialRadioButton.configure(state=DISABLED)
	nextQuestButton.configure(command=getResults)

def setQuest6State():
	quest1Text = 'Имеется ли событие, как-либо связанное с вашим противником?\r\n'
	questLabel.configure(text=quest1Text)
	answers[5] = selectedRadioButton.get()
	partialRadioButton.configure(state=DISABLED)
	nextQuestButton.configure(command=setQuest7State)

def setQuest5State():
	quest1Text = 'Имеет ли противник ограничения на появление во время какого-либо времени суток? Например, только ночью или только днем\r\n'
	questLabel.configure(text=quest1Text)
	answers[4] = selectedRadioButton.get()
	partialRadioButton.configure(state=NORMAL)
	nextQuestButton.configure(command=setQuest6State)

def setQuest4State():
	quest1Text = 'Может ли игрок призвать данного противника какими-либо своими действиями, помимо использования соответствующей статуи\r\n'
	questLabel.configure(text=quest1Text)
	answers[3] = selectedRadioButton.get()
	partialRadioButton.configure(state=DISABLED)
	nextQuestButton.configure(command=setQuest5State)

def setQuest3State():
	quest1Text = 'Ваш враг является редким противником? [боссы - редкие!]\r\n'
	questLabel.configure(text=quest1Text)
	answers[2] = selectedRadioButton.get()
	partialRadioButton.configure(state=DISABLED)
	nextQuestButton.configure(command=setQuest4State)

def setQuest2State():
	quest1Text = 'Ваш враг является боссом, мини-боссом или боссом события?\r\n'
	questLabel.configure(text=quest1Text)
	answers[1] = selectedRadioButton.get()
	partialRadioButton.configure(state=DISABLED)
	nextQuestButton.configure(command=setQuest3State)

def setQuest1State():
	quest1Text = 'Встречается только после убийства стены плоти?\r\n'
	questLabel.configure(text=quest1Text)
	partialRadioButton.configure(state=DISABLED)
	nextQuestButton.configure(command=setQuest2State)

if __name__ == "__main__":
	setQuest1State()
	window.mainloop()
