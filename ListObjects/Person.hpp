#ifndef CUSTOMDATAOBJECT_HPP
#define CUSTOMDATAOBJECT_HPP

#include <QObject>
#include <QQmlListProperty>

class Person : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int age READ age NOTIFY ageChanged)
    Q_PROPERTY(bool isDonor READ isDonor WRITE setIsDonor NOTIFY isDonorChanged)
    Q_PROPERTY(QString name READ name NOTIFY nameChanged)

    Q_PROPERTY(QQmlListProperty<Person> friends READ friends NOTIFY friendsChanged)

public:
    explicit Person(QObject *parent = nullptr);

    /* Getter methods */

    int age() const {
        return m_age;
    }

    bool isDonor() const {
        return m_isDonor;
    }

    QString name() const {
        return m_name;
    }

    QQmlListProperty<Person> friends() const {
        return m_friends;
    }

    /* Setter methods */

    void setIsDonor(bool isDonor) {
        if (m_isDonor != isDonor) {
            m_isDonor = isDonor;
        }
    }

signals:
    void ageChanged();
    void isDonorChanged();
    void nameChanged();
    void friendsChanged();

private:
    int m_age;
    bool m_isDonor;
    QString m_name;
    QQmlListProperty<Person> m_friends;

};

#endif // CUSTOMDATAOBJECT_HPP
