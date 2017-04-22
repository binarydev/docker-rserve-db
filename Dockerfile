FROM r-base:3.3.1

COPY install_local_packages.sh /

RUN chmod a+x install_local_packages.sh

RUN apt-get update

RUN apt-get install --fix-missing -y libmariadb-client-lgpl-dev

# Define a default CRAN repo
#RUN echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"), download.file.method = "libcurl")' >> /etc/R/Rprofile.site

RUN echo 'remote enable' >> /etc/Rserv.conf

# install a few common required packages - change to your liking if necessary
RUN R -e "install.packages(c('lme4','DoE.base','jsonlite','Rserve','dplyr','tidyr','RMySQL'))"

CMD /bin/bash install_local_packages.sh && R CMD Rserve --no-save && /bin/bash
