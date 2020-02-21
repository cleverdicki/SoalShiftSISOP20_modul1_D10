1.a
awk -F "\t" '
{for(n=21;n<=NF; ++n)a[$13]+=$n}
END{for(i in a ) if (a[i]>0) print a[i], i  }' Sample-Superstore.tsv | sort -g | head -1 

1.b
awk -F "\t" '
{for(n=21;n<=NF; ++n) if($13 == "Central") a[$11]+=$n}
END{for(i in a ) print a[i], i  }' Sample-Superstore.tsv | sort -g | head -2

1.c
awk -F "\t" '
{for(n=21;n<=NF; ++n) if($11 == "Texas" || $11 == "Illinois") a[$17]+=$n}
END{for(i in a ) print a[i], i  }' Sample-Superstore.tsv | sort -g | head -10
