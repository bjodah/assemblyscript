(module
 (type $iiv (func (param i32 i32)))
 (type $iv (func (param i32)))
 (type $ii (func (param i32) (result i32)))
 (type $v (func))
 (global $assembly/ugc/GC (mut i32) (i32.const 0))
 (global $HEAP_BASE i32 (i32.const 4))
 (memory $0 1)
 (export "gc_pause" (func $assembly/ugc/gc_pause))
 (export "gc_resume" (func $assembly/ugc/gc_resume))
 (export "gc_collect" (func $assembly/ugc/gc_collect))
 (export "memory" (memory $0))
 (start $start)
 (func $assembly/ugc/ObjectHeader#clear (; 0 ;) (type $iv) (param $0 i32)
  (local $1 i32)
  (i32.store
   (tee_local $1
    (get_local $0)
   )
   (i32.or
    (get_local $0)
    (i32.and
     (i32.load
      (get_local $1)
     )
     (i32.const 3)
    )
   )
  )
  (i32.store offset=4
   (tee_local $1
    (get_local $0)
   )
   (i32.or
    (get_local $0)
    (i32.and
     (i32.load offset=4
      (get_local $1)
     )
     (i32.const 3)
    )
   )
  )
 )
 (func $assembly/ugc/Control.create (; 1 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (call $assembly/ugc/ObjectHeader#clear
   (get_local $0)
  )
  (call $assembly/ugc/ObjectHeader#clear
   (tee_local $2
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
   )
  )
  (i32.store8 offset=28
   (tee_local $1
    (get_local $0)
   )
   (i32.const 0)
  )
  (i32.store8 offset=29
   (get_local $1)
   (i32.const 0)
  )
  (i32.store offset=16
   (get_local $1)
   (get_local $0)
  )
  (i32.store offset=20
   (get_local $1)
   (get_local $2)
  )
  (i32.store offset=24
   (get_local $1)
   (i32.load offset=20
    (get_local $1)
   )
  )
  (get_local $1)
 )
 (func $assembly/ugc/Control#set:paused (; 2 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (i32.store8 offset=28
   (get_local $0)
   (if (result i32)
    (get_local $1)
    (block (result i32)
     (i32.store8 offset=28
      (get_local $0)
      (tee_local $2
       (i32.or
        (i32.load8_u offset=28
         (get_local $0)
        )
        (i32.const 128)
       )
      )
     )
     (get_local $2)
    )
    (block (result i32)
     (i32.store8 offset=28
      (get_local $0)
      (tee_local $2
       (i32.and
        (i32.load8_u offset=28
         (get_local $0)
        )
        (i32.const -129)
       )
      )
     )
     (get_local $2)
    )
   )
  )
 )
 (func $assembly/ugc/gc_pause (; 3 ;) (type $v)
  (call $assembly/ugc/Control#set:paused
   (get_global $assembly/ugc/GC)
   (i32.const 1)
  )
 )
 (func $assembly/ugc/gc_resume (; 4 ;) (type $v)
  (call $assembly/ugc/Control#set:paused
   (get_global $assembly/ugc/GC)
   (i32.const 0)
  )
 )
 (func $assembly/ugc/Control#step (; 5 ;) (type $iv) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (block $break|0
   (block $case2|0
    (block $case1|0
     (block $case0|0
      (block $tablify|0
       (br_table $case0|0 $case1|0 $case2|0 $tablify|0
        (i32.load8_u offset=28
         (get_local $0)
        )
       )
      )
      (br $break|0)
     )
     (i32.store8 offset=28
      (get_local $0)
      (i32.const 1)
     )
     (br $break|0)
    )
    (set_local $2
     (i32.load8_u offset=29
      (get_local $0)
     )
    )
    (if
     (i32.ne
      (tee_local $1
       (i32.and
        (i32.load
         (i32.load offset=24
          (get_local $0)
         )
        )
        (i32.const -4)
       )
      )
      (i32.load offset=20
       (get_local $0)
      )
     )
     (block
      (i32.store offset=24
       (get_local $0)
       (get_local $1)
      )
      (i32.store
       (tee_local $0
        (get_local $1)
       )
       (i32.or
        (i32.load
         (get_local $0)
        )
        (i32.xor
         (get_local $2)
         (i32.const 1)
        )
       )
      )
      (if
       (get_local $1)
       (drop
        (i32.load
         (i32.add
          (get_local $1)
          (i32.const 8)
         )
        )
       )
      )
     )
     (if
      (i32.eq
       (i32.and
        (i32.load
         (i32.load offset=24
          (get_local $0)
         )
        )
        (i32.const -4)
       )
       (i32.load offset=20
        (get_local $0)
       )
      )
      (block
       (set_local $1
        (i32.load offset=16
         (get_local $0)
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
        (get_local $1)
       )
       (i32.store8 offset=29
        (get_local $0)
        (i32.xor
         (get_local $2)
         (i32.const 1)
        )
       )
       (i32.store offset=24
        (get_local $0)
        (i32.load
         (get_local $1)
        )
       )
       (i32.store8 offset=28
        (get_local $0)
        (i32.const 2)
       )
      )
     )
    )
    (br $break|0)
   )
   (if
    (i32.ne
     (tee_local $1
      (i32.load offset=24
       (get_local $0)
      )
     )
     (i32.load offset=20
      (get_local $0)
     )
    )
    (block
     (i32.store offset=24
      (get_local $0)
      (i32.and
       (i32.load
        (get_local $1)
       )
       (i32.const -4)
      )
     )
     (drop
      (i32.load
       (i32.add
        (get_local $1)
        (i32.const 8)
       )
      )
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
  )
 )
 (func $assembly/ugc/gc_collect (; 6 ;) (type $v)
  (local $0 i32)
  (local $1 i32)
  (set_local $1
   (i32.ne
    (i32.and
     (i32.load8_u offset=28
      (tee_local $1
       (get_global $assembly/ugc/GC)
      )
     )
     (i32.const 128)
    )
    (i32.const 0)
   )
  )
  (call $assembly/ugc/Control#set:paused
   (get_global $assembly/ugc/GC)
   (i32.const 0)
  )
  (if
   (i32.eqz
    (i32.load8_u offset=28
     (tee_local $0
      (get_global $assembly/ugc/GC)
     )
    )
   )
   (call $assembly/ugc/Control#step
    (get_local $0)
   )
  )
  (loop $continue|0
   (if
    (i32.load8_u offset=28
     (get_local $0)
    )
    (block
     (call $assembly/ugc/Control#step
      (get_local $0)
     )
     (br $continue|0)
    )
   )
  )
  (call $assembly/ugc/Control#set:paused
   (get_global $assembly/ugc/GC)
   (get_local $1)
  )
 )
 (func $start (; 7 ;) (type $v)
  (set_global $assembly/ugc/GC
   (call $assembly/ugc/Control.create
    (get_global $HEAP_BASE)
   )
  )
 )
)
