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
  {:name => "a", :surname => "A", :credit => 0},
  {:name => "b", :surname => "B", :credit => 0},
  {:name => "c", :surname => "C", :credit => 0},
  {:name => "d", :surname => "D", :credit => 0},
  {:name => "a", :surname => "E", :credit => 0},# same name    OK
  {:name => "e", :surname => "A", :credit => 0} # same surname OK
  {:name => "a", :surname => "A", :credit => 0} # full replica ERR
])
