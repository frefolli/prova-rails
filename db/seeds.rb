def assert_count(obj, count)
  if obj.count() != count
    raise obj.to_s + "::ERR: Expected allocation of " + count.to_s +  " rows, got " + obj.count().to_s
  else
    puts obj.to_s + "::OK"
  end
end

def assert_create(obj, params)
  obj.create(params)
  assert_count(obj, params.length)
end

Transaction.delete_all
Account.delete_all

assert_create(Account, [
  {:name => "A", :surname => "Ason", fiscalcode: "0", :credit => 10},
  {:name => "B", :surname => "Bson", fiscalcode: "1", :credit => 10},
  {:name => "C", :surname => "Cson", fiscalcode: "2", :credit => 10}
])

assert_create(Transaction, [
  {:from => Account.find_by(fiscalcode: "0"),
   :to => Account.find_by(fiscalcode: "1"),
   :timestamp => "2010-10-20 10:10:10",
   :amount => 1},
  {:from => Account.find_by(fiscalcode: "0"),
   :to => Account.find_by(fiscalcode: "2"),
   :timestamp => "2010-10-20 10:10:10",
   :amount => 2},
  {:from => nil,
   :to => Account.find_by(fiscalcode: "2"),
   :timestamp => "2010-10-20 10:10:10",
   :amount => 2}
])
