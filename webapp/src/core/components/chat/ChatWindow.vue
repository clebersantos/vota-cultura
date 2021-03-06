<template>
  <v-card class="chat-room">
    <v-toolbar
      card
      dense
      flat
      class="white chat-room--toolbar"
      light
    >
      <v-btn icon>
        <v-icon color="text--secondary">
          keyboard_arrow_left
        </v-icon>
      </v-btn>
      <template v-if="chat.users">
        <v-avatar
          v-for="(user_id, index) in chat.users"
          :key="index"
          size="32"
          class="avatar-stack"
        >
          <img
            :src="getAvatar(user_id)"
            alt=""
          >
        </v-avatar>
      </template>
      <v-spacer />
      <v-toolbar-title> <h4>Chat Channel</h4></v-toolbar-title>
      <v-spacer />
      <v-tooltip bottom>
        <v-btn
          slot="activator"
          icon
        >
          <v-icon color="text--secondary">
            add
          </v-icon>
        </v-btn>
        <span>Add user</span>
      </v-tooltip>
    </v-toolbar>
    <vue-perfect-scrollbar
      class="chat-room--scrollbar grey lighten-5"
      :style="computeHeight"
    >
      <v-card-text class="chat-room--list pa-3">
        <template v-for="(item, index) in chat.messages">
          <div
            :key="index"
            :class="[index % 2 == 0 ? 'reverse' : '']"
            class="messaging-item layout row my-4"
          >
            <v-avatar
              class="indigo mx-1"
              size="40"
            >
              <img
                :src="item.user.avatar"
                alt=""
              >
            </v-avatar>
            <div class="messaging--body layout column mx-2">
              <p
                :value="true"
                :class="[index % 2 == 0 ? 'primary white--text' : 'white']"
                class="pa-2"
              >
                {{ item.text }}
              </p>
              <div class="caption px-2 text--secondary">
                {{ new Date(item.created_at).toLocaleString() }}
              </div>
            </div>
            <v-spacer />
          </div>
        </template>
      </v-card-text>
    </vue-perfect-scrollbar>
    <v-card-actions>
      <v-text-field
        full-width
        flat
        clearable
        solo
        append-icon="send"
        label="Type some message here"
      >
        <v-icon slot="append-icon">
          send
        </v-icon>
        <v-icon
          slot="append-icon"
          class="mx-2"
        >
          photo
        </v-icon>
        <v-icon slot="append-icon">
          face
        </v-icon>
      </v-text-field>
    </v-card-actions>
  </v-card>
</template>
<script>
import VuePerfectScrollbar from 'vue-perfect-scrollbar';
import { getChatById } from '../../api/chat';
import { getUserById } from '../../api/user';

export default {
  components: {
    VuePerfectScrollbar,
  },
  props: {
    uuid: {
      type: String,
      default: '',
    },
    height: {
      type: String,
      default: null,
    },
  },
  computed: {
    chat() {
      const chatOrigin = {
        title: 'Chat',
        users: [],
        messages: [],
      };
      const chat = getChatById(this.$route.params.uuid);
      return Object.assign(chatOrigin, chat);
    },
    computeHeight() {
      return {
        height: this.height || '',
      };
    },
  },

  methods: {
    getAvatar(uid) {
      return getUserById(uid).avatar;
    },
  },
};
</script>
