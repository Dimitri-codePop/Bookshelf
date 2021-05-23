const CoreModel = require('./coreModel');

class GenreModel extends CoreModel {

    static tableName = 'genre';

    static fields = [
        'label'
    ];

    if(fields){
        console.log(fields);
    }

    constructor(obj){
        super(obj);
    }

    
}


module.exports = GenreModel;