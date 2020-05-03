<div class="ui add modal small">
    <div class="header">Add Visitor</div>
    <div class="content">
    <form id="add_role_form" action="{{ url('timesheet/clockin') }}" class="ui form" method="post" accept-charset="utf-8">
    {{ csrf_field() }}
        <div class="field">
            <input type="hidden" name="visitor_id" id="visitor_id" >
            <label>Visitor Name</label>
            <textarea class="uppercase" name="visitor_name" placeholder="Type your message here." value="" type="text"></textarea>
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
        <button class="ui positive small button" type="submit" name="submit"><i class="ui checkmark icon"></i> Yes, Clockin</button>
        <button class="ui grey cancel small button" type="button"><i class="ui times icon"></i> Cancel</button>
    </div>
    </form>  
</div>

