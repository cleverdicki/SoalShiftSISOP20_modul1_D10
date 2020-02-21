# SoalShiftSISOP20_modul1_D10

kelompok D10
Clever Dicki Marpaung (05111840000116)
Nodas Uziel Putra Serpara (05111840007007)

## Soal 1
### Source code (1.a)
```console
awk -F "\t" '
{for(n=21;n<=NF; ++n)a[$13]+=$n}
END{for(i in a ) if (a[i]>0) print a[i], i  }' Sample-Superstore.tsv | sort -g | head -1 
```
Pada nomor 1.a, diminta untuk menampilkan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling
sedikit.
* untuk perintah ```awk -F "\t"``` melakukan separation antar kolum di Sample-Superstore.tsv, karena pada setiap kolum dibedakan melalui tab (\t)
* untuk perintah ```{for(n=21;n<=NF; ++n)a[$13]+=$n}``` akan membuat looping pada kolum keuntungan (profit) agar dapat dijumlah berdasarkan bagian (region) mereka masing"
* untuk perintah ```END{for(i in a ) if (a[i]>0) print a[i], i  }' Sample-Superstore.tsv | sort -g | head -1``` untuk melakukan print jumlah tiap" bagian (region), lalu di sort mana yang paling sedikit, setelah itu menampilkan 1 region yang paling sedikit profitnya

### Source code (1.b)
```console
awk -F "\t" '
{for(n=21;n<=NF; ++n) if($13 == "Central") a[$11]+=$n}
END{for(i in a ) print a[i], i  }' Sample-Superstore.tsv | sort -g | head -2
```
Pada nomor 1.b, diminta menampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling
sedikit berdasarkan hasil poin a.
Perintahnya hampir sama seperti 1.a, yang membedakan adalah perintah ```if($13 == "Central")``` yang berguna untuk menghitung profit state pada region Central saja, lalu ```a[$11]+=$n``` untuk membuat looping penjumlahan profit berdasarkan state yang berada pada region Central, dan ```head -2``` untuk menampilkan 2 saja state yang profitnya paling sedikit

### Source code (1.c)
```console
awk -F "\t" '
{for(n=21;n<=NF; ++n) if($11 == "Texas" || $11 == "Illinois") a[$17]+=$n}
END{for(i in a ) print a[i], i  }' Sample-Superstore.tsv | sort -g | head -10
```
Pada nomor 1.c, diminta menampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling
sedikit berdasarkan 2 negara bagian (state) hasil poin b.
Perintahnya hampir sama seperti 1.b, yang membedakan adalah perintah ```if($11 == "Texas" || $11 == "Illinois")``` yang berguna untuk menghitung profit product pada state Texas atau Illinois saja, lalu ```a[$17]+=$n``` untuk membuat looping penjumlahan profit berdasarkan product yang berada pada state Texas atau Illionis, dan ```head -10``` untuk menampilkan 10 saja product yang profitnya paling sedikit

## Soal 2
```console
#!/bin/bash

array=()
for i in {a..z} {A..Z} {0..9};
do
array[$RANDOM]=$i
done
name="$(echo $* | awk -F "." '{print $1}')"
hr=`date +"%H"`
caps=({A..Z})
nocaps=({a..z})
big=${caps[$hr]}
bigmin=${caps[$hr-1]}
small=${nocaps[$hr]}
smallmin=${nocaps[$hr-1]}
title="$(echo "$name" | tr [A-Z] ["$big"-ZA-"$bigmin"] | tr [a-z] ["$small"-za-"$smallmin"])"
printf %s ${array[@]::28} $'\n' >> "$title".txt
```
Pada nomor 2 bagian (a), diminta untuk membuat sebuah script bash yang dapat menghasilkan password secara random sebanyak 28 karakter alphanumeric, bisa huruf kapital bisa tidak. Pada bagian berikut merupakan bash script untuk generate random password:
### Source Code (a)
```console
array=()
for i in {a..z} {A..Z} {0..9};
do
array[$RANDOM]=$i
done
```
Pada bagian tersebut, bash script generate random password, dimana akan dilakukan looping untuk mendapatkan alphanumeric yang diinginkan (posisi dari huruf dan angka juga random).
Kemudian pada bagian (b), diminta untuk membuat judul file sesuai dengan argumen yang kita inputkan, maka pada bagian ```name="$(echo $* | awk -F "." '{print $1}')"``` berfungsi untuk memisahkan ekstensi file yang kita inputkan pada argumen.
### Source Code (b)&(c)
```console
name="$(echo $* | awk -F "." '{print $1}')"
hr=`date +"%H"`
caps=({A..Z})
nocaps=({a..z})
big=${caps[$hr]}
bigmin=${caps[$hr-1]}
small=${nocaps[$hr]}
smallmin=${nocaps[$hr-1]}
title="$(echo "$name" | tr [A-Z] ["$big"-ZA-"$bigmin"] | tr [a-z] ["$small"-za-"$smallmin"])"
printf %s ${array[@]::28} $'\n' >> "$title".txt
```
Dan pada bagian (c), kita diminta untuk enkripsi nama file sesuai dengan waktu pembuatan file. variable ```hr``` digunakan untuk mendapatkan nilai dari jam pembuatan file. Kemudian nantinya, akan digunakan sebagai penanda dalam array untuk menentukan batasan dalam enkripsi dan perubahan nama file nya. Variabel ```title``` nantinya akan menyimpan hasil dari enkripsi judul file sesuai waktu pembuatan file tersebut. Pada akhirnya, password random yang digenerate tadinya (sebanyak 28 karakter) akan disimpan ke dalam file yang nama file nya sudah dienkripsi.
### Source Code (d)
```console
#!/bin/bash

name="$(echo $* | awk -F "." '{print $1}')"
hr=`date +"%H"`
caps=({A..Z})
nocaps=({a..z})
big=${caps[$hr]}
bigmin=${caps[$hr-1]}
small=${nocaps[$hr]}
smallmin=${nocaps[$hr-1]}
title="$(echo "$name" | tr ["$big"-ZA-"$bigmin"] [A-Z] | tr ["$small"-za-"$smallmin"] [a-z])"
mv $1 "$title".txt
```
Terakhir, pada bagian (d) diminta untuk dapat dekripsi nama file yang sudah kita enkripsi tadi. Pada bash script diatas sudah ditampilkan bagaimana proses untuk dekripsi nama file. Sama halnya dengan proses enkripsi, hanya bedanya pada proses pembuatan di variabel ```title``` caesar chiper nya ditukar. Kemudian setelah nama file berhasil didekripsi, namanya di rename dengan hasil dekripsi tersebut.

