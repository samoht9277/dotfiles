#include <curl/curl.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
	CURL *curl;
	CURLcode res;

  	/* In windows, this will init the winsock stuff */
  	curl_global_init(CURL_GLOBAL_ALL);

  	/* get a curl handle */
  	curl = curl_easy_init();
  	if (curl) {
	    curl_easy_setopt(curl, CURLOPT_CUSTOMREQUEST, "PUT");
    	curl_easy_setopt(curl, CURLOPT_URL, "http://192.168.1.39/api/LfnIHwm20K2s5KD9fEwbfaCOWrz7a49T1VWDxNuX/lights/8/state/");
    	curl_easy_setopt(curl, CURLOPT_POSTFIELDS, argv[1]);

    	res = curl_easy_perform(curl);
    	if (res != CURLE_OK) fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));

    	curl_easy_cleanup(curl);
  	}
  	curl_global_cleanup();
	return 0;
}