output=$(gcloud compute instances list --filter="labels.env=production AND labels.service=swarm" --format="table(name)")
output=$(echo "$output" | awk 'NR>1')

IFS=$'\n' read -r -d '' -a names <<< "$output"

command="gcloud compute ssh --tunnel-through-iap"

tmux new-session -d -s mysession

current_pane=$(tmux display-message -p "#P")

for name in "${names[@]}"
do
  tmux split-window -h
  tmux select-layout tiled
  tmux send-keys "$command $name" C-m
done

tmux select-pane -t $current_pane
tmux kill-pane
tmux attach-session -t mysession
