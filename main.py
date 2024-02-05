import mysql.connector
import tkinter as tk
from tkinter import *
#window size
my_w = tk.Tk()
my_w.geometry("800x600")

my_connect = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="power",
  database="hotel"
)

my_conn = my_connect.cursor()
# Add your search here
def search_guests(guest_id):
    
    print(f"Searching for guest with id {guest_id}")

my_conn.execute("SELECT * FROM guests limit 0,10")
i = 0
for guests in my_conn:
    for j in range(len(guests)):
        e = Entry(my_w, width=10, fg='blue', font=('Helvetica', 14))
        e.grid(row=i, column=j)
        e.insert(END, guests[j])
    
    i = i + 1

    entry = Entry(my_w, width=10)
    entry.grid(row=i, column=0)

    button = Button(my_w, text="Search", command=lambda e=entry: search_guests(e.get()))
    button.grid(row=i, column=1)

    i = i + 1
#view data
tk.Label(my_w, width=10, text='id', borderwidth=8, relief='ridge', anchor='w', bg='blue').grid(row=0, column=1)
tk.Label(my_w, width=10, text='FirstName', borderwidth=8, relief='ridge', anchor='w', bg='blue').grid(row=0, column=2)
tk.Label(my_w, width=10, text='LastName', borderwidth=8, relief='ridge', anchor='w', bg='blue').grid(row=0, column=3)
tk.Label(my_w, width=10, text='email', borderwidth=8, relief='ridge', anchor='w', bg='blue').grid(row=0, column=4)
tk.Label(my_w, width=10, text='PhoneNumber', borderwidth=8, relief='ridge', anchor='w', bg='blue').grid(row=0, column=5)

my_w.mainloop()