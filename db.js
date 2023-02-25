const Pool = require('pg').Pool
const connectionString = process.env.DATABASE_URL
const pool = new Pool({
    connectionString
})
const getMatches = (request, response) => {
    pool.query('SELECT * FROM pre_match', (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).json(results.rows)
    })
}
const saveMatch = (request, response) => {
    const data = request.body
    var as = data.as.replace("[", "").replace("]", "");
    var asg = data.asg.replace("[", "{").replace("]", "\}");
    var tct = data.tct.replace("[", "{").replace("]", "\}");
    var tsg = data.tsg.replace("[", "{").replace("]", "\}");
    console.log(asg);
    pool.query('call save_match ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28)'
    , [data.s, data.e, data.l, data.m, data.r, data.t, as, asg,
    data.acs, data.am, data.ad, tct, tsg, data.wf, data.wd, data.who,
    data.fpu, data.dt, data.fs, data.dn, data.ds, data.dr, data.sd, data.sr,
    data.die, data.tip, data.dc, data.co], (error, results) => {
        if (error) {
            throw error
        }
        response.status(201).send(`save good`)
    })
}
module.exports = {
    getMatches,
    saveMatch,
}