const APIUtil = {
  followUser: id => {
    // ...
    return $.ajax({
      method: 'POST',
      url: `/users/${id}/follow`,
      dataType: "json"
    });

  },

  unfollowUser: id => {
    // ...
    return $.ajax({
      method: 'DELETE',
      url: `/users/${id}/follow`,
      dataType: "json"
    });

  },


  searchUsers: (queryVal, success) => {

    return $.ajax({
      method: 'GET',
      url: '/users/search',
      data: {
        query: queryVal
      },
      dataType: 'json',
      success: success,
      error: () => console.log('fail')
    });

  }
};

module.exports = APIUtil;
