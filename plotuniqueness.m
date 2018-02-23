function plotuniqueness(ourpoints, userpoint, avg, stddev, type, plotnum)
    %this function plots a bar graph of the user's file alongside the files
    %used to garner the average uniqueness scores, which are also plotted
    %on top of the bar graph
 
    allpoints=[ourpoints userpoint];
    ourpointsx=1:length(ourpoints)+1;
    allpoints=sort(allpoints);
    userindex=find(allpoints==userpoint,1);
    ourpointsx(userindex)=[];
 
    figure(plotnum)
    hold on
    bar(ourpointsx, sort(ourpoints),'w')
    bar(userindex,userpoint,'r')
    if (userpoint > (avg - stddev)) && (userpoint < (avg + stddev))
        plottitle=['Your ' type ' Compared to Ours: Good Job!'];
    else
        plottitle=['Your ' type ' Compared to Ours: Needs Improvement'];
    end
    xticks(sort([ourpointsx userindex]))
    title(plottitle)
    axistitle=[type 's (yours is marked in red)'];
    xlabel(axistitle)
    ylabel('Uniqueness Score')
    
    avgline = zeros(1,length(ourpoints)) + avg;
    sigabove = zeros(1,length(ourpoints)) + avg + stddev;
    sigbelow = zeros(1,length(ourpoints)) + avg - stddev;
    plot(avgline, 'k--')
    plot(sigabove, 'k:')
    plot(sigbelow, 'k:')
end
