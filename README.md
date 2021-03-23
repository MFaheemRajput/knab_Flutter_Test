1. How long did you spend on the coding assignment? What would you add to your solution if you had more time? 

Answer: I worked on 3.5 days on it (mix). first i spend the time to study the Both APIs to design the flow. also selected the API which best suit my solution.
I whould like to add local database and saving data in it. I already added basic structure but stop implementing it due to time. also I want to add more Unit tests and batter UI. 
My focus is on build the flexible and good code structure so it shows how easy to add new features and make it easy to undestand for new developer.
2. What was the most useful feature that was added to the latest version of your language of choice?
    I am using FlutterBloc (Cubit) to handel multiple type of states.
    there are 4 states now.
    1) initial. default state of view
    2) Loading. it starts before calling restAPI and runs till receives the response (success, error).
    3) Loaded. this stats represents the Operation completed with success. in our case API returns the Data successfully. 
    4) Error. All kind of Exceptions will be handel in this stats.

    Note: Beauty of state management is you can distribute state of Page in multiple states and easily display best UI or page and handel operations for it. Also can use as many states you want.

    example:
@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crypto Currency'),
        ),
        body: Container(
         child: BlocBuilder<CryptoCurrencyCubit, CryptoCurrencyState>(
           builder: (context, state){
              if (state is CryptoCurrencyInitial){
                return InitialWidget();
              } else if(state is CryptoCurrencyLoading){
                return LoadingWidget();
              } else if (state is CryptoCurrencyLoaded){
                return CryptoCurrencyListView(items: state.cryptoCurrencies);
              } else {
                return MyErrorWidget();
              }
            },
            
       ),
    ),);
  }

3. How would you track down a performance issue in production? Have you ever had to do this?

    Answer: Integration of Analytics, Crash reporting Tools can help us here. like Firebase crash reporting, Google and Microsoft Analytics etc. I use it Microsoft Analytics in it.

4. What was the latest technical book you have read or tech conference you have been to? What did you learn?
    I attended Fosdem Belgium last month. its europe biggest open-source conference. I studied about data security. encryption/decryption for communication based on Bluetooth.
5. What do you think about this technical assessment?
6. Please, describe yourself using JSON.