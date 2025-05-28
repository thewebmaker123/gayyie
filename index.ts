import { Plugin } from "enmity/managers/plugins";
import { sendMessage } from "enmity/api/messages";
import { getByProps } from "enmity/metro";
import { React, Dialog, Toasts } from "enmity/metro/common";
import { registerCommand, unregisterAllCommands } from "enmity/api/commands";

let autoDeleteEnabled = false;

const MessageEvents = getByProps("sendMessage");

const AutoDeletePlugin: Plugin = {
  name: "AutoDeleteToggle",

  onStart() {
    // Command for toggling on/off
    registerCommand({
      name: "autodelete",
      description: "Toggle auto-delete for next message",
      arguments: [],
      execute() {
        autoDeleteEnabled = !autoDeleteEnabled;
        return {
          content: `🧹 Auto-delete is now **${autoDeleteEnabled ? "enabled" : "disabled"}**.`,
        };
      },
    });

    // Patch sendMessage
    const origSendMessage = MessageEvents.sendMessage;
    MessageEvents.sendMessage = async (channelId: string, message: any) => {
      const msg = await origSendMessage(channelId, message);

      if (autoDeleteEnabled) {
        autoDeleteEnabled = false;

        // Delay briefly to let message send
        setTimeout(() => {
          MessageEvents.deleteMessage(channelId, msg.id);
        }, 500);
      }

      return msg;
    };
  },

  onStop() {
    unregisterAllCommands("autodelete");
  },
};

export default AutoDeletePlugin;