## Soal 3
```console
#!bin/bash/

mkdir kenangan
mkdir duplicate
for ((i=1; i<=28; i++))
do
wget -a wget.log https://loremflickr.com/320/240/cat -O pdkt_kusuma_$i.jpg
done

grep "Location" wget.log > location.log
readarray line < location.log
for ((i=0; i<28; i++))
do
for ((j=0; j<=i; j++))
do
if [ $i == $j ]
then
continue
elif [ "${line[$i]}" == "${line[$j]}" ]
then
mv pdkt_kusuma_"$(($i+1))".jpg ./duplicate/duplicate_"$i".jpg
fi
done
done

for ((i=1; i<=28; i++))
do
mv pdkt_kusuma_"$i".jpg ./kenangan/kenangan_"$i".jpg
done
cp wget.log wget.log.bak
```
Di nomor 3 ini, kita diminta untuk membuat script dimana kita akan melakukan download gambar dari link yang disediakan. Nantinya, gambar yang duplikat akan dipisahkan dan dipindahkan ke directory yang berbeda.
### Source Code (a)
```console
#!bin/bash/

mkdir kenangan
mkdir duplicate
for ((i=1; i<=28; i++))
do
wget -a wget.log https://loremflickr.com/320/240/cat -O pdkt_kusuma_$i.jpg
done
```
Bagian (a) dari soal ini, diminta untuk melakukan download dari link yang disediakan serta membuat nama file dari gambar yang kita donwload tadi sesuai dengan permintaan soal, yaitu "pdkt_kusuma_NO". Dan untuk setiap log messages akan disimpan ke file yang bernama "wget.log".
### Source Code (b)
```console
5 6-24/8 * * 0-5 bash /home/dicki/Praktikum/Praktikum1/Soal3.sh
```
Bagian (b), diminta untuk membuat jadwal unutk menjalankan script pada waktu yang ditentukan. ```5 6-23/8 * * 0-5``` artinya adalah setiap 8 jam mulai dari pukul 6.05 sampai 24.00 setiap harinya dari hari Minggu sampai hari Jumat, ```bash /home/dicki/Praktikum/Praktikum1/Soal3.sh``` akan melakukan script sesuai dengan script yang sudah dibuat dan diletakkan di directory yang sudah diatur.
### Source Code (c)
```
grep "Location" wget.log > location.log
readarray line < location.log
for ((i=0; i<28; i++))
do
for ((j=0; j<=i; j++))
do
if [ $i == $j ]
then
continue
elif [ "${line[$i]}" == "${line[$j]}" ]
then
mv pdkt_kusuma_"$(($i+1))".jpg ./duplicate/duplicate_"$i".jpg
fi
done
done

for ((i=1; i<=28; i++))
do
mv pdkt_kusuma_"$i".jpg ./kenangan/kenangan_"$i".jpg
done
cp wget.log wget.log.bak
```
Dan terakhir bagian (c), diminta untuk memindahkan gambar yang duplikat (jika ada), serta untuk melakukan back-up terhadapa log messages yang sudah disimpan tadi. Digunakan ```grep``` untuk mendapatkan isi dari ```Location``` yang terdapat di dalama log messages. ```Location``` inilah yang digunakan untuk membedakan anatara satu gambar dengan gambar lainnya. Jika ```Location``` dari suatu log messages sama, maka gambar tersebut identik dan nantinya akan dipindahkan ke directory ```duplicate``` dan nama dari file gambar tersebut akan diganti dengan nama ```duplicate_NO```. Sisanya, gambar yang tidak berduplikat ataupun satu dari gambar yang ada duplikatnya akan dipindahkan ke directory ```kenangan``` serta nama dari file gambar tersebut akan diganti dengan nama ```kenangan_NO```. Setelahnya, akan dilakukan back-up terhadap log messages tadi menuju ke file ```wget.log.bak```.
