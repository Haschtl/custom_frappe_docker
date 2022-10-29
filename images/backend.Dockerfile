# syntax=docker/dockerfile:1.3

ARG ERPNEXT_VERSION
FROM frappe/erpnext-worker:${ERPNEXT_VERSION}

COPY repos ../apps

USER root

RUN ls && install-app posawesome --verbose && \
    install-app wiki && \
    install-app woocommerceconnector && \
    install-app erpnext_shipping && \
    install-app erpnext_germany && \
    install-app nextcloud_integration && \
    install-app payments && \
    install-app erpnext_telegram_integration

USER frappe
