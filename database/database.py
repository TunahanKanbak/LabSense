import pandas as pd

def getUpdatedExpList():
    df = pd.read_csv("database/deneykodu.csv", header=0)
    df["Fullname"] = df["urun kodu"] + "-" + df["deney no"].astype("string") + "-" + df["uretim sakalasi"]
    return df

def getUpdatedExpResult():
    return pd.read_csv("database/deneyverisi.csv", header=0)

def getUserPerms(uname, pword):
    if uname == "admin" and pword == "root":
        return "full"
    if uname == "customer" and pword == "user":
        return "read"
    if uname == "technician" and pword == "user":
        return "write"
    else:
        return "denied"
# yorum
# dosyada değiklik denemesi