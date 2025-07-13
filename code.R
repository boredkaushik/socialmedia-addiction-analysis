library(tidyverse)

# Reading the csv file

data <- read_csv("data/research_data.csv")

# View(data)

# Number of rows and columns

rownames(data)
colnames(data)

demography <- data |> 
  select(c(1,2,3))

device <- data |>
  select(c(1,5,6,7,8,9)) |>
  rename(
    timestamp = "Timestamp",
    smartphone_own = "How many digital devices do you personally own?  [Smartphone]",
    laptop_pc_own = "How many digital devices do you personally own?  [Laptop/PC]",
    tablet_own = "How many digital devices do you personally own?  [Tablet]",
    other_own = "How many digital devices do you personally own?  [Others]",
    device_to_access_social_media = "Which device do you primarily use to access social media?" 
  ) |>
  mutate_all(~replace(.,is.na(.),0))

social <- data |>
  select(c(1,10:22)) |>
  rename(
    timestamp = "Timestamp",
    daily_use = "Which social media platforms do you use daily?",
    most_use = "Which is your most-used social media platform?",
    average_screen_time = "On average, what is your daily screen time (in hours)?",
    primary_use = "What do you primarily use social media for?",
    prefered_media_type = "What type of media do you prefer?",
    memes = "What type of content do you prefer to watch or engage?  [Memes]",   
    news = "What type of content do you prefer to watch or engage?  [News]",
    educational = "What type of content do you prefer to watch or engage?  [Educational]",
    vlogs = "What type of content do you prefer to watch or engage?  [Vlogs]",
    gaming = "What type of content do you prefer to watch or engage?  [Gaming]",
    others = "What type of content do you prefer to watch or engage?  [Other]",
    motivates_tobeon_social_media = "What motivates you to be on social media?",
    interaction = "How often do you interact (like, comment, share) on social media?"
  )

mental_physical_impact <- data |>
  select(c(1,23:34))


attention_focus <- data |>
  select(c(1,35:45))

behavioral_observations <- data |>
  select(c(1,46:49))

# Delete columns

modified_data <- data |> 
  select(
    -c(Timestamp,
       Name.of.the.state..country.you.live.in, How.many.digital.devices.do.you.personally.own....Others.,
       If.you.could.change.one.thing.about.social.media.regarding.how.it.affects.your.life..what.change.would.it.be...in.1.2.lines.)
  )


# Rename columns

modified_data <- modified_data |>  
  rename(
    
    device_to_access_social_media = 
      Which.device.do.you.primarily.use.to.access.social.media.,
    
    media_platforms_use_daily =
      Which.social.media.platforms.do.you.use.daily.,
    
    average_screentime =
      On.average..what.is.your.daily.screen.time..in.hours..,
    
    primarily_reason =
      What.do.you.primarily.use.social.media.for.,
    
    preferable_types_of_media =
      What.type.of.media.do.you.prefer.,
    
    motivation_to_use_media =
      What.motivates.you.to.be.on.social.media.,
    
    interaction_on_media = 
      How.often.do.you.interact..like..comment..share..on.social.media.,
    
    impact_on_daily_life =
      How.has.social.media.impacted.your.daily.life.overall.,
    
    use_media_after_waking_up =
      Do.you.log.into.social.media.first.thing.after.waking.up.,
    
    doom_scroll =
      Do.you.log.into.social.media.first.thing.after.waking.up.,
    
    experience_after_take_a_break_from_media =
      Do.you.experience.restlessness.or.anxiety.when.you.try.to.stay.off.take.a.break.from.social.media.,
    
    feelings_notification = 
      How.do.you.feel.when.you.get.a.notification.,
    
    attention_span =
      Has.social.media.affected.your.attention.span.,
    
    concentration_without_phone =
      Do.you.find.it.difficult.to.concentrate.on.tasks.without.checking.your.phone.,
    
    concentration_on_a_task_more_than_20_mins =
      Can.you.concentrate.on.a.single.task..e.g...reading..studying..for.more.than.20.minutes.without.checking.your.phone.,
    
    spend_more_time_than_intended = 
      Do.you.spend.more.time.on.social.media.than.you.intend.to.,
    
    sleep_schedule =
      Has.social.media.usage.altered.your.sleep.schedule.,
    
    feel_sense_of_relief_using_media =
      Do.you.feel.a.sense.of.relief.or.escapism.while.using.social.media.,
    
    app_blocker = 
      Have.you.ever.used.social.media.blocking.apps.to.stop.unnecessary.scrolling.
  ) 

# New cleaned data set

write.csv(modified_data, "cleaned_dataset.csv")

# View(modified_data)

