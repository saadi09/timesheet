@extends('layouts.default')
    @section('meta')
    <title>Companies | Smart Timesheet</title>
    <meta name="description" content="smart timesheet companies, view companies, and export or download companies.">
    @endsection

    @section('content')
    @include('admin.modals.modal-import-company')

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h2 class="page-title">ADD COMPANY
                    <button class="ui basic button mini offsettop5 btn-import float-right"><i class="ui icon upload"></i> Import</button>
                    <a href="{{ url('export/fields/company' )}}" class="ui basic button mini offsettop5 btn-export float-right"><i class="ui icon download"></i> Export</a>
                </h2>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="box box-success">
                    <div class="box-body">
                    
                    <form id="add_company_form" action="{{ url('fields/company/add') }}" class="ui form" method="post" accept-charset="utf-8">
                        {{ csrf_field() }}
                        <div class="field">
                            <label>Company Name <span class="help">e.g. "Apple Corporation"</span></label>
                            <input class="uppercase" name="company" value="" type="text">
                        </div>
                        <div class="field">
                            <div class="ui error message">
                                <i class="close icon"></i>
                                <div class="header"></div>
                                <ul class="list">
                                    <li class=""></li>
                                </ul>
                            </div>
                        </div>
                        <div class="actions">
                            <button type="submit" class="ui positive button small"><i class="ui icon check"></i> Save</button>
                        </div>          
                    </form>
                    
                    </div>
                </div>
            </div>

            <div class="col-md-8">
            <div class="box box-success">
                <div class="box-body">
                <table width="100%" class="table table-striped table-hover" id="dataTables-example">
                    <thead>
                        <tr>
                            <th>Company</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        @isset($data)
                        @foreach ($data as $company)
                        <tr>
                            <td>{{ $company->company }}</td>
                            <td class="align-right"> 
                                <a href="{{ url('fields/company/delete/'.$company->id) }}" class="ui circular basic icon button tiny"><i class="icon trash alternate outline"></i></a>
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
    </div>

    @endsection

    @section('scripts')
    <script type="text/javascript">
        $(document).ready(function() {
            $('#dataTables-example').DataTable({ responsive: true, searching: true, ordering: true, info: true, bLengthChange: false, });
        });
        function validateFile() {
            var f = document.getElementById("csvfile").value;
            var d = f.lastIndexOf(".") + 1;
            var ext = f.substr(d, f.length).toLowerCase();
            if (ext == "csv") { } else {
                document.getElementById("csvfile").value="";
                $.notify({
                icon: 'ui icon times',
                message: "Please upload only CSV file format."},
                {type: 'danger',timer: 400});
            }
        }
    </script>

    @endsection


  