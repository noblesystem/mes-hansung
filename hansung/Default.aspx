<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="hansung.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css" />
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<style>
    .notice td {
        cursor: pointer;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
        <div class="col-lg-4">

            <div class="col-lg-12">
                  <div class="ibox ">
                        <div class="ibox-title">
                            <h5>공지사항-리스트</h5>
                        </div>
                        <div class="ibox-content table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>타이틀</th>
                                        <th>등록일</th>
                                        <th>등록자</th>
                                    </tr>
                                </thead>
                                <tbody id="notice_list">
                                    <%  
                                    foreach (var o in notices)
                                    {%>
                                    <tr class="notice">
                                        <td id="seq"><%=o["seq"].ToString() %></td>
                                        <td id="title"><%=o["title"].ToString() %></td>
                                        <td id="insert_date"><%=o["insert_date"].ToString() %></td>
                                        <td id="insert_user_name"><%=o["insert_user_name"].ToString() %></td>
                                        <input type="hidden" id="contents" value="<%=o["contents"].ToString() %>">
                                        <input type="hidden" id="image_url" value="<%=o["image_path"].ToString() %>">
                                    </tr>
                                    <%
                                    } %>
                                </tbody>
                            </table>
                            <script>
                                $(document).ready(function () {

                                    function initContent() {
                                        var contents = $('#notice_list tr:first-child')

                                        var title = $(contents).find("#title").html();
                                        var insert_date = $(contents).find("#insert_date").html();
                                        var insert_user_name = $(contents).find("#insert_user_name").html();
                                        var contents = $(contents).find("#contents").val();
                                        var image_path = $(contents).find("#image_path").val();

                                        $("#nt_insert_date").text(insert_date);
                                        $("#nt_title").text(title);
                                        $("#nt_contents").html(contents);

                                        $("#image_path").attr("src", image_path);
                                    }

                                    initContent();

                                    $(".notice").click(function () {

                                        var title = $(this).find("#title").html();
                                        var insert_date = $(this).find("#insert_date").html();
                                        var insert_user_name = $(this).find("#insert_user_name").html();
                                        var contents = $(this).find("#contents").val();
                                        var image_path = $(this).find("#image_path").val();

                                        $("#nt_insert_date").text(insert_date);
                                        $("#nt_title").text(title);
                                        $("#nt_contents").html(contents);

                                        $("#image_path").fadeTo(100, 0.30, function () {
                                            $("#image_path").attr("src", image_path);
                                        }).fadeTo(100, 1);

                                    })

                                });
                            </script>
                        </div>
                    </div>
            </div>
          
            <div class="col-lg-12">
                 <div class="ibox ">
                    <div class="ibox-title">
                        <h5>KPI지표</h5>

                    </div>
                    <div class="ibox-content">
                        <div class="form-group row">
                            <div class="col-sm-12 col-sm-offset-0">
                                <a href="#" id="chart1" class="chart-btn btn btn-white btn-sm">월별매출</a>
                                <a href="#" id="chart2" class="chart-btn btn btn-white btn-sm">클레임</a>
                                <a href="#" id="chart3" class="chart-btn btn btn-white btn-sm">재고비용</a>
                                <a href="#" id="chart4" class="chart-btn btn btn-white btn-sm">수출LT</a>
                            </div>
                        </div>
                        <canvas id="kpi-chart1" class="chart" width="500" height="400"></canvas>
                        <canvas id="kpi-chart2" class="chart" width="500" height="400"></canvas>
                        <canvas id="kpi-chart3" class="chart" width="500" height="400"></canvas>
                        <canvas id="kpi-chart4" class="chart" width="500" height="400"></canvas>
                    </div>
                </div>
            </div>


        </div>


        <div class="col-lg-8">
            <div class="ibox ">
                <div class="ibox-title">

                    <h5 id="nt_insert_date">2019.06.01</h5>
                    
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content table-responsive">

                    <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>구분</th>
                                    <th>내용</th>
                                </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>제목</td>
                                <td id="nt_title">  
                                    공지사항 제목
                                </td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td id="nt_contents">  
                                    공지사항 말씀
                                </td>
                            </tr>
                            <tr>
                                <td>사진</td>
                                <td>  
                                    <div><img id="image_path" src="/img/ceo/20190522.png" style="width: 100%;" />  </div>
                                </td>                                
                            </tr>
                            </tbody>
                        </table>

               
                    
                </div>
            </div>
        </div>

        
    </div> 
</div>
<script>
    $("canvas").hide();
    $("#kpi-chart1").show();
    $(document).ready(function () {

       

        $("#chart1").click(function (e) {
            e.preventDefault();  
            $("canvas").hide();
            $("#kpi-chart1").show();
        })
        $("#chart2").click(function (e) {
            e.preventDefault();
            $("canvas").hide();
            $("#kpi-chart2").show();
        })
        $("#chart3").click(function (e) {
            e.preventDefault();
            $("canvas").hide();
            $("#kpi-chart3").show();
        })
        $("#chart4").click(function (e) {
            e.preventDefault();
            $("canvas").hide();
            $("#kpi-chart4").show();
        })

        
    })
    kpi1();
    function kpi1() {

        var ctx = document.getElementById('kpi-chart1').getContext('2d');

        var charts = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['201905', '201906'],
                datasets: [{
                    label: '',
                    data: [32, 22],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                title: {
                    display: true,
                    text: '월별매출'
                },
                scales: {
                    yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: '백만원'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

        console.log(charts)
    }

    kpi2();
    function kpi2() {

        var ctx = document.getElementById('kpi-chart2').getContext('2d');

        var charts = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['대체', '폐기'],
                datasets: [{
                    label: '',
                    data: [6, 2],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                title: {
                    display: true,
                    text: '클레임'
                },
                scales: {
                    yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: '수'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

        console.log(charts)
    }

    kpi3();
    function kpi3() {

        var ctx = document.getElementById('kpi-chart3').getContext('2d');

        var charts = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['201812', '201901', '201902', '201903', '201904', '201905', '201906'],
                datasets: [{
                    label: '',
                    data: [24543320,164434110,23022200,66440,58547180,147040620],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                title: {
                    display: true,
                    text: '재고비용'
                },
                scales: {
                    yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: '원'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

        console.log(charts)
    }

    kpi4();
    function kpi4() {

        var ctx = document.getElementById('kpi-chart4').getContext('2d');

        Chart.defaults.global.elements.line.fill = false;

        // stacked bar with 2 unstacked lines - nope
        var barChartData = {
            labels: ['201812', '201901', '201902', '201903', '201905', '201906'],
            datasets: [{
                type: 'bar',
                label: '1',
                id: "y-axis-0",
                backgroundColor: "rgba(217,83,79,0.75)",
                data: [1,0,1,0,0,5]
            }, {
                type: 'bar',
                label: '2',
                id: "y-axis-0",
                backgroundColor: "rgba(92,184,92,0.75)",
                data: [0,2,1,0,3,3]
            }, {
                type: 'bar',
                label: '3',
                id: "y-axis-0",
                backgroundColor: "rgba(51,51,51,0.5)",
                data: [2,2,0,1,2,2]
            }, {
                type: 'bar',
                label: '4',
                id: "y-axis-1",
                backgroundColor: "rgba(151,187,205,0.5)",
                data: [0,0,0,0,0,2]
            }, {
                type: 'bar',
                label: '5',
                id: "y-axis-1",
                backgroundColor: "rgba(151,187,205,0.5)",
                data: [1,0,0,0,0,1]
            }, {
                type: 'bar',
                label: '6',
                id: "y-axis-0",
                backgroundColor: "rgba(92,184,92,0.75)",
                data: [0,0,0,0,0,3]
            }, {
                type: 'bar',
                label: '7',
                id: "y-axis-0",
                backgroundColor: "rgba(51,51,51,0.5)",
                data: [0,0,0,0,0,3]
            }
            ]
        };


        var ctx = document.getElementById("kpi-chart4");
        // allocate and initialize a chart
        var ch = new Chart(ctx, {
            type: 'bar',
            data: barChartData,
            options: {
                title: {
                    display: true,
                    text: "재고LT"
                },
                tooltips: {
                    mode: 'label'
                },
                responsive: true,
                scales: {
                    xAxes: [{
                        stacked: false
                    }],
                    yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: '리드타임(L/T)'
                        },
                        stacked: false,
                        position: "left",
                        id: "y-axis-0",
                    }]
                }
            }
        });


    }

    

</script>



</asp:Content>
