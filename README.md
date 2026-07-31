# CARPEDIM

Jogo de terror psicológico que roda inteiro no `cmd`. Não tem gráficos, não tem engine, não tem instalador. O que ele tem é acesso ao seu Windows — e usa isso como roteiro.

A premissa: a entidade do outro lado do terminal não quer te assustar. Ela quer te **substituir**. Cada coisa que ela descobre sobre você durante a partida (o nome da sua rede, quanto tempo seu PC está ligado, o que tem na sua Área de Trabalho, quanto tempo você demora para responder) é um dado sendo coletado para montar uma cópia sua.

<img width="1920" height="1080" alt="Captura de tela" src="https://github.com/user-attachments/assets/08ad61b4-1be8-421e-b541-42f95f0b3fcb" />
<br/>
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/028d8e9e-f5be-4ccb-8b04-99e8ec1093bc" />

## Como jogar

Requisitos: Windows com `cmd.exe` e PowerShell (ambos já vêm no sistema). Não precisa de administrador.

```
jogo.cmd
```

Abre uma janela `conhost` no tamanho certo e mostra o aviso antes de começar.

| Comando | O que faz |
| --- | --- |
| `jogo.cmd` | Joga normalmente |
| `jogo.cmd list` | Lista os estágios para pular (debug) |
| `jogo.cmd <Estagio>` | Pula direto para um estágio, ex: `jogo.cmd Enigma002Stage` |
| `jogo.cmd esquecer` | Apaga a memória entre partidas |
| `jogo.cmd limpar` | Apaga a memória **e** os arquivos deixados na Área de Trabalho |
| `jogo.cmd aqui` | Roda na janela atual, sem abrir outra — use para ver mensagens de erro |

## Aviso: o jogo mexe de verdade no seu Windows

Para a imersão, o jogo interage com o sistema real durante a partida:

**Leitura (nada é alterado)**

- nome da rede Wi-Fi, nome da máquina, processos abertos, status e porcentagem da bateria;
- há quantas horas o computador não é desligado, hora e dia da semana;
- os **nomes** dos arquivos da sua Área de Trabalho — só os nomes, nenhum arquivo é aberto ou lido por dentro;
- a existência de uma câmera e de um microfone. Nenhum dos dois é acessado em momento algum, e isso é de propósito: a cena funciona melhor assim.

- o **nome completo** do seu perfil do Windows (não o username — o nome que você digitou quando configurou a máquina);
- o nome do último arquivo que você abriu **antes** de rodar o jogo (atalhos da pasta Recent, só os nomes);
- se existe outra conta de usuário ativa na máquina.

**Escrita (tudo reversível)**

- escreve na área de transferência;
- cria e apaga arquivos na Área de Trabalho;
- abre o navegador e o Bloco de Notas (fechando **apenas** a janela que ele mesmo abriu, pelo PID — nunca `taskkill /im notepad.exe`);
- fecha o `explorer.exe` por 4 segundos, e ele volta sozinho;
- encerra o Gerenciador de Tarefas se você abrir durante a partida;
- move o cursor do mouse e devolve para a posição exata de origem;
- muda o tamanho e o título desta janela de console, e restaura no fim;
- **troca o papel de parede** por alguns segundos e restaura (ver abaixo);
- toca notas graves em segundo plano durante a partida;
- agenda um desligamento do Windows e cancela em seguida.

**Sobre o falso apagamento:** existe uma cena em que a entidade lista seus arquivos reais e finge apagá-los um por um. Ela não apaga. O arquivo `falso_apagamento.cmd` não contém um único comando `del` — pode conferir — e no fim da cena o jogo reconta os arquivos e mostra o número na tela para você ver que está tudo lá.

**Sobre o papel de parede:** é a única feature que mexe numa configuração sua, então tem três redes de segurança. O caminho original é salvo em disco antes da troca; um processo independente restaura sozinho em 30 segundos mesmo que o jogo trave ou você feche a janela; e `jogo.cmd limpar` restaura a qualquer momento.

**O que o jogo NÃO faz:** não instala nada, não cria tarefa agendada, não altera registro, não bloqueia teclado ou mouse via API do sistema, não acessa câmera nem microfone, não lê o conteúdo dos seus arquivos, não envia nada para lugar nenhum.

Sobre o "teclado travado" do Ato III: o jogo não bloqueia entrada no Windows. Ele simplesmente **descarta** o que for digitado durante a cena (`limpar_teclado.cmd`). O efeito para quem joga é idêntico e o risco é zero — se o script morrer no meio, não fica nada travado.

## Memória entre partidas

O jogo guarda arquivos em `%APPDATA%\Carpedim` que **sobrevivem ao fim da partida**. É de propósito: é o que permite a entidade te reconhecer quando você volta. A abertura muda completamente a partir da segunda partida.

O que fica guardado:

