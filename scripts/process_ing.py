#!/usr/bin/python
# coding: utf-8

import csv
import argparse

DESCRIPTION = "Omschrijving:"


def process_ing_csv(infile, outfile='/tmp/administratie.csv'):
    ''' the magic foo function'''

    to_csv = []

    with open(infile, 'r') as csvfile:  # noqa
        csvreader = csv.DictReader(csvfile, delimiter=';')

        for row in csvreader:
            # Convert the yyyymmdd to yyyy-mm-dd
            raw_date = row["Datum"]
            date = raw_date[:4] + "-" + raw_date[4:6] + "-" + raw_date[6:]

            # Integrate the debit/credit into the value
            amount = row["Bedrag (EUR)"]
            sign = row["Af Bij"]
            if sign == "Af":
                amount = "-" + amount
            # Do str_replace to match google docs notation for amounts
            print(amount)
            amount = amount.replace(',', '.')
            print(amount)

            # If 'Mededelingen' contains 'Omschrijving', It is probally a
            # better representation of the transfer.
            description = row["Naam / Omschrijving"]
            index = description.find(DESCRIPTION)
            if index is not -1:
                description = description[index+len(DESCRIPTION)+1:]
            else:
                description = ""

            to_csv.append({
                **row,
                "Date": date,
                "Description": description,
                "Deposit": amount,
            })

    with open(outfile, 'w') as csvfile:
        fieldnames = ["Date", "Description", "Deposit"] + list(row.keys())
        csvwriter = csv.DictWriter(csvfile, fieldnames=fieldnames)

        csvwriter.writeheader()
        csvwriter.writerows(to_csv)

    print('Written output to : "%s"' % outfile)


if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='Process raw ING data file')
    parser.add_argument('-i', '--infile', type=str,
                        help='The raw ING inputfile',
                        required=True, dest='infile', metavar='<infile>')
    parser.add_argument('-o', '--outfile', type=str,
                        help='The processed outputfile',
                        default='/tmp/administratie.csv',
                        dest='outfile', metavar='<outfile>')
    args = parser.parse_args()
    print('Infile: ' + args.infile)
    print('Outfile: ' + args.outfile)
    process_ing_csv(infile=args.infile, outfile=args.outfile)
