

a = %w(a b c d e) + [1, 2, 3, 4, 5] + [nil, nil, nil]
pp a.group_by{_1.class}

