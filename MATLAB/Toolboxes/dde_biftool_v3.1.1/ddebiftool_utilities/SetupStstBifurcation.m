%% Initialize continuation of equilibrium bifurcation (fold or Hopf)
function [bifbranch,suc]=SetupStstBifurcation(funcs,branch,ind,type,varargin)
%% Inputs
%
% * |funcs|: functions used for DDE
% * |branch|: branch of stst along which bifurcation was discovered
% * |ind|: index of approximate bifurcation point
% * |type|: tpye of bifurcation, string: at the moment either |'fold'| or |'hopf'|
%
% Important name-value pair inputs
%
% * |'contpar'| (integers default |[]|): index of continuation parameters
%  (replacing free pars of branch)
% * |'correc'| (logical, default true): apply |p_correc| to first points on
% bifurcation branch
% * |'dir'| (integer, default |[]|): which parameter to vary initially
% along bifurcation branch (bifbranch has only single point if dir is empty)
% * |'step'| (real, default |1e-3|): size of initial step if dir is non-empty
%
% All other named arguments are passed on to fields of |bifbranch|
%% Outputs
% 
% * |bifbranch|: branch of bifurcation points with first point (or two points)
% * |suc|: flag whether corection was successful
%
% Parameter limits for bifbranch etc are inherited from branch, unless overridden by
% optional input arguments.
%
% (c) DDE-BIFTOOL v. 3.1.1(55), 29/06/2014
%
%% process options
default={'contpar',[],'correc',true,'dir',[],'step',1e-3,'excludefreqs',[]};
[options,pass_on]=dde_set_options(default,varargin,'pass_on');
% initialize branch of bifurcations (bifbranch)
bifbranch=branch;
bifbranch=replace_branch_pars(bifbranch,options.contpar,pass_on);
point=branch.point(ind);
if ~isfield(point,'stability') || isempty(point.stability)
    point.stability=p_stabil(funcs,point,branch.method.stability);
end
%% create initial guess for correction
switch type
    case 'hopf'
        pini0=p_tohopf(funcs,point,options.excludefreqs);
    case 'fold'
        pini0=p_tofold(funcs,point);
    otherwise
        warning('SetupStstBifurcation:type',...
            'SetupStstBifurcation: type %s not supported',type);
        suc=0;
        return
end
%% correct and add 2nd point if desired
[bifbranch,suc]=correct_ini(funcs,bifbranch,pini0,...
    options.dir,options.step,options.correc);
end
