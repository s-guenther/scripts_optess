#!/usr/bin/env python3
"""
Creates a random signal with 1000 points and calculates the hybridisation
area
"""

import timeit
import os
import sys
import shutil

import optess as oe


def main(npoints, nprocesses):
    # Load single calculation
    start = timeit.default_timer()

    dia = oe.HybridDia.load('/bigwork/nhmcsgue/large/single{}'.format(npoints))
    dia.name = 'curve{}_{}'.format(npoints, nprocesses)
    try:
        shutil.copytree('single{}'.format(npoints),
                        'curve{}_{}'.format(npoints, nprocesses))
    except FileExistsError:
        pass

    end = timeit.default_timer() - start
    print('Preprocessing... {} seconds'.format(end))

    # Start calculation
    start = timeit.default_timer()
    dia.calculate_cut(0.5, strategy='inter')
    end = timeit.default_timer() - start
    print('Curve Calculation ... {} seconds'.format(end))

    # Save
    start = timeit.default_timer()
    dia.save()
    end = timeit.default_timer() - start
    print('Saving... {} seconds'.format(end))


if __name__ == '__main__':
    NPOINTS = int(sys.argv[1])
    NPROCESSES = int(sys.argv[2])
    main(NPOINTS, NPROCESSES)
