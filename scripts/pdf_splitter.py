import os
import re
import sys


def make_new_filename():
    ptrn = re.compile('[0-9]{3}\.pdf$')
    filelist = os.listdir('.')
    files = [fname for fname in filelist if ptrn.match(fname)]

    if not files:
        return '001.pdf'

    latest = sorted(files, reverse=True)[0]
    n = int(re.match('[0-9]{3}', latest).group()) + 1

    return '%03d.pdf' % (n)


def extract(file_from, pages, file_to):
    pages = ' '.join(pages.split(','))

    return os.system('pdftk %s cat %s output %s' % (file_from, pages, file_to))


if __name__ == '__main__':
    file_from = sys.argv[1]
    pages = sys.argv[2]
    try:
        file_to = sys.argv[3]
    except IndexError:
        file_to = make_new_filename()

    ret = extract(file_from, pages, file_to)

    print('written to %s' % (file_to))

    sys.exit(ret)
