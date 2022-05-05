#ifndef SIGNAL_GENERATOR_H
#define SIGNAL_GENERATOR_H

#include <QObject>
#include <QTimer>
#include <QString>
#include <QDebug>


class Signal_generator : public QObject
{
    Q_OBJECT
public:
    explicit Signal_generator(QObject *parent = nullptr);
    QTimer *loop;
    Q_INVOKABLE void init_obj();

    ~Signal_generator();


signals:

    void Send_data(QString);

public slots:
    void generator();

};


#endif // SIGNAL_GENERATOR_H
