function NewBoard = Evolve(OldBoard,Rule)

%Evolves board of 2d cellular automata according to chosen rule, assuming
%periodic boundary conditions

%Last column will be counted as adjacent to the first column, etc.
PeriodicBoard = ...
    [OldBoard(end,end), OldBoard(end,:),OldBoard(end,1)
    OldBoard(:,end),OldBoard,OldBoard(:,1)
    OldBoard(1,end), OldBoard(1,:), OldBoard(1,1)];

%Neighbors are positions reachable by a King
MooreNeighborhood = [1 1 1; 1 0 1; 1 1 1];
%Gives number of alive neighbors of each cell
Neighbors = conv2(PeriodicBoard, MooreNeighborhood, 'same');
if any(isnan(Neighbors))
    NewBoard = OldBoard;
    disp("lol")
else
%Modifies a cell state according to how many alive neighbors it has
if strcmp(Rule,"Life")
    NewBoard = PeriodicBoard & (Neighbors > 1 & Neighbors < 4) ...
        | ~PeriodicBoard & (Neighbors == 3);
elseif strcmp(Rule,"Fredkin")
%         if any(isnan(mod(Neighbors,2)))
%             cringe = Neighbors
%         end
        NewBoard = PeriodicBoard & ~mod(Neighbors,2) ...
        | ~PeriodicBoard & mod(Neighbors,2);
end

%Removes the boundary copies
NewBoard = NewBoard(2:end-1,2:end-1);
end

end
