function [xkm,ykm]=OMTIlatlon(latfile,lonfile,height,lat0,lon0,alt0)

lat = load(latfile);
lat=reshape(lat,256,256);
lon = load(lonfile);
lon=reshape(lon,256,256);

nanpoint = find(lat<-998 | lon <-998);
lat(nanpoint) = NaN;
lon(nanpoint) = NaN;
lon = -(360-lon);

[xkm,ykm] = latlon_to_km(lat,lon,lat0,lon0,height+alt0);