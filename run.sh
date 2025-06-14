vector_available=$(which vector 2>/dev/null)
if [[ -z "$vector_available" ]]; then
  echo "Vector is not installed. Please install it first."
  echo "Installation guide can be foundt at https://vector.dev/docs/setup/installation/"
  exit 1
fi

function seperate () {
  echo "-----------------------------------------------------------"
  echo "------------------RUNNING NEW VECTOR-----------------------"
  echo "-----------------------------------------------------------"
}

# Running vector with simple stdin and stdout
echo "Hello world!" | vector --config ./vector-01.yaml

seperate

# Running vector with syslog
vector --config ./vector-02.yaml
