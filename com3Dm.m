N=100

figure;
            % Generate a sphere consisting of 20by 20 faces
            [x,y,z]=sphere(N);
            % use surf function to plot
            hSurface=surf(x(1:0.5*N,1:0.25*N),y(1:0.5*N,1:0.25*N),z(1:0.5*N,1:0.25*N));  hold on
            set(hSurface,'FaceColor','k','EdgeAlpha', 0);
            hSurface=surf(x(1:0.5*N,0.25*N:0.5*N),y(1:0.5*N,0.25*N:0.5*N),z(1:0.5*N,0.25*N:0.5*N));  hold on
            set(hSurface,'FaceColor',[0.9 0.9 0.9],'EdgeAlpha', 0);
             hSurface=surf(x(1:0.5*N,0.5*N:0.75*N),y(1:0.5*N,0.5*N:0.75*N),z(1:0.5*N,0.5*N:0.75*N));  hold on
            set(hSurface,'FaceColor','k','EdgeAlpha', 0);
            hSurface=surf(x(1:0.5*N,0.75*N:end),y(1:0.5*N,0.75*N:end),z(1:0.5*N,0.75*N:end));  hold on
            set(hSurface,'FaceColor',[0.9 0.9 0.9],'EdgeAlpha', 0);
            
             hSurface=surf(x(0.5*N:end,0.75*N:end),y(0.5*N:end,0.75*N:end),z(0.5*N:end,0.75*N:end));  hold on
             set(hSurface,'FaceColor','k','EdgeAlpha', 0);
             hSurface=surf(x(0.5*N:end,1:0.25*N),y(0.5*N:end,1:0.25*N),z(0.5*N:end,1:0.25*N));
            set(hSurface,'FaceColor',[0.9 0.9 0.9],'EdgeAlpha', 0);
            hSurface=surf(x(0.5*N:end,0.25*N:0.5*N),y(0.5*N:end,0.25*N:0.5*N),z(0.5*N:end,0.25*N:0.5*N));
            set(hSurface,'FaceColor','k','EdgeAlpha', 0);
            hSurface=surf(x(0.5*N:end,0.5*N:0.75*N),y(0.5*N:end,0.5*N:0.75*N),z(0.5*N:end,0.5*N:0.75*N));
            set(hSurface,'FaceColor',[0.9 0.9 0.9],'EdgeAlpha', 0);
            %axis([-0.5 0.5 -0.5 0.5 -0.5 0.5]);
            daspect([1 1 1]);
           
         
            
            
            
            
            
            %%
            figure;
            x0=5;
            y0=5;
            z0=5;
            r=0.3;
            N=100
            % Generate a sphere consisting of 20by 20 faces
            [x,y,z]=sphere(N);
            % use surf function to plot
            hSurface=surf(x0+r*x(1:0.5*N,1:0.25*N),y0+r*y(1:0.5*N,1:0.25*N),z0+r*z(1:0.5*N,1:0.25*N));  hold on
            set(hSurface,'FaceColor','k','EdgeAlpha', 0);
            hSurface=surf(x0+r*x(1:0.5*N,0.25*N:0.5*N),y0+r*y(1:0.5*N,0.25*N:0.5*N),z0+r*z(1:0.5*N,0.25*N:0.5*N));  hold on
            set(hSurface,'FaceColor',[0.9 0.9 0.9],'EdgeAlpha', 0);
             hSurface=surf(x0+r*x(1:0.5*N,0.5*N:0.75*N),y0+r*y(1:0.5*N,0.5*N:0.75*N),z0+r*z(1:0.5*N,0.5*N:0.75*N));  hold on
            set(hSurface,'FaceColor','k','EdgeAlpha', 0);
            hSurface=surf(x0+r*x(1:0.5*N,0.75*N:end),y0+r*y(1:0.5*N,0.75*N:end),z0+r*z(1:0.5*N,0.75*N:end));  hold on
            set(hSurface,'FaceColor',[0.9 0.9 0.9],'EdgeAlpha', 0);
            
             hSurface=surf(x0+r*x(0.5*N:end,0.75*N:end),y0+r*y(0.5*N:end,0.75*N:end),z0+r*z(0.5*N:end,0.75*N:end));  hold on
             set(hSurface,'FaceColor','k','EdgeAlpha', 0);
             hSurface=surf(x0+r*x(0.5*N:end,1:0.25*N),y0+r*y(0.5*N:end,1:0.25*N),z0+r*z(0.5*N:end,1:0.25*N));
            set(hSurface,'FaceColor',[0.9 0.9 0.9],'EdgeAlpha', 0);
            hSurface=surf(x0+r*x(0.5*N:end,0.25*N:0.5*N),y0+r*y(0.5*N:end,0.25*N:0.5*N),z0+r*z(0.5*N:end,0.25*N:0.5*N));
            set(hSurface,'FaceColor','k','EdgeAlpha', 0);
            hSurface=surf(x0+r*x(0.5*N:end,0.5*N:0.75*N),y0+r*y(0.5*N:end,0.5*N:0.75*N),z0+r*z(0.5*N:end,0.5*N:0.75*N));
            set(hSurface,'FaceColor',[0.9 0.9 0.9],'EdgeAlpha', 0);
            daspect([1 1 1]);
    