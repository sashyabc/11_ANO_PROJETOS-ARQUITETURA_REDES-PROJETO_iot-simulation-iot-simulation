# Template no formato do ZIP

- POM pai com `<modules>` contendo `common` e `app`
- Java 17, surefire `useModulePath=false`
- `app/` herda do pai
- Scripts:
  - `init-common.sh <URL>`: adiciona submódulo git `common/`
  - `rename-module.sh <nome>`: renomeia **pai** para `<nome>-parent` e o `app` para `<nome>`
