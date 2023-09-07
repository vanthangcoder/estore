<div class="container">
    <div class="card">
    <div class="card-header">
        List Order
    </div>
    <?php
    if($this->session->flashdata('success')){
        ?>
    <div class="alert alert-success"><?php echo $this->session->flashdata('success');?></div>
    <?php   
        }elseif($this->session->flashdata('error')){
    ?>
    <div class="alert alert-danger"><?php echo $this->session->flashdata('error');?></div>
    <?php
        }
    ?>
    <div class="card-body">
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Order code</th>
                <th scope="col">Name</th>
                <th scope="col">Address</th>
                <th scope="col">Status</th>
                <th scope="col">Manage</th>
            </tr>
        </thead>
        <tbody>
            <?php
                foreach($order as $key =>$ord){
            ?>

            <tr>
                <th scope="row"><?php echo $key?></th>
                <td><?php echo $ord->order_code?></td>
                <td><?php echo $ord->name?></td>
                <td><?php echo $ord->phone?></td>
                <td><?php echo $ord->address?></td>
                
                <td>
                    <?php
                    if($ord->status==1){
                        echo '<span class="text text-primary">Đang chờ sử lý</span> ';
                        
                    }else if($ord->status==2){
                        echo '<span class="text text-success">Đã giao hàng </span> ';
                    }else{
                        echo '<span class="text text-danger">Đã hủy đơn  </span> ';
                    }
                    ?>
                </td>
                <td>
                    <a onclick="return confirm ('Are u Sure?')" href="<?php echo base_url('order/delete/'.$ord->order_code)?>" class="btn btn-danger">Delete</a>
                    <a href="<?php echo base_url('order/view/'.$ord->order_code)?>" class="btn btn-warning">View</a>
                </td>
            </tr>
            <?php
                }
            ?>
        </tbody>
    </table>
    </div>
    </div>

</div>