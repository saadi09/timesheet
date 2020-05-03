@extends('layouts.default')
@section('meta')
    <title>Manage Visitors Timesheet | Smart Timesheet</title>
    <meta name="description"
          content="smart timesheet leave of absence, view all employee leaves of absence, edit, comment, and approve or deny leave requests.">
@endsection

@section('content')
    @include('admin.modals.modal-add-visitors')
    <div class="container-fluid">
        <div class="row">
            <div class="box box-success">
                <div class="box-body">
                    <table width="100%" class="table table-striped table-hover" id="dataTables-example">
                        <thead>
                        <tr>
                            <th>ID #</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Contact No</th>
                            <th>National ID</th>
                            <th>Clock In</th>
                            <th>Clock Out</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        @isset($visitors)
                            @foreach ($visitors as $data)
                                <tr>
                                    <td>{{ $data->v_timesheet_id }}</td>
                                    <td>{{ $data->visitor_name }}</td>
                                    <td>{{ $data->visitor_email }}</td>
                                    <td>{{ $data->visitor_contact_no }}</td>
                                    <td>{{ $data->visitor_national_id }}</td>
                                    <td>{{ $data->v_clockin }}</td>
                                    <td>
                                            @if(!empty($data->v_clockout))

                                             {{e(date('D, M d, Y', strtotime($data->v_clockout)))}}
                                        @else
                                         {{"Not Clocked Out Yet"}}
                                         @endif
                                        </td>
                                    <td class="align-right">
                                        <a href="{{ url('visitors/visitor_visiting_history/'.$data->visitor_id) }}"
                                           class="ui circular basic icon button tiny"><i
                                                    class="icon clock alternate outlin"></i></a>
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