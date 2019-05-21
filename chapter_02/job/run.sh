for i in apple banana cherry
do
	cat job.yaml.txt | sed "s/\$ITEM/$i/" > ./jobs/job-$i.yaml
done

exit 0
