﻿
Функция PingGetPing(Запрос)
	Возврат ОбщегоНазначенияHTTP.ПростойУспешныйОтвет();
КонецФункции

Функция SendPostSend(Запрос)
	УстановитьПривилегированныйРежим(Истина);
	
	Попытка
		Ответ = Телеграм.ОбработатьВходящийЗапрос(Запрос);
	Исключение
		Ответ = ОбщегоНазначенияHTTP.ОтветОбОшибке(ИнформацияОбОшибке());
	КонецПопытки;
	
	ОбщегоНазначенияHTTP.ЗаписатьЛогДляВходящегоHTTPЗапроса("tg/send", Запрос, Ответ);
	
	Возврат Ответ;
КонецФункции
