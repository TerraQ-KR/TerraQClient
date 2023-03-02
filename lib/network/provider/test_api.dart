import 'package:eco_reward_app/network/custom_jobs.dart';

// final Testjob = customQueryJob(queryKey: "getTest", path: "/getTest");
// final testQuery = useQuery(job: Testjob, externalData: Null);

final testQuery = cachedQuery(
  queryKey: "getTest",
  path: "/getTest",
  staleTime: const Duration(seconds: 2),
);
final testMutate =
    cachedMutation(mutationKey: 'postTest', apiType: "post", path: "/postTest");
