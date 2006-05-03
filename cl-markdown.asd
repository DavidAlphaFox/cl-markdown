;;; -*- Mode: Lisp; package: CL-USER; Syntax: Common-lisp; Base: 10 -*-

#|

|#

(in-package :common-lisp-user)
(defpackage "CL-MARKDOWN-SYSTEM" (:use #:cl #:asdf))
(in-package "CL-MARKDOWN-SYSTEM")

(defsystem cl-markdown 
  :version "0.1"
  :author "Gary Warren King <gwking@metabang.com>"
  :maintainer "Gary Warren King <gwking@metabang.com>"
  :licence "MIT Style License"
  :components ((:module "dev"
                        :components ((:file "package")
                                     (:file "definitions"
                                            :depends-on ("package"))
                                     (:file "macros"
                                            :depends-on ("package"))
                                     (:file "class-defs"
                                            :depends-on ("definitions"))
                                     (:file "utilities"
                                            :depends-on ("package"))
                                     (:file "spans"
                                            :depends-on ("package"))
                                     (:file "markdown"
                                            :depends-on ("utilities" "class-defs" 
                                                         "spans" "definitions"))
                                     #+Ignore
                                     (:file "html"
                                            :depends-on ("utilities" "class-defs" "spans"))
                                     (:file "lml2"
                                            :depends-on ("utilities" "class-defs" "spans" "macros"))
                                     
                                     (:file "epilogue"
                                            :depends-on ("markdown"))
                                            
                                     (:static-file "notes.text"))))
                                     
  
  :depends-on (metatilities cl-ppcre lml2 html-encode))

