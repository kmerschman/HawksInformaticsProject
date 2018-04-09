/*
 * Controller where we get the data on soccer infos
 */
(function () {
    'use strict';

    // the 'soccer' part comes from the name of the app we created in soccer.module.js
    var myApp = angular.module("informatics");

    // 'dataControl' is used in the html file when defning the ng-controller attribute
    myApp.controller("dataControl", function($scope, $http, $window) {

        // define data for the app
        // in the html code we will refer to data.infos. The data part comes from $scope.data, the infos part comes from the JSON object below

        $http.get('getinfos.php')
            .then(function(response) {
                // response.data.value has value come from the getinfos.php file $response['value']['infos'] = $infos;
                $scope.data = response.data.value;
            }
                   );
        /*
        $scope.data = {
            "infos":[
                {"name":"Lionel Messi", "country":"Argentina", "club":"FC Barcelona", "video":"<iframe src='https://www.youtube.com/embed/E2MBCa_OFsY' frameborder='0' allow='autoplay; encrypted-media' allowfullscreen></iframe>", "videoid":"E2MBCa_OFsY"},
                {"name":"Neymar Jr.", "country":"Brazil", "club":"Paris Saint Germain", "video":"<iframe src='https://www.youtube.com/embed/E2MBCa_OFsY' frameborder='0' allow='autoplay; encrypted-media' allowfullscreen></iframe>", "videoid":"E2MBCa_OFsY"},
                {"name":"Gianluigi Buffon", "country":"Italy", "club":"Juventus", "video":"<iframe src='https://www.youtube.com/embed/U0XSU0wNiNw' frameborder='0' allow='autoplay; encrypted-media' allowfullscreen></iframe>", "videoid":"U0XSU0wNiNw"},
                {"name":"Diego Godin", "country":"Uruguay", "club":"Atletico Madrid", "video":"<iframe src='https://www.youtube.com/embed/E2MBCa_OFsY' frameborder='0' allow='autoplay; encrypted-media' allowfullscreen></iframe>", "videoid":"E2MBCa_OFsY"}
            ]
        };
        */


        /*
         *    Code for search bar
         *    With queryBy you can say which attribute you want to search under. For example if it is "name" it will only search under names. If you want to search under everything, then use "$"
         *    We are assuming there is an input element with an ng-model="query[queryBy]"
         *    We are also assuming that you are filtering through this query when you get data under ng-repeat
         */
        $scope.query = {};
        $scope.queryBy = "$";

        // this variable will hold the page number that should be highlighted in the menu bar
        // 0 is for index.html
        // 1 is for newinfo.html
        $scope.menuHighlight = 0;


        // function to send new information to the web api to which will add it to the database
        $scope.newinfo = function(infoDetails) {
          var infoupload = angular.copy(infoDetails);

          $http.post("newinfo.php", infoupload)
            .then(function (response) {
               if (response.status == 200) {
                    if (response.data.status == 'error') {
                        alert('error: ' + response.data.message);
                    } else {
                        // successful
                        // send user back to home page
                        $window.location.href = "index.html";
                    }
               } else {
                    alert('unexpected error');
               }
            });
        };


        // function to delete a info. it receives the info's name and id and call a php web api to complete deletion from the database
        $scope.deleteinfo = function(name, id) {
            if (confirm("Are you sure you want to delete " + name + "?")) {

                $http.post("deleteinfo.php", {"id" : id})
                  .then(function (response) {
                     if (response.status == 200) {
                          if (response.data.status == 'error') {
                              alert('error: ' + response.data.message);
                          } else {
                              // successful
                              // send user back to home page
                              $window.location.href = "index.html";
                          }
                     } else {
                          alert('unexpected error');
                     }
                  }
                );
            }
        };

        // function to edit info data and send it to web api to edit the info in the database
        $scope.editinfo = function(infoDetails) {
          var infoupload = angular.copy(infoDetails);

          $http.post("editinfo.php", infoupload)
            .then(function (response) {
               if (response.status == 200) {
                    if (response.data.status == 'error') {
                        alert('error: ' + response.data.message);
                    } else {
                        // successful
                        // send user back to home page
                        $window.location.href = "index.html";
                    }
               } else {
                    alert('unexpected error');
               }
            });
        };


        /*
         * Set edit mode of a particular info
         * on is true if we are setting edit mode to be on, false otherwise
         * info corresponds to the info for which we are setting an edit mode
         */
        $scope.setEditMode = function(on, info) {
            if (on) {
                // if info had a birth, for example, you'd include the line below
                // info.birthyear = parseInt(info.birthyear);
                // editinfo matches the ng-model used in the form we use to edit info information
                $scope.editinfo = angular.copy(info);
                info.editMode = true;
            } else {
                // if editinfo is null we assume no info is currently being edited
                $scope.editinfo = null;
                info.editMode = false;
            }
        };

        /*
         * Gets the edit mode for a particular info
         */
        $scope.getEditMode = function(info) {
            return info.editMode;
        };


        // function to send new account information to web api to add it to the database
        $scope.newAccount = function(accountDetails) {
          var accountupload = angular.copy(accountDetails);

          $http.post("newaccount.php", accountupload)
            .then(function (response) {
               if (response.status == 200) {
                    if (response.data.status == 'error') {
                        alert('error: ' + response.data.message);
                    } else {
                        // successful
                        // send user back to home page
                        $window.location.href = "index.html";
                    }
               } else {
                    alert('unexpected error');
               }
            });
        };

        // function to send new account information to web api to add it to the database
        $scope.login = function(accountDetails) {
          var accountupload = angular.copy(accountDetails);

          $http.post("login.php", accountupload)
            .then(function (response) {
               if (response.status == 200) {
                    if (response.data.status == 'error') {
                        alert('error: ' + response.data.message);
                    } else {
                        // successful
                        // send user back to home page
                        $window.location.href = "index.html";
                    }
               } else {
                    alert('unexpected error');
               }
            });
        };


        // function to log the user out
        $scope.logout = function() {
          $http.post("logout.php")
            .then(function (response) {
               if (response.status == 200) {
                    if (response.data.status == 'error') {
                        alert('error: ' + response.data.message);
                    } else {
                        // successful
                        // send user back to home page
                        $window.location.href = "index.html";
                    }
               } else {
                    alert('unexpected error');
               }
            });
        };

        // function to check if user is logged in
        $scope.checkifloggedin = function() {
          $http.post("isloggedin.php")
            .then(function (response) {
               if (response.status == 200) {
                    if (response.data.status == 'error') {
                        alert('error: ' + response.data.message);
                    } else {
                        // successful
                        // set $scope.isloggedin based on whether the user is logged in or not
                        $scope.isloggedin = response.data.loggedin;
                    }
               } else {
                    alert('unexpected error');
               }
            });
        };


    });


} )();
