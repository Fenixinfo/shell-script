from time import sleep
import os

print(('=')*30)
print('AGENDAMENTO DE DESLIGAMENTO')
print(('=')*30)
print(''' TIPOS DE DESLIGAMENTO

off ------------  Desliga o computador
standby --------  Minimo de economia
suspend --------  Suspende disco
mem ------------  suspende RAM
''')
while True:
    op =  'off' 
    ti = str(input('     Qual tipo de desligamento? '))
    if ti == op:
        break
    else:
        print('     !!!! Opcao invalida !!!!  ')

print(('=')*50)
print('       *** Tempo em segundos ')
#while True:    
te = int(input('     Qual o tempo para reinicio? '))

up = te / 3.600

print(('=')*30)
print('          O computador retornara em {} horas'.format(up))
print('          O computador se desligara em 1 minuto') 
for c in range(60, 0,  -1):
    print(c)
    sleep(1) 
var =('         rtcwake -m {} -s {}'.format(ti, te))
print(var)
print('      BY       ')


