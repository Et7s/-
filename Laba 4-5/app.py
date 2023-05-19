import requests
from flask import Flask, render_template, request, redirect
import psycopg2

app = Flask(__name__)

conn = psycopg2.connect(database='LABA9',
                        user='postgres',
                        password='Danila314',
                        host='localhost',
                        port='5432',)

cursor = conn.cursor()

@app.route('/', methods=['GET'])
def index():
    return redirect("/login/")




@app.route('/login/', methods=['POST', 'GET'])
def login():
    if request.method == 'POST':
        if request.form.get("login"):
            login = request.form.get('login')
            password = request.form.get('password')
            if (not login) or (not password):
                return render_template('login.html', error='Введен неправильный логин или пароль')
            cursor.execute("SELECT * FROM peeople WHERE login=%s AND password=%s", (str(login), str(password)))
            records = list(cursor.fetchall())
            if records:
                return render_template('account.html', users=records[0][1], login=records[0][2], password=records[0][3])
            return render_template('login.html', error='Такой учетной записи не существует')
        elif request.form.get("registration"):
            return redirect("/registration/")

    return render_template('login.html')


@app.route('/registration/', methods=['POST', 'GET'])
def registration():
    if request.method == 'POST':
        name = request.form.get('name')
        login = request.form.get('login')
        password = request.form.get('password')
        if (not name):
            return render_template('registration.html', error='Имя не может быть пустым')
        elif not name.replace(" ", "").isalpha():
            return render_template('registration.html', error='имя не может содержать цифры')
        elif (not login) or (not password):
            return render_template('registration.html', error='Неправильно написали логин или пароль')
        if login:
            cursor.execute('SELECT * FROM service.users')
            rows = cursor.fetchall()
            for row in rows:
                if login ==row[2]:
                    return render_template('registration.html', error='Эта учетная запись уже существует')
        cursor.execute('INSERT INTO service.users (full_name, login, password) VALUES (%s, %s, %s);',
                       (str(name), str(login), str(password)))
        conn.commit()

        return redirect('/login/')

    return render_template('registration.html')


