for i=2:13
    pinMode(a,i,'OUTPUT')
end

%Numbers vector for SSD
pins = [0 0 0 0 0 0 0;1 1 1 1 1 1 0;0 1 1 0 0 0 0;1 1 0 1 1 0 1;1 1 1 1 0 0 1;0 1 1 0 0 1 1;1 0 1 1 0 1 1;1 0 1 1 1 1 1;1 1 1 0 0 0 0;1 1 1 1 1 1 1;1 1 1 0 0 1 1];

%Level selection vector
pinHighLow = [0 0 0 1 1 1 0;0 1 1 0 1 1 1];
Level = 1;
marks = 0;

%Read signal from two push buttons
n = 1;
while n 
    p = analogRead(a,4); 
    q = analogRead(a,5); 
  n= n+1;
  
%Low level
if p<100
   %disp L letter & off
    for i=2:8
    digitalWrite(a,i,pinHighLow(1,i-1));
    end
    pause(2);
       
    for i=2:8
    digitalWrite(a,i,pins(1,i-1));
    end
    pause(1);
    
    %Level loop
    for Level = 1:3
        
    %display level & off    
    for i=2:8
    digitalWrite(a,i,pins(Level+2,i-1));
    end
    pause(1);
   
    for i=2:8
    digitalWrite(a,i,pins(1,i-1));
    end
    pause(1);

    %Round loop
    for Round=1:3
       
        LengthSq = Level+2;
        genarateSq=randi(4,[1,LengthSq]);   %generate sequence
        disp(genarateSq);                   %display sequence on matlab
        
        %display sequence by LED
        for j=1:length(genarateSq)
            digitalWrite(a,(genarateSq(j))+8,1)
            pause(0.5)
            digitalWrite(a,(genarateSq(j))+8,0)
            pause(0.5)
        end
     
        %Take entered sequence in to matrix
        enterSq=[];
        n=1;
        while n<=LengthSq
        LDR1 = analogRead(a,0);
        LDR2 = analogRead(a,1);
        LDR3 = analogRead(a,2);
        LDR4 = analogRead(a,3);
        
         if LDR1 >= 1000
                enterSq(n)=1;
                pause(0.5)
                disp(1)
                n=n+1;
                digitalWrite(a,9,1);
                pause(0.5);
                digitalWrite(a,9,0);
                pause(0.3);
                
            elseif LDR2>=970
                 enterSq(n)=2;
                 pause(0.5)
                 disp(2)
                 n=n+1;
                 digitalWrite(a,10,1);
                 pause(0.5);
                 digitalWrite(a,10,0);
                 pause(0.3);

            elseif LDR3>=900
                 enterSq(n)=3;
                 pause(0.5)
                 disp(3)
                 n=n+1; 
                 digitalWrite(a,11,1);
                 pause(0.5);
                 digitalWrite(a,11,0);
                 pause(0.3);

            elseif LDR4>=965
                 enterSq(n)=4;
                 pause(0.5)
                 disp(4)
                 n=n+1;
                 digitalWrite(a,12,1);
                 pause(0.5);
                 digitalWrite(a,12,0);
                 pause(0.3);
         end
        end
        disp(enterSq);      %display entered sequence in matlab
        
        %Comparing two sequences
        %if you correct
        if isequal(enterSq,genarateSq)
            
            disp('Correct');
            digitalWrite(a,9,1);
            digitalWrite(a,10,1);
            digitalWrite(a,11,1);
            digitalWrite(a,12,1);
            for i=2:8
                digitalWrite(a,i,pins(3,i-1));
            end
            pause(1)
            
            digitalWrite(a,9,0);
            digitalWrite(a,10,0);
            digitalWrite(a,11,0);
            digitalWrite(a,12,0);
            for i=2:8
                digitalWrite(a,i,pins(1,i-1));
            end
            pause(1)
            marks = marks+1;
            
        %if you wrong    
        else
            disp('Wrong');
            digitalWrite(a,13,1);
            for i=2:8
                digitalWrite(a,i,pins(2,i-1));
            end
            pause(1)
            
            digitalWrite(a,13,0);
            for i=2:8
                digitalWrite(a,i,pins(1,i-1));
            end
            pause(1)
    end
    
    end
end
fprintf('marks : %d\n',marks);   %display marks in  matlab

%display marks on SSD & off
row = marks+2;
for i=2:8
    digitalWrite(a,i,pins(row,i-1));
end

%Music Loop
for cnt = 1:2 
digitalWrite(a,13,1);
 pause(0.2)
 digitalWrite(a,13,0);
 pause(0.2) 
 digitalWrite(a,13,1);
 pause(0.2)
 digitalWrite(a,13,0);
 pause(0.2)
  digitalWrite(a,13,1);
 pause(0.2)
 digitalWrite(a,13,0);
 pause(0.5)
 
 
 digitalWrite(a,13,1);
 pause(0.2)
 digitalWrite(a,13,0);
 pause(0.2) 
 digitalWrite(a,13,1);
 pause(0.2)
 digitalWrite(a,13,0);
 pause(0.2)
  digitalWrite(a,13,1);
 pause(0.2)
 digitalWrite(a,13,0);
 pause(0.5)
 
 
 digitalWrite(a,13,1);
 pause(0.5)
 digitalWrite(a,13,0);
 pause(0.3) 
 digitalWrite(a,13,1);
 pause(0.5)
 digitalWrite(a,13,0);
 pause(0.3)
  digitalWrite(a,13,1);
 pause(0.5)
 digitalWrite(a,13,0);
 pause(0.7)
 
 
