
 resource null_resource write_outputs {
   provisioner "local-exec" {
     command = "echo \"$${OUTPUT}\" > gitops-output.json"

     environment = {
       OUTPUT = jsonencode({
         name        = module.cp-waiops-aimgr.name
         branch      = module.cp-waiops-aimgr.branch
         layer       = module.cp-waiops-aimgr.layer
         layer_dir   = module.cp-waiops-aimgr.layer == "infrastructure" ? "1-infrastructure" : (module.cp4s.layer == "services" ? "2-services" : "3-applications")
         type        = module.cp-waiops-aimgr.type
       })
     }
   }
}