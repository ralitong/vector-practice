vector_available=$(which vector 2>/dev/null)
if [[ -z "$vector_available" ]]; then
  echo "Vector is not installed. Please install it first."
  echo "Installation guide can be foundt at https://vector.dev/docs/setup/installation/"
  exit 1
fi

function separate () {
  echo "-----------------------------------------------------------"
  echo "------------------RUNNING NEW VECTOR-----------------------"
  echo "-----------------------------------------------------------"
}

# (1) Running vector with simple stdin and stdout
echo "Hello world!" | vector --config ./vector-01.yaml
separate
# (2) running vector with syslog
vector --config ./vector-02.yaml
separate
# (3) running vector with syslog but with more complex remapping
vector --config ./vector-03.yaml
separate
# (4) running vector to conform with GPDR laws
cat <<-EOF | vector --config ./vector-05.toml
  { "id": "user1", "gdpr": false, "email": "us-user1@datadoghq.com" }
  { "id": "user2", "gdpr": false, "email": "us-user2@datadoghq.com" }
  { "id": "user3", "gdpr": true, "email": "eu-user3@datadoghq.com" }
EOF
separate
# (5) running vector to test log namespaces
vector --config ./vector-06.yaml
separate
# (6) running vector to test log namespaces but with log namespaces disabled
vector --config ./vector-07.yaml
separate
# (7) running vector with custom semantics
vector --config ./vector-08.yaml
# (8) save time by letting vector generate configs
vector generate /remap,filter,reduce > vector-09.toml
separate
# (9) testing configs
vector test ./vector-10.toml
separate
# (10) 