end
% pause(10);

for i=2:8
    digitalWrite(a,i,pins(1,i-1));
end

marks = 0;

















 

%High Level
  elseif q<100
    %disp H letter & off
    for i=2:8
    digitalWrite(a,i,pinHighLow(2,i-1));
    end
    pause(2);
       
    for i=2:8
    digitalWrite(a,i,pins(1,i-1));
    end
    pause(1);
    
    %Level loop
    for Level = 1:3
        
    %display level & off    
    for i=2:8
    digitalWrite(a,i,pins(Level+2,i-1));
    end
    pause(1);
   
    for i=2:8
    digitalWrite(a,i,pins(1,i-1));
    end
    pause(1);

    %Round loop
    for Round=1:3
       
        LengthSq = 2*Level+2;
        genarateSq=randi(4,[1,LengthSq]);   %generate sequence
        disp(genarateSq);                   %display sequence on matlab
        
        %display sequence by LED
        for j=1:length(genarateSq)
            digitalWrite(a,(genarateSq(j))+8,1)
            pause(0.5)
            digitalWrite(a,(genarateSq(j))+8,0)
            pause(0.5)
        end
     
        %Take entered sequence in to matrix
        enterSq=[];
        n=1;
        while n<=LengthSq
        LDR1 = analogRead(a,0);
        LDR2 = analogRead(a,1);
        LDR3 = analogRead(a,2);
        LDR4 = analogRead(a,3);
        
         if LDR1 >= 800
                enterSq(n)=1;
                pause(0.5)
                disp(1)
                n=n+1;
                digitalWrite(a,9,1);
                pause(0.5);
                digitalWrite(a,9,0);
                pause(0.3);
                
            elseif LDR2>=700
                 enterSq(n)=2;
                 pause(0.5)
                 disp(2)
                 n=n+1;
                 digitalWrite(a,10,1);
                 pause(0.5);
                 digitalWrite(a,10,0);
                 pause(0.3);

            elseif LDR3>=450
                 enterSq(n)=3;
                 pause(0.5)
                 disp(3)
                 n=n+1; 
                 digitalWrite(a,11,1);
                 pause(0.5);
                 digitalWrite(a,11,0);
                 pause(0.3);

            elseif LDR4>=600
                 enterSq(n)=4;
                 pause(0.5)
                 disp(4)
                 n=n+1;
                 digitalWrite(a,12,1);
                 pause(0.5);
                 digitalWrite(a,12,0);
                 pause(0.3);
         end
        end
        disp(enterSq);      %display entered sequence in matlab
        
        %Comparing two sequences
        %if you correct
        if isequal(enterSq,genarateSq)
            
            disp('Correct');
            digitalWrite(a,9,1);
            digitalWrite(a,10,1);
            digitalWrite(a,11,1);
            digitalWrite(a,12,1);
            for i=2:8
                digitalWrite(a,i,pins(3,i-1));
            end
            pause(1)
            
            digitalWrite(a,9,0);
            digitalWrite(a,10,0);
            digitalWrite(a,11,0);
            digitalWrite(a,12,0);
            for i=2:8
                digitalWrite(a,i,pins(1,i-1));
            end
            pause(1)
            marks = marks+1;
            
        %if you wrong    
        else
            disp('Wrong');
            digitalWrite(a,13,1);
            for i=2:8
                digitalWrite(a,i,pins(2,i-1));
            end
            pause(1)
            
            digitalWrite(a,13,0);
            for i=2:8
                digitalWrite(a,i,pins(1,i-1));
            end
            pause(1)
    end
    
    end
end
fprintf('marks : %d\n',marks);      %display marks in matlab

%display marks on SSD & off
row = marks+2;
for i=2:8
    digitalWrite(a,i,pins(row,i-1));
end

%Music Loop
for cnt = 1:2 
digitalWrite(a,13,1);
 pause(0.2)
 digitalWrite(a,13,0);
 pause(0.2) 
 digitalWrite(a,13,1);
 pause(0.2)
 digitalWrite(a,13,0);
 pause(0.2)
  digitalWrite(a,13,1);
 pause(0.2)
 digitalWrite(a,13,0);
 pause(0.5)
 
 
 digitalWrite(a,13,1);
 pause(0.2)
 digitalWrite(a,13,0);
 pause(0.2) 
 digitalWrite(a,13,1);
 pause(0.2)
 digitalWrite(a,13,0);
 pause(0.2)
  digitalWrite(a,13,1);
 pause(0.2)
 digitalWrite(a,13,0);
 pause(0.5)
 
 
 digitalWrite(a,13,1);
 pause(0.5)
 digitalWrite(a,13,0);
 pause(0.3) 
 digitalWrite(a,13,1);
 pause(0.5)
 digitalWrite(a,13,0);
 pause(0.3)
  digitalWrite(a,13,1);
 pause(0.5)
 digitalWrite(a,13,0);
 pause(0.7)
 
 
end
% pause(10);

for i=2:8
    digitalWrite(a,i,pins(1,i-1));
end
 

   pause(1);
end

marks = 0;
end
