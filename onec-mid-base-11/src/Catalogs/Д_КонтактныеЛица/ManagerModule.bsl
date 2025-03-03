#Область ОбработчикиСобытий

Процедура ОбработкаПолученияПолейПредставления(Поля, СтандартнаяОбработка) 
	
	СтандартнаяОбработка = Ложь;
	Поля.Добавить("Наименование");
	Поля.Добавить("Д_ДействуетНаОсновании");
	
КонецПроцедуры 

Процедура ОбработкаПолученияПредставления(Данные, Представление, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	Если ЗначениеЗаполнено(Данные.Д_ДействуетНаОсновании) Тогда
		Представление = Данные.Наименование + " (" + "на основании " + (Строка(Данные.Д_ДействуетНаОсновании)) + ")";
	Иначе
		Представление = Данные.Наименование;
	КонецЕсли;
КонецПроцедуры

#КонецОбласти