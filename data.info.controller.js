(function () {
    'use strict';

    // the 'tutor' part comes from the name of the app we created in info.module.js
    var myApp = angular.module("Tutor");

    myApp.controller("dataControl", function($scope, $http, $window) {
        $http.get('getCredits.php')
        .then(function(response) {
            $scope.data = response.data.value;
        });

        $scope.menuHighlight = 0;
        $scope.login = function(accountDetails) {
          var accountupload = angular.copy(accountDetails);

          $http.post("getLoginRole.php", accountupload)
            .then(function (response) {
               if (response.status == 200) {
                    if (response.data.status == 'error') {
                        alert('error: ' + response.data.message);
                    } else {
                        if (response.data.role == 'S') {
                            $window.location.href = 'studentHome.html'
                        }
                        else if (response.data.role == 'A') {
                            $window.location.href = 'adminHome.html'
                        }
                        else if (response.data.role == 'T') {
                            $window.location.href = 'tutorHome.html'
                        }
                        else if (response.data.role == 'F') {
                            $window.location.href = 'facultyHome.html'
                        }
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

    myApp.controller("addSlots", function($scope, $http, $window) {
        $http.get('getTutorSlots.php')
            .then(function(response) {
                // response.data.value has value come from the getinfos.php file $response['value']['slots'] = $slots;
                $scope.data = response.data.value;
            });

        $scope.menuHighlight = 0;

        $scope.login = function(accountDetails) {
          var accountupload = angular.copy(accountDetails);

          $http.post("getLoginRole.php", accountupload)
            .then(function (response) {
               if (response.status == 200) {
                    if (response.data.status == 'error') {
                        alert('error: ' + response.data.message);
                    } else {
                        if (response.data.role == 'S') {
                            $window.location.href = 'studentHome.html'
                        }
                        else if (response.data.role == 'A') {
                            $window.location.href = 'adminHome.html'
                        }
                        else if (response.data.role == 'T') {
                            $window.location.href = 'tutorHome.html'
                        }
                        else if (response.data.role == 'F') {
                            $window.location.href = 'facultyHome.html'
                        }
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

        $scope.addSession = function(session_id) {
            if (confirm("Are you sure you want to add this session?")) {
                $http.post("addSession.php", {'session_id' : session_id})
                    .then(function (response) {
                        if (response.status == 200) {
                            if (response.data.status == 'error') {
                                alert('error: ' + response.data.message);
                            } else {
                                $window.location.href = "addSession.html";
                                }
                        }
                    });
            }else {
                alert('unexpected error');
            }

        };

        $scope.newSlot = function(slotDetails) {
            var slotupload = angular.copy(slotDetails);

            $http.post("newTutorSlot.php", slotDetails)
            .then(function (response) {
               if (response.status === 200) {
                    if (response.data.status === 'error') {
                        alert('error: ' + response.data.message);
                    } else {

                        $window.location.href = "tutorHome.html";
                    }
               } else {
                    alert('unexpected error');
               }
            });
        };

    });

    myApp.controller("upcomingStudentSlots", function($scope, $http, $window) {
        $http.get('getUpcoming.php')
            .then(function(response) {
                $scope.data = response.data.value;
            });
        $scope.menuHighlight = 0;

        $scope.login = function(accountDetails) {
          var accountupload = angular.copy(accountDetails);

          $http.post("getLoginRole.php", accountupload)
            .then(function (response) {
               if (response.status == 200) {
                    if (response.data.status == 'error') {
                        alert('error: ' + response.data.message);
                    } else {
                        if (response.data.role == 'S') {
                            $window.location.href = 'studentHome.html'
                        }
                        else if (response.data.role == 'A') {
                            $window.location.href = 'adminHome.html'
                        }
                        else if (response.data.role == 'T') {
                            $window.location.href = 'tutorHome.html'
                        }
                        else if (response.data.role == 'F') {
                            $window.location.href = 'facultyHome.html'
                        }
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

        $scope.cancelSession = function(session_id) {
            if (confirm("Are you sure you want to cancel this session?")) {
                $http.post("cancelSession.php", {'session_id' : session_id})
                    .then(function (response) {
                        if (response.status == 200) {
                            if (response.data.status == 'error') {
                                alert('error: ' + response.data.message);
                            } else {
                                $window.location.href = "studentHome.html";
                                }
                        }
                    });
                }else {
                    alert('unexpected error');
                }

            };
        });

    myApp.controller("upcomingTutorSlots", function($scope, $http, $window) {
            $http.get('getUpcomingTutor.php')
                .then(function(response) {
                    $scope.data = response.data.value;
                });
            $scope.menuHighlight = 0;

            $scope.login = function(accountDetails) {
              var accountupload = angular.copy(accountDetails);

              $http.post("getLoginRole.php", accountupload)
                .then(function (response) {
                   if (response.status == 200) {
                        if (response.data.status == 'error') {
                            alert('error: ' + response.data.message);
                        } else {
                            if (response.data.role == 'S') {
                                $window.location.href = 'studentHome.html'
                            }
                            else if (response.data.role == 'A') {
                                $window.location.href = 'adminHome.html'
                            }
                            else if (response.data.role == 'T') {
                                $window.location.href = 'tutorHome.html'
                            }
                            else if (response.data.role == 'F') {
                                $window.location.href = 'facultyHome.html'
                            }
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

            $scope.cancelSession = function(session_id) {
                if (confirm("Are you sure you want to cancel this session?")) {
                    $http.post("cancelSession.php", {'session_id' : session_id})
                        .then(function (response) {
                            if (response.status == 200) {
                                if (response.data.status == 'error') {
                                    alert('error: ' + response.data.message);
                                } else {
                                    $window.location.href = "studentHome.html";
                                    }
                            }
                        });
                    }else {
                        alert('unexpected error');
                    }

                };

                $scope.cancelSessionTutor = function(session_id) {
                    if (confirm("Are you sure you want to cancel this session?")) {
                        $http.post("cancelSession.php", {'session_id' : session_id})
                            .then(function (response) {
                                if (response.status == 200) {
                                    if (response.data.status == 'error') {
                                        alert('error: ' + response.data.message);
                                    } else {
                                        $window.location.href = "tutorHome.html";
                                        }
                                }
                            });
                        }else {
                            alert('unexpected error');
                        }

                    };
    myApp.controller("problemSet", function($scope, $http, $window) {
      $http.get('getproblemSet.php')
          .then(function(response) {
              $scope.data = response.data.value;
          });
      $scope.menuHighlight = 0;
      }
});

}) ();
