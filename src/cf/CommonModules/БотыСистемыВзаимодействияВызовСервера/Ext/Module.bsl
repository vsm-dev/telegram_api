﻿
#Область ПрограммныйИнтерфейс

Процедура ИнициализацияБотов() Экспорт
	Если НЕ СистемаВзаимодействия.ИнформационнаяБазаЗарегистрирована() Тогда
		Возврат;
	КонецЕсли;
	
	УстановитьПривилегированныйРежим(Истина);
	
	СоздатьТестовогоЭхоБота();
КонецПроцедуры

Процедура ВыполнитьОбработкуБотов() Экспорт
	СистемаВзаимодействия.ВыполнитьОбработкуБотов();
КонецПроцедуры

Функция ИдентификаторТестовогоЭхоБотаВСистемеВзаимодействия() Экспорт
	ИменаБота = ИменаТестовогоЭхоБота();
	Возврат ИдентификаторБотаВСистемеВзаимодействия(ИменаБота.Имя);
КонецФункции

Процедура СоздатьСообщениеТестовогоЭхоБота(ТекстСообщения, ИдентификаторОбсуждения) Экспорт
	Ответ = СистемаВзаимодействия.СоздатьСообщение(ИдентификаторОбсуждения);
	Ответ.Текст = "Цитирую:" + Символы.ПС + ">" + СтрСоединить(СтрРазделить(ТекстСообщения, Символы.ПС), Символы.ПС + ">");
	Ответ.Записать();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура СоздатьТестовогоЭхоБота()
	ИменаБота = ИменаТестовогоЭхоБота();
	СоздатьБота(ИменаБота);
КонецПроцедуры

Функция ИменаТестовогоЭхоБота()
	Возврат Новый Структура("Имя, ПолноеИмя", "ТестовыйЭхоБот", "Тестовый эхо-бот");
КонецФункции

Процедура СоздатьБота(ИменаБота)
	БотКакПользовательИБ = ПользователиИнформационнойБазы.НайтиПоИмени(ИменаБота.Имя);
	
	Если БотКакПользовательИБ = Неопределено Тогда
		БотКакПользовательИБ = ПользователиИнформационнойБазы.СоздатьПользователя();
		БотКакПользовательИБ.Имя = ИменаБота.Имя;
		БотКакПользовательИБ.ПолноеИмя = ИменаБота.ПолноеИмя;
		БотКакПользовательИБ.ПоказыватьВСпискеВыбора = Ложь;
		БотКакПользовательИБ.Записать();
		
		БотКакПользовательСВ = СистемаВзаимодействия.СоздатьПользователя(БотКакПользовательИБ);
		БотКакПользовательСВ.Записать();
	КонецЕсли;
КонецПроцедуры

Функция ИдентификаторБотаВСистемеВзаимодействия(ИмяБота)
	Если НЕ СистемаВзаимодействия.ИнформационнаяБазаЗарегистрирована() Тогда
		Возврат "";
	КонецЕсли;
	
	БотКакПользовательИБ = ПользователиИнформационнойБазы.НайтиПоИмени(ИмяБота);
	Если БотКакПользовательИБ = Неопределено Тогда
		Возврат "";
	КонецЕсли;
	
	Возврат СистемаВзаимодействия.ПолучитьИдентификаторПользователя(БотКакПользовательИБ.УникальныйИдентификатор);
КонецФункции

#КонецОбласти