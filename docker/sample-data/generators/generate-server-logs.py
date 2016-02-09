import tempfile, random, uuid, json

#1420102842 (000) - 01/01/2015
#1450029600 (000) - 31/12/2015

logLevels = ['D'] * 10 + ['I'] * 6 + ['W'] * 5 + ['E'] * 3 + ['F']
 
with tempfile.NamedTemporaryFile(delete=False) as nf:
	for _ in xrange(50000):
		timestamp = random.randint(1420102842, 1450029600)       
		hostName = 'SCSVR1'
		logLevel = random.choice(logLevels)
		message =  [str(uuid.uuid4())] * random.randint(1, 10)
		line = ','.join([hostName, str(timestamp), logLevel, ''.join(message), "\r\n"])
		nf.write(line)
	print nf.name