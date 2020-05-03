@extends('layouts.default')
@section('meta')
    <title>Manage Visitors Timesheet | Smart Timesheet</title>
    <meta name="description"
          content="smart timesheet leave of absence, view all employee leaves of absence, edit, comment, and approve or deny leave requests.">
@endsection

@section('content')
    @include('admin.modals.modal-add-clockin')
    @include('admin.modals.modal-add-clockout')
    <div class="container-fluid">
        <div class="row">
            <h2 class="page-title">Visitors Timesheet Report
                {{--<button class="ui positive button mini offsettop5 btn-add float-right"><i class="ui icon plus"></i>Add
                </button>--}}
            </h2>
        </div>

        <div class="row">
            <div class="box box-success">
                <div class="box-body">
                    <table width="100%" class="table table-striped table-hover" id="dataTables-example">
                        <thead>
                        <tr>
                            <th>ID#</th>
                            <th>Name</th>
                            <th>Contact No</th>
                            <th>National ID</th>
                            <th>Current Date</th>
                            <th>ClockIn Time</th>
                            <th>ClockOut Time</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        @isset($result)
                            @foreach ($result as $data)
                                <tr>
                                    <td>{{ $data->visitor_id }}</td>
                                    <td>{{ $data->visitor_name }}</td>
                                    <td>{{ $data->visitor_contact_no }}</td>
                                    <td>{{ $data->visitor_national_id }}</td>
                                    <td>{{ date('jS-M,Y')}}</td>
                                    <td>
                                        @if(!empty($data->clockin))

                                            {{e(date('D, M d, Y', strtotime($data->clockin)))}}
                                        @endif
                                    </td>
                                    <td>
                                        @if(!empty($data->clockout))

                                            {{e(date('D, M d, Y', strtotime($data->clockout)))}}
                                        @endif
                                    </td>
                                    <td class="">
                                        <button type="button"
                                                data-id="{{ $data->visitor_id }}"
                                           class="ui circular positive icon button tiny btn-add"><i
                                                    class="icon clock alternate outlin"></i> ClockIn</button> |
                                        <button type="button"
                                                data-id="{{ $data->visitor_id }}"
                                                class="ui circular negative icon button btn-off tiny"><i
                                                    class="icon clock alternate outlin"></i> ClockOut</button>
                                    </td>
                                </tr>
                            @endforeach
                        @endisset
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

    </div>

@endsection

@section('scripts')
    <script type="text/javascript">
        $(document).ready(function () {
            $('#dataTables-example').DataTable({
                responsive: true,
                pageLength: 15,
                lengthChange: false,
                searching: true,
            });
        });
    </script>

@endsection