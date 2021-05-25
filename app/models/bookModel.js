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
        'author_id'
    ]

    constructor(obj){
        super(obj);
    }

     async insert() {
         try {
            await super.insert();
            
            if(this.dataValues.author_id) {
                for (const prop of this.dataValues.author_id) {
                    await client.query(`INSERT INTO "book_has_author" ("book_id","author_id") VALUES ($1, $2)`, [this.dataValues.id, prop])
                }
            }

            if (this.dataValues.genre_id){
                for (const prop of this.dataValues.genre_id) {
                    await client.query(`INSERT INTO "book_has_genre" ("book_id","genre_id") VALUES ($1, $2)`, [this.dataValues.id, prop])
                }
            }
        } catch (error) {
            console.trace(error);
        }
        
    } 

}
module.exports = BookModel;