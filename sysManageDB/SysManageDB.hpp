/*!
 * @file SysManageDB.hpp
 * @author INikituk (inikituk@npomis.ru)
 * @brief Основной файл имплементирующий функции СУБД и файлового сервера
 */

#ifndef SYSMANAGEDB_HPP
#define SYSMANAGEDB_HPP

#include <QtSql>
#include "UtilsSysManageDB.hpp"

namespace ES {

/*!
 * \brief Структура t_paramSUBD предназначена для передачи
 * структурированных данных в метод connectSUBD
 */
typedef struct s_paramSUBD
{
	QString	driver;
	QString	hostName;
	qint32	port;
	QString	databaseName;
	QString	userName;
	QString	password;
}	t_paramSUBD;

/*!
 * \brief Класс SysManageDB предназначени для работы с СУБД
 */
class SysManageDB
{
public:
	SysManageDB();
	virtual ~SysManageDB();

	/*!
	 * \brief connectSUBD - метод для соединения с СУБД
	 * \param param - структура t_paramSUBD, которая содержит все необходимые параметры для установки соединения
	 * \return True если соединение было успешно установлено, иначе false
	 */
	bool	connectSUBD(const t_paramSUBD& param);

	/*!
	 * \brief Метод getGroupObjs - для получения групповых объектов
	 * \param структура t_requestGroupObjects
	 * \return Список структур t_responseGroupObjects, длина списка равна количеству объектов
	 */
	QList<t_responseGroupObjects>*	getGroupObjs(t_requestGroupObjects req);

	/*!
	 * \brief getPathToSatelliteImage - метод для получения списка путей до спутниковых изображений
	 * на файловом сервере отсортированном по датам от новых к старым
	 * \param idGroupObj - уникальный идентификатор группового объекта
	 * \return Возвращает список строк, который содержит пути до спутниковых снимков
	 */
	QStringList						getPathsToSatelliteImage(int idGroupObj);

	/*!
	 * \brief getlistCountry - метод для получения списка стран из СУБД
	 * \return список строк (стран)
	 */
	QStringList						getListCountry();

	/*!
	 * \brief getlisttypeGroupObject - метод для получения списка типов групповых объектов
	 * \return список строк (типов групповых объектов)
	 */
	QStringList						getListTypeGroupObject();

	/*!
	 * \brief getListTypeBLA - метод для получения списка типов БЛА
	 * \return список строк (типов БЛА)
	 */
	QStringList						getListTypeBLA();
};
}

#endif // SYSMANAGEDB_HPP
