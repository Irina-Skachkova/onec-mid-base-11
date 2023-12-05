
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
		//++ Скачкова 05.12.2023
	Команда = Команды.Добавить("Пересчитать");
    Команда.Действие = "Пересчитать";
    Команда.Заголовок = "Пересчитать";
	
	Кнопка = Элементы.Добавить("КомандаПересчитать", Тип("КнопкаФормы"), Элементы.ГруппаШапкаЛево);
    Кнопка.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	Кнопка.Отображение = ОтображениеКнопки.КартинкаИТекст;
	Кнопка.Картинка = БиблиотекаКартинок.Обновить;
    Кнопка.ИмяКоманды = "Пересчитать"; 
	//-- 05.12.2023
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы
&НаКлиенте
Процедура Д_СогласованнаяСкидкаПриИзменении(Элемент)

	ПересчитатьАсинх();

КонецПроцедуры 

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
		
	//++ Скачкова 05.12.2023
	//КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	//ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	
	ИтоговаяСкидка = ТекущиеДанные.Скидка + Объект.Д_СогласованнаяСкидка;
	Если ИтоговаяСкидка < 100 Тогда
		ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * (1 -ИтоговаяСкидка / 100);
	Иначе
		ТекущиеДанные.Сумма  = 0;
		ОбщегоНазначенияКлиент.СообщитьПользователю("Суммарная скидка не может превышать 100%");
	КонецЕсли;
	//-- 05.12.2023	
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

&НаКлиенте
Процедура ПересчитатьТабличныеДанные()
	//++ Скачкова 05.12.2023
	Для Каждого Строка Из Объект.Товары Цикл
		РассчитатьСуммуСтроки(Строка);
	КонецЦикла;
	
	Для Каждого Строка ИЗ Объект.Услуги Цикл
		РассчитатьСуммуСтроки(Строка);
	КонецЦикла;
	
	РассчитатьСуммуДокумента();
	//-- 05.12.2023
КонецПроцедуры 

&НаКлиенте
Асинх Процедура ПересчитатьАсинх()
	//++ Скачкова 05.12.2023
	Если Объект.Товары.Количество() > 0 Или Объект.Услуги.Количество() > 0 Или Объект.Д_СогласованнаяСкидка > 0 Тогда
		Ответ = Ждать ВопросАсинх("Пересчитать сумму товаров и услуг с учетом согласованной скидки?", РежимДиалогаВопрос.ДаНет);
	Иначе
		Возврат;
	КонецЕсли;
	Если Ответ = КодВозвратаДиалога.Да Тогда
		ПересчитатьТабличныеДанные();
	КонецЕсли;
	//-- 05.12.2023 
КонецПроцедуры

&НаКлиенте
Процедура Пересчитать(Команда)
	//++ Скачкова 05.12.2023
	ПересчитатьАсинх();
	//-- 05.12.2023 
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
