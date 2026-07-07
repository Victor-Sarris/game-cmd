Jogo de Enigma sendo desenvolvido. A ideia é que ele funcione completamente pelo cmd, apenas interagindo com alguns elementos do seu computador.

Para rodar o game, basta abrir o repositório do projeto e executar o arquivo jogo.cmd como no exemplo a baixo:

<img width="1920" height="1080" alt="Captura de tela 2026-02-13 134835" src="https://github.com/user-attachments/assets/08ad61b4-1be8-421e-b541-42f95f0b3fcb" />
<br/>

<<<<<<< HEAD
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/028d8e9e-f5be-4ccb-8b04-99e8ec1093bc" />

## Como jogar

Requisitos: Windows com `cmd.exe` e PowerShell (ambos já vêm no sistema).

```
jogo.cmd
```

Isso abre uma janela `conhost` no tamanho certo e mostra um aviso antes de começar — leia a seção abaixo.

## Aviso: o jogo mexe de verdade no seu sistema

Para a imersão, o jogo interage com o Windows de verdade durante a partida. Isso inclui:

- ler e escrever na área de transferência (clipboard);
- criar e depois apagar arquivos na sua Área de Trabalho (`oferenda.txt`, `yasfgf6a78.txt`, `nao_olhe.txt`);
- abrir o navegador em um link externo (parte do enigma da Ponte de Einstein-Rosen);
- fechar o `explorer.exe` por alguns segundos (ele volta sozinho) e encerrar o Gerenciador de Tarefas se for aberto durante o jogo;
- agendar um desligamento do Windows e cancelá-lo logo em seguida (`shutdown -s` seguido de `shutdown -a`).

Nada disso causa dano permanente, mas é bom saber antes de rodar o jogo sem contexto — principalmente se for baixar e executar em outra máquina.

Toda vez que o jogo inicia, ele limpa os arquivos temporários deixados por uma partida anterior (Desktop e `%temp%`), então é seguro rejogar do zero.

## Modo debug (para quem for mexer no jogo)

Rodar o jogo inteiro do começo toda vez que você quer testar uma cena específica é lento. Dois atalhos:

- `jogo.cmd list` — lista os nomes dos estágios disponíveis para pular direto.
- `jogo.cmd <Estagio>` — pula direto para aquele estágio (ex: `jogo.cmd Enigma002Stage`), sem mostrar o aviso inicial. A partir dali o jogo segue normalmente até o final.

## Estrutura

- `jogo.cmd` — ponto de entrada, controla a ordem das cenas.
- `scripts\` — cenas principais da história (`base001.cmd`, `condicao001.cmd`, `enigma001.cmd`, etc).
- `scripts\Features\` — funcionalidades reutilizáveis (efeito de datilografia, vigias de processo/clipboard/arquivo/energia/sistema, boot falso, ruído branco, tela de cena).
- `midea\music\` — áudio usado nas cenas.

## Licença

MIT — veja [LICENSE](LICENSE).
=======
```bash
Nota: o arquivo cmd mexe com algumas propriedades do seu pc... Mas não se preocupe, não é algo nocivo.
```

VS 🔱🪽 | 2005
>>>>>>> origin/develop
