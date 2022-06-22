import mysql.connector as cn
from datetime import date, time
import pandas as pd
#from connection import MysqlDBConnection as mycnx



class MysqlDBManager:
    __host       = None
    __user       = None
    __password   = None
    __database   = None
    __session    = None
    __connection = None

    def __init__(self, host='localhost', user='root', password='', database='labsense'):
        self.__host     = host
        self.__user     = user
        self.__password = password
        self.__database = database
     

    def openDB(self):
        try:
            cnx = cn.connect(
                host=self.__host, 
                user=self.__user, 
                password= self.__password, 
                database= self.__database
            )
            self.__connection = cnx
            self.__session    = cnx.cursor()
            print('database baglantisi acildi')
        except cn.Error as e:
            print ("Error %d: %s" % (e.args[0], e.args[1]))
    ## End def __open

    def closeDB(self):
        self.__session.close()
        self.__connection.close()
        print('database baglantisi kapatildi')
    ## End def __close

    # yetki seviyesini kontrol eden fonksiyon
    def kullanici_sec(self,kullanici_adi,sifre):
        self.openDB()

        sql ='SELECT yetki FROM kullanici WHERE kullaniciAdi=%s AND sifre=%s'
        values = (kullanici_adi,sifre)

        try:
            self.__session.execute(sql,values)
            yetki = self.__session.fetchone()
            return yetki[0] if yetki else None
        except cn.Error as err:
            print("hata kullanici sec: {}".format(err))
        finally:
            self.closeDB()

    # müşterinin yapmış olduğu deney talebini işleyen ve talepID geri döndüren fonksiyon
    def deney_talebi_isle(self,musteri_adi,deney_turu, deney_kafilesi,tarih):

        self.openDB()
        
        durum = "open"
        sql ='INSERT INTO deneytalebi (tarih,deneyKafilesi,deneyTuru,durum) VALUES(%s,%s,%s,%s)'
        values = (tarih, deney_kafilesi, deney_turu, durum)

        try:
            self.__session.execute(sql,values)
            self.__connection.commit()
            self.__session.execute('SELECT MAX(talepID) FROM deneytalebi')
            talepID = self.__session.fetchone()
            print(f'son eklenen kayit id: {talepID}')
            self.talep_eder(musteri_adi, talepID[0])
            return True, talepID[0]
        except cn.Error as err:
            print("hata deney talebi isle: {}".format(err))
            return False, -1
        finally:
            self.closeDB()

    def talep_eder(self, musteri_adi, talepID):

        sql ='INSERT INTO talepeder (kullaniciAdi, talepID) VALUES(%s,%s)'
        values = (musteri_adi, talepID)
        self.__session.execute(sql,values)
        self.__connection.commit()

    def deney_talebi_goruntule(self):

        self.openDB()

        try:
            self.__session.execute('SELECT talepID FROM deneytalebi WHERE durum = "open"')
            result = self.__session.fetchall()
            talep_list = []
            for Id in result:
                talep_list.append(Id[0])
            return talep_list
        except cn.Error as err:
            print("hata deney talebi goruntule: {}".format(err))
            return []
        finally:
            self.closeDB()

    # deney verisini "girisyapar,sahiptir ve deneyversisi tablolarına" işleyen fonsiyon
    def deney_verisi_isle(self,talepID,lab_gorevlisi, df):

        self.openDB()        

        try:
            liste = []
            for _, aciklama, zaman, sonuc, sicaklik in df.itertuples():
                liste.append((aciklama, zaman, sonuc, sicaklik))

            IDlist = []
            for deger in liste:
                sql ='INSERT INTO deneyverisi (aciklama, zaman, sonuc, sicaklik) VALUES(%s,%s,%s,%s)'
                values = deger
                self.__session.execute(sql, values)
                self.__connection.commit()
                IDlist.append(self.__session.lastrowid)
                print(f'son eklenen kayit id: {self.__session.lastrowid}')

            self.sahiptir_ekle(talepID,IDlist)
            self.girisyapar_ekle(lab_gorevlisi,IDlist)
            self.talep_kapat(talepID)
            return True
        except cn.Error as err:
            print("hata deney verisi isle: {}".format(err))
            return False
        finally:
            self.closeDB()

    def talep_kapat(self, talepID):

        sql ='Update deneytalebi Set durum="closed" where talepID=%s'
        values = (talepID,)

        try:
            self.__session.execute(sql,values)
            self.__connection.commit()
        except cn.Error as err:
            print("hata talep kapat: {}".format(err))

    def sahiptir_ekle(self, talepID, IDlist):

        for deneyID in IDlist:
            sql= 'INSERT INTO sahiptir (talepID, deneyID) VALUES(%s,%s)'
            values = (talepID, deneyID)
            self.__session.execute(sql,values)
            self.__connection.commit()

    def girisyapar_ekle(self, lab_gorevlisi, IDlist):

        for deneyID in IDlist:
            sql= 'INSERT INTO girisyapar (kullaniciAdi, deneyID) VALUES(%s,%s)'
            values = (lab_gorevlisi, deneyID)
            self.__session.execute(sql,values)
            self.__connection.commit()

    def deney_sonucu_goruntule(self):
        self.openDB()        

        df = pd.DataFrame({'deneyID': [],
                           'talepID': [],
                           'sicaklik': [],
                           'sonuc': [],
                           'aciklama': [],
                           'zaman': []})
        try:
            self.__session.execute('SELECT s.deneyID, s.talepID, DV.sicaklik, DV.sonuc, DV.aciklama, DV.zaman '
                                   'FROM deneyverisi DV, talepeder T, sahiptir S '
                                   'WHERE DV.deneyID=S.deneyID and T.talepID=S.talepID')

            result = self.__session.fetchall()
            for veri in result:
                df.loc[len(df)] = veri
            return df
        except cn.Error as err:
            print("hata deney sonucu goruntule: {}".format(err))
            return []
        finally:
            self.closeDB()


obje1 = MysqlDBManager()
# sonuc = obje1.kullanici_sec('customer','user11')
# print(sonuc)

# sonuc = obje1.deney_talebi_isle('customer','B','Y13-5-small','2022-06-09')
# print(sonuc)

# data = {
#     "zaman" : ['2022-06-17 10:40:15','2022-06-17 10:50:25'],
#     "sicaklik" : [12.2,12.4],
#     "aciklama" : ['yogun','yogun'],
#     "sonuc" : [4.5,4.3]
# }

# df= pd.DataFrame(data)
# liste = []

# for _, zaman, sicaklik, aciklama, sonuc in df.itertuples():
#     liste.append((zaman,sicaklik,aciklama,sonuc))

# print(liste)

# obje1.deney_verisi_isle(103,'technician',liste)


# print(obje1.deney_talebi_goruntule())

#print(obje1.deney_sonucu_goruntule())