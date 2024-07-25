#substituir pelos hostnames das m�quinas
$computers = @("hostname1", "hostname2", "hostname3")

#Substituit pelo caminho do arquivo que deseja enviar para as m�quinas remotamente
$sourceFolderPath = "C:\temp\appMat"

#substituir pelo caminho das m�quinas que deseja enviar o arquivo pela rede
$destinationFolderPath = "c$\"

foreach ($computer in $computers) {

    $remotePath = "\\$computer\$destinationFolderPath"
    try {
        Copy-Item -Path $sourceFolderPath -Destination $remotePath -Recurse -ErrorAction Stop

        Write-Host "Arquivo copiado para $computer com sucesso."
    } catch {
        Write-Host "Falha ao copiar o arquivo para $computer $_"
    }
}