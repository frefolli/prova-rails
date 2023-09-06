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

Account.delete_all

assert_create(Account, [
  {:name => "a", :surname => "A", fiscalcode: "0", :credit => 0},
  {:name => "b", :surname => "B", fiscalcode: "1", :credit => 0},
  {:name => "c", :surname => "C", fiscalcode: "2", :credit => 0},
  {:name => "d", :surname => "D", fiscalcode: "3", :credit => 0},
  {:name => "a", :surname => "E", fiscalcode: "4", :credit => 0},
  {:name => "e", :surname => "A", fiscalcode: "5", :credit => 0},
  {:name => "a", :surname => "A", fiscalcode: "6", :credit => 0}
])
