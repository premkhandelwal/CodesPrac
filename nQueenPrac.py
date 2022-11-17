class NQBacktracking:
    def __init__(self, x_, y_):
        self.ld = [0] * 15
        self.rd = [0] * 15
        self.ro = [0] * 15
        self.x = x_
        self.y = y_

    def printSolution(self, board):
        for line in board:
            print(" ". join(map(str, line)))

    def solveNQUtil(self, board, col):
        if col >= N:
            return True        

        if col == self.y:
            return self.solveNQUtil(board, col + 1)

        for i in range(N):
            if i == self.x:
                continue

            if(self.ld[i - col + N - 1] != 1 and self.rd[i + col] != 1 and self.ro[i] != 1):
                board[i][col] = 1
                self.ld[i - col + N - 1] = self.rd[i + col] = self.ro[i] = 1
                if self.solveNQUtil(board, col + 1):
                    return True
                board[i][col] = 0
                self.ld[i - col + N - 1] = self.rd[i + col] = self.ro[i] = 0
        return False            




    def solveNQ(self):
        board = [[0 for _ in range(N)] for _ in range(N)]
        board[self.x][self.y] = 1

        self.ld[self.x - self.y + N - 1] = self.rd[self.x + self.y]  = self.ro[self.x] = 1

        if not self.solveNQUtil(board, 0):
            print("Solution does not exist")
            return False
        self.printSolution(board)
        return True    
        


if __name__ == "__main__":
    N = 8
    x, y = 1,0
    NQBT = NQBacktracking(x, y)
    NQBT.solveNQ()        