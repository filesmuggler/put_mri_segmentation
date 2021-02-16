xhost +local:root

if [ -z "$3" ]
then
	DATASET_VOLUME="/home/krzysztof/Datasets/:/datasets/"
else
	DATASET_VOLUME=$3
fi

if [ -z "$4" ]
then
	PROJECTS_VOLUME="/home/krzysztof/Projects/:/projects/"
else
	PROJECTS_VOLUME=$4
fi

docker run -it \
	-v $DATASET_VOLUME \
	-v $PROJECTS_VOLUME \
	--name=$2 \
	--shm-size=16g \
	--ulimit memlock=-1 \
	--memory-swap=-1 \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM=1" \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--volume="/$HOME/.Xauthority:/root/.Xauthority:rw" \
	-e QT_GRAPHICSSYSTEM=native \
	$1\
	bash
