@component('mail::message')
<div class="container">
    <div class="col-lg-12" style="border-radius: 10px; background-color: #f5f5f5; padding: 15px;">
        <p>
        <h2>Dear <?= $user['emp_name'] ?> </h2>
        </p>
        <hr>
        <p style="color: #000">
        <b>Your weekly schedule for <?= date('jS-M,Y', strtotime($shifts['start'])) ?> to <?= date('jS-M,Y', strtotime($shifts['end'])) ?>  has been published.</b>
        <table border="1px" width="600px">
            <tr>
                <th colspan="4">Schedule Detail</th>
            </tr>
            <tr>
                <th>Working Days</th>
                <th>Date</th>
                <th>Shift</th>
                <th>Shift Timings</th>
            </tr>
            <?php foreach($shifts['days'] as $key => $value): ?>
                <tr>
                    <td align="center"><?= $key ?></td>
                    <td align="center"><?= $value;  ?></td>
                    <td align="center" bgcolor="<?= $shifts['color']?>"><?= $shifts['shift']; ?></td>
                    <td align="center" bgcolor="yellow"><?= date('h:i:a', strtotime($shifts['shift_start'])).' to '.date('h:i:a', strtotime($shifts['shift_end']))  ?></td>
                </tr>
            <?php endforeach; ?>
        </table>
    </div>
</div>
@endcomponent
