/*!
 * @file UtilsSysManageDB.hpp
 * @author INikituk (inikituk@npomis.ru)
 * @brief Файл содержит структуры предназначенные для структурирования данных необходимых
 * для методов запросов/ответов к/от СУБД
 */

#ifndef UTILSSYSMANAGEDB_HPP
#define UTILSSYSMANAGEDB_HPP

#include <QStringList>

namespace ES {

/*!
 * \brief Структура предназначена для передачи структурированных
 * данных в метод получения информации о групповых объектах
 */
typedef struct  s_requestGroupObjects
{
	QStringList	countryList;
	QStringList	typeObjectsList;
}	t_requestGroupObjects;

/*!
 * \brief Структура предназначена для передачи структурированных
 * данных из метода получения информации о групповых объектах
 */
typedef struct s_responseGroupObjects
{
	int			groupObjId;
	QString		nameGroupObj;
	QString		nameTypeGroupObj;
	QString		nameCountry;
	qreal		coordX;
	qreal		coordY;
	QStringList	pathSatelliteImage;
	//Count	satteliteShots
	//Count	rentgenShots;
	//Count	ikShots;
	//has klassifiersFile;
	//has mvm;
}	t_responseGroupObjects;

}

#endif // UTILSSYSMANAGEDB_HPP
