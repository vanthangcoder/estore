<div class="container">
    <div class="card">
    <div class="card-header">
        Edit Brand
    </div>
    <div class="card-body">
    <a href="<?php echo base_url('brand/create')?>" class="btn btn-primary">Add Brand</a>
    <a href="<?php echo base_url('brand/list')?>" class="btn btn-success">List Brand</a>

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
    <form action="<?php echo base_url('brand/update/') .$brand->id?>" method="POST" enctype="multipart/form-data">
        <div class="form-group">
            <label for="exampleInputEmail1">Title</label>
            <input type="text" name="title" onkeyup="ChangeToSlug();" value="<?php echo $brand->title?>" class="form-control" id="slug" aria-describedby="emailHelp" >
            <?php echo '<span class="text text-danger">'. form_error('title').'</span>' ;?>
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">Slug</label>
            <input type="text" name="slug" value="<?php echo $brand->slug?>" class="form-control" id="convert_slug" aria-describedby="emailHelp" >
            <?php echo '<span class="text text-danger">'. form_error('slug').'</span>' ;?>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Description</label>
            <input type="text"  class="form-control" name="description" value="<?php echo $brand->description?>" id="exampleInputPassword1" >
            <?php echo '<span class="text text-danger">'. form_error('description').'</span>';?>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Image</label>
            <input type="file" class="form-control-file" name="image" id="exampleInputPassword1" >
            <img src="<?php echo base_url('uploads/brand/'). $brand->image?>" width="150" height="150">
            <small><?php if(isset($error)){ echo $error;}?></small>
        </div>
        <div class="form-group">
            <label for="exampleFormControlSelect1">Status</label>
            <select name="status" class="form-control"  id="exampleFormControlSelect1">
                <?php if($brand->status==1){?>
                <option selected value="1">Active</option>
                <option value="0">InActive</option>
                <?php }else{?>
                <option  value="1">Active</option>
                <option selected value="0">InActive</option>
                <?php 
                    }
                ?>
            </select>
        </div>
        <small><?php echo form_error('status')?></small>
        <button type="submit" class="btn btn-primary">update</button>
    </form>
    </div>
    </div>

</div>


