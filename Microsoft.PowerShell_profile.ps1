$global:ExebirCaminhoCompleto = $false

function prompt {
    $PastaAtual = Get-Location
    $DiscoAtual = [System.IO.Path]::GetPathRoot($PastaAtual.Path)
    $top = [char]0x250C + [char]0x2500 + [char]0x2500
    $bottom = [char]0x2514 + [char]0x003E
    $open = [char]0x005B
    $close = [char]0x005D
    
    # Quebra o caminho em partes
    $ParteDoCaminho = $PastaAtual.Path -split '\\'

    # Verifica fullpath esta ativado.
    if ($global:ExebirCaminhoCompleto -eq $false){

        # Verifica se há mais de 3 partes
        if ($ParteDoCaminho.Count -gt 3) {
            
            # Pega as últimas 2 pastas
            $CaminhoExibido = "$DiscoAtual..." + ($ParteDoCaminho[-2..-1] -join '\')
        }
        else { # Se o caminho tiver 3 ou menos pastas, mostra o caminho completo
            $CaminhoExibido = $PastaAtual.Path
        }
        
    }
    else{
        $CaminhoExibido = $PastaAtual.Path
    }


    # Formata as cores e estilo.
    Write-Host  "  "
    Write-Host  $top -ForegroundColor Green -NoNewline
    Write-Host  $open -ForegroundColor Blue -NoNewline 
    Write-Host  "$CaminhoExibido" -ForegroundColor Yellow -NoNewline
    Write-Host  $close -ForegroundColor Blue
    Write-Host  $bottom -ForegroundColor Green -NoNewline
    return " "

}

# alterna a exbição do caminho.
function fullpath {
    if ($global:ExebirCaminhoCompleto -eq $false){
        $global:ExebirCaminhoCompleto = $true
    } else {
        $global:ExebirCaminhoCompleto = $false
    }
}