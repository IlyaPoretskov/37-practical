#include "mainwindow.h"
#include <QLineEdit>
#include <QPushButton>
#include <QGridLayout>
#include <QLabel>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
{
    QWidget *widget = new QWidget(this);
    setCentralWidget(widget);

    lineEdit1 = new QLineEdit;
    lineEdit2 = new QLineEdit;
    resultLineEdit = new QLineEdit;
    resultLineEdit->setReadOnly(true);

    addButton = new QPushButton(tr("Add"));
    subtractButton = new QPushButton(tr("Subtract"));
    multiplyButton = new QPushButton(tr("Multiply"));
    divideButton = new QPushButton(tr("Divide"));

    QGridLayout *layout = new QGridLayout(widget);
    layout->addWidget(new QLabel(tr("Number 1:")), 0, 0);
    layout->addWidget(lineEdit1, 0, 1);
    layout->addWidget(new QLabel(tr("Number 2:")), 1, 0);
    layout->addWidget(lineEdit2, 1, 1);
    layout->addWidget(new QLabel(tr("Result:")), 2, 0);
    layout->addWidget(resultLineEdit, 2, 1);

    layout->addWidget(addButton, 3, 0);
    layout->addWidget(subtractButton, 3, 1);
    layout->addWidget(multiplyButton, 4, 0);
    layout->addWidget(divideButton, 4, 1);

    connect(addButton, &QPushButton::clicked, this, &MainWindow::on_addButton_clicked);
    connect(subtractButton, &QPushButton::clicked, this, &MainWindow::on_subtractButton_clicked);
    connect(multiplyButton, &QPushButton::clicked, this, &MainWindow::on_multiplyButton_clicked);
    connect(divideButton, &QPushButton::clicked, this, &MainWindow::on_divideButton_clicked);

    setWindowTitle(tr("Basic Calculator"));
}

void MainWindow::on_addButton_clicked()
{
    bool ok1, ok2;
    double num1 = lineEdit1->text().toDouble(&ok1);
    double num2 = lineEdit2->text().toDouble(&ok2);

    if (ok1 && ok2) {
        double result = num1 + num2;
        resultLineEdit->setText(QString::number(result));
    } else {
        resultLineEdit->setText("ERROR");
    }
}

void MainWindow::on_subtractButton_clicked()
{
    bool ok1, ok2;
    double num1 = lineEdit1->text().toDouble(&ok1);
    double num2 = lineEdit2->text().toDouble(&ok2);

    if (ok1 && ok2) {
        double result = num1 - num2;
        resultLineEdit->setText(QString::number(result));
    } else {
        resultLineEdit->setText("ERROR");
    }
}

void MainWindow::on_multiplyButton_clicked()
{
    bool ok1, ok2;
    double num1 = lineEdit1->text().toDouble(&ok1);
    double num2 = lineEdit2->text().toDouble(&ok2);

    if (ok1 && ok2) {
        double result = num1 * num2;
        resultLineEdit->setText(QString::number(result));
    } else {
        resultLineEdit->setText("ERROR");
    }
}

void MainWindow::on_divideButton_clicked()
{
    bool ok1, ok2;
    double num1 = lineEdit1->text().toDouble(&ok1);
    double num2 = lineEdit2->text().toDouble(&ok2);

    if (ok1 && ok2) {
        if (num2 != 0) {
            double result = num1 / num2;
            resultLineEdit->setText(QString::number(result));
        } else {
            resultLineEdit->setText("ERROR: Divide by zero");
        }
    } else {
        resultLineEdit->setText("ERROR");
    }
}
