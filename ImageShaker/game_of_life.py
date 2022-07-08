import numpy as np

col_about_to_die = (200, 200, 225)
col_alive = (255, 255, 215)
col_background = (10, 10, 40)
col_grid = (30, 30, 60)


def update(cur):
    nxt = np.zeros((cur.shape[0], cur.shape[1]))

    for r, c in np.ndindex(cur.shape):
        num_alive = np.sum(cur[r-1:r+2, c-1:c+2]) - cur[r, c]

        if cur[r, c] == 1 and num_alive < 2 or num_alive > 3:
            col = col_about_to_die
        elif (cur[r, c] == 1 and 2 <= num_alive <= 3) or (cur[r, c] == 0 and num_alive == 3):
            nxt[r, c] = 1
            col = col_alive

        col = col if cur[r, c] == 1 else col_background
        #aggiungere condizioni al contorno

    return nxt


def init(dimx, dimy, square):
    cells = np.zeros((dimy, dimx))

    pattern = square

    pos = (round(dimx/2),round(dimy/2))
    cells[pos[0]:pos[0]+pattern.shape[0], pos[1]:pos[1]+pattern.shape[1]] = pattern
    return cells


def main(dimx, dimy, square, numIterations):
    history = []
    cells = init(dimx, dimy, square)
    k = 0
    while k < numIterations:
        history.append(cells)
        cells = update(cells)
        k += 1
    return history

#if __name__ == "__main__":
    #main(100, 70, 8,)