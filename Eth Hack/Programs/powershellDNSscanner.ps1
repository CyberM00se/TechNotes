Write-Host $args[0]

$searchip = $args[0]
$dnsServer = $args[1]

for (($i = 1); $i -lt 255; $i++)
{
    $fullIP = '{0}.{1}' -f $searchip,$i
    ##Write-Host $fullIP
    Resolve-DnsName -DnsOnly $fullIP -Server $dnsServer -ErrorAction Ignore | Select Name
}