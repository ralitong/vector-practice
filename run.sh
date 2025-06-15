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

# (1) Running vector with simple stdin and stdout
echo "Hello world!" | vector --config ./vector-01.yaml
seperate
# (2) running vector with syslog
vector --config ./vector-02.yaml
seperate
# (3) running vector with syslog but with more complex remapping
vector --config ./vector-03.yaml
seperate
# (4) running vector to conform with GPDR laws
cat <<-EOF | vector --config ./vector-05.toml
  { "id": "user1", "gdpr": false, "email": "us-user1@datadoghq.com" }
  { "id": "user2", "gdpr": false, "email": "us-user2@datadoghq.com" }
  { "id": "user3", "gdpr": true, "email": "eu-user3@datadoghq.com" }
EOF