use myDatabase;
db.dropDatabase();

// Create the "authors" collection and insert data
db.authors.insertMany([
    { "_id": 1, "name": "John Doe", "age": 45 },
    { "_id": 2, "name": "Jane Smith", "age": 38 },
    { "_id": 3, "name": "Alice Johnson", "age": 50 }
]);

// Create the "books" collection and insert data
db.books.insertMany([
    { "_id": 101, "title": "MongoDB Mastery", "author_id": 1, "year": 2020 },
    { "_id": 102, "title": "NoSQL Explained", "author_id": 2, "year": 2019 },
    { "_id": 103, "title": "Advanced Databases", "author_id": 3, "year": 2018 },
    { "_id": 104, "title": "Introduction to MongoDB", "author_id": 1, "year": 2021 }
]);

// Exercício 1: Utilize $lookup para combinar as coleções authors e books e retornar o nome do autor e o título do livro.
db.authors.aggregate([
    {
        $lookup: {
            from: "books",
            localField: "_id",
            foreignField: "author_id",
            as: "livros"
        }
    }
]);

// Exercício 2: Use $lookup para retornar o nome do autor e todos os livros que ele escreveu.
db.authors.aggregate([
    {
        $lookup: {
            from: "books",
            localField: "_id",
            foreignField: "author_id",
            as: "livros"
        }
    },
    {
        $project: {
            Nome: "$name",
            Livro: "$livros.title"
        }
    }

]);

//Exercício 3: Adicione o campo nationality aos documentos da coleção authors usando $set.
db.authors.updateMany(
    {},
    { $set: { "nationality": "unknow" } }
);
db.authors.find();

// Exercício 4: Realize um $lookup para retornar o autor que escreveu o livro "MongoDB Mastery".
db.authors.aggregate([
    {
        $lookup: {
            from: "books",
            localField: "_id",
            foreignField: "author_id",
            as: "livros"
        }
    },
    {
        $unwind: "$livros"
    },
    {
        $match: { "livros.title": "MongoDB Mastery" }
    },
    {
        $project: {
            Nome: "$name",
            Livro: "$livros.title"
        }
    }
]);

// Exercício 5: Faça um $lookup entre authors e books e filtre a saída apenas para os autores que escreveram livros após 2019, usando $match.
db.authors.aggregate([
    {
        $lookup: {
            from: "books",
            localField: "_id",
            foreignField: "author_id",
            as: "livros"
        }
    },
    {
        $match: { "livros.year": { $gte: 2019 } }
    },
    {
        $project: {
            Nome: "$name",
            Livro: "$livros.title"
        }
    }
]);