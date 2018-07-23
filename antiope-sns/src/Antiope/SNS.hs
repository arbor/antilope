module Antiope.SNS
( MonadAWS
, publishMsg
, subscribeMsg
, module Network.AWS.SNS
) where

import Control.Lens
import Data.Text       (Text)
import Network.AWS     (MonadAWS, send)
import Network.AWS.SNS

publishMsg :: MonadAWS m => Text -> Text -> m ()
publishMsg topicArn message = do
  _ <- send $ publish message & pTopicARN ?~ topicArn
  return ()

subscribeMsg :: MonadAWS m => Text -> Text -> Text -> m ()
subscribeMsg topicArn protocol ep = do
  _ <- send $ subscribe topicArn protocol & subEndpoint ?~ ep
  return ()

