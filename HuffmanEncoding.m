probabilities = [0.2, 0.15, 0.1, 0.1, 0.2, 0.15, 0.1];
[codes, codelength, efficiency] = huffmanEncoding(probabilities);
disp(['Codes: ', strjoin(codes, ', ')]);
disp(['Codelength: ', num2str(codelength)]);
disp(['Efficiency: ', num2str(efficiency)]);

function [codes, codelength, efficiency] = huffmanEncoding(probabilities)
    if sum(probabilities) ~= 1 || any(probabilities <= 0)
        error('Invalid probabilities. Probabilities must be positive and sum up to 1.');
    end

    
    treeNode(1) = struct('left', [], 'right', [], 'probability', [], 'symbol', []);

    
    queue = cell(1, numel(probabilities));
    for i = 1:numel(probabilities)
        node = treeNode;
        node(1).probability = probabilities(i);
        node(1).symbol = i;
        queue{i} = node;
    end
    
    
    while numel(queue) > 1
        
        [~, order] = sort(cellfun(@(x) x(1).probability, queue));
        queue = queue(order);

        
        newNode = treeNode;
        newNode(1).left = queue{1};
        newNode(1).right = queue{2};
        newNode(1).probability = newNode(1).left(1).probability + newNode(1).right(1).probability;

        
        queue = [{newNode}, queue(3:end)];
    end

    
    root = queue{1};
    codes = cell(size(probabilities));
    traverseTree(root, '');
    
    
    codelength = cellfun(@length, codes) * probabilities';
    entropy = -sum(probabilities .* log2(probabilities));
    efficiency = entropy / codelength;

    function traverseTree(node, code)
        if isempty(node(1).left) && isempty(node(1).right)
            codes{node(1).symbol} = code;
        else
            if ~isempty(node(1).left)
                traverseTree(node(1).left, [code, '0']);
            end
            if ~isempty(node(1).right)
                traverseTree(node(1).right, [code, '1']);
            end
        end
    end
end
