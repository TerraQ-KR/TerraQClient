import 'package:eco_reward_app/network/custom_jobs.dart';

// final Testjob = customQueryJob(queryKey: "getTest", path: "/getTest");
// final testQuery = useQuery(job: Testjob, externalData: Null);

final testMutate =
    cachedMutation(mutationKey: 'postTest', apiType: "post", path: "/postTest");
