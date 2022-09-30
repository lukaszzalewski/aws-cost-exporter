FROM alpine:3.16
RUN mkdir -p /etc/aws-cost-exporter/queries
COPY aws-cost-exporter ./
COPY queries /etc/aws-cost-exporter/queries
RUN ls -lha && ls -lha /etc/aws-cost-exporter/queries

ENTRYPOINT [ "/aws-cost-exporter" ]
EXPOSE 9100