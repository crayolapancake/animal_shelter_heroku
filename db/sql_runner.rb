require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'de04d4rdldvht0',
        host: 'ec2-54-235-66-24.compute-1.amazonaws.com',
        port: 5432,
        user: 'ftwifuvbfiqwjp',
        password: 'acd99f2ad47e227af07369526fec1288342647391944d638910ccd94d4b8eb09'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
