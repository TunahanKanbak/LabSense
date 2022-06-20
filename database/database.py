import pandas as pd

def kullanıcıKontrol(uname, passw):
    return "full"

def deneyTalebiIsle(dict):
    print(dict)
    if dict['kullaniciAdi'] == 'admin':
        return True, 74572
    else:
        return False, 0

def deneyVerisiIsle(uname, deney_adi, tarih, dict):
    print('Operator Adi:{}\nDeney Adi:{}\nDeney Tarihi:{}'.format(uname, deney_adi, tarih))
    print('Sonuclar')
    print(dict)
    if uname == 'admin':
        return True, 74572
    else:
        return False, 0

def deneyTalebiGoruntule():
    return ['Tetra-A', 'Tetra-B', 'Beta-A', 'Charlie-B']

def deneySonucuGoruntule():
    pass