# Ubuntu Image
FROM ubuntu:xenial

# Updating Ubuntu packages and getting git
RUN apt-get update && yes | apt-get upgrade
RUN apt-get install -y git

# Adding wget and bzip2
RUN apt-get update -y
RUN apt-get install -y wget bzip2

# Download miniconda and pip
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b
RUN rm Miniconda3-latest-Linux-x86_64.sh

# Set path to conda
ENV PATH /root/miniconda3/bin:$PATH

# Updating conda packages
RUN conda update conda
RUN conda install pip

# Set up LabelBox
RUN git clone https://github.com/Labelbox/Labelbox.git
WORKDIR /Labelbox/scripts/
RUN pip install attrs==17.4.0 \
                chardet==3.0.4 \
                idna==2.6 \
                Jinja2==2.10 \
                MarkupSafe==1.0 \
                -e git+https://github.com/Labelbox/pascal-voc-writer.git@324d06d90d8fde94355b8c9c03cc8c1fb29a0999#egg=pascal_voc_writer \
                Pillow==5.0.0 \
                pluggy==0.6.0 \
                py==1.5.2 \
                pytest==3.4.1 \
                requests==2.18.4 \
                Shapely==1.6.4.post1 \
                six==1.11.0 \
                urllib3==1.22
RUN mkdir my_scripts
WORKDIR /Labelbox/scripts/my_scripts
RUN conda install numpy
RUN conda install scikit-learn
RUN conda install pandas
RUN conda install -c menpo opencv
RUN apt-get install nano
