<template>
  <el-container>
    <el-main>
      <el-card v-for="news in newsList">
        <el-row class="hidden-md-and-up" id="news-img-xs"
          ><el-image :src="news.image"
        /></el-row>
        <el-row id="news" :gutter="10">
          <el-col :xs="24" :sm="16" :md="16" :lg="16" :xl="16" id="news-text">
            <el-row>
              <el-link :underline="true" :href="news.url" id="title">{{
                news.title
              }}</el-link>
            </el-row>
            <el-row>
              <el-col :span="12" id="source">{{ news.source }}</el-col>
              <el-col :span="12" id="author">{{ news.author }}</el-col>
            </el-row>
            <el-row id="description"
              ><el-scrollbar height="200px">{{
                news.description
              }}</el-scrollbar></el-row
            >
            <el-row id="date">{{ news.published_at }}</el-row>
          </el-col>
          <el-col
            :xs="0"
            :sm="8"
            :md="8"
            :lg="8"
            :xl="8"
            class="hidden-xs-only"
            id="news-img-md-plus"
          >
            <el-image :src="news.image" />
          </el-col>
        </el-row>
      </el-card>
    </el-main>
  </el-container>
</template>

<script>
import axios from 'axios'
export default {
  name: 'app',
  data() {
    return {
      newsList: new Array(),
      loadFinish: false,
    }
  },
  created() {
    axios
      .get(
        'https://proxy-for-test-2023.hkupootal.com/?q=http%3A%2F%2Fapi.mediastack.com%2Fv1%2Fnews%3Faccess_key%3D2fd2f9887688bad65a8d02ffdbd47b52'
      )
      .then((response) => {
        this.newsList = response.data.data
      })
      .catch((error) => {
        console.log(error)
      })
  },
}
</script>

<style lang="scss">
body {
  margin: 0px;
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  background-color: lightpink;
}
#news {
  height: 100%;
}
#title {
  font-size: 20px;
  color: #000000;
  font-weight: bold;
}
#source {
  font-size: 14px;
  color: #a9a9a9;
  text-align: left;
}
#author {
  font-size: 14px;
  color: #a9a9a9;
  text-align: right;
}
#description {
  font-size: 16px;
  color: #505050;
  text-align: justify;
  margin: 5px 0 25px 0;
  padding: 5px 5px;
  border: 1px solid;
}
#date {
  font-size: 14px;
  color: #a9a9a9;
  text-align: left;
  position: absolute;
  bottom: 0;
  left: 0;
}
.el-card {
  width: 60%;
  margin: 0 20%;
}
.hidden-md-and-up {
  display: none;
}
.hidden-xs-only {
  display: none;
}
.el-image {
  width: 100%;
  object-fit: fill;
}
.el-image__placeholder {
  background: url('./assets/loading.png') no-repeat center;
  background-size: contain;
}
.el-image__error {
  background: url('./assets/fail.png') no-repeat 50% 50%;
  background-size: 50%;
}
@media (max-width: 768px) {
  .hidden-md-and-up {
    display: block;
  }
}
@media (min-width: 768px) {
  .hidden-xs-only {
    display: block;
  }
}
</style>
