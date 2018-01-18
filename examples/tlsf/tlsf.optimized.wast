(module
 (type $iiiv (func (param i32 i32 i32)))
 (type $iiiiv (func (param i32 i32 i32 i32)))
 (type $iii (func (param i32 i32) (result i32)))
 (type $iiv (func (param i32 i32)))
 (type $iv (func (param i32)))
 (type $ii (func (param i32) (result i32)))
 (type $iiii (func (param i32 i32 i32) (result i32)))
 (type $v (func))
 (global $assembly/tlsf/fl_out (mut i32) (i32.const 0))
 (global $assembly/tlsf/sl_out (mut i32) (i32.const 0))
 (global $assembly/tlsf/TLSF (mut i32) (i32.const 0))
 (global $HEAP_BASE i32 (i32.const 4))
 (memory $0 1)
 (export "allocate_memory" (func $assembly/tlsf/allocate_memory))
 (export "free_memory" (func $assembly/tlsf/free_memory))
 (export "memory" (memory $0))
 (start $start)
 (func $assembly/tlsf/mapping_insert (; 0 ;) (type $iv) (param $0 i32)
  (local $1 i32)
  (set_global $assembly/tlsf/fl_out
   (if (result i32)
    (i32.lt_u
     (get_local $0)
     (i32.const 128)
    )
    (block (result i32)
     (set_local $0
      (i32.div_s
       (get_local $0)
       (i32.const 4)
      )
     )
     (i32.const 0)
    )
    (block (result i32)
     (set_local $0
      (i32.xor
       (i32.shr_s
        (get_local $0)
        (i32.sub
         (tee_local $1
          (i32.sub
           (i32.const 31)
           (i32.clz
            (get_local $0)
           )
          )
         )
         (i32.const 5)
        )
       )
       (i32.const 32)
      )
     )
     (i32.sub
      (get_local $1)
      (i32.const 6)
     )
    )
   )
  )
  (set_global $assembly/tlsf/sl_out
   (get_local $0)
  )
 )
 (func $assembly/tlsf/Control#insertFreeBlock (; 1 ;) (type $iiiiv) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (i32.store offset=8
   (get_local $1)
   (tee_local $4
    (i32.load
     (i32.add
      (i32.add
       (tee_local $4
        (get_local $0)
       )
       (i32.const 116)
      )
      (i32.mul
       (i32.add
        (i32.mul
         (get_local $2)
         (i32.const 32)
        )
        (get_local $3)
       )
       (i32.const 4)
      )
     )
    )
   )
  )
  (i32.store offset=12
   (get_local $1)
   (get_local $0)
  )
  (i32.store offset=12
   (get_local $4)
   (get_local $1)
  )
  (i32.store
   (i32.add
    (i32.add
     (tee_local $4
      (get_local $0)
     )
     (i32.const 116)
    )
    (i32.mul
     (i32.add
      (i32.mul
       (get_local $2)
       (i32.const 32)
      )
      (get_local $3)
     )
     (i32.const 4)
    )
   )
   (get_local $1)
  )
  (i32.store offset=16
   (get_local $0)
   (i32.or
    (i32.load offset=16
     (get_local $0)
    )
    (i32.shl
     (i32.const 1)
     (get_local $2)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (tee_local $1
      (get_local $0)
     )
     (i32.const 20)
    )
    (i32.mul
     (tee_local $4
      (get_local $2)
     )
     (i32.const 4)
    )
   )
   (tee_local $0
    (i32.or
     (i32.load
      (i32.add
       (i32.add
        (get_local $0)
        (i32.const 20)
       )
       (i32.mul
        (get_local $2)
        (i32.const 4)
       )
      )
     )
     (i32.shl
      (i32.const 1)
      (get_local $3)
     )
    )
   )
  )
 )
 (func $assembly/tlsf/Control#insertBlock (; 2 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (call $assembly/tlsf/mapping_insert
   (i32.and
    (i32.load offset=4
     (get_local $1)
    )
    (i32.const -4)
   )
  )
  (call $assembly/tlsf/Control#insertFreeBlock
   (get_local $0)
   (get_local $1)
   (get_global $assembly/tlsf/fl_out)
   (get_global $assembly/tlsf/sl_out)
  )
 )
 (func $assembly/tlsf/BlockHeader#get:next (; 3 ;) (type $ii) (param $0 i32) (result i32)
  (i32.add
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
   (tee_local $0
    (i32.sub
     (i32.and
      (i32.load offset=4
       (get_local $0)
      )
      (i32.const -4)
     )
     (i32.const 4)
    )
   )
  )
 )
 (func $assembly/tlsf/BlockHeader#linkNext (; 4 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (i32.store
   (tee_local $1
    (call $assembly/tlsf/BlockHeader#get:next
     (get_local $0)
    )
   )
   (get_local $0)
  )
  (get_local $1)
 )
 (func $assembly/tlsf/Control#addPool (; 5 ;) (type $iiiv) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (set_local $2
   (i32.sub
    (tee_local $2
     (i32.sub
      (get_local $2)
      (i32.const 8)
     )
    )
    (i32.and
     (get_local $2)
     (i32.const 3)
    )
   )
  )
  (if
   (i32.rem_u
    (get_local $1)
    (i32.const 4)
   )
   (unreachable)
  )
  (if
   (i32.and
    (if (result i32)
     (i32.lt_u
      (get_local $2)
      (i32.const 12)
     )
     (i32.lt_u
      (get_local $2)
      (i32.const 12)
     )
     (i32.gt_u
      (get_local $2)
      (i32.const 1073741824)
     )
    )
    (i32.const 1)
   )
   (unreachable)
  )
  (i32.store offset=4
   (tee_local $3
    (tee_local $1
     (i32.add
      (get_local $1)
      (i32.const -4)
     )
    )
   )
   (i32.or
    (get_local $2)
    (i32.and
     (i32.load offset=4
      (get_local $3)
     )
     (i32.const 3)
    )
   )
  )
  (i32.store offset=4
   (tee_local $2
    (get_local $1)
   )
   (i32.or
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const 1)
   )
  )
  (i32.store offset=4
   (tee_local $2
    (get_local $1)
   )
   (i32.and
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const -3)
   )
  )
  (call $assembly/tlsf/Control#insertBlock
   (get_local $0)
   (get_local $1)
  )
  (i32.store offset=4
   (tee_local $1
    (tee_local $0
     (call $assembly/tlsf/BlockHeader#linkNext
      (get_local $1)
     )
    )
   )
   (i32.or
    (i32.const 0)
    (i32.and
     (i32.load offset=4
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
   (i32.and
    (i32.load offset=4
     (get_local $1)
    )
    (i32.const -2)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (i32.or
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 2)
   )
  )
 )
 (func $assembly/tlsf/Control.create (; 6 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (if
   (i32.rem_u
    (get_local $0)
    (i32.const 4)
   )
   (unreachable)
  )
  (i32.store offset=8
   (get_local $0)
   (get_local $0)
  )
  (i32.store offset=12
   (get_local $0)
   (get_local $0)
  )
  (i32.store offset=16
   (get_local $0)
   (i32.const 0)
  )
  (loop $continue|0
   (if
    (i32.lt_u
     (get_local $3)
     (i32.const 24)
    )
    (block
     (i32.store
      (i32.add
       (i32.add
        (tee_local $2
         (get_local $0)
        )
        (i32.const 20)
       )
       (i32.mul
        (get_local $3)
        (i32.const 4)
       )
      )
      (i32.const 0)
     )
     (set_local $2
      (i32.const 0)
     )
     (loop $continue|1
      (if
       (i32.lt_u
        (get_local $2)
        (i32.const 32)
       )
       (block
        (i32.store
         (i32.add
          (i32.add
           (get_local $0)
           (i32.const 116)
          )
          (i32.mul
           (i32.add
            (i32.mul
             (get_local $3)
             (i32.const 32)
            )
            (get_local $2)
           )
           (i32.const 4)
          )
         )
         (get_local $0)
        )
        (set_local $2
         (i32.add
          (get_local $2)
          (i32.const 1)
         )
        )
        (br $continue|1)
       )
      )
     )
     (set_local $3
      (i32.add
       (get_local $3)
       (i32.const 1)
      )
     )
     (br $continue|0)
    )
   )
  )
  (call $assembly/tlsf/Control#addPool
   (get_local $0)
   (i32.add
    (get_local $0)
    (i32.const 3188)
   )
   (i32.sub
    (get_local $1)
    (i32.const 3188)
   )
  )
  (get_local $0)
 )
 (func $assembly/tlsf/adjust_request_size (; 7 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (if
   (if (result i32)
    (get_local $0)
    (i32.lt_u
     (get_local $0)
     (i32.const 1073741824)
    )
    (get_local $0)
   )
   (set_local $2
    (select
     (tee_local $0
      (i32.and
       (i32.add
        (get_local $0)
        (i32.sub
         (get_local $1)
         (i32.const 1)
        )
       )
       (i32.xor
        (i32.sub
         (get_local $1)
         (i32.const 1)
        )
        (i32.const -1)
       )
      )
     )
     (i32.const 12)
     (i32.gt_u
      (get_local $0)
      (i32.const 12)
     )
    )
   )
  )
  (get_local $2)
 )
 (func $assembly/tlsf/mapping_search (; 8 ;) (type $iv) (param $0 i32)
  (if
   (i32.ge_u
    (get_local $0)
    (i32.const 128)
   )
   (set_local $0
    (i32.add
     (get_local $0)
     (i32.sub
      (i32.shl
       (i32.const 1)
       (i32.sub
        (i32.sub
         (i32.const 31)
         (i32.clz
          (get_local $0)
         )
        )
        (i32.const 5)
       )
      )
      (i32.const 1)
     )
    )
   )
  )
  (call $assembly/tlsf/mapping_insert
   (get_local $0)
  )
 )
 (func $assembly/tlsf/find_suitable_block (; 9 ;) (type $iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (if
   (i32.eqz
    (tee_local $2
     (i32.and
      (i32.load
       (i32.add
        (i32.add
         (get_local $0)
         (i32.const 20)
        )
        (i32.mul
         (get_local $1)
         (i32.const 4)
        )
       )
      )
      (i32.shl
       (i32.const -1)
       (get_local $2)
      )
     )
    )
   )
   (block
    (if
     (i32.eqz
      (tee_local $1
       (i32.and
        (i32.load offset=16
         (get_local $0)
        )
        (i32.shl
         (i32.const -1)
         (i32.add
          (get_local $1)
          (i32.const 1)
         )
        )
       )
      )
     )
     (return
      (i32.const 0)
     )
    )
    (set_global $assembly/tlsf/fl_out
     (tee_local $1
      (i32.ctz
       (get_local $1)
      )
     )
    )
    (set_local $2
     (i32.load
      (i32.add
       (i32.add
        (tee_local $2
         (get_local $0)
        )
        (i32.const 20)
       )
       (i32.mul
        (get_local $1)
        (i32.const 4)
       )
      )
     )
    )
   )
  )
  (set_global $assembly/tlsf/sl_out
   (tee_local $2
    (i32.ctz
     (get_local $2)
    )
   )
  )
  (i32.load
   (i32.add
    (i32.add
     (get_local $0)
     (i32.const 116)
    )
    (i32.mul
     (i32.add
      (i32.mul
       (get_local $1)
       (i32.const 32)
      )
      (get_local $2)
     )
     (i32.const 4)
    )
   )
  )
 )
 (func $assembly/tlsf/Control#removeFreeBlock (; 10 ;) (type $iiiiv) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (i32.store offset=12
   (tee_local $4
    (i32.load offset=8
     (get_local $1)
    )
   )
   (tee_local $5
    (i32.load offset=12
     (get_local $1)
    )
   )
  )
  (i32.store offset=8
   (get_local $5)
   (get_local $4)
  )
  (if
   (i32.eq
    (i32.load
     (i32.add
      (i32.add
       (tee_local $5
        (get_local $0)
       )
       (i32.const 116)
      )
      (i32.mul
       (i32.add
        (i32.mul
         (get_local $2)
         (i32.const 32)
        )
        (get_local $3)
       )
       (i32.const 4)
      )
     )
    )
    (get_local $1)
   )
   (block
    (i32.store
     (i32.add
      (i32.add
       (tee_local $1
        (get_local $0)
       )
       (i32.const 116)
      )
      (i32.mul
       (i32.add
        (i32.mul
         (tee_local $5
          (get_local $2)
         )
         (i32.const 32)
        )
        (get_local $3)
       )
       (i32.const 4)
      )
     )
     (get_local $4)
    )
    (if
     (i32.eq
      (get_local $4)
      (get_local $0)
     )
     (block
      (i32.store
       (i32.add
        (i32.add
         (tee_local $5
          (get_local $0)
         )
         (i32.const 20)
        )
        (i32.mul
         (get_local $2)
         (i32.const 4)
        )
       )
       (tee_local $1
        (i32.and
         (i32.load
          (i32.add
           (i32.add
            (tee_local $1
             (get_local $0)
            )
            (i32.const 20)
           )
           (i32.mul
            (tee_local $4
             (get_local $2)
            )
            (i32.const 4)
           )
          )
         )
         (i32.xor
          (i32.shl
           (i32.const 1)
           (get_local $3)
          )
          (i32.const -1)
         )
        )
       )
      )
      (if
       (i32.eqz
        (i32.load
         (i32.add
          (i32.add
           (tee_local $1
            (get_local $0)
           )
           (i32.const 20)
          )
          (i32.mul
           (tee_local $3
            (get_local $2)
           )
           (i32.const 4)
          )
         )
        )
       )
       (i32.store offset=16
        (get_local $0)
        (i32.and
         (i32.load offset=16
          (get_local $0)
         )
         (i32.xor
          (i32.shl
           (i32.const 1)
           (get_local $2)
          )
          (i32.const -1)
         )
        )
       )
      )
     )
    )
   )
  )
 )
 (func $assembly/tlsf/Control#locateFreeBlock (; 11 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (if
   (get_local $1)
   (block
    (call $assembly/tlsf/mapping_search
     (get_local $1)
    )
    (if
     (i32.lt_s
      (get_global $assembly/tlsf/fl_out)
      (i32.const 30)
     )
     (set_local $2
      (call $assembly/tlsf/find_suitable_block
       (get_local $0)
       (get_global $assembly/tlsf/fl_out)
       (get_global $assembly/tlsf/sl_out)
      )
     )
    )
   )
  )
  (if
   (get_local $2)
   (call $assembly/tlsf/Control#removeFreeBlock
    (get_local $0)
    (get_local $2)
    (get_global $assembly/tlsf/fl_out)
    (get_global $assembly/tlsf/sl_out)
   )
  )
  (get_local $2)
 )
 (func $assembly/tlsf/request_memory (; 12 ;) (type $iv) (param $0 i32)
  (local $1 i32)
  (if
   (i32.and
    (get_local $0)
    (i32.const 65535)
   )
   (set_local $0
    (i32.add
     (i32.or
      (get_local $0)
      (i32.const 65535)
     )
     (i32.const 1)
    )
   )
  )
  (if
   (i32.lt_s
    (tee_local $0
     (grow_memory
      (select
       (tee_local $1
        (current_memory)
       )
       (tee_local $0
        (i32.shr_u
         (get_local $0)
         (i32.const 16)
        )
       )
       (i32.gt_u
        (get_local $1)
        (get_local $0)
       )
      )
     )
    )
    (i32.const 0)
   )
   (unreachable)
  )
  (set_local $1
   (current_memory)
  )
  (call $assembly/tlsf/Control#addPool
   (get_global $assembly/tlsf/TLSF)
   (i32.shl
    (get_local $0)
    (i32.const 16)
   )
   (i32.shl
    (i32.sub
     (get_local $1)
     (get_local $0)
    )
    (i32.const 16)
   )
  )
 )
 (func $assembly/tlsf/BlockHeader#markAsFree (; 13 ;) (type $iv) (param $0 i32)
  (local $1 i32)
  (i32.store offset=4
   (tee_local $1
    (call $assembly/tlsf/BlockHeader#linkNext
     (get_local $0)
    )
   )
   (i32.or
    (i32.load offset=4
     (get_local $1)
    )
    (i32.const 2)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (i32.or
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 1)
   )
  )
 )
 (func $assembly/tlsf/BlockHeader#split (; 14 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store offset=4
   (tee_local $3
    (tee_local $2
     (i32.add
      (i32.add
       (get_local $0)
       (i32.const 8)
      )
      (tee_local $2
       (i32.sub
        (get_local $1)
        (i32.const 4)
       )
      )
     )
    )
   )
   (i32.or
    (i32.sub
     (i32.and
      (i32.load offset=4
       (get_local $0)
      )
      (i32.const -4)
     )
     (i32.add
      (get_local $1)
      (i32.const 4)
     )
    )
    (i32.and
     (i32.load offset=4
      (get_local $3)
     )
     (i32.const 3)
    )
   )
  )
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
  (call $assembly/tlsf/BlockHeader#markAsFree
   (get_local $2)
  )
  (get_local $2)
 )
 (func $assembly/tlsf/Control#trimFreeBlock (; 15 ;) (type $iiiv) (param $0 i32) (param $1 i32) (param $2 i32)
  (if
   (i32.ge_u
    (i32.and
     (i32.load offset=4
      (get_local $1)
     )
     (i32.const -4)
    )
    (i32.add
     (get_local $2)
     (i32.const 16)
    )
   )
   (block
    (set_local $2
     (call $assembly/tlsf/BlockHeader#split
      (get_local $1)
      (get_local $2)
     )
    )
    (drop
     (call $assembly/tlsf/BlockHeader#linkNext
      (get_local $1)
     )
    )
    (i32.store offset=4
     (tee_local $1
      (get_local $2)
     )
     (i32.or
      (i32.load offset=4
       (get_local $1)
      )
      (i32.const 2)
     )
    )
    (call $assembly/tlsf/Control#insertBlock
     (get_local $0)
     (get_local $2)
    )
   )
  )
 )
 (func $assembly/tlsf/allocate_memory (; 16 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (if
   (i32.eqz
    (get_global $assembly/tlsf/TLSF)
   )
   (set_global $assembly/tlsf/TLSF
    (call $assembly/tlsf/Control.create
     (get_global $HEAP_BASE)
     (i32.sub
      (i32.shl
       (current_memory)
       (i32.const 16)
      )
      (get_global $HEAP_BASE)
     )
    )
   )
  )
  (if
   (i32.and
    (if (result i32)
     (tee_local $1
      (call $assembly/tlsf/Control#locateFreeBlock
       (tee_local $3
        (get_global $assembly/tlsf/TLSF)
       )
       (tee_local $2
        (call $assembly/tlsf/adjust_request_size
         (get_local $0)
         (i32.const 4)
        )
       )
      )
     )
     (i32.eqz
      (get_local $1)
     )
     (i32.gt_u
      (get_local $0)
      (i32.const 0)
     )
    )
    (i32.const 1)
   )
   (block
    (call $assembly/tlsf/request_memory
     (get_local $2)
    )
    (set_local $1
     (call $assembly/tlsf/Control#locateFreeBlock
      (get_local $3)
      (get_local $2)
     )
    )
   )
  )
  (set_local $0
   (i32.const 0)
  )
  (if
   (get_local $1)
   (block
    (call $assembly/tlsf/Control#trimFreeBlock
     (get_local $3)
     (get_local $1)
     (get_local $2)
    )
    (i32.store offset=4
     (tee_local $2
      (call $assembly/tlsf/BlockHeader#get:next
       (tee_local $0
        (get_local $1)
       )
      )
     )
     (i32.and
      (i32.load offset=4
       (get_local $2)
      )
      (i32.const -3)
     )
    )
    (i32.store offset=4
     (get_local $0)
     (i32.and
      (i32.load offset=4
       (get_local $0)
      )
      (i32.const -2)
     )
    )
    (set_local $0
     (i32.add
      (get_local $1)
      (i32.const 8)
     )
    )
   )
  )
  (get_local $0)
 )
 (func $assembly/tlsf/Control#removeBlock (; 17 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (call $assembly/tlsf/mapping_insert
   (i32.and
    (i32.load offset=4
     (get_local $1)
    )
    (i32.const -4)
   )
  )
  (call $assembly/tlsf/Control#removeFreeBlock
   (get_local $0)
   (get_local $1)
   (get_global $assembly/tlsf/fl_out)
   (get_global $assembly/tlsf/sl_out)
  )
 )
 (func $assembly/tlsf/BlockHeader#absorb (; 18 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (i32.store offset=4
   (get_local $0)
   (i32.add
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (i32.and
      (i32.load offset=4
       (get_local $1)
      )
      (i32.const -4)
     )
     (i32.const 4)
    )
   )
  )
  (drop
   (call $assembly/tlsf/BlockHeader#linkNext
    (get_local $0)
   )
  )
 )
 (func $assembly/tlsf/Control#mergePrevBlock (; 19 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (if
   (i32.ne
    (i32.and
     (i32.load offset=4
      (get_local $1)
     )
     (i32.const 2)
    )
    (i32.const 0)
   )
   (block
    (call $assembly/tlsf/Control#removeBlock
     (get_local $0)
     (tee_local $0
      (i32.load
       (tee_local $0
        (get_local $1)
       )
      )
     )
    )
    (call $assembly/tlsf/BlockHeader#absorb
     (get_local $0)
     (get_local $1)
    )
    (set_local $1
     (get_local $0)
    )
   )
  )
  (get_local $1)
 )
 (func $assembly/tlsf/free_memory (; 20 ;) (type $iv) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (if
   (if (result i32)
    (get_global $assembly/tlsf/TLSF)
    (get_local $0)
    (get_global $assembly/tlsf/TLSF)
   )
   (block
    (set_local $1
     (get_global $assembly/tlsf/TLSF)
    )
    (call $assembly/tlsf/BlockHeader#markAsFree
     (tee_local $0
      (i32.sub
       (get_local $0)
       (i32.const 8)
      )
     )
    )
    (call $assembly/tlsf/Control#insertBlock
     (get_local $1)
     (block (result i32)
      (set_local $2
       (get_local $1)
      )
      (if
       (i32.ne
        (i32.and
         (i32.load offset=4
          (tee_local $0
           (call $assembly/tlsf/BlockHeader#get:next
            (tee_local $1
             (call $assembly/tlsf/Control#mergePrevBlock
              (get_local $1)
              (get_local $0)
             )
            )
           )
          )
         )
         (i32.const 1)
        )
        (i32.const 0)
       )
       (block
        (call $assembly/tlsf/Control#removeBlock
         (get_local $2)
         (get_local $0)
        )
        (call $assembly/tlsf/BlockHeader#absorb
         (get_local $1)
         (get_local $0)
        )
       )
      )
      (get_local $1)
     )
    )
   )
  )
 )
 (func $start (; 21 ;) (type $v)
  (nop)
 )
)
