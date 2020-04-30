<!doctype html>
<html lang="en" class="fullscreen-bg">

<head>
	<title>Sign in | Albrighton Care</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
    <link href="{{ asset('/assets/vendor/semantic-ui/semantic.min.css') }}" rel="stylesheet" type="text/css">
	<link href="{{ asset('/assets/css/auth.css') }}" rel="stylesheet">
	<style>
		body { overflow:hidden; background-color:  !important; }
		.auth-box{
			position: absolute;
			left: 0;
			right: 0;
			margin-left: auto;
			margin-right: auto;
			margin-top: 100px;
		}
	</style>
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle" id="particles-js">
				<div class="auth-box">
					<div class="content">
						<div class="header">
							<div class="logo align-center"><img src="{{ asset('/assets/images/img/Albrighton_Care_logo.png') }}" alt="Timesheet"></div>
							<p class="lead">Sign in to your account</p>
						</div>
						<form class="form-auth-small ui form" action="{{ route('login') }}" method="POST">
                       		{{ csrf_field() }}
							
							<div class="fields">
								<div class="sixteen wide field {{ $errors->has('email') ? ' has-error' : '' }}">
									<label for="email" class="color-white">Email</label>
									<input id="email" type="email" class="" name="email" value="{{ old('email') }}" placeholder="Your e-mail address" required autofocus>

									@if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                	@endif	
								</div>
							</div>
							<div class="fields">
								<div class="sixteen wide field {{ $errors->has('password') ? ' has-error' : '' }}">
									<label for="password" class="color-white">Password</label>
                                	<input id="password" type="password" class="" name="password" placeholder="Your password" required>

                                	@if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                	@endif
								</div>
							</div>
							<div class="fields">
								<div class="sixteen wide field">
									<div class="ui checkbox">
										<input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}>
										<label class="color-white">Remember me</label>
									</div>
								</div>
							</div>

							<button type="submit" class="ui green button large fluid">SIGN IN</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		
	</div>
	<!-- END WRAPPER -->

	<!--   Core JS Files   -->
    <script src="{{ asset('/assets/vendor/jquery/jquery-3.3.1.min.js') }}"></script>
    <script src="{{ asset('/assets/vendor/semantic-ui/semantic.min.js') }}"></script>
	<script>
		$('.ui.checkbox').checkbox('uncheck', 'toggle');
	</script>

	<!--  Particles Animation  -->
	<script src="{{asset('assets/particles.min.js')}}"></script>
	<script type="text/javascript">
		particlesJS.load('particles-js', '{{asset('assets/particlesjs-config.json')}}', function() {
			console.log('callback - particles.js config loaded');
		});
	</script>

</body>

</html>
