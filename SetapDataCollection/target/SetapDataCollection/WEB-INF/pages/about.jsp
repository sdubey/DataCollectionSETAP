<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>template</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/setap.css" rel="stylesheet">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript">

$(function(){

// The height of the content block when it's not expanded
var adjustheight = 80;
// The "more" link text
var moreText = "+  More";
// The "less" link text
var lessText = "- Less";

// Sets the .more-block div to the specified height and hides any content that overflows
$(".more-less .more-block").css('height', adjustheight).css('overflow', 'hidden');

// The section added to the bottom of the "more-less" div
$(".more-less").append('<p class="continued">[&hellip;]</p><a href="#" class="adjust"></a>');

$("a.adjust").text(moreText);

$(".adjust").toggle(function() {
		$(this).parents("div:first").find(".more-block").css('height', 'auto').css('overflow', 'visible');
		// Hide the [...] when expanded
		$(this).parents("div:first").find("p.continued").css('display', 'none');
		$(this).text(lessText);
	}, function() {
		$(this).parents("div:first").find(".more-block").css('height', adjustheight).css('overflow', 'hidden');
		$(this).parents("div:first").find("p.continued").css('display', 'block');
		$(this).text(moreText);
});
});

</script>

<style>
	body{
		background:#fefefe;
		font-family:Tahoma, Geneva, sans-serif; 
	}
	p{
		font-family:Tahoma, Geneva, sans-serif; 
		font-size:14px; 
		line-height:22px;
		margin-bottom:20px;
	}
	a.adjust{
		padding:10px;
		display:block;
		font-weight:bold;
		background:#eee;
		color:#333;
		border-radius:12px;
		-webkit-border-radius:12px;
		-moz-border-radius:12px;
		width:80px;
		text-align:center;
		text-decoration:none;
	}
		a.adjust:hover{
			background:#333;
			color:#FFF;
			-webkit-transition: all 400ms; /*safari and chrome */
			-moz-transition: all 400ms ease; /* firefox */
			-o-transition: all 400ms ease; /* opera */
			transition: all 400ms ease;
		}
	p.continued{
		margin-top:0;
	}
	img{
		padding:10px;
		background:#FFF;
		border-radius: 12px;
		-webkit-box-shadow: 0 1px 13px rgba(0,0,0,.25);
		-moz-box-shadow: 0 1px 13px rgba(0,0,0,.25);
		box-shadow: 0 1px 13px rgba(0,0,0,.25);
		width:400px;
		margin-left:20px;
	}
