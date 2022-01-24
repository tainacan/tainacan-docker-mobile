FROM datencia/ionic-android:latest
    
### User script ---------------------------------------------------
	COPY tools /opt/tools
	RUN apt-get update && \
		apt-get install -y sudo && \
		rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
		apt-get autoremove -y && \
		apt-get clean
	RUN chmod a+x /opt/tools/init-user.sh

### Final setup--------------------------------------------------

	EXPOSE 8100 35729
	ENTRYPOINT ["/opt/tools/init-user.sh"]

