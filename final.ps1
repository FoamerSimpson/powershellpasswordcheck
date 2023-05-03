function lengthcheck($pass) {
$min = 8
if ( $pass.Length -gt $min ){
return $true }
else
{
    return $false
}
}

function specialcheck($pass) {
    if ($pass -match "[^a-zA-Z0-9]"){
        return $true
    }else{
        return $false
    }
}
function numbercheck($pass) {
    $count = 0
    for ($i = 0; $i -lt $pass.Length; $i++)
{
    if ([Char]::IsDigit($pass[$i])){
        $count = $count + 1
    }
}
if ($count -gt 2){
    return $true
}else{
    return $false
}
}
$x = $null
while ($x -ne $true){
$password = Read-Host -Prompt 'Input a password that is atleast 8 characters long, includes atleast 3 numbers,
and atleast 1 special character (Note blank spaces are not allowed and will be removed)
'
$password = $password.Replace(" ", "")
if (numbercheck($password)){
    Write-Output "Password has Sufficeint amount of numbers"
}else{
    Write-Output "Password has insufficient amount of numbers"
}

if (lengthcheck($password)){
    Write-Output "Password length is Sufficeint"
}else{
    Write-Output "Password length is Insufficeint"
}

if (specialcheck($password)){
    Write-Output "password has special char"
}else {
    Write-Output "password is without special char"
}
if ((specialcheck($password)) -and (lengthcheck($password)) -and (numbercheck($password))){
    $x = $true
}
if ($x -ne $true){
    Write-Output "make sure the password is up to specification"
}
}
Write-Output "Password is good. Good-Bye"

Start-Sleep -Seconds 5
