#!/usr/bin/python
# coding: utf-8

import csv
import argparse

DESCRIPTION = "Omschrijving:"
HEADERS = [
    'Datum',
    'Mededelingen',
    'Naam / Omschrijving',
    'Bedrag (EUR)',
    'Af Bij',
]


def process_ing_csv(infile, outfile='/tmp/administratie.csv'):
    ''' the magic foo function'''

    to_csv = []

    with open('/home/maico/Documents/NL88INGB0001250318_01-01-2015_31-01-2015.csv', 'r') as csvfile:  # noqa
        csvreader = csv.DictReader(csvfile)

        for row in csvreader:
            # Convert the yyyymmdd to yyyy-mm-dd
            raw_date = row[HEADERS[0]]
            date = raw_date[:4] + "-" + raw_date[4:6] + "-" + raw_date[6:]

            # Integrate the debit/credit into the value
            amount = row[HEADERS[3]]
            sign = row[HEADERS[4]]
            if sign == "Af":
                amount = "-" + amount
            # Do str_replace to match google docs notation for amounts
            print(amount)
            amount.replace(',', '.')  # FIXME: Replace , with .
            print(amount)

            # If 'Mededelingen' contains 'Omschrijving', It is probally a
            # better representation of the transfer.
            description = row[HEADERS[1]]
            index = description.find(DESCRIPTION)
            if index is not -1:
                description = description[index+len(DESCRIPTION)+1:]
            else:
                description = ""

            to_csv.append({
                HEADERS[0]: date,
                HEADERS[2]: row[HEADERS[2]],
                HEADERS[1]: description,
                HEADERS[3]: amount,
            })

    with open('/tmp/administratie.csv', 'w') as csvfile:
        fieldnames = [HEADERS[0], HEADERS[2], HEADERS[1], HEADERS[3]]
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
