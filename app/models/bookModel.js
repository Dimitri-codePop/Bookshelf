const client = require('../client');
const CoreModel = require('./coreModel');

class BookModel extends CoreModel {

    static tableName = 'book';

    static fields = [
        'reference',
        'title',
        'locale',
        'year',
        'page_count',
        'chapter_count',
        'front_cover',
        'cover',
        'publisher_id',
        'genre_id',
        'author_id',
        'book_id'
    ]

    constructor(obj){
        super(obj);
    }
     async insert() {
        try {
            if(this.dataValues.author_id) {
                super.insert();
                for (const prop of this.dataValues.author_id) {
                    await client.query(`INSERT INTO "book_has_author" ("book_id","author_id") VALUES ($1, $2)`, [this.dataValues, prop])
                }
            }

            if (this.dataValues.genre_id){
                super.insert();
                for (const prop of this.dataValues.genre_id) {
                    await client.query(`INSERT INTO "book_has_genre" ("book_id","genre_id") VALUES ($1, $2)`, [this.dataValues, prop])
                }
            }
        } catch (error) {
            console.trace(error);
        }
        
    } 

}
module.exports = BookModel;