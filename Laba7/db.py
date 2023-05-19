import psycopg2

conn = psycopg2.connect(database="LABA_7",
                        user="postgres",
                        password="Danila314",
                        host="localhost",
                        port="5432")

cursor = conn.cursor()

weekday = ['Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота']


def get_day(week, day):
    timetable = [0] * 6
    cursor.execute(f'SELECT class, class_time, room_number FROM timetable WHERE qqqw = {week} AND gggg = {day}')
    classrooms = cursor.fetchall()
    print(classrooms)
    for classroom in classrooms:
        day1 = []
        cursor.execute(f'SELECT subject, subject_type FROM classs WHERE id = {classroom[0]}')
        subjects = cursor.fetchall()
        subject = subjects[0][0]
        subject_type = subjects[0][1]
        cursor.execute(f'SELECT start_time FROM timee WHERE id = {classroom[1]}')
        time = cursor.fetchone()[0]
        day1.append(time)
        cursor.execute(f'SELECT name FROM subject WHERE id = {subject}')
        subj = cursor.fetchone()[0]
        day1.append(subj)
        cursor.execute(f'SELECT teacher FROM teacher_subject WHERE clas = {classroom[0]}')
        teacher_id = cursor.fetchone()[0]
        cursor.execute(f'SELECT full_name FROM teacher WHERE id = {teacher_id}')
        teacher = cursor.fetchone()[0]
        day1.append(teacher)
        cursor.execute(f'SELECT name FROM subject_type WHERE id = {subject_type}')
        subject_type_name = cursor.fetchone()[0]
        day1.append(subject_type_name)
        day1.append(classroom[2])
        timetable[classroom[1] - 1] = day1
        print(timetable)
    return timetable


def get_day_formatting(week, day):
    timetable = get_day(week, day)
    s = f'    {weekday[day - 1]}    \n'
    for curr_day in range(1, 6):
        if timetable[curr_day - 1] == 0:
            s += f'———————————————————\n{curr_day}. Пара отсутствует\n'
        else:
            s += f'———————————————————\n{curr_day}. {timetable[curr_day - 1][0]}\n{timetable[curr_day - 1][1]}\n' \
                 f'{timetable[curr_day - 1][3]}\n' \
                 f'{timetable[curr_day - 1][2]} | {timetable[curr_day - 1][4]}\n'
    return s


def get_week_formatting(week):
    s = ''
    for day in range(1, 7):
        s += get_day_formatting(week, day) + '\n'
    return s
