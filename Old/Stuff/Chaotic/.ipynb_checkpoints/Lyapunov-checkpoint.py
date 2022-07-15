import lifelib
rules = ["b3s23"]
rpattern = "bo7b$obo6b$bo7b8$8bo$6bobo$5b2obo2$4b3o!"
sess = lifelib.load_rules(rules[0])
lt = sess.lifetree()
lidka = lt.pattern(rpattern)
print("Initial population: %d" % lidka.population)
lidka_30k = lidka[3000]
print("Final population: %d" % lidka_30k.population)
lidka_30k.save("prova.rle")
lidka.viewer()