- o placar — partidas, docilidade, ruído, qual final você pegou;
- **quantos dias** você ficou sem abrir (ela conta, e comenta);
- **em que ato você fechou o jogo no meio**, se fechou. Um arquivo de progresso é escrito no início de cada ato e só é apagado quando o jogo chega ao fim. Se ele ainda estiver lá na próxima vez, ela sabe exatamente onde você desistiu;
- as **frases literais** que você digitou em perguntas-chave. Numa partida futura ela cita de volta, palavra por palavra, o que você respondeu.

Para apagar: `jogo.cmd limpar`.

## Os três finais

O jogo conta **docilidade** (obedecer, responder rápido, resolver os enigmas, entregar a oferenda) contra **ruído** (ficar calado, travar, desistir, abrir o Gerenciador de Tarefas, recusar a oferenda).

| Final | Como chegar |
| --- | --- |
| **SUBSTITUIÇÃO** | Obedeceu mais do que resistiu |
| **RUÍDO** | Resistiu mais do que obedeceu |
| **ESPELHO** | Secreto — a partir da terceira partida completa |

A chave do enigma do Ato II é a palavra `ESPELHO`. Ela é plantada dois atos antes de significar alguma coisa.

## Estrutura

```
jogo.cmd                      ponto de entrada, os 3 atos, roteador de finais
scripts/
  base001.cmd                 primeiro contato (muda se você já jogou)
  condicao001.cmd             "você se considera livre?"
  enigma001.cmd               cifra de César
  enigma003.cmd               achar a chave dentro de um arquivo real
  base002.cmd                 a falha, e quem são "eles"
  enigma002.cmd               a ponte de Einstein-Rosen
  possessao001.cmd            ele toma o teclado
  rosto.cmd / rostog.cmd      os rostos em ASCII
  Finais/
    substituicao.cmd  ruido.cmd  espelho.cmd
  Features/
    fala.cmd                  voz da entidade: datilografia + corrupção
    digitar.cmd               datilografia sem quebra de linha (ele digitando)
    rasurar.cmd               ela escreve, apaga com backspace e reescreve
    ecoar.cmd                 repete a sua frase com uma palavra trocada
    perguntar.cmd             pergunta, cronometra a hesitação e guarda
    memoria.cmd               placar, dias sumido, ato onde você desistiu
    lembrar.cmd               guarda e recupera as suas frases literais
    watchdog.cmd              vigia paralelo do Gerenciador de Tarefas
    ambiencia.cmd             notas graves em intervalos irregulares
    possessao.cmd             janela, cursor, restauração
    papel_parede.cmd          troca e restaura o fundo de tela
    falso_apagamento.cmd      finge apagar seus arquivos (não apaga)
    falso_crash.cmd           o jogo "morre" e volta pro prompt
    bloco.cmd                 a ficha no Bloco de Notas
    ato.cmd                   cartela de ato + nível de instabilidade
    cena.cmd                  limpa a tela, aplica cor, desenha o rosto
    limpar_teclado.cmd        descarta entrada durante as cenas de possessão
    boot_fake.cmd             boot falso com dados reais da máquina
    ruido_branco.cmd          estática (com o seu nome escondido no meio)
    Vigia*.cmd                os módulos de reconhecimento
midea/music/                  áudio
```

## Como a voz apodrece sozinha

Nenhum glitch é escrito na mão. `fala.cmd` lê a variável global `Instabilidade` e corrompe o texto na hora:

| Nível | Onde | Efeito |
| --- | --- | --- |
| 0 | Ato I | voz limpa |
| 1 | Ato II | voz tremida |
| 2 | Ato III | voz quebrando |
| 3 | picos e finais | quase ilegível |

Como as posições são sorteadas, a mesma fala se corrompe diferente a cada partida.

## Se for mexer no código

Duas armadilhas do `cmd` que quebram o jogo em silêncio:

1. **Não use `!` em falas nem em `echo`.** O jogo roda com `enabledelayedexpansion` e a exclamação é comida na hora.
2. **Não use `'` em falas.** O texto vira uma string de aspas simples no PowerShell. O `fala.cmd` já dobra apóstrofos vindos de dados do sistema (nome de Wi-Fi, nome de arquivo), mas em texto escrito à mão prefira evitar.

3. **O `rasurar.cmd` só funciona em uma linha.** O backspace do console não sobe de linha, então as duas frases precisam caber em ~50 caracteres. Frase maior apaga torto.

4. **Cuidado com `^` dentro de aspas.** Entre aspas o circunflexo sai impresso em vez de escapar. Para imprimir um `>` dentro de `set /p "=texto>"`, não use `^` — entre aspas o `>` já não é redirecionamento.

Tamanho da janela: variável `TamanhoJanela` no topo do `jogo.cmd`. O padrão é `56,50`. Os dois rostos têm ~51 colunas, então no `44,30` antigo cada linha do desenho quebrava ao meio. O `rostog` tem 52 linhas e continua enchendo a tela inteira — isso é intencional, é o rosto "grande".

## Licença

MIT — veja [LICENSE](LICENSE).

VS 🔱🪽 | 2005
