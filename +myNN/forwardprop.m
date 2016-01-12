function pred_prob = forwardprop( theta, layer_sizes, data)
%SPNETCOSTSLAVE Slave cost function for simple phone net
%   Does all the work of cost / gradient computation
%   Returns cost broken into cross-entropy, weight norm, and prox reg
%        components (ceCost, wCost, pCost)




%% reshape into network
stack = params2stack(theta, ei);
numHidden = numel(layer_sizes) - 1;
hAct = cell(numHidden+1, 1);

%% forward prop
%%% YOUR CODE HERE %%%
%sigmoid function and its deriv
sgmd=@(A) 1./(1+exp(-A));

%forward prop
for l=1:numHidden
     if l > 1
         hAct{l}=sgmd(bsxfun(@plus,stack{l}.W*hAct{l-1},stack{l}.b));
    else
        hAct{l}=sgmd(bsxfun(@plus,stack{l}.W*data,stack{l}.b));
    end;
    
end


 temp=exp(bsxfun(@plus,stack{numHidden+1}.W*hAct{numHidden},stack{numHidden+1}.b));
 hAct{numHidden+1}=bsxfun(@rdivide, temp, sum(temp,1));
 pred_prob=hAct{numHidden+1};

  return;

end



