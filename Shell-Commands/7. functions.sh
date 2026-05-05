funcm() {
    echo Hello-World 
    echo a  $a
}

a=10
funcm

source common.sh
func1
func2
echo b  $b
echo c  $c