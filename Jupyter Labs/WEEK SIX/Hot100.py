#!/usr/bin/env python
# coding: utf-8

# In[77]:


import requests # to download html code
from bs4 import BeautifulSoup # to navigate through the html code
import pandas as pd
import numpy as np
import re


# #### Create a function to scrape the Billboards 100 HOT songs and create a local dataframe of songs with them including:
# 
# Song’s name
# 
# Song’s artist
# 

# In[11]:


url = "https://www.billboard.com/charts/hot-100/"


# In[12]:


# 3. download html with a get request. Use the function request.get() and store the output in response
response = requests.get(url)
# 200 status code means OK! response.status_code
print(response.status_code) #400 and 500 a problem, 200-299 is fine. 


# In[53]:


# 4.1. parse html (create the 'soup')
soup = BeautifulSoup(response.text, 'html.parser')
# 4.2. check that the html code looks like it should
print(soup.prettify())


# In[30]:


text = soup.select("td.titleColumn")[0].get_text()
print("Original text: ",text)


# In[ ]:


titles = []


# In[ ]:


#titles = [elem.get_text() for elem in soup.select("td.titleColumn a")]
#titles = [elem.get_text() for elem in soup.select("td.titleColumn a")]
#titles = [elem.get_text() for elem in soup.select("td.titleColumn a")]


# In[35]:


#<h3 id="title-of-a-story" class="c-title  a-no-trucate a-font-primary-bold-s u-letter-spacing-0021 u-font-size-23@tablet 
#lrv-u-font-size-16 u-line-height-125 u-line-height-normal@mobile-max a-truncate-ellipsis u-max-width-245 
#u-max-width-230@tablet-only u-letter-spacing-0028@tablet">


# In[36]:


#soup.find_all("h3", {"class": "c-title"})


# In[37]:


#soup.find_all("h3", {"class": "c-title"})[-1]


# In[68]:


soup.find_all("h3", {"id":"title-of-a-story"})[6]


# In[70]:


#soup.select("h3", {"id":"title-of-a-story"})[0].get_text() 


# In[93]:


titles = [elem.get_text().strip() for elem in soup.select("li>h3.a-no-trucate")] #


# In[91]:


#titles = [elem.get_text() for elem in soup.select("h3", {"id":"title-of-a-story"})]
#titles
artists = [elem.get_text().strip() for elem in soup.select("span.c-label.a-no-trucate")]
artists


# In[94]:


pd.DataFrame({'titles': titles, 'artists': artists})


# In[52]:


#[elem.get_text().replace("\t"," ") for elem in soup.select("h3", {"id":"title-of-a-story"})[0]]


# In[74]:


#star1 = []
#star1 = [elem['class'].split(" ")[1][1:] for elem in soup.select("h3", {"id":"title-of-a-story"})[0]]
#star1


# In[66]:


#ratings = [elem.get_text() for elem in soup.select("title-of-a-story")]
#ratings


# In[44]:


#ratings = [elem.get_text() for elem in soup.select("h3", {"id":"title-of-a-story"})]
#ratings


# In[75]:


#[elem.select("a") for elem in soup.find_all("td", {"class":"titleColumn"})].get_text


# In[28]:


#titles = [elem.get_text() for elem in soup.select("td.titleColumn h3")]
#titles


# In[73]:


#soup.find_all("div", {"class": "c-title  a-no-trucate a-font-primary-bold-s u-letter-spacing-0021 u-font-size-23@tablet 
#lrv-u-font-size-16 u-line-height-125 u-line-height-normal@mobile-max a-truncate-ellipsis u-max-width-245 
#u-max-width-230@tablet-only u-letter-spacing-0028@tablet"})


# In[19]:


#song_container = container.find('div', {'class': 'chart-row__title'})
#song_container 


# In[78]:


#url = 'https://www.billboard.com/charts/hot-100/'
#res = requests.get(url)
#soup = bs4.BeautifulSoup(res.text)

#data = []

#for e in soup.find_all(attrs={'class':'o-chart-results-list-row-container'}):
    #data.append({
        #'title':e.h3.get_text(strip=True),
        #'artist':e.h3.find_next('span').get_text(strip=True)
    #})

#data

