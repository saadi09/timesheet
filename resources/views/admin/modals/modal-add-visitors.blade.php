<div class="ui add modal small">
    <div class="header">Add Visitor</div>
    <div class="content">
    <form id="add_role_form" action="{{ url('visitors/add') }}" class="ui form" method="post" accept-charset="utf-8">
    {{ csrf_field() }}
        <div class="field">
            <label>Visitor Name</label>
            <input class="uppercase" name="visitor_name" value="" type="text">
        </div>
        <div class="field">
            <label>Visitor Email</label>
            <input class="lowercase" name="visitor_email" value="" type="email">
        </div>
        <div class="field">
            <label>Contact No</label>
            <input class="uppercase" name="contact_no" value="" type="text">
        </div>
        <div class="field">
            <label>National ID</label>
            <input class="uppercase" name="national_id" value="" type="text">
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
        <button class="ui positive small button" type="submit" name="submit"><i class="ui checkmark icon"></i> Save</button>
        <button class="ui grey cancel small button" type="button"><i class="ui times icon"></i> Cancel</button>
    </div>
    </form>  
</div>
