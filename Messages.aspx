<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Users/UserMasterPage.master" CodeFile="Messages.aspx.cs" Inherits="Users_Messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title style="font-size: large; font-weight: bold;"></title>

    
    <style>

        .chat {
            list-style: none;
            margin: 0;
            padding: 0;
        }

            .chat li {
                margin-bottom: 10px;
                padding-bottom: 5px;
                border-bottom: 1px dotted #B3A9A9;
            }

                .chat li.left .chat-body {
                    margin-left: 60px;
                }

                .chat li.right .chat-body {
                    margin-right: 60px;
                }


                .chat li .chat-body p {
                    margin: 0;
                    color: #777777;
                }

        #OnlineUsersList {
            list-style: square outside url("Users/Images/OnlineIndicator.png");
            margin: 0px;
        }

            #OnlineUsersList li {
                margin-bottom: 5%;
            }

        .OnlineUserLogo {
            max-width: 45px;
            max-height: 30px;
            min-width: 45px;
        }

        .msgsmry {
            width: auto;
            white-space: nowrap;
            overflow: hidden !important;
            text-overflow: ellipsis;
        }

        .initials{
             width: 50px;
  height: 50px;
  border-radius: 50%;
  font-size: 15px;
  color: black;
  font-family: 'Comic Sans MS';
  line-height: 50px;
  text-align: center;
  background-color:#64C2EB;
  box-shadow:inset 0 0 1px #565656;
        }

        .me{

             background-color:#fa866d;

        }

    </style>

    <script type="text/javascript">

        $(document).ready(function () {

            var Chat = $.connection.chatHub;

            $.connection.hub.start().done(function () {

                console.log("Chat Hub has been Initialized");

            });

            $.connection.hub.error(function (error) {
                console.log('SignalR error: ' + error)
            });

            Chat.client.receiveOnlineUsers = function (msgtype, msg, content,statistics) {


                console.log(statistics);
                try{
                    $('#inbox').append('<b>'+statistics.Inbox+'</b>');
                    $('#sent').append('<b>'+statistics.OutBox+'</b>');
                    $('#received').append ('<b>'+statistics.Received+'</b>');
       
                    if (msgtype == "RU") {

                     
                        var OnlineUsers = content;

                        console.log("Online Users:" + OnlineUsers);

                        for (i = 0; i <= OnlineUsers.length; i++) {

                            console.log(OnlineUsers);

                            $('#OnlineUsersList').append('<li><a href=#><div class="col-md-8"><b>' + OnlineUsers[i].UserName +'</b></div><div class="col-md-4"> <img class="OnlineUserLogo" src="data:image/png;base64,' + OnlineUsers[i]["ProfilePictureByte"] + '"/></div></a></li><hr/>');

                        }
                      
                    }
                    
                    else if (msgtype == "NewConnection") {

                        var NewOnlineUser = content;

                        console.log("Online Users:" + NewOnlineUser);

                  

                            $('#OnlineUsersList').append('<li><a href=#><div class="col-md-8"><b>' + NewOnlineUser.UserName + '</b></div><div class="col-md-4"> <img class="OnlineUserLogo" src="data:image/png;base64,' + NewOnlineUser["ProfilePictureByte"] + '"/></div></a></li><hr/>');

                        
                    }
                }
                catch (ex) {

                }

            }

            Chat.client.receiveSideMessages = function (data) {

                var messageList = data;

                $('.sidechat').children().remove();

                for (var i = 0; i < messageList.length; i++) {

                    var MessageObject = messageList[i];

                    console.log(MessageObject);

                    $('.sidechat').append('<li value="'+MessageObject.Sender.Id+'" class="left clearfix"><a href="#"><span class="chat-img pull-left">' +
                                '<div class="initials">'+MessageObject.Sender.LastName.charAt(0)+MessageObject.Sender.FirstName.charAt(0)+'</div>' +
                            '</span>' +
                                '<div class="chat-body clearfix">' +
                                    '<div class="header">' +
                                        '<strong class="primary-font">' + MessageObject.Sender.UserName + '</strong> <small class="pull-right text-muted">' +
                                            '<span class="glyphicon glyphicon-time"></span>12 mins ago</small>' +
                                    '</div>' +
                                    '<p class="msgsmry">' +
                                        MessageObject.Message +

                '</p>' +
            '</div>' +
            '</a>' +
        '</li>');
         
                }
            }


            Chat.client.getChatHistory = function (peer,thread)

            {
               
                $('#peerName').text(peer.LastName +' '+ peer.FirstName);

                $('.main').children().remove();

                try
                {

                for(var i=0; i<=thread.length; i++)
                {
                    var Node = thread[i];

                    if (thread[i].Indicator == 1)
                    {

                        

                    $('.main').append('<li class="right clearfix"><span class="chat-img pull-right">' +
                                                '<div class="initials me">'+Node.Sender.LastName.charAt(0)+Node.Sender.FirstName.charAt(0)+'</div>'+
                                            '</span>' +
                                               '<div class="chat-body clearfix">' +
                                                    '<div class="header">' +
                                                    '<small class="text-muted"><span class="glyphicon glyphicon-time"></span> 10 mins ago</small>'+
                                                        '<strong class="pull-right primary-font">' + Node.Sender.UserName + '</strong></div> ' +
                                                             
                                                     '<p class="pull-right">' + thread[i].Message + '</p></div></li>');



                }

                else{

                    $('.main').append(' <li class="left clearfix"><span class="chat-img pull-left">' +
                                                '<div class="initials">'+Node.Sender.LastName.charAt(0)+Node.Sender.FirstName.charAt(0)+'</div>'+
                                            '</span>' +
                                               '<div class="chat-body clearfix">' +
                                                    '<div class="header">' +
                                                        '<strong class="primary-font">'+Node.Sender.UserName+'</strong> <small class="pull-right text-muted">' +
                                                            '<span class="glyphicon glyphicon-time"></span> 12 mins ago</small>' +
                                                    '</div> <p>' + thread[i].Message + '</p></div></li>');


                }

               
                                                        
                }

            }

            catch (ex) {
                console.log('Wrong');
            }

       

            }


            $('.sidechat').on('click','li', function () {

                Chat.server.getChat($(this).val());

            });

});

     </script>

      </asp:Content>

