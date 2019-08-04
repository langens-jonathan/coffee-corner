(in-package :mu-cl-resources)

(define-resource task ()
  :class (s-prefix "todos:Task")
  :properties `((:title :string ,(s-prefix "dct:title"))
                (:description :string ,(s-prefix "dct:description"))
                (:done :boolean ,(s-prefix "todos:done"))
                (:due :date ,(s-prefix "todos:due"))
                (:priority :int ,(s-prefix "todos:priority")))
  :has-many `((tag :via ,(s-prefix "todos:tag")
                   :as "tags")
              (user :via ,(s-prefix "todos:owner")
                    :as "authors")
              )
  :resource-base (s-url "http://resources.gamerlords.com/todos/tasks/")
  :on-path "tasks"
)

;; (define-resource user ()
;;   :class (s-prefix "foaf:Person")
;;   :properties `((:name :string ,(s-prefix "foaf:name"))
;;                 (:password :string ,(s-prefix "todos:pwd"))
;;                 )
;;   :resource-base (s-url "http://resources.gamerlords.com/todos/users/")
;;   :on-path "users"
;; )

(define-resource tag ()
  :class (s-prefix "todos:Tag")
  :properties `((:pref-label :string ,(s-prefix "skos:prefLabel")))
  :resource-base (s-url "http://resources.gamerlords.com/todos/tags/")
  :on-path "tags"
  )

(define-resource theme ()
  :class (s-prefix "todos:Theme")
  :properties `((:title :string ,(s-prefix "dct:title")))
  :resource-base (s-url "http://resources.gamerlords.com/todos/themes/")
  :on-path "themes"
  )

(define-resource project ()
  :class (s-prefix "todos:Project")
  :properties `((:title :string ,(s-prefix "dct:title")))
  :resource-base (s-url "http://resources.gamerlords.com/todos/projects/")
  :on-path "projects"
  )
