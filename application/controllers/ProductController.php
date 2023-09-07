<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ProductController extends CI_Controller {

    public function checkLogin(){
        if ( !$this->session->userdata('LoggedIn')) {
            redirect(base_url('/login'));
        } 
          
    }
	
	public function index()
	{
        $this->checkLogin();
		$this->load->view('admin_template/header');
        $this->load->view('admin_template/navbar');

        $this->load->model('ProductModel');
        $data['product'] = $this->ProductModel->selectAllProduct();

        $this->load->view('product/list',$data);
        $this->load->view('admin_template/footer');
	}

    public function create()
	{
        $this->checkLogin();
		$this->load->view('admin_template/header');
        $this->load->view('admin_template/navbar');
        //goi brand
        $this->load->model('BrandModel');
        $data['brand'] = $this->BrandModel->selectBrand();
        //goi category
        $this->load->model('CategoryModel');
        $data['category'] = $this->CategoryModel->selectCategory();

        $this->load->view('product/create',$data);
        $this->load->view('admin_template/footer');
	}

    public function store()
    {
        $this->form_validation->set_rules('title','Title','trim|required',['required'=>'bạn nên điền  %s']);
        $this->form_validation->set_rules('slug','Slug','trim|required',['required'=>'bạn nên điền  %s']);
        $this->form_validation->set_rules('price','Price','trim|required',['required'=>'bạn nên điền  %s']);
        $this->form_validation->set_rules('quantity','Quantity','trim|required',['required'=>'bạn nên điền  %s']);
		$this->form_validation->set_rules('description','Description','trim|required',['required'=>'bạn nên điền %s']);
		if ($this->form_validation->run()==TRUE) 
		{
            $ori_filename = $_FILES['image']['name']; // cd hinh123.jpg
            $new_name = time()."".str_replace('','-',$ori_filename);  //hinh 123+45678.jpg
            $config = [
                'upload_path' => './uploads/product',
                'allowed_types' =>'gif|jpg|png|jpeg',
                'file_name'=>$new_name
            ];

            $this->load->library('upload',$config);

            if (! $this->upload->do_upload('image')) {
                $error = array('error'=>$this->upload->display_errors());
                $this->load->view('admin_template/header');
                $this->load->view('admin_template/navbar');
                $this->load->view('product/create',$error);
                $this->load->view('admin_template/footer');
            }else{
                $product_filename = $this->upload->data('file_name');
                $data=[
                    'title'=>$this->input->post('title'),
                    'description'=>$this->input->post('description'),
                    'slug'=>$this->input->post('slug'),
                    'quantity'=>$this->input->post('quantity'),
                    'price'=>$this->input->post('price'),
                    'category_id'=>$this->input->post('category_id'),
                    'brand_id'=>$this->input->post('brand_id'),
                    'status' => $this->input->post('status'),
                    'image' =>$product_filename,
    
                ];
                $this->load->model('ProductModel');
                $this->ProductModel->insertproduct($data);
                $this->session->set_flashdata('success','Add Susses product');
                redirect(base_url('product/list'));
            }

        }else{
            $this->create();
        }
    }

    public function edit($id){
        $this->checkLogin();
		$this->load->view('admin_template/header');
        $this->load->view('admin_template/navbar');
        //goi brand
        $this->load->model('BrandModel');
        $data['brand'] = $this->BrandModel->selectBrand();
        //goi category
        $this->load->model('CategoryModel');
        $data['category'] = $this->CategoryModel->selectCategory();
        //goi product by id
        $this->load->model('ProductModel');
        $data['product'] = $this->ProductModel->selectProductById($id);

        $this->load->view('product/edit',$data);
        $this->load->view('admin_template/footer');
    }

    public function update($id){
        
        $this->form_validation->set_rules('title','Title','trim|required',['required'=>'bạn nên điền  %s']);
        $this->form_validation->set_rules('slug','Slug','trim|required',['required'=>'bạn nên điền  %s']);
        $this->form_validation->set_rules('price','Price','trim|required',['required'=>'bạn nên điền  %s']);
        $this->form_validation->set_rules('quantity','Quantity','trim|required',['required'=>'bạn nên điền  %s']);
		$this->form_validation->set_rules('description','Description','trim|required',['required'=>'bạn nên điền %s']);
		if ($this->form_validation->run()==TRUE) 
		{
            if(!empty($_FILES['image']['name'])){
                //upload_img
                $ori_filename = $_FILES['image']['name']; // cd hinh123.jpg
                $new_name = time()."".str_replace('','-',$ori_filename);  //hinh 123+45678.jpg
                $config = [
                    'upload_path' => './uploads/product',
                    'allowed_types' =>'gif|jpg|png|jpeg',
                    'file_name'=>$new_name
                ];

                $this->load->library('upload',$config);

                if (! $this->upload->do_upload('image')) {
                    $error = array('error'=>$this->upload->display_errors());
                    $this->load->view('admin_template/header');
                    $this->load->view('admin_template/navbar');
                    $this->load->view('product/create',$error);
                    $this->load->view('admin_template/footer');
                }else{
                    $filename = $this->upload->data('file_name');
                    $data=[
                        'title'=>$this->input->post('title'),
                        'description'=>$this->input->post('description'),
                        'slug'=>$this->input->post('slug'),
                        'quantity'=>$this->input->post('quantity'),
                        'price'=>$this->input->post('price'),
                        'category_id'=>$this->input->post('category_id'),
                        'brand_id'=>$this->input->post('brand_id'),
                        'status' => $this->input->post('status'),
                        'image' =>$filename,
        
                    ];
                    
                }
            }else{
                $data=[
                    'title'=>$this->input->post('title'),
                    'description'=>$this->input->post('description'),
                    'slug'=>$this->input->post('slug'),
                    'price'=>$this->input->post('price'),
                    'quantity'=>$this->input->post('quantity'),
                    'category_id'=>$this->input->post('category_id'),
                    'brand_id'=>$this->input->post('brand_id'),
                    'status' => $this->input->post('status'),
                    
    
                ];
            }
            $this->load->model('ProductModel');
            $this->ProductModel->updateProduct($id,$data);
            $this->session->set_flashdata('success','Update Susses product');
            redirect(base_url('product/list'));
            
        }else{
            $this->edit($id);
        }
    }

    public function delete($id){
        $this->load->model('ProductModel');
        $this->ProductModel->deleteProduct($id);
        $this->session->set_flashdata('success','Delete Susses product');
        redirect(base_url('product/list'));
    }
    
}