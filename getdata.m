truealpha = 2;
truebeta  = 2;
expthetas = ...
    [ 0.5613     0.6017     0.4699     0.5235 ; ...
      0.8168     0.6904     0.3914     0.5137 ; ...
      0.2483     0.5009     0.1646     0.8499 ; ...
      0.5482     0.6026     0.1860     0.2789 ; ...
      0.8078     0.1436     0.5408     0.8834 ; ...
      0.5227     0.4032     0.9207     0.3413 ; ...
      0.4639     0.7912     0.5923     0.9397 ; ...
      0.3714     0.2735     0.5196     0.5523 ; ...
      0.3684     0.3648     0.7376     0.2732 ; ...
      0.6305     0.5876     0.5516     0.4627 ; ...
      0.4748     0.2503     0.2288     0.7858 ; ...
      0.5961     0.7601     0.5496     0.1921 ; ...
      0.1332     0.2587     0.0672     0.7757 ; ...
      0.1876     0.2856     0.4284     0.3418 ; ...
      0.2633     0.1321     0.7124     0.7755 ; ...
      0.7751     0.5459     0.8303     0.3932 ; ...
      0.5268     0.9461     0.9504     0.6231 ; ...
      0.6255     0.1210     0.3980     0.4216 ; ...
      0.7029     0.4979     0.5602     0.0978 ; ...
      0.4391     0.7223     0.8425     0.3705 ];

% -----------------------------------------------------
% LOAD THE DATA
% -----------------------------------------------------
%%
if ~exist( 'npoints2' )
    load testweek_data\testweekdata

    NS = length( id );
    maxfreqchoice = zeros( NS , 1 );
    for i=1:NS
        freqs = hist( choices( i , : ) , 1:4 );
        maxfreq = max( freqs );
        maxfreqchoice( i ) = maxfreq;
    end
    
    % FILTER THE SUBJECTS
    %swh = find( explain > 2 & npoints/(100*20*15) > 0.525  & maxfreqchoice < 200 & (duration/60) > 6 );
    
    % FILTER THE SUBJECTS
    %swh = find( explain >= 0 );
   
%     explain = explain( swh );
%     id = id( swh );
%     choices = choices( swh , : );
%     returns = returns( swh , : );
%     blockorder = blockorder( swh , : );
%     duration  = duration( swh );
%     explainstr = explainstr( swh );
%     npoints = npoints( swh );
%     session = session( swh );
%     maxfreqchoice = maxfreqchoice( swh );
    
    NS = size( id , 1 );
    fprintf( '#Subjects: %d\n' , NS );

    NB = 20;
    K  = 15;
    N  = 4;

    % REARRANGE SUBJECT DATA
    choicedata = zeros( NS , NB , K );
    returndata = zeros( NS , NB , K );
    for s=1:NS
        ii = 0;
        for b=1:20 
            for k=1:K
                ii = ii + 1;
                choicedata( s,b,k ) = choices( s , ii );
                returndata( s,b,k ) = returns( s , ii );
            end
        end
    end
    
    % DO A CHECK
    %npoints2 = sum( sum( returndata , 3 ) , 2 );
    %if any( npoints2 ~= npoints/100 )
    %    error( 'hmmm' );
    %end
end

