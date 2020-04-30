@extends('layouts.default')

@section('meta')
    <title>Edit Visitor | Smart Timesheet</title>
    <meta name="description" content="smart timesheet edit user.">
@endsection

@section('content')

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h2 class="page-title">Edit Visitor</h2>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="box box-success">
                    <div class="box-content">

                        <form id="edit_user_form" action="{{ url('visitors/update') }}" class="ui form add-user"
                              method="post"
                              accept-charset="utf-8">
                            {{ csrf_field() }}
                            <div class="field">
                                <label>Visitor Name</label>
                                <input class="uppercase" name="visitor_name"
                                       value="@isset($visitors->visitor_name){{ $visitors->visitor_name }}@endisset"
                                       type="text">
                            </div>
                            <div class="field">
                                <label>Visitor Email</label>
                                <input class="lowercase" name="visitor_email"
                                       value="@isset($visitors->visitor_email){{ $visitors->visitor_email }}@endisset"
                                       type="email">
                            </div>
                            <div class="field">
                                <label>Contact No</label>
                                <input class="uppercase" name="contact_no"
                                       value="@isset($visitors->visitor_contact_no){{ $visitors->visitor_contact_no }}@endisset"
                                       type="text">
                            </div>
                            <div class="field">
                                <label>National ID</label>
                                <input class="uppercase" name="national_id"
                                       value="@isset($visitors->visitor_national_id){{ $visitors->visitor_national_id }}@endisset"
                                       type="text">
                            </div>
                    </div>

                    <div class="box-footer">
                        <input type="hidden" value="@isset($id){{ $id }}@endisset" name="visitor_id">
                        <button class="ui positive approve small button" type="submit" name="submit"><i
                                    class="ui checkmark icon"></i>
                            Update
                        </button>
                        <a href="{{ url('visitors') }}" class="ui black grey small button"><i class="ui times icon"></i>
                            Cancel</a>
                    </div>

                    </form>

                </div>
            </div>
        </div>

        @endsection

        @section('scripts')
            <script type="text/javascript">
                $(document).ready(function () {
                    $('.opt-radio .checkbox').first().checkbox({
                        ischecked: function () {
                            $('.role, .role .ui.dropdown').addClass('disabled');
                            $('select[name="role_id"]').addClass('disabled').val('');
                        }
                    });
                });
            </script>
@endsection