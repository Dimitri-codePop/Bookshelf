module.exports= {
    ressourceNotFound(_, res){
        res.status(404).json({error: `Ressource not found`});
    }
}