FROM cheggwpt/java:0.0.2
MAINTAINER jgilley@chegg.com

# BASICS - java 
RUN	apk --update --no-cache add wget && \
	rm -rf /var/cache/apk/*

# LANGUAGE TOOLS
ENV LANGUAGETOOL_VERSION 3.4
RUN wget -q https://languagetool.org/download/LanguageTool-$LANGUAGETOOL_VERSION.zip -P /tmp && \
	unzip /tmp/LanguageTool-$LANGUAGETOOL_VERSION.zip -d /usr/local && \
	ln -s /usr/local/LanguageTool-$LANGUAGETOOL_VERSION /usr/local/languagetool && \
	rm /tmp/LanguageTool-$LANGUAGETOOL_VERSION.zip && \
	apk del wget

EXPOSE 8081

# Add the files
COPY container_confs /
