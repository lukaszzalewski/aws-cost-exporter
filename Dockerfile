FROM alpine:3.16
COPY aws-cost-exporter ./
RUN ls -lha

ENTRYPOINT [ "/aws-cost-exporter" ]
EXPOSE 9100