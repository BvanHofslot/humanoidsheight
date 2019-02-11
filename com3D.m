function hSurface = com3D(x0,y0,z0,r,N)
hold on
            % Generate a sphere consisting of 20by 20 faces
            [x,y,z]=sphere(N);
            % use surf function to plot
            hSurface=surf(x0+r*x(1:0.5*N,1:0.25*N),y0+r*y(1:0.5*N,1:0.25*N),z0+r*z(1:0.5*N,1:0.25*N));  hold on
            set(hSurface,'FaceColor','k','EdgeAlpha', 0);
            hSurface1=surf(x0+r*x(1:0.5*N,0.25*N:0.5*N),y0+r*y(1:0.5*N,0.25*N:0.5*N),z0+r*z(1:0.5*N,0.25*N:0.5*N));  hold on
            set(hSurface1,'FaceColor',[0.9 0.9 0.9],'EdgeAlpha', 0);
             hSurface2=surf(x0+r*x(1:0.5*N,0.5*N:0.75*N),y0+r*y(1:0.5*N,0.5*N:0.75*N),z0+r*z(1:0.5*N,0.5*N:0.75*N));  hold on
            set(hSurface2,'FaceColor','k','EdgeAlpha', 0);
            hSurface3=surf(x0+r*x(1:0.5*N,0.75*N:end),y0+r*y(1:0.5*N,0.75*N:end),z0+r*z(1:0.5*N,0.75*N:end));  hold on
            set(hSurface3,'FaceColor',[0.9 0.9 0.9],'EdgeAlpha', 0);
            
             hSurface4=surf(x0+r*x(0.5*N:end,0.75*N:end),y0+r*y(0.5*N:end,0.75*N:end),z0+r*z(0.5*N:end,0.75*N:end));  hold on
             set(hSurface4,'FaceColor','k','EdgeAlpha', 0);
             hSurface5=surf(x0+r*x(0.5*N:end,1:0.25*N),y0+r*y(0.5*N:end,1:0.25*N),z0+r*z(0.5*N:end,1:0.25*N));
            set(hSurface5,'FaceColor',[0.9 0.9 0.9],'EdgeAlpha', 0);
            hSurface6=surf(x0+r*x(0.5*N:end,0.25*N:0.5*N),y0+r*y(0.5*N:end,0.25*N:0.5*N),z0+r*z(0.5*N:end,0.25*N:0.5*N));
            set(hSurface6,'FaceColor','k','EdgeAlpha', 0);
            h=surf(x0+r*x(0.5*N:end,0.5*N:0.75*N),y0+r*y(0.5*N:end,0.5*N:0.75*N),z0+r*z(0.5*N:end,0.5*N:0.75*N));
            set(h,'FaceColor',[0.9 0.9 0.9],'EdgeAlpha', 0);
            %daspect([1 1 1]);
            