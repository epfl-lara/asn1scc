; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31596 () Bool)

(assert start!31596)

(declare-fun b!158094 () Bool)

(declare-fun e!107323 () Bool)

(declare-datatypes ((array!7338 0))(
  ( (array!7339 (arr!4228 (Array (_ BitVec 32) (_ BitVec 8))) (size!3319 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5830 0))(
  ( (BitStream!5831 (buf!3789 array!7338) (currentByte!6968 (_ BitVec 32)) (currentBit!6963 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5830)

(declare-fun array_inv!3078 (array!7338) Bool)

(assert (=> b!158094 (= e!107323 (array_inv!3078 (buf!3789 bs!65)))))

(declare-fun b!158093 () Bool)

(declare-fun e!107325 () Bool)

(declare-fun from!240 () (_ BitVec 32))

(assert (=> b!158093 (= e!107325 (not (or (not (= (bvand from!240 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand from!240 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)))))))

(declare-fun lt!249207 () BitStream!5830)

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158093 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3319 (buf!3789 lt!249207))) ((_ sign_extend 32) (currentByte!6968 lt!249207)) ((_ sign_extend 32) (currentBit!6963 lt!249207)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!10556 0))(
  ( (Unit!10557) )
))
(declare-fun lt!249210 () Unit!10556)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5830 BitStream!5830 (_ BitVec 64) (_ BitVec 32)) Unit!10556)

(assert (=> b!158093 (= lt!249210 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249207 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!14384 0))(
  ( (tuple2!14385 (_1!7654 BitStream!5830) (_2!7654 (_ BitVec 8))) )
))
(declare-fun lt!249206 () tuple2!14384)

(declare-fun readBytePure!0 (BitStream!5830) tuple2!14384)

(assert (=> b!158093 (= lt!249206 (readBytePure!0 lt!249207))))

(declare-fun res!132075 () Bool)

(declare-fun e!107324 () Bool)

(assert (=> start!31596 (=> (not res!132075) (not e!107324))))

(declare-fun arr!153 () array!7338)

(assert (=> start!31596 (= res!132075 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3319 arr!153))))))

(assert (=> start!31596 e!107324))

(assert (=> start!31596 true))

(assert (=> start!31596 (array_inv!3078 arr!153)))

(declare-fun inv!12 (BitStream!5830) Bool)

(assert (=> start!31596 (and (inv!12 bs!65) e!107323)))

(declare-fun b!158092 () Bool)

(assert (=> b!158092 (= e!107324 e!107325)))

(declare-fun res!132077 () Bool)

(assert (=> b!158092 (=> (not res!132077) (not e!107325))))

(assert (=> b!158092 (= res!132077 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14386 0))(
  ( (tuple2!14387 (_1!7655 BitStream!5830) (_2!7655 array!7338)) )
))
(declare-fun lt!249208 () tuple2!14386)

(declare-fun readByteArrayLoopPure!0 (BitStream!5830 array!7338 (_ BitVec 32) (_ BitVec 32)) tuple2!14386)

(assert (=> b!158092 (= lt!249208 (readByteArrayLoopPure!0 lt!249207 (array!7339 (store (arr!4228 arr!153) from!240 (_2!7654 (readBytePure!0 bs!65))) (size!3319 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5830 (_ BitVec 32)) BitStream!5830)

(assert (=> b!158092 (= lt!249207 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!249209 () tuple2!14386)

(assert (=> b!158092 (= lt!249209 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!158091 () Bool)

(declare-fun res!132076 () Bool)

(assert (=> b!158091 (=> (not res!132076) (not e!107324))))

(assert (=> b!158091 (= res!132076 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3319 (buf!3789 bs!65))) ((_ sign_extend 32) (currentByte!6968 bs!65)) ((_ sign_extend 32) (currentBit!6963 bs!65)) (bvsub to!236 from!240)))))

(assert (= (and start!31596 res!132075) b!158091))

(assert (= (and b!158091 res!132076) b!158092))

(assert (= (and b!158092 res!132077) b!158093))

(assert (= start!31596 b!158094))

(declare-fun m!247867 () Bool)

(assert (=> start!31596 m!247867))

(declare-fun m!247869 () Bool)

(assert (=> start!31596 m!247869))

(declare-fun m!247871 () Bool)

(assert (=> b!158092 m!247871))

(declare-fun m!247873 () Bool)

(assert (=> b!158092 m!247873))

(declare-fun m!247875 () Bool)

(assert (=> b!158092 m!247875))

(declare-fun m!247877 () Bool)

(assert (=> b!158092 m!247877))

(declare-fun m!247879 () Bool)

(assert (=> b!158092 m!247879))

(declare-fun m!247881 () Bool)

(assert (=> b!158094 m!247881))

(declare-fun m!247883 () Bool)

(assert (=> b!158091 m!247883))

(declare-fun m!247885 () Bool)

(assert (=> b!158093 m!247885))

(declare-fun m!247887 () Bool)

(assert (=> b!158093 m!247887))

(declare-fun m!247889 () Bool)

(assert (=> b!158093 m!247889))

(push 1)

(assert (not b!158091))

(assert (not b!158092))

(assert (not b!158093))

(assert (not b!158094))

(assert (not start!31596))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

