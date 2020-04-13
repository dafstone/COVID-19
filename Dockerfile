FROM python:3.8-buster 

WORKDIR /tmp
RUN wget -q http://ftp.ruby-lang.org/pub/ruby/2.7/ruby-2.7.1.tar.gz && \
    tar -xzvf ruby-2.7.1.tar.gz && \
    cd ruby-2.7.1/ && \
    ./configure && \
    make && \
    make install 

WORKDIR /data
ADD requirements.txt .
ADD Gemfile .
ADD Gemfile.lock .
RUN pip install -r requirements.txt
RUN bundle install

ADD . .
RUN ./clear_visuals.sh

CMD ["./extract_plotly.sh"]

