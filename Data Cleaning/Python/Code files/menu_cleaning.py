import pandas as pd
import numpy as np
import re
from datetime import datetime

# @Begin Clean_text
def clean_text(df, column_name):
    # @Param df
    # @Param column_name to clean up.

    # Removing white trailing spaces 
    df[column_name] = df[column_name].str.strip()
    
    # Removing double quotes
    df[column_name] = df[column_name].str.replace('"', '', regex=True)
    df[column_name] = df[column_name].str.replace('""', '', regex=True)
    
    # Removing Square brackets
    df[column_name] = df[column_name].str.replace('[', '', regex=True)
    df[column_name] = df[column_name].str.replace(']', '', regex=True)

    # cleaning text (?)
    df[column_name] = df[column_name].str.replace('\(\?\)', '', regex=True) 
    
    # cleaning text (;$)
    df[column_name] = df[column_name].str.replace('\;$', '', regex=True) 

    # cleaning text ?
    df[column_name] = df[column_name].str.replace('?', '', regex=True)

    # cleaning text ;  
    df[column_name] = df[column_name].str.replace(';', '', regex=True)

    # cleaning text ()
    df[column_name] = df[column_name].str.replace('\(\)', '', regex=True)

    # cleaning text (
    df[column_name] = df[column_name].str.replace('\(', '', regex=True)

    # cleaning text )
    df[column_name] = df[column_name].str.replace('\)', '', regex=True)

    return df
# @End Clean_text


# @Begin clean_date
def clean_date(df, col_name = 'date'):
    # change the column to a  datetime column
    df[col_name] = pd.to_datetime(df[col_name],  errors='coerce')
    # only selects dates from the past.
    df = df[df[col_name] <  pd.Timestamp(2022,7,22).tz_localize('US/Eastern')]
    return df
# @End clean_date

# @BEGIN main
if __name__ == "__main__":

    '''Read the Menu csv file and load into a Pandas dataframe'''
    menu_df = pd.read_csv("../../Data/Menu-clean.csv")

    # taking only a subset of the columns
    menu_df_subset = menu_df[['name', 'sponsor', 'event', 'venue', 'place', 'location', 'date']]
    
    # @Begin cleaning_name
    # @IN name @as Name 
    menu_df = clean_text(menu_df, 'name')
    # @OUT name @As Name
    # @END cleaning_name

    # @Begin cleaning_sponsor
    # @IN sponsor @as Sponsor 
    menu_df = clean_text(menu_df, 'sponsor')
    # @OUT sponsor @As Sponsor
    # @END cleaning_name


    # @Begin cleaning_event
    # @IN event @as Event
    menu_df = clean_text(menu_df, 'event')
    # @OUT event @As Event
    # @END cleaning_event


    # @Begin cleaning_venue
    # @IN venue @as Venue 
    menu_df = clean_text(menu_df, 'venue')
    # @OUT venue @As Venue
    # @END cleaning_venue


    # @Begin cleaning_place
    # @IN place @as Place
    menu_df = clean_text(menu_df, 'place')
    # @OUT place @As Place
    # @END cleaning_place



    # @Begin cleaning_location
    # @IN location @as Location
    menu_df = clean_text(menu_df, 'location')
    # @OUT location @As Location
    # @END cleaning_location

    # @Begin cleaning_date
    # @IN date @as Date
    menu_df = clean_date(menu_df, 'date')
    # @OUT date @As Date
    # @END cleaning_date

    '''Saving the dataframe to a csv file'''
    menu_df.to_csv('../../Data/Menu_cleaned_python.csv')


# @End main