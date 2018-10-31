#ifndef TTSPEECH_H
#define TTSPEECH_H

#include <QObject>
#include <QTextToSpeech>
#include <QVector>

class TTSpeech : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double rate READ rate WRITE setRate)
    Q_PROPERTY(double pitch READ pitch WRITE setPitch)
    Q_PROPERTY(double volume READ volume WRITE setVolume)
    Q_PROPERTY(QVariantList voicesList READ voicesList)
    Q_PROPERTY(QString voice WRITE setVoice)

    QTextToSpeech *mSpeech;

public:
    enum Age { Child, Teenager, Adult, Senior, Other};
    enum Gender { Male, Female, Unknown };
    enum Language { Russian, English};
    enum Country { RF, USA};
    Q_ENUM(Age)
    Q_ENUM(Gender)
    Q_ENUM(Language)
    Q_ENUM(Country)


    explicit TTSpeech(QObject *parent = nullptr);

    Q_INVOKABLE void say(const QString &);
    Q_INVOKABLE void pause();
    Q_INVOKABLE void resume();
    Q_INVOKABLE void stop();
    QVariantList voicesList();


    void setRate(double);
    void setPitch(double);
    void setVolume(double);
    void setVoice(QString);
    Q_INVOKABLE void setLocal(Language, Country);

    double rate() {return mSpeech->rate();}
    double pitch() {return mSpeech->pitch();}
    double volume() {return mSpeech->volume();}

};

#endif // TTSPEECH_H
