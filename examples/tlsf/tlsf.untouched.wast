(module
 (type $i (func (result i32)))
 (type $iiiv (func (param i32 i32 i32)))
 (type $iiiiv (func (param i32 i32 i32 i32)))
 (type $iii (func (param i32 i32) (result i32)))
 (type $iiv (func (param i32 i32)))
 (type $iv (func (param i32)))
 (type $ii (func (param i32) (result i32)))
 (type $iiii (func (param i32 i32 i32) (result i32)))
 (type $Ii (func (param i64) (result i32)))
 (type $v (func))
 (global $assembly/tlsf/SL_INDEX_COUNT_LOG2 i32 (i32.const 5))
 (global $assembly/tlsf/ALIGN_SIZE_LOG2 i32 (i32.const 2))
 (global $assembly/tlsf/ALIGN_SIZE i32 (i32.const 4))
 (global $assembly/tlsf/FL_INDEX_MAX i32 (i32.const 30))
 (global $assembly/tlsf/SL_INDEX_COUNT i32 (i32.const 32))
 (global $assembly/tlsf/FL_INDEX_SHIFT i32 (i32.const 7))
 (global $assembly/tlsf/FL_INDEX_COUNT i32 (i32.const 24))
 (global $assembly/tlsf/SMALL_BLOCK_SIZE i32 (i32.const 128))
 (global $assembly/tlsf/fl_out (mut i32) (i32.const 0))
 (global $assembly/tlsf/sl_out (mut i32) (i32.const 0))
 (global $assembly/tlsf/TLSF (mut i32) (i32.const 0))
 (global $assembly/tlsf/integrity_prev_status (mut i32) (i32.const 0))
 (global $assembly/tlsf/integrity_status (mut i32) (i32.const 0))
 (global $HEAP_BASE i32 (i32.const 4))
 (memory $0 1)
 (export "allocate_memory" (func $assembly/tlsf/allocate_memory))
 (export "free_memory" (func $assembly/tlsf/free_memory))
 (export "memory" (memory $0))
 (start $start)
 (func $assembly/tlsf/Control#sl_bitmap_set (; 0 ;) (type $iiiv) (param $0 i32) (param $1 i32) (param $2 i32)
  (nop)
  (return
   (i32.store
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
    (get_local $2)
   )
  )
 )
 (func $assembly/tlsf/Control#blocks_set (; 1 ;) (type $iiiiv) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (nop)
  (return
   (i32.store
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
    (get_local $3)
   )
  )
 )
 (func $assembly/tlsf/align_down (; 2 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (if
   (i32.eqz
    (i32.eqz
     (i32.and
      (get_local $1)
      (i32.sub
       (get_local $1)
       (i32.const 1)
      )
     )
    )
   )
   (unreachable)
  )
  (return
   (i32.sub
    (get_local $0)
    (i32.and
     (get_local $0)
     (i32.sub
      (get_local $1)
      (i32.const 1)
     )
    )
   )
  )
 )
 (func $assembly/tlsf/BlockHeader.fromOffset (; 3 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (return
   (i32.add
    (get_local $0)
    (get_local $1)
   )
  )
 )
 (func $assembly/tlsf/BlockHeader#set:size (; 4 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (nop)
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
 (func $assembly/tlsf/BlockHeader#tagAsFree (; 5 ;) (type $iv) (param $0 i32)
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
 (func $assembly/tlsf/BlockHeader#tagAsPrevUsed (; 6 ;) (type $iv) (param $0 i32)
  (i32.store offset=4
   (get_local $0)
   (i32.and
    (i32.load offset=4
     (get_local $0)
    )
    (i32.xor
     (i32.const 2)
     (i32.const -1)
    )
   )
  )
 )
 (func $assembly/tlsf/BlockHeader#get:size (; 7 ;) (type $ii) (param $0 i32) (result i32)
  (nop)
  (return
   (i32.and
    (i32.load offset=4
     (get_local $0)
    )
    (i32.xor
     (i32.const 3)
     (i32.const -1)
    )
   )
  )
 )
 (func $assembly/tlsf/fls<usize> (; 8 ;) (type $ii) (param $0 i32) (result i32)
  (return
   (i32.sub
    (i32.sub
     (i32.shl
      (i32.const 4)
      (i32.const 3)
     )
     (i32.const 1)
    )
    (i32.clz
     (get_local $0)
    )
   )
  )
 )
 (func $assembly/tlsf/mapping_insert (; 9 ;) (type $iv) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (nop)
  (if
   (i32.lt_u
    (get_local $0)
    (i32.const 128)
   )
   (block
    (set_local $1
     (i32.const 0)
    )
    (set_local $2
     (i32.div_s
      (get_local $0)
      (i32.div_u
       (i32.const 128)
       (i32.const 32)
      )
     )
    )
   )
   (block
    (set_local $1
     (call $assembly/tlsf/fls<usize>
      (get_local $0)
     )
    )
    (set_local $2
     (i32.xor
      (i32.shr_s
       (get_local $0)
       (i32.sub
        (get_local $1)
        (i32.const 5)
       )
      )
      (i32.shl
       (i32.const 1)
       (i32.const 5)
      )
     )
    )
    (set_local $1
     (i32.sub
      (get_local $1)
      (i32.sub
       (i32.const 7)
       (i32.const 1)
      )
     )
    )
   )
  )
  (set_global $assembly/tlsf/fl_out
   (get_local $1)
  )
  (set_global $assembly/tlsf/sl_out
   (get_local $2)
  )
 )
 (func $assembly/tlsf/Control#blocks (; 10 ;) (type $iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (nop)
  (return
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
 )
 (func $assembly/tlsf/BlockHeader#toDataPtr (; 11 ;) (type $ii) (param $0 i32) (result i32)
  (return
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
 )
 (func $assembly/tlsf/align_ptr (; 12 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (block
   (set_local $2
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
  )
  (if
   (i32.eqz
    (i32.eqz
     (i32.and
      (get_local $1)
      (i32.sub
       (get_local $1)
       (i32.const 1)
      )
     )
    )
   )
   (unreachable)
  )
  (return
   (get_local $2)
  )
 )
 (func $assembly/tlsf/Control#sl_bitmap (; 13 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (nop)
  (return
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
  )
 )
 (func $assembly/tlsf/Control#insertFreeBlock (; 14 ;) (type $iiiiv) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (block
   (set_local $4
    (call $assembly/tlsf/Control#blocks
     (get_local $0)
     (get_local $2)
     (get_local $3)
    )
   )
  )
  (if
   (i32.eqz
    (get_local $4)
   )
   (unreachable)
  )
  (if
   (i32.eqz
    (get_local $1)
   )
   (unreachable)
  )
  (i32.store offset=8
   (get_local $1)
   (get_local $4)
  )
  (i32.store offset=12
   (get_local $1)
   (get_local $0)
  )
  (i32.store offset=12
   (get_local $4)
   (get_local $1)
  )
  (if
   (i32.eqz
    (i32.eq
     (call $assembly/tlsf/BlockHeader#toDataPtr
      (get_local $1)
     )
     (call $assembly/tlsf/align_ptr
      (call $assembly/tlsf/BlockHeader#toDataPtr
       (get_local $1)
      )
      (i32.const 4)
     )
    )
   )
   (unreachable)
  )
  (call $assembly/tlsf/Control#blocks_set
   (get_local $0)
   (get_local $2)
   (get_local $3)
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
  (call $assembly/tlsf/Control#sl_bitmap_set
   (get_local $0)
   (get_local $2)
   (i32.or
    (call $assembly/tlsf/Control#sl_bitmap
     (get_local $0)
     (get_local $2)
    )
    (i32.shl
     (i32.const 1)
     (get_local $3)
    )
   )
  )
 )
 (func $assembly/tlsf/Control#insertBlock (; 15 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (call $assembly/tlsf/mapping_insert
   (call $assembly/tlsf/BlockHeader#get:size
    (get_local $1)
   )
  )
  (call $assembly/tlsf/Control#insertFreeBlock
   (get_local $0)
   (get_local $1)
   (get_global $assembly/tlsf/fl_out)
   (get_global $assembly/tlsf/sl_out)
  )
 )
 (func $assembly/tlsf/BlockHeader#get:isLast (; 16 ;) (type $ii) (param $0 i32) (result i32)
  (return
   (i32.eq
    (call $assembly/tlsf/BlockHeader#get:size
     (get_local $0)
    )
    (i32.const 0)
   )
  )
 )
 (func $assembly/tlsf/BlockHeader#get:next (; 17 ;) (type $ii) (param $0 i32) (result i32)
  (if
   (i32.eqz
    (i32.eqz
     (call $assembly/tlsf/BlockHeader#get:isLast
      (get_local $0)
     )
    )
   )
   (unreachable)
  )
  (return
   (call $assembly/tlsf/BlockHeader.fromOffset
    (call $assembly/tlsf/BlockHeader#toDataPtr
     (get_local $0)
    )
    (i32.sub
     (call $assembly/tlsf/BlockHeader#get:size
      (get_local $0)
     )
     (i32.const 4)
    )
   )
  )
 )
 (func $assembly/tlsf/BlockHeader#linkNext (; 18 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (block
   (set_local $1
    (call $assembly/tlsf/BlockHeader#get:next
     (get_local $0)
    )
   )
  )
  (i32.store
   (get_local $1)
   (get_local $0)
  )
  (return
   (get_local $1)
  )
 )
 (func $assembly/tlsf/BlockHeader#tagAsUsed (; 19 ;) (type $iv) (param $0 i32)
  (i32.store offset=4
   (get_local $0)
   (i32.and
    (i32.load offset=4
     (get_local $0)
    )
    (i32.xor
     (i32.const 1)
     (i32.const -1)
    )
   )
  )
 )
 (func $assembly/tlsf/BlockHeader#tagAsPrevFree (; 20 ;) (type $iv) (param $0 i32)
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
 (func $assembly/tlsf/Control#addPool (; 21 ;) (type $iiiv) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (nop)
  (block
   (set_local $3
    (call $assembly/tlsf/align_down
     (i32.sub
      (get_local $2)
      (i32.const 8)
     )
     (i32.const 4)
    )
   )
  )
  (if
   (i32.ne
    (i32.rem_u
     (get_local $1)
     (i32.const 4)
    )
    (i32.const 0)
   )
   (unreachable)
  )
  (if
   (i32.and
    (if (result i32)
     (i32.ne
      (i32.lt_u
       (get_local $3)
       (i32.const 12)
      )
      (i32.const 0)
     )
     (i32.lt_u
      (get_local $3)
      (i32.const 12)
     )
     (i32.gt_u
      (get_local $3)
      (i32.const 1073741824)
     )
    )
    (i32.const 1)
   )
   (unreachable)
  )
  (block
   (set_local $4
    (call $assembly/tlsf/BlockHeader.fromOffset
     (get_local $1)
     (i32.sub
      (i32.const 0)
      (i32.const 4)
     )
    )
   )
  )
  (call $assembly/tlsf/BlockHeader#set:size
   (get_local $4)
   (get_local $3)
  )
  (call $assembly/tlsf/BlockHeader#tagAsFree
   (get_local $4)
  )
  (call $assembly/tlsf/BlockHeader#tagAsPrevUsed
   (get_local $4)
  )
  (call $assembly/tlsf/Control#insertBlock
   (get_local $0)
   (get_local $4)
  )
  (block
   (set_local $5
    (call $assembly/tlsf/BlockHeader#linkNext
     (get_local $4)
    )
   )
  )
  (call $assembly/tlsf/BlockHeader#set:size
   (get_local $5)
   (i32.const 0)
  )
  (call $assembly/tlsf/BlockHeader#tagAsUsed
   (get_local $5)
  )
  (call $assembly/tlsf/BlockHeader#tagAsPrevFree
   (get_local $5)
  )
 )
 (func $assembly/tlsf/Control.create (; 22 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (if
   (i32.ne
    (i32.rem_u
     (get_local $0)
     (i32.const 4)
    )
    (i32.const 0)
   )
   (unreachable)
  )
  (block
   (set_local $2
    (get_local $0)
   )
  )
  (i32.store offset=8
   (get_local $2)
   (get_local $2)
  )
  (i32.store offset=12
   (get_local $2)
   (get_local $2)
  )
  (i32.store offset=16
   (get_local $2)
   (i32.const 0)
  )
  (block $break|0
   (block
    (set_local $3
     (i32.const 0)
    )
   )
   (loop $continue|0
    (if
     (i32.lt_u
      (get_local $3)
      (i32.const 24)
     )
     (block
      (block
       (call $assembly/tlsf/Control#sl_bitmap_set
        (get_local $2)
        (get_local $3)
        (i32.const 0)
       )
       (block $break|1
        (block
         (set_local $4
          (i32.const 0)
         )
        )
        (loop $continue|1
         (if
          (i32.lt_u
           (get_local $4)
           (i32.const 32)
          )
          (block
           (call $assembly/tlsf/Control#blocks_set
            (get_local $2)
            (get_local $3)
            (get_local $4)
            (get_local $2)
           )
           (set_local $4
            (i32.add
             (get_local $4)
             (i32.const 1)
            )
           )
           (br $continue|1)
          )
         )
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
  )
  (call $assembly/tlsf/Control#addPool
   (get_local $2)
   (i32.add
    (get_local $0)
    (i32.const 3188)
   )
   (i32.sub
    (get_local $1)
    (i32.const 3188)
   )
  )
  (return
   (get_local $2)
  )
 )
 (func $assembly/tlsf/align_up (; 23 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (if
   (i32.eqz
    (i32.eqz
     (i32.and
      (get_local $1)
      (i32.sub
       (get_local $1)
       (i32.const 1)
      )
     )
    )
   )
   (unreachable)
  )
  (return
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
 )
 (func $assembly/tlsf/adjust_request_size (; 24 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (block
   (set_local $2
    (i32.const 0)
   )
  )
  (if
   (if (result i32)
    (i32.ne
     (get_local $0)
     (i32.const 0)
    )
    (i32.lt_u
     (get_local $0)
     (i32.const 1073741824)
    )
    (get_local $0)
   )
   (block
    (block
     (set_local $3
      (call $assembly/tlsf/align_up
       (get_local $0)
       (get_local $1)
      )
     )
    )
    (set_local $2
     (select
      (tee_local $4
       (get_local $3)
      )
      (tee_local $5
       (i32.const 12)
      )
      (i32.gt_u
       (get_local $4)
       (get_local $5)
      )
     )
    )
   )
  )
  (return
   (get_local $2)
  )
 )
 (func $assembly/tlsf/mapping_search (; 25 ;) (type $iv) (param $0 i32)
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
        (call $assembly/tlsf/fls<usize>
         (get_local $0)
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
 (func $assembly/tlsf/find_suitable_block (; 26 ;) (type $iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (block
   (set_local $3
    (i32.and
     (call $assembly/tlsf/Control#sl_bitmap
      (get_local $0)
      (get_local $1)
     )
     (i32.shl
      (i32.xor
       (i32.const 0)
       (i32.const -1)
      )
      (get_local $2)
     )
    )
   )
  )
  (if
   (i32.eqz
    (get_local $3)
   )
   (block
    (block
     (set_local $4
      (i32.and
       (i32.load offset=16
        (get_local $0)
       )
       (i32.shl
        (i32.xor
         (i32.const 0)
         (i32.const -1)
        )
        (i32.add
         (get_local $1)
         (i32.const 1)
        )
       )
      )
     )
    )
    (if
     (i32.eqz
      (get_local $4)
     )
     (return
      (i32.const 0)
     )
    )
    (set_local $1
     (i32.ctz
      (get_local $4)
     )
    )
    (set_global $assembly/tlsf/fl_out
     (get_local $1)
    )
    (set_local $3
     (call $assembly/tlsf/Control#sl_bitmap
      (get_local $0)
      (get_local $1)
     )
    )
   )
  )
  (if
   (i32.eqz
    (get_local $3)
   )
   (unreachable)
  )
  (set_local $2
   (i32.ctz
    (get_local $3)
   )
  )
  (set_global $assembly/tlsf/sl_out
   (get_local $2)
  )
  (return
   (call $assembly/tlsf/Control#blocks
    (get_local $0)
    (get_local $1)
    (get_local $2)
   )
  )
 )
 (func $assembly/tlsf/Control#removeFreeBlock (; 27 ;) (type $iiiiv) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (block
   (set_local $4
    (i32.load offset=12
     (get_local $1)
    )
   )
  )
  (block
   (set_local $5
    (i32.load offset=8
     (get_local $1)
    )
   )
  )
  (if
   (i32.eqz
    (get_local $4)
   )
   (unreachable)
  )
  (if
   (i32.eqz
    (get_local $5)
   )
   (unreachable)
  )
  (i32.store offset=12
   (get_local $5)
   (get_local $4)
  )
  (i32.store offset=8
   (get_local $4)
   (get_local $5)
  )
  (if
   (i32.eq
    (call $assembly/tlsf/Control#blocks
     (get_local $0)
     (get_local $2)
     (get_local $3)
    )
    (get_local $1)
   )
   (block
    (call $assembly/tlsf/Control#blocks_set
     (get_local $0)
     (get_local $2)
     (get_local $3)
     (get_local $5)
    )
    (if
     (i32.eq
      (get_local $5)
      (get_local $0)
     )
     (block
      (call $assembly/tlsf/Control#sl_bitmap_set
       (get_local $0)
       (get_local $2)
       (i32.and
        (call $assembly/tlsf/Control#sl_bitmap
         (get_local $0)
         (get_local $2)
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
      (if
       (i32.eqz
        (call $assembly/tlsf/Control#sl_bitmap
         (get_local $0)
         (get_local $2)
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
 (func $assembly/tlsf/Control#locateFreeBlock (; 28 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (block
   (set_local $2
    (i32.const 0)
   )
  )
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
   (block
    (if
     (i32.eqz
      (i32.ge_u
       (call $assembly/tlsf/BlockHeader#get:size
        (get_local $2)
       )
       (get_local $1)
      )
     )
     (unreachable)
    )
    (call $assembly/tlsf/Control#removeFreeBlock
     (get_local $0)
     (get_local $2)
     (get_global $assembly/tlsf/fl_out)
     (get_global $assembly/tlsf/sl_out)
    )
   )
  )
  (return
   (get_local $2)
  )
 )
 (func $assembly/tlsf/request_memory (; 29 ;) (type $iv) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
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
  (block
   (set_local $3
    (grow_memory
     (select
      (tee_local $1
       (current_memory)
      )
      (tee_local $2
       (i32.shr_u
        (get_local $0)
        (i32.const 16)
       )
      )
      (i32.gt_u
       (get_local $1)
       (get_local $2)
      )
     )
    )
   )
  )
  (if
   (i32.lt_s
    (get_local $3)
    (i32.const 0)
   )
   (unreachable)
  )
  (block
   (set_local $4
    (current_memory)
   )
  )
  (call $assembly/tlsf/Control#addPool
   (get_global $assembly/tlsf/TLSF)
   (i32.shl
    (get_local $3)
    (i32.const 16)
   )
   (i32.shl
    (i32.sub
     (get_local $4)
     (get_local $3)
    )
    (i32.const 16)
   )
  )
 )
 (func $assembly/tlsf/BlockHeader#get:isFree (; 30 ;) (type $ii) (param $0 i32) (result i32)
  (return
   (i32.ne
    (i32.and
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 1)
    )
    (i32.const 0)
   )
  )
 )
 (func $assembly/tlsf/BlockHeader#canSplit (; 31 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (return
   (i32.ge_u
    (call $assembly/tlsf/BlockHeader#get:size
     (get_local $0)
    )
    (i32.add
     (i32.const 16)
     (get_local $1)
    )
   )
  )
 )
 (func $assembly/tlsf/BlockHeader#markAsFree (; 32 ;) (type $iv) (param $0 i32)
  (local $1 i32)
  (block
   (set_local $1
    (call $assembly/tlsf/BlockHeader#linkNext
     (get_local $0)
    )
   )
  )
  (call $assembly/tlsf/BlockHeader#tagAsPrevFree
   (get_local $1)
  )
  (call $assembly/tlsf/BlockHeader#tagAsFree
   (get_local $0)
  )
 )
 (func $assembly/tlsf/BlockHeader#split (; 33 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (block
   (set_local $2
    (call $assembly/tlsf/BlockHeader.fromOffset
     (call $assembly/tlsf/BlockHeader#toDataPtr
      (get_local $0)
     )
     (i32.sub
      (get_local $1)
      (i32.const 4)
     )
    )
   )
  )
  (block
   (set_local $3
    (i32.sub
     (call $assembly/tlsf/BlockHeader#get:size
      (get_local $0)
     )
     (i32.add
      (get_local $1)
      (i32.const 4)
     )
    )
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (call $assembly/tlsf/BlockHeader#toDataPtr
      (get_local $2)
     )
     (call $assembly/tlsf/align_ptr
      (call $assembly/tlsf/BlockHeader#toDataPtr
       (get_local $2)
      )
      (i32.const 4)
     )
    )
   )
   (unreachable)
  )
  (call $assembly/tlsf/BlockHeader#set:size
   (get_local $2)
   (get_local $3)
  )
  (if
   (i32.eqz
    (i32.ge_u
     (call $assembly/tlsf/BlockHeader#get:size
      (get_local $2)
     )
     (i32.const 12)
    )
   )
   (unreachable)
  )
  (call $assembly/tlsf/BlockHeader#set:size
   (get_local $0)
   (get_local $1)
  )
  (call $assembly/tlsf/BlockHeader#markAsFree
   (get_local $2)
  )
  (return
   (get_local $2)
  )
 )
 (func $assembly/tlsf/Control#trimFreeBlock (; 34 ;) (type $iiiv) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (if
   (i32.eqz
    (call $assembly/tlsf/BlockHeader#get:isFree
     (get_local $1)
    )
   )
   (unreachable)
  )
  (if
   (call $assembly/tlsf/BlockHeader#canSplit
    (get_local $1)
    (get_local $2)
   )
   (block
    (block
     (set_local $3
      (call $assembly/tlsf/BlockHeader#split
       (get_local $1)
       (get_local $2)
      )
     )
    )
    (drop
     (call $assembly/tlsf/BlockHeader#linkNext
      (get_local $1)
     )
    )
    (call $assembly/tlsf/BlockHeader#tagAsPrevFree
     (get_local $3)
    )
    (call $assembly/tlsf/Control#insertBlock
     (get_local $0)
     (get_local $3)
    )
   )
  )
 )
 (func $assembly/tlsf/BlockHeader#markAsUsed (; 35 ;) (type $iv) (param $0 i32)
  (local $1 i32)
  (block
   (set_local $1
    (call $assembly/tlsf/BlockHeader#get:next
     (get_local $0)
    )
   )
  )
  (call $assembly/tlsf/BlockHeader#tagAsPrevUsed
   (get_local $1)
  )
  (call $assembly/tlsf/BlockHeader#tagAsUsed
   (get_local $0)
  )
 )
 (func $assembly/tlsf/Control#prepareUsedBlock (; 36 ;) (type $iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (block
   (set_local $3
    (i32.const 0)
   )
  )
  (if
   (get_local $1)
   (block
    (if
     (i32.eqz
      (get_local $2)
     )
     (unreachable)
    )
    (call $assembly/tlsf/Control#trimFreeBlock
     (get_local $0)
     (get_local $1)
     (get_local $2)
    )
    (call $assembly/tlsf/BlockHeader#markAsUsed
     (get_local $1)
    )
    (set_local $3
     (call $assembly/tlsf/BlockHeader#toDataPtr
      (get_local $1)
     )
    )
   )
  )
  (return
   (get_local $3)
  )
 )
 (func $assembly/tlsf/allocate_memory (; 37 ;) (type $ii) (param $0 i32) (result i32)
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
  (block
   (set_local $1
    (get_global $assembly/tlsf/TLSF)
   )
  )
  (block
   (set_local $2
    (call $assembly/tlsf/adjust_request_size
     (get_local $0)
     (i32.const 4)
    )
   )
  )
  (block
   (set_local $3
    (call $assembly/tlsf/Control#locateFreeBlock
     (get_local $1)
     (get_local $2)
    )
   )
  )
  (if
   (i32.and
    (if (result i32)
     (i32.ne
      (i32.eqz
       (get_local $3)
      )
      (i32.const 0)
     )
     (i32.gt_u
      (get_local $0)
      (i32.const 0)
     )
     (i32.eqz
      (get_local $3)
     )
    )
    (i32.const 1)
   )
   (block
    (call $assembly/tlsf/request_memory
     (get_local $2)
    )
    (set_local $3
     (call $assembly/tlsf/Control#locateFreeBlock
      (get_local $1)
      (get_local $2)
     )
    )
   )
  )
  (return
   (call $assembly/tlsf/Control#prepareUsedBlock
    (get_local $1)
    (get_local $3)
    (get_local $2)
   )
  )
 )
 (func $assembly/tlsf/BlockHeader.fromDataPtr (; 38 ;) (type $ii) (param $0 i32) (result i32)
  (return
   (i32.sub
    (get_local $0)
    (i32.const 8)
   )
  )
 )
 (func $assembly/tlsf/BlockHeader#get:isPrevFree (; 39 ;) (type $ii) (param $0 i32) (result i32)
  (return
   (i32.ne
    (i32.and
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 2)
    )
    (i32.const 0)
   )
  )
 )
 (func $assembly/tlsf/BlockHeader#get:prev (; 40 ;) (type $ii) (param $0 i32) (result i32)
  (if
   (i32.eqz
    (call $assembly/tlsf/BlockHeader#get:isPrevFree
     (get_local $0)
    )
   )
   (unreachable)
  )
  (return
   (i32.load
    (get_local $0)
   )
  )
 )
 (func $assembly/tlsf/Control#removeBlock (; 41 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (call $assembly/tlsf/mapping_insert
   (call $assembly/tlsf/BlockHeader#get:size
    (get_local $1)
   )
  )
  (call $assembly/tlsf/Control#removeFreeBlock
   (get_local $0)
   (get_local $1)
   (get_global $assembly/tlsf/fl_out)
   (get_global $assembly/tlsf/sl_out)
  )
 )
 (func $assembly/tlsf/BlockHeader#absorb (; 42 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (if
   (i32.eqz
    (i32.eqz
     (call $assembly/tlsf/BlockHeader#get:isLast
      (get_local $0)
     )
    )
   )
   (unreachable)
  )
  (i32.store offset=4
   (get_local $0)
   (i32.add
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (call $assembly/tlsf/BlockHeader#get:size
      (get_local $1)
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
 (func $assembly/tlsf/Control#mergePrevBlock (; 43 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (if
   (call $assembly/tlsf/BlockHeader#get:isPrevFree
    (get_local $1)
   )
   (block
    (block
     (set_local $2
      (call $assembly/tlsf/BlockHeader#get:prev
       (get_local $1)
      )
     )
    )
    (if
     (i32.eqz
      (get_local $2)
     )
     (unreachable)
    )
    (if
     (i32.eqz
      (call $assembly/tlsf/BlockHeader#get:isFree
       (get_local $2)
      )
     )
     (unreachable)
    )
    (call $assembly/tlsf/Control#removeBlock
     (get_local $0)
     (get_local $2)
    )
    (call $assembly/tlsf/BlockHeader#absorb
     (get_local $2)
     (get_local $1)
    )
    (set_local $1
     (get_local $2)
    )
   )
  )
  (return
   (get_local $1)
  )
 )
 (func $assembly/tlsf/Control#mergeNextBlock (; 44 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (block
   (set_local $2
    (call $assembly/tlsf/BlockHeader#get:next
     (get_local $1)
    )
   )
  )
  (if
   (i32.eqz
    (get_local $2)
   )
   (unreachable)
  )
  (if
   (call $assembly/tlsf/BlockHeader#get:isFree
    (get_local $2)
   )
   (block
    (if
     (i32.eqz
      (i32.eqz
       (call $assembly/tlsf/BlockHeader#get:isLast
        (get_local $1)
       )
      )
     )
     (unreachable)
    )
    (call $assembly/tlsf/Control#removeBlock
     (get_local $0)
     (get_local $2)
    )
    (call $assembly/tlsf/BlockHeader#absorb
     (get_local $1)
     (get_local $2)
    )
   )
  )
  (return
   (get_local $1)
  )
 )
 (func $assembly/tlsf/free_memory (; 45 ;) (type $iv) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (if
   (if (result i32)
    (i32.ne
     (get_global $assembly/tlsf/TLSF)
     (i32.const 0)
    )
    (get_local $0)
    (get_global $assembly/tlsf/TLSF)
   )
   (block
    (block
     (set_local $1
      (get_global $assembly/tlsf/TLSF)
     )
    )
    (block
     (set_local $2
      (call $assembly/tlsf/BlockHeader.fromDataPtr
       (get_local $0)
      )
     )
    )
    (if
     (i32.eqz
      (i32.eqz
       (call $assembly/tlsf/BlockHeader#get:isFree
        (get_local $2)
       )
      )
     )
     (unreachable)
    )
    (call $assembly/tlsf/BlockHeader#markAsFree
     (get_local $2)
    )
    (set_local $2
     (call $assembly/tlsf/Control#mergePrevBlock
      (get_local $1)
      (get_local $2)
     )
    )
    (set_local $2
     (call $assembly/tlsf/Control#mergeNextBlock
      (get_local $1)
      (get_local $2)
     )
    )
    (call $assembly/tlsf/Control#insertBlock
     (get_local $1)
     (get_local $2)
    )
   )
  )
 )
 (func $assembly/tlsf/ffs<u32> (; 46 ;) (type $ii) (param $0 i32) (result i32)
  (return
   (if (result i32)
    (get_local $0)
    (i32.ctz
     (get_local $0)
    )
    (i32.sub
     (i32.const 0)
     (i32.const 1)
    )
   )
  )
 )
 (func $assembly/tlsf/fls<u32> (; 47 ;) (type $ii) (param $0 i32) (result i32)
  (return
   (i32.sub
    (i32.sub
     (i32.shl
      (i32.const 4)
      (i32.const 3)
     )
     (i32.const 1)
    )
    (i32.clz
     (get_local $0)
    )
   )
  )
 )
 (func $assembly/tlsf/fls<u64> (; 48 ;) (type $Ii) (param $0 i64) (result i32)
  (return
   (i32.sub
    (i32.sub
     (i32.shl
      (i32.const 8)
      (i32.const 3)
     )
     (i32.const 1)
    )
    (i32.wrap/i64
     (i64.clz
      (get_local $0)
     )
    )
   )
  )
 )
 (func $assembly/tlsf/test_ffs_fls (; 49 ;) (type $i) (result i32)
  (local $0 i32)
  (block
   (set_local $0
    (i32.const 0)
   )
  )
  (set_local $0
   (i32.add
    (get_local $0)
    (if (result i32)
     (i32.eq
      (call $assembly/tlsf/ffs<u32>
       (i32.const 0)
      )
      (i32.sub
       (i32.const 0)
       (i32.const 1)
      )
     )
     (i32.const 0)
     (i32.const 1)
    )
   )
  )
  (set_local $0
   (i32.add
    (get_local $0)
    (if (result i32)
     (i32.eq
      (call $assembly/tlsf/fls<u32>
       (i32.const 0)
      )
      (i32.sub
       (i32.const 0)
       (i32.const 1)
      )
     )
     (i32.const 0)
     (i32.const 2)
    )
   )
  )
  (set_local $0
   (i32.add
    (get_local $0)
    (if (result i32)
     (i32.eq
      (call $assembly/tlsf/ffs<u32>
       (i32.const 1)
      )
      (i32.const 0)
     )
     (i32.const 0)
     (i32.const 4)
    )
   )
  )
  (set_local $0
   (i32.add
    (get_local $0)
    (if (result i32)
     (i32.eq
      (call $assembly/tlsf/fls<u32>
       (i32.const 1)
      )
      (i32.const 0)
     )
     (i32.const 0)
     (i32.const 8)
    )
   )
  )
  (set_local $0
   (i32.add
    (get_local $0)
    (if (result i32)
     (i32.eq
      (call $assembly/tlsf/ffs<u32>
       (i32.const -2147483648)
      )
      (i32.const 31)
     )
     (i32.const 0)
     (i32.const 16)
    )
   )
  )
  (set_local $0
   (i32.add
    (get_local $0)
    (if (result i32)
     (i32.eq
      (call $assembly/tlsf/ffs<u32>
       (i32.const -2147450880)
      )
      (i32.const 15)
     )
     (i32.const 0)
     (i32.const 32)
    )
   )
  )
  (set_local $0
   (i32.add
    (get_local $0)
    (if (result i32)
     (i32.eq
      (call $assembly/tlsf/fls<u32>
       (i32.const -2147483640)
      )
      (i32.const 31)
     )
     (i32.const 0)
     (i32.const 64)
    )
   )
  )
  (set_local $0
   (i32.add
    (get_local $0)
    (if (result i32)
     (i32.eq
      (call $assembly/tlsf/fls<u32>
       (i32.const 2147483647)
      )
      (i32.const 30)
     )
     (i32.const 0)
     (i32.const 128)
    )
   )
  )
  (set_local $0
   (i32.add
    (get_local $0)
    (if (result i32)
     (i32.eq
      (call $assembly/tlsf/fls<u64>
       (i64.const 2147483648)
      )
      (i32.const 31)
     )
     (i32.const 0)
     (i32.const 256)
    )
   )
  )
  (set_local $0
   (i32.add
    (get_local $0)
    (if (result i32)
     (i32.eq
      (call $assembly/tlsf/fls<u64>
       (i64.const 4294967296)
      )
      (i32.const 32)
     )
     (i32.const 0)
     (i32.const 512)
    )
   )
  )
  (set_local $0
   (i32.add
    (get_local $0)
    (if (result i32)
     (i32.eq
      (call $assembly/tlsf/fls<u64>
       (i64.const -1)
      )
      (i32.const 63)
     )
     (i32.const 0)
     (i32.const 1024)
    )
   )
  )
  (return
   (get_local $0)
  )
 )
 (func $start (; 50 ;) (type $v)
  (if
   (i32.eqz
    (i32.ge_u
     (i32.shl
      (i32.const 4)
      (i32.const 3)
     )
     (i32.const 32)
    )
   )
   (unreachable)
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.const 4)
     (i32.div_u
      (i32.const 128)
      (i32.const 32)
     )
    )
   )
   (unreachable)
  )
  (if
   (i32.eqz
    (i32.eq
     (call $assembly/tlsf/test_ffs_fls)
     (i32.const 0)
    )
   )
   (unreachable)
  )
 )
)
