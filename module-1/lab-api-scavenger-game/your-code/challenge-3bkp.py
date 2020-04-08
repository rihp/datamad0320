# Debugging wrong kernel 
import sys
print(sys.path, sys.version)




import os
import requests
from base64 import b64decode
from dotenv import load_dotenv


load_dotenv()
apiKey=os.getenv("GITHUB_APIKEY")
print(apiKey[:3])



# Create function that GETs the response from server
def getFromGithub(path, queryParams=dict(), apiKey=''):
    url = f"https://api.github.com{path}"
    headers = {'Authorization':'token {}'.format(apiKey)} if apiKey else {}
    res = requests.get(url, params=queryParams, headers=headers)
    print(res.status_code, res.url)
    
    return res.json()



    # To see contents of repo
scv_base_data = getFromGithub('/repos/ironhack-datalabs/scavenger/contents')
len(scv_base_data)


def scavenger2(scv_base_data):
    
    #output variable(s)
    hunted = []
    garbage = []
    
    # Look for folders and save their names
    for objeto in scv_base_data:    
        if objeto['type'] == 'dir':        
            #print(objeto['name'], '<< folder found')
            folder_name = objeto['name']

            
            # GET that folder with API
            #print('checking directory contents')
            directory_contents = getFromGithub(
                f'/repos/ironhack-datalabs/scavenger/contents/{folder_name}', apiKey=apiKey)
            #print('SUCCESS: directory contents fetched >>> ', directory_contents)

            
            # Check which files in the directory are scavenger hunt files
            for file in directory_contents:
                if 'scavenger' in file['name']:
                    #print('@ -> Found a scavenger item : Check hunted tupples')
                    file_name = file['name']
                    
                    
                    # Use API again, but aim at the specified folder/file path
                    json = getFromGithub(
                        f'/repos/ironhack-datalabs/scavenger/contents/{folder_name}/{file_name}', apiKey=apiKey)
                        #print(json)
                    #print(json['content'])
                    hunted.append((file['name'], json['content']))
                else:
                    garbage.append((objeto['name'], objeto['type']))
        else:
            garbage.append((objeto['name'], objeto['type']))
    print(garbage)
    return hunted #garbage




hunted_scv_files = scavenger2(scv_base_data)



hunted_scv_files.sort()
print(len(hunted_scv_files))
hunted_scv_files




def decoder(hunted):
    words = []
    
    for f, code in hunted:
        #words.append((f, b64decode(code)))
        text = b64decode(code)
        words.append(text.strip())

    return b' '.join(words) 






print(decoder(hunted_scv_files))