<asp:Content ID="UserLabel" ContentPlaceHolderID="JumbHeader" runat="server">Messenger</asp:Content>

<asp:Content ID="HomeButtonLink" ContentPlaceHolderID="HomeLink" runat="server"><a href="http://localhost/CosmoSchools/UserPage.aspx">Home</a></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <body>

        <div class="col-md-3">

            <h3>Inbox</h3>

            <div class="panel">
                <div>
                    <h4 class="panel-heading">Recent</h4>
                </div>

                <div class="panel-body">
                    
                    <ul class="sidechat chat">

                       
                    </ul>
                </div>

            </div>

        </div>
        <div class="col-md-7">

            <h3 id="peerName">Peer Name</h3>

            <div class="container container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="panel">

                            <div class="panel-body">
                                <ul class="chat main">
                                   
                                </ul>
                            </div>
                            <div class="panel-footer">
                                <div class="input-group">
                                    <input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." />
                                    <span class="input-group-btn">
                                        <button class="btn btn-warning btn-sm" id="btn-chat">
                                            Send</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-md-2" style="min-height: 40%;">

            <div class="row" style="min-height: 40%;">
                <h3>Stats</h3>

                <div class="panel">
                    <div class="panel-body">

                        <p id="inbox">Inbox: </p>
                        <p id="sent">Sent: </p>
                        <p id="received">Received: </p>



                    </div>

                </div>

            </div>

            <div class="row">



                <div class="panel">

                    <div class="panel-heading">
                        <h3>Online</h3>
                    </div>
                    <div class="panel-body">
                        <ul id="OnlineUsersList">
                        </ul>
                    </div>

                </div>

            </div>

        </div>


    </body>
    </html>


</asp:Content>
