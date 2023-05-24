#include "SysManageDB.hpp"

ES::SysManageDB::SysManageDB() {}

ES::SysManageDB::~SysManageDB()
{
	QSqlDatabase db = QSqlDatabase::database();
	if (db.isOpen())
		db.close();
}

bool	ES::SysManageDB::connectSUBD(const t_paramSUBD& param)
{
	bool	ret;

	QSqlDatabase db = QSqlDatabase::addDatabase(param.driver);
	db.setHostName(param.hostName);
	db.setPort(param.port);
	db.setDatabaseName(param.databaseName);
	db.setUserName(param.userName);
	db.setPassword(param.password);
	ret =db.open();
	if (ret)
		qInfo() << "SUBD is connected";
	return (ret);
}

QList<ES::t_responseGroupObjects>*	ES::SysManageDB::getGroupObjs(t_requestGroupObjects req)
{
	QList<ES::t_responseGroupObjects>* resp = new QList<ES::t_responseGroupObjects>;
	QSqlQueryModel pModel;

	QString query("SELECT group_obj.group_obj_id, type_group_obj.name_type_group_obj, "
				  "country.name_country_id, group_obj.name_group_obj, group_obj.coord_x, group_obj.coord_y "
				  "FROM group_obj "
				  "INNER JOIN country "
				  "ON group_obj.country_id = country.country_id "
				  "INNER JOIN type_group_obj "
				  "ON group_obj.type_group_obj_id = type_group_obj.type_group_obj_id "
				  "WHERE country.name_country_id IN ('%1')"
				  "AND type_group_obj.name_type_group_obj IN ('%2');"
				  );
	query = query.arg(req.countryList.join("', '")).arg(req.typeObjectsList.join("', '"));

	pModel.setQuery(query);

	t_responseGroupObjects  temp;
	for (int i = 0; i < pModel.rowCount(); ++i)
	{
		temp.groupObjId = pModel.data(pModel.index(i, 0)).toInt();
		temp.nameTypeGroupObj = pModel.data(pModel.index(i, 1)).toString();
		temp.nameCountry = pModel.data(pModel.index(i, 2)).toString();
		temp.nameGroupObj = pModel.data(pModel.index(i, 3)).toString();
		temp.coordX = pModel.data(pModel.index(i, 4)).toReal();
		temp.coordY = pModel.data(pModel.index(i, 1)).toReal();
		temp.pathSatelliteImage = getPathsToSatelliteImage(temp.groupObjId);
		resp->append(temp);
	}
	return (resp);
}

QStringList	ES::SysManageDB::getPathsToSatelliteImage(int idGroupObj)
{
	QSqlQueryModel pModel;
	QString query("SELECT source_data_path "
				  "FROM source_data "
				  "WHERE group_obj_id = %1 "
				  "ORDER BY data_create DESC;"
				  );
	pModel.setQuery(query.arg(idGroupObj));
	QStringList list;
	for(int i = 0; !(pModel.data(pModel.index(i, 0)).toString()).isNull(); ++i)
		list << pModel.data(pModel.index(i, 0)).toString();
	return list;
}

QStringList	ES::SysManageDB::getListCountry()
{
	QSqlQueryModel pModel;
	QString	query("SELECT name_country_id "
				  "FROM country "
				  "ORDER BY name_country_id;"
				  );
	pModel.setQuery(query);
	QStringList list;
	for(int i = 0; !(pModel.data(pModel.index(i, 0)).toString()).isNull(); ++i)
		list << pModel.data(pModel.index(i, 0)).toString();
	return list;
}

QStringList	ES::SysManageDB::getListTypeGroupObject()
{
	QSqlQueryModel pModel;
	QString	query("SELECT name_type_group_obj "
				  "FROM type_group_obj "
				  "ORDER BY name_type_group_obj; "
				  );
	pModel.setQuery(query);

	QStringList list;
	for(int i = 0; !(pModel.data(pModel.index(i, 0)).toString()).isNull(); ++i)
		list << pModel.data(pModel.index(i, 0)).toString();
	return list;
}

QStringList	ES::SysManageDB::getListTypeBLA()
{
	QSqlQueryModel pModel;
	QString query("SELECT name_type_bla "
				  "FROM type_bla "
				  "ORDER BY name_type_bla ASC;"
				  );
	pModel.setQuery(query);

	QStringList list;
	for(int i = 0; !(pModel.data(pModel.index(i, 0)).toString()).isNull(); ++i)
		list << pModel.data(pModel.index(i, 0)).toString();

	return list;
}
