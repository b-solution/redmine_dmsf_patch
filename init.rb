Redmine::Plugin.register :redmine_dmsf_patch do
  name 'Redmine Dmsf Patch plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

DmsfFilesCopyController.send(:include, DmsfPatch::DmsfFilesCopyControllerPatch)
DmsfController.send(:include, DmsfPatch::DmsfControllerPatch)
