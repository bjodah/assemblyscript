(module
 (type $iiv (func (param i32 i32)))
 (type $iv (func (param i32)))
 (type $ii (func (param i32) (result i32)))
 (type $i (func (result i32)))
 (type $v (func))
 (global $assembly/ugc/IDLE i32 (i32.const 0))
 (global $assembly/ugc/MARK i32 (i32.const 1))
 (global $assembly/ugc/SWEEP i32 (i32.const 2))
 (global $assembly/ugc/GRAY i32 (i32.const 2))
 (global $assembly/ugc/GC (mut i32) (i32.const 0))
 (global $HEAP_BASE i32 (i32.const 4))
 (memory $0 1)
 (export "gc_pause" (func $assembly/ugc/gc_pause))
 (export "gc_resume" (func $assembly/ugc/gc_resume))
 (export "gc_collect" (func $assembly/ugc/gc_collect))
 (export "memory" (memory $0))
 (start $start)
 (func $assembly/ugc/ObjectHeader#set:next (; 0 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (i32.store
   (get_local $0)
   (i32.or
    (get_local $1)
    (i32.and
     (i32.load
      (get_local $0)
     )
     (i32.const 3)
    )
   )
  )
 )
 (func $assembly/ugc/ObjectHeader#set:prev (; 1 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (i32.store offset=4
   (get_local $0)
   (i32.or
    (get_local $1)
    (i32.and
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 3)
    )
   )
  )
 )
 (func $assembly/ugc/ObjectHeader#clear (; 2 ;) (type $iv) (param $0 i32)
  (call $assembly/ugc/ObjectHeader#set:next
   (get_local $0)
   (get_local $0)
  )
  (call $assembly/ugc/ObjectHeader#set:prev
   (get_local $0)
   (get_local $0)
  )
 )
 (func $assembly/ugc/Control.create (; 3 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (block
   (set_local $1
    (get_local $0)
   )
  )
  (block
   (set_local $2
    (get_local $0)
   )
  )
  (block
   (set_local $3
    (i32.add
     (get_local $0)
     (i32.mul
      (i32.const 2)
      (i32.const 4)
     )
    )
   )
  )
  (call $assembly/ugc/ObjectHeader#clear
   (get_local $2)
  )
  (call $assembly/ugc/ObjectHeader#clear
   (get_local $3)
  )
  (i32.store8 offset=28
   (get_local $1)
   (i32.const 0)
  )
  (i32.store8 offset=29
   (get_local $1)
   (i32.const 0)
  )
  (i32.store offset=16
   (get_local $1)
   (get_local $2)
  )
  (i32.store offset=20
   (get_local $1)
   (get_local $3)
  )
  (i32.store offset=24
   (get_local $1)
   (i32.load offset=20
    (get_local $1)
   )
  )
  (return
   (get_local $1)
  )
 )
 (func $assembly/ugc/Control#set:paused (; 4 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (i32.store8 offset=28
   (get_local $0)
   (if (result i32)
    (get_local $1)
    (block (result i32)
     (set_local $2
      (i32.and
       (i32.or
        (i32.load8_u offset=28
         (get_local $0)
        )
        (i32.const 128)
       )
       (i32.const 255)
      )
     )
     (i32.store8 offset=28
      (get_local $0)
      (get_local $2)
     )
     (get_local $2)
    )
    (block (result i32)
     (set_local $2
      (i32.and
       (i32.and
        (i32.load8_u offset=28
         (get_local $0)
        )
        (i32.xor
         (i32.const 128)
         (i32.const -1)
        )
       )
       (i32.const 255)
      )
     )
     (i32.store8 offset=28
      (get_local $0)
      (get_local $2)
     )
     (get_local $2)
    )
   )
  )
 )
 (func $assembly/ugc/gc_pause (; 5 ;) (type $v)
  (call $assembly/ugc/Control#set:paused
   (get_global $assembly/ugc/GC)
   (i32.const 1)
  )
 )
 (func $assembly/ugc/gc_resume (; 6 ;) (type $v)
  (call $assembly/ugc/Control#set:paused
   (get_global $assembly/ugc/GC)
   (i32.const 0)
  )
 )
 (func $assembly/ugc/Control#get:paused (; 7 ;) (type $ii) (param $0 i32) (result i32)
  (return
   (i32.ne
    (i32.and
     (i32.and
      (i32.load8_u offset=28
       (get_local $0)
      )
      (i32.const 128)
     )
     (i32.const 255)
    )
    (i32.const 0)
   )
  )
 )
 (func $assembly/ugc/gc_scan_fn (; 8 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (if
   (i32.eqz
    (get_local $1)
   )
   (nop)
   (set_local $2
    (i32.load
     (i32.add
      (get_local $1)
      (i32.const 8)
     )
    )
   )
  )
 )
 (func $assembly/ugc/ObjectHeader#get:next (; 9 ;) (type $ii) (param $0 i32) (result i32)
  (return
   (i32.and
    (i32.load
     (get_local $0)
    )
    (i32.xor
     (i32.const 3)
     (i32.const -1)
    )
   )
  )
 )
 (func $assembly/ugc/ObjectHeader#set:color (; 10 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (if
   (i32.eqz
    (i32.lt_u
     (get_local $1)
     (i32.const 3)
    )
   )
   (unreachable)
  )
  (i32.store
   (get_local $0)
   (i32.or
    (i32.load
     (get_local $0)
    )
    (get_local $1)
   )
  )
 )
 (func $std:heap/free_memory (; 11 ;) (type $iv) (param $0 i32)
 )
 (func $assembly/ugc/gc_free_fn (; 12 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (block
   (set_local $2
    (i32.load
     (i32.add
      (get_local $1)
      (i32.const 8)
     )
    )
   )
  )
  (call $std:heap/free_memory
   (get_local $1)
  )
 )
 (func $assembly/ugc/Control#step (; 13 ;) (type $iv) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (nop)
  (block $break|0
   (block $case2|0
    (block $case1|0
     (block $case0|0
      (set_local $2
       (i32.load8_u offset=28
        (get_local $0)
       )
      )
      (br_if $case0|0
       (i32.eq
        (get_local $2)
        (i32.const 0)
       )
      )
      (br_if $case1|0
       (i32.eq
        (get_local $2)
        (i32.const 1)
       )
      )
      (br_if $case2|0
       (i32.eq
        (get_local $2)
        (i32.const 2)
       )
      )
      (br $break|0)
     )
     (call $assembly/ugc/gc_scan_fn
      (get_local $0)
      (i32.const 0)
     )
     (i32.store8 offset=28
      (get_local $0)
      (i32.const 1)
     )
     (br $break|0)
    )
    (set_local $1
     (call $assembly/ugc/ObjectHeader#get:next
      (i32.load offset=24
       (get_local $0)
      )
     )
    )
    (block
     (set_local $3
      (i32.load8_u offset=29
       (get_local $0)
      )
     )
    )
    (if
     (i32.ne
      (get_local $1)
      (i32.load offset=20
       (get_local $0)
      )
     )
     (block
      (i32.store offset=24
       (get_local $0)
       (get_local $1)
      )
      (call $assembly/ugc/ObjectHeader#set:color
       (get_local $1)
       (i32.and
        (i32.xor
         (get_local $3)
         (i32.const 1)
        )
        (i32.const 255)
       )
      )
      (call $assembly/ugc/gc_scan_fn
       (get_local $0)
       (get_local $1)
      )
     )
     (block
      (call $assembly/ugc/gc_scan_fn
       (get_local $0)
       (i32.const 0)
      )
      (set_local $1
       (call $assembly/ugc/ObjectHeader#get:next
        (i32.load offset=24
         (get_local $0)
        )
       )
      )
      (if
       (i32.eq
        (get_local $1)
        (i32.load offset=20
         (get_local $0)
        )
       )
       (block
        (block
         (set_local $4
          (i32.load offset=16
           (get_local $0)
          )
         )
        )
        (i32.store offset=16
         (get_local $0)
         (i32.load offset=20
          (get_local $0)
         )
        )
        (i32.store offset=20
         (get_local $0)
         (get_local $4)
        )
        (i32.store8 offset=29
         (get_local $0)
         (i32.and
          (i32.xor
           (get_local $3)
           (i32.const 1)
          )
          (i32.const 255)
         )
        )
        (i32.store offset=24
         (get_local $0)
         (i32.load
          (get_local $4)
         )
        )
        (i32.store8 offset=28
         (get_local $0)
         (i32.const 2)
        )
       )
      )
     )
    )
    (br $break|0)
   )
   (set_local $1
    (i32.load offset=24
     (get_local $0)
    )
   )
   (if
    (i32.ne
     (get_local $1)
     (i32.load offset=20
      (get_local $0)
     )
    )
    (block
     (i32.store offset=24
      (get_local $0)
      (call $assembly/ugc/ObjectHeader#get:next
       (get_local $1)
      )
     )
     (call $assembly/ugc/gc_free_fn
      (get_local $0)
      (get_local $1)
     )
    )
    (block
     (call $assembly/ugc/ObjectHeader#clear
      (i32.load offset=20
       (get_local $0)
      )
     )
     (i32.store8 offset=28
      (get_local $0)
      (i32.const 0)
     )
    )
   )
   (br $break|0)
  )
 )
 (func $assembly/ugc/Control#collect (; 14 ;) (type $iv) (param $0 i32)
  (if
   (i32.eq
    (i32.load8_u offset=28
     (get_local $0)
    )
    (i32.const 0)
   )
   (call $assembly/ugc/Control#step
    (get_local $0)
   )
  )
  (block $break|0
   (loop $continue|0
    (if
     (i32.ne
      (i32.load8_u offset=28
       (get_local $0)
      )
      (i32.const 0)
     )
     (block
      (call $assembly/ugc/Control#step
       (get_local $0)
      )
      (br $continue|0)
     )
    )
   )
  )
 )
 (func $assembly/ugc/gc_collect (; 15 ;) (type $v)
  (local $0 i32)
  (block
   (set_local $0
    (call $assembly/ugc/Control#get:paused
     (get_global $assembly/ugc/GC)
    )
   )
  )
  (call $assembly/ugc/Control#set:paused
   (get_global $assembly/ugc/GC)
   (i32.const 0)
  )
  (call $assembly/ugc/Control#collect
   (get_global $assembly/ugc/GC)
  )
  (call $assembly/ugc/Control#set:paused
   (get_global $assembly/ugc/GC)
   (get_local $0)
  )
 )
 (func $start (; 16 ;) (type $v)
  (set_global $assembly/ugc/GC
   (call $assembly/ugc/Control.create
    (get_global $HEAP_BASE)
   )
  )
 )
)
