create table "Исполнитель"
(
	"ИсполнительID" integer generated by default as identity
		constraint "Исполнитель_pk"
			primary key,
	"Псевдоним" varchar not null
);

create table "Альбом"
(
	"АльбомID" integer generated by default as identity
		constraint "Альбом_pk"
			primary key,
	"Название" varchar not null,
	"Год выпуска" date not null
);

create table "АльбомыИсполнителя"
(
	"Альбом" integer not null
		constraint "АльбомыИсполнителя_Альбом_АльбомI"
			references "Альбом",
	"Исполнитель" integer not null
		constraint "АльбомыИсполнителя_Исполнитель_И"
			references "Исполнитель",
	constraint "АльбомыИсполнителя_pk"
		primary key ("Исполнитель", "Альбом")
);

create table "Жанр"
(
	"ЖанрID" integer generated by default as identity
		constraint "Жанр_pk"
			primary key,
	"Название" varchar not null
);

create table "ЖанрыИсполнителя"
(
	"Исполнитель" integer not null
		constraint "ЖанрыИсполнителя_Исполнитель_Исп"
			references "Исполнитель",
	"Жанр" integer not null
		constraint "ЖанрыИсполнителя_Жанр_ЖанрID_fk"
			references "Жанр",
	constraint "ЖанрыИсполнителя_pk"
		primary key ("Исполнитель", "Жанр")
);

create table "Трек"
(
	"ТрекID" integer generated by default as identity
		constraint "Трек_pk"
			primary key,
	"Название" varchar not null,
	"Длительность" time not null,
	"Альбом" integer not null
		constraint "Трек_Альбом_АльбомID_fk"
			references "Альбом"
);

create table "Сборник"
(
	"СборникID" integer generated by default as identity
		constraint "Сборник_pk"
			primary key,
	"Название" varchar not null,
	"Год выпуска" date not null
);

create table "ТрекиСборника"
(
	"Трек" integer not null
		constraint "ТрекиСборника_Трек_ТрекID_fk"
			references "Трек",
	"Сборник" integer not null
		constraint "ТрекиСборника_Сборник_СборникID_fk"
			references "Сборник",
	constraint "ТрекиСборника_pk"
		primary key ("Трек", "Сборник")
);


