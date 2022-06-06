import pandas as pd

def getUpdatedExpList():
    return pd.read_csv("deneykodu.csv", header=0)

def getUpdatedExpResult():
    return pd.read_csv("deneyverisi.csv", header=0)

# yorum
# dosyada değiklik denemesi