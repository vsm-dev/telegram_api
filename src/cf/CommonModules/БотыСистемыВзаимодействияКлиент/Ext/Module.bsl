﻿
#Область ПрограммныйИнтерфейс

Процедура ПриНачалеРаботыСистемы() Экспорт
	Если НЕ СистемаВзаимодействия.ИнформационнаяБазаЗарегистрирована() Тогда
		Возврат;
	КонецЕсли;
	
	Обработчик = Новый ОписаниеОповещения("ОбработкаОтправкиСообщения", ЭтотОбъект);
	СистемаВзаимодействия.ПодключитьОбработчикПослеОтправкиСообщения(Обработчик);
КонецПроцедуры

Процедура ОбработкаОтправкиСообщения(Сообщение, Обсуждение, ДополнительныеПараметры) Экспорт
	Если Обсуждение.Участники.Содержит(БотыСистемыВзаимодействияВызовСервера.ИдентификаторТестовогоЭхоБотаВСистемеВзаимодействия()) Тогда
		БотыСистемыВзаимодействияВызовСервера.СоздатьСообщениеТестовогоЭхоБота(Сообщение.Текст, Обсуждение.Идентификатор);
	КонецЕсли;
КонецПроцедуры

#КонецОбласти
