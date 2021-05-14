
z = 3
a = <<TEST
  test data #{z}
  fuck you
TEST

p a.split(/\R/).map(&:strip)