</style>
</head>
<body>
	<div id="container">
		<div id="modal-header" class="modal-header">
			<%@ include file="header.jsp"%>
			<h3><span class="tab">About SETAP</span></h3>
		</div>
		<div class="page_content">
			<div class="more-less">
				<div class="more-block">
					<p>Modern software development today involves intensive
						software engineering (SE) teamwork (where teams are often globally
						distributed) with the goals of developing easy to use and
						maintainable software (SW), on schedule and budget, and satisfying
						intended specifications. The need for improved teaching and
						industrial management and training in software development is
						evidenced by the unacceptably high incidence of failure of
						industrial software projects: about 9% are abandoned, about 1/3
						fail, and over half experience cost and schedule overruns [1-5].
						The research also indicates that these failures stem primarily
						from failures in teamwork aspects of SE such as communication,
						organization and teamwork [1,4-8].</p>
					<p>Therefore, there is a critical need in developing methods to
						effectively teach (and with it to assess) teamwork skills in SE
						including for globally distributed teams. Effective methods for
						assessment and early prediction of learning effectiveness in SE
						teamwork are not only critical part of effective teaching but also
						of value in industrial training and project management. Great
						majority of existing approaches to assess achievement of SE
						teamwork skills are based on qualitative and subjective data taken
						as surveys at the end of the class (e.g. “rate the impression of
						your SE teamwork experience in the past class”) followed up by
						only rudimentary data analysis [see for example 18, 19]. These
						approaches are in general lacking in the following: a) the data
						extracted are most often qualitative and subjective (and thus not
						precise and amenable for sophisticated analysis); b) detailed user
						behavior and “meta-data” on usage of SW development tools,
						communication patters in time and among the team members, often
						used in other Internet applications and readily available from
						todays’ SE tools, are rarely used in this context; c) the more
						complex decision methods like machine learning (ML) [9] used
						nowadays in many applications from medicine, marketing, analysis
						of customer and user behavior (e.g. on-line shopping [10] to SE
						problems such as in managing SW reuse and evolution [11, 28, 29])
						are rarely used; d)</p>
					<p>methods to predict early the possible team failures to
						enable class intervention are rarely available (one reason being
						that most class surveys are given at the end of the class). In our
						research we define the learning of SE teamwork as the students’
						ability: (i) to learn and effectively apply SE processes in a
						teamwork setting, and (ii) to work as a team to develop
						satisfactory software (SW) products, e.g. we focus not only on the
						quality of the output (e.g. SW product) but ability of students to
						follow “best practices” in SE teamwork. Our approach to assessment
						and most importantly prediction of learning of SE teamwork is
						novel in that it: a) develops and uses only objective and
						quantitative measures from multiple courses like statistics of
						their time usage and usage of SE tools; and b) applies powerful
						machine learning (ML)</p>
					<p>techniques to identify quantitative and objective factors
						which can assess and predict students’ learning of SE teamwork
						skills. We chose Random Forest (RF) ML approach [17, 20] due to
						its accuracy, ease of implementation, availability of open source
						SW and specifically for its ability to rank variables in terms of
						their predictive power discovering most important factors in
						assessment and prediction. Our research in intimately integrated
						and critically dependent on teaching a joint team intensive and
						globally distributed SE class at San Francisco State University
						(SFSU), Florida Atlantic University (FAU) and Fulda University in
						Germany since 2006 [12-16] which provides an environment where
						student teams are “embedded and observed” thus providing realistic
						data for the research. Our approach has three basic steps [22]:
						Step 1: Collection of the objective and quantitative data on
						student team activity during joint SE classes at SFSU, Florida
						Atlantic University and Fulda University, Germany Step 2: Creation
						of ML training database with team activity measures and instructor
						observations of learning outcomes Step 3: Applying Random Forest
						ML to discover models and factors that</p>
					<p>determine and predict student SE teamwork achievement. Our
						joint and synchronously taught SE class now involves about 140
						students each year, working in about 20-30 teams of 5-6 students
						each. All student teams develop the same application, using the
						same and mandatory modern SE development and communication tools,
						in 5 well defined milestones M1-M5 (high level requirements,
						detailed requirements and specs, prototype development, beta
						release, final delivery), starting only from high level (1page)
						description of the intended product. Student teams are local (made
						of students from the same school/class) and global (mixture of
						students from two schools). They meet in the class (mandatory
						weekly team meetings with the instructors) and on their own.
						Global teams meet over skype or Google chat. Students are
						monitored by instructors during the class and are graded both in
						SE Process and SE Product components of SE teamwork as described
						above. Student team project brings 50/100 class points, with SE
						Process and SE Product component contributing with 25 each. It is
						critical to form student teams with approximately the same overall
						distribution</p>
					<p>of skills and experiences, in order to focus our analysis
						only on factors influencing team success exhibited during the
						class and minimize influence of overall team experience and skills
						prior to the class. Thus we have developed and recently improved
						and formalized the following process for student team selection
						that attempts to select student teams with very similar overall
						skill level. A Team Placement Survey (TPS) with 17 graded
						(Lickert) scale and small number of Y/N questions and 3 simple
						programming tests to judge programming proficiently is
						administered to all students at the beginning of the class. This
						survey includes questions about experience in product development
						and teamwork, proficiency self-rating for various programming
						languages used in the class, GPA, gender, etc. It is made clear
						that information from this survey will not be used for grading and
						that true self-assessment is vital Each student questionnaire is
						rated by weighted sum of responses to questions and instructors
						grading of the programming tests to determine student skills score
						for each student. Teams are formed such that team skills score
						obtained by averaging participating student skills score is
						approximately equal. Genders are mixed as much as possible Global
						teams are formed mainly of volunteers keeping</p>
					<p>the team score of global teams approximately equal to teams
						scores of local teams Each team is asked to recommend a team lead
						who is then evaluated and approved by instructors. Global teams
						have team leads in each participating school. All students are
						given formal survey agreement (“informed consent”) to decide
						whether to participate in this study or not. Student privacy is
						strictly observed and analysis is done and published only at the
						team level (from TAM data). It is made very clear to all students
						that no information collected or derived from this research
						influences student grade. So far, starting in Fall 2012, all
						students agreed to participate in this study. We have previously
						published an overview of our approach applied in a pilot project
						with limited and incomplete measurement set (only several teamwork
						activity measures (TAM) from a few student teams) with very
						preliminary RF analysis [22]. In this paper we provide significant
						new contributions as follows: a) we for the first time</p>
					<p>present in detail a full TAM data set (over 40 measures)
						with detailed definitions and methods of collection including some
						recently developed new measures; b) we present a ML framework by
						using RF on TAM that we developed to specifically deal with the
						challenge of small training data set and somewhat unbalanced
						decision classes, problems known and challenging [23, 24]; c) we
						present implementation details of our “processing pipeline”
						consisting of data collection, training database creation and ML
						analysis subsystems which is now fully implemented and
						operational; and finally d) we present the status of the project
						based on the data from our joint SE class synchronously taught at
						SFSU, Florida Atlantic University and Fulda University, Germany in
						Fall 2012 and SFSU class in Spring 2013 with the data from 17
						student teams (13 local and 4 global). Collecting the data for a
						large ML or data mining project has been recognized in industry
						and academia as the most challenging and time consuming task, and
						our experience conforms this. Accurate training data is critical
						for proper derivation of ML predictors. In addition, when data is
						collected from three synchronous SE classes in three geographic
						locations, great effort must be spent to ensure efficiency,
						accuracy, ease of use of data collection instruments and tools by
						students and faculty, as well as integration of data collection
						and isntrutorss’ observations with the teaching.</p>

				</div>
			</div>

			<hr />
		</div>
		<div id="modal-footer" class="modal-footer">
			<%@ include file="footer.jsp"%>
		</div>
	</div>
</body>
</html>