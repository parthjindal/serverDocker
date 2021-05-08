while test $# -gt 0; do
    case "$1" in
    -h | --help)
        echo "options:"
        echo "-h, --help             show brief help"
        echo "-a, --agent_port       specify agent_port"
        echo "-s, --server_port      specify server_port"
        exit 0
        ;;
    -a | --agent_port)
        shift
        AGENT_PORT=$1
        ;;
    -s | --server_port)
        shift
        SERVER_PORT=$1
        ;;
    --*)
        echo "bad option $1"
        ;;
    esac
    shift
done

#set default vals
SERVER_PORT=${SERVER_PORT:-3200}         #default: 3200
AGENT_PORT=${AGENT_PORT:-3100}           #default: 3100

export SERVER_PORT
export AGENT_PORT

docker-compose -f docker-compose.rcssserver.yml up 