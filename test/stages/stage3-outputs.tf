
 resource null_resource write_outputs {
   provisioner "local-exec" {
     command = "echo \"$${OUTPUT}\" > gitops-output.json"

     environment = {
       OUTPUT = jsonencode({
         name        = module.gitops_cp_waiops_aimgr.name
         branch      = module.gitops_cp_waiops_aimgr.branch
         layer       = module.gitops_cp_waiops_aimgr.layer
         layer_dir   = module.gitops_cp_waiops_aimgr.layer == "infrastructure" ? "1-infrastructure" : (module.gitops_cp_waiops_aimgr.layer == "services" ? "2-services" : "3-applications")
         type        = module.gitops_cp_waiops_aimgr.type
       })
     }
   }
}