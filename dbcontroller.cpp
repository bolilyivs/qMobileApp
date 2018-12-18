#include "dbcontroller.h"

void DBController::createConnection()
{
    QFile dbFileTarget("./" + mDBPath);
    if(!dbFileTarget.exists()){
        QFile dbFile(":/db/" + mDBPath);
        if (dbFile.exists())
        {
             dbFile.copy("./" + mDBPath);
             QFile::setPermissions("./" + mDBPath,QFile::WriteOwner | QFile::ReadOwner);
        }
        dbFile.close();
    }
    mDB = QSqlDatabase::addDatabase("QSQLITE", mDBPath);
    mDB.setDatabaseName("./" + mDBPath);
}


void DBController::doQuery(QString squery)
{
    qDebug() << squery;

    if(!mDB.open()){
        qDebug() << "Error open";
        mDB.close();
        return ;
    }

    if(mDB.isOpen())
    {
        qDebug() << "Open:";
    }

    QSqlQuery query = mDB.exec(squery);

    mMapResults.clear();

    QString str = "";
    QSqlRecord qsr = query.record();
    while(query.next()){
        mMapResults.append(QMap<QString, QString>());
        for(int i=0; i< qsr.count(); i++){
            mMapResults.last()[qsr.fieldName(i)] =  query.value(i).toString();
        }
    }
    mDB.close();
}


