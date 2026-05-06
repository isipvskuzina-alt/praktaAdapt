
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    login VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) DEFAULT 'student',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ninjas (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    element VARCHAR(50) NOT NULL,
    weapon VARCHAR(100),
    description TEXT,
    image_url TEXT
);

CREATE TABLE schedule (
    id SERIAL PRIMARY KEY,
    ninja_id INT REFERENCES ninjas(id),
    lesson_title VARCHAR(100) NOT NULL,
    description TEXT,
    lesson_date DATE NOT NULL,
    lesson_time TIME NOT NULL,
    room VARCHAR(50),
    teacher_id INT REFERENCES users(id)
);

-- Добавляем мастеров ниндзя
INSERT INTO ninjas (name, element, weapon, description, image_url) VALUES
('Коул', 'Земля', 'Коса Землетрясений', 'Мастер земли и силы, самый сильный физически ниндзя', 'https://i.pinimg.com/736x/45/de/65/45de65d51ed8db0d83f8ad5d1abf0034.jpg'),
('Кай', 'Огонь', 'Огненные катаны', 'Самый горячий ниндзя, мастер стихии огня, лидер команды', 'https://i.pinimg.com/474x/1c/be/a6/1cbea6744d68c853e7e737a66cd03581.jpg'),
('Джей', 'Молния', 'Нунчаки молнии', 'Мастер молнии и остроумный изобретатель, гений техники', 'https://i.pinimg.com/736x/97/16/0b/97160b9f4b87020297be8e51b4871205.jpg'),
('Зейн', 'Лёд', 'Сюрикены льда', 'Мастер льда, ниндроид с душой человека, самый мудрый', 'https://i.pinimg.com/736x/a4/2b/f8/a42bf8920ad7c843307e3899bdfedbcc.jpg'),
('Ллойд', 'Энергия', 'Зелёные когти', 'Золотой ниндзя, Избранный, мастер энергии', 'https://i.pinimg.com/736x/5e/7c/7b/5e7c7be7b204a4c4bb5c1b9b9112d07e.jpg');

INSERT INTO schedule (ninja_id, lesson_title, description, lesson_date, lesson_time, room) VALUES
(1, 'Мастерство Земли', 'Изучение основ стихии земли и техник обороны', '2026-06-10', '10:00:00', 'Зал Земли'),
(2, 'Пламя дракона', 'Тренировка контроля огня и атакующих техник', '2026-06-11', '14:00:00', 'Зал Огня'),
(3, 'Энергия молнии', 'Скоростные техники и использование нунчаков', '2026-06-12', '11:30:00', 'Зал Молнии'),
(4, 'Искусство льда', 'Защитные техники и сюрикены', '2026-06-13', '09:00:00', 'Зал Льда');

SELECT 'База данных Ниндзяго создана!' as "Статус";
SELECT COUNT(*) as "Количество ниндзя" FROM ninjas;
SELECT COUNT(*) as "Количество уроков" FROM schedule;
