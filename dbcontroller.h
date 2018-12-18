#ifndef DBCONTROLLER_H
#define DBCONTROLLER_H
#include <QObject>
#include <QtSql>


class DBController : public QObject
{
    Q_OBJECT
protected:
    QSqlDatabase mDB;
    QString mDBPath;
    QVector<QMap<QString, QString>> mMapResults;
public:
    DBController(QObject *parent = nullptr)  : QObject(parent) {}
    void setDBPath(QString lDBPath){mDBPath = lDBPath;}
    QString getDBPath(){return mDBPath;}
    void createConnection();
    void doQuery(QString squery);
    QVector<QMap<QString, QString>> &getMapResults(){return mMapResults;}
signals:

public slots:
};

#endif // DBCONTROLLER_H
