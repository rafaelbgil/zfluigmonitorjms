# zfluigmonitorjms
Template para monitoramento de filas JMS da aplicação Fluig Totvs (Jboss)

Descrição: Template criado com o objetivo de obter informações de monitoramento do uso de filas JMS do Fluig Totvs utilizando ferramentas do próprio jboss (jboss-cli.sh) .

Atualmente o template monitora as seguintes filas:
- ECMNotificationQueue
- FluigDeployQueue
- FluigMailQueue
- FluigThumbnail
- TOTVSTechAsyncQueue
- TOTVSTechDeployQueue
- TOTVSTechIntegrationRegisterQueue
- TOTVSTechocialPostDeliveryQueue
- TOTVSTechSocialQueue

- Gera um gráfico unificado do consumo atual de todas as filas.
- Possui triggers para alerta no caso de qualquer uma das filas atingir possuir mais do que 10 mensagens enfileiradas, isso pode ser ajustado diretamente e individualmente conforme a necessidade do ambiente.

Para informações sobre configuração e instalação do template acesse: https://github.com/rafaelbgil/zfluigmonitorjms/wiki
