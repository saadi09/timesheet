<div class="ui off modal small">
    <div class="header">Visitor Clock Out</div>
    <div class="content">
        <form id="add_role_form" action="{{ url('timesheet/clockout') }}" class="ui form" method="post"
              accept-charset="utf-8">
            {{ csrf_field() }}
            <div class="field">
                <input type="hidden" name="visitor_id_off" id="visitor_id_off">
                <label>Visitor Name</label>
                <div class="text-capitalize">Are You sure, You want to clock out this visitor?</div>
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
    </div>
    <div class="actions">
        <button class="ui positive small button" type="submit" name="submit"><i class="ui checkmark icon"></i> Yes,
            ClockOut
        </button>
        <button class="ui grey cancel small button" type="button"><i class="ui times icon"></i> No, Cancel</button>
    </div>
    </form>
</div>

