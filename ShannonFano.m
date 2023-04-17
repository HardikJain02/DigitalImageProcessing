prob = [0.4, 0.3, 0.2, 0.1];
[code, codelen, eff] = shannon_fano(prob)

function [code, codelen, eff] = shannon_fano(prob)
p = prob(:);
[sorted_p, sorted_idx] = sort(p, 'descend');


total_p = sum(p);
subset_p = 0;
idx = 1;
while subset_p < total_p/2
    subset_p = subset_p + sorted_p(idx);
    idx = idx + 1;
end
subset1_idx = sorted_idx(1:idx-1);
subset2_idx = sorted_idx(idx:end);


if length(subset1_idx) > 1
    [subset1_code, subset1_codelen, subset1_eff] = shannon_fano(p(subset1_idx));
    for i = 1:length(subset1_code)
        subset1_code{i} = [false, subset1_code{i}];
    end
else
    subset1_code = {false};
    subset1_codelen = 1;
    subset1_eff = 1;
end
if length(subset2_idx) > 1
    [subset2_code, subset2_codelen, subset2_eff] = shannon_fano(p(subset2_idx));
    for i = 1:length(subset2_code)
        subset2_code{i} = [true, subset2_code{i}];
    end
else
    subset2_code = {true};
    subset2_codelen = 1;
    subset2_eff = 1;
end


codebook = cell(length(p), 1);
for i = 1:length(subset1_idx)
    codebook{subset1_idx(i)} = subset1_code{i};
end
for i = 1:length(subset2_idx)
    codebook{subset2_idx(i)} = subset2_code{i};
end


code = codebook(sorted_idx);

codelen = cellfun(@length, code);
avg_codelen = dot(p, codelen);
entropy = -dot(p, log2(p));
eff = entropy / avg_codelen;
end
