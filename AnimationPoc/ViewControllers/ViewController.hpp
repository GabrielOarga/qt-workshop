#ifndef VIEWCONTROLLER_HPP
#define VIEWCONTROLLER_HPP

#include <QQuickItem>

class ViewController : public QQuickItem
{
    Q_OBJECT

    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)

public:

    ViewController();
    virtual ~ViewController();

    QString title() { return m_title; }
    void setTitle( const QString title ) { if ( title != m_title ) m_title = title; emit titleChanged(); }

signals:
    void titleChanged();

private:

    QString m_title;
};

#endif // VIEWCONTROLLER_HPP
