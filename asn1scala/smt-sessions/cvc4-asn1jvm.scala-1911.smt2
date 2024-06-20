; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50040 () Bool)

(assert start!50040)

(declare-fun b!235216 () Bool)

(declare-fun e!162594 () Bool)

(declare-datatypes ((array!12369 0))(
  ( (array!12370 (arr!6420 (Array (_ BitVec 32) (_ BitVec 8))) (size!5433 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9830 0))(
  ( (BitStream!9831 (buf!5908 array!12369) (currentByte!10999 (_ BitVec 32)) (currentBit!10994 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9830)

(declare-fun array_inv!5174 (array!12369) Bool)

(assert (=> b!235216 (= e!162594 (array_inv!5174 (buf!5908 bs!63)))))

(declare-fun b!235217 () Bool)

(declare-fun res!196708 () Bool)

(declare-fun e!162596 () Bool)

(assert (=> b!235217 (=> (not res!196708) (not e!162596))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235217 (= res!196708 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235218 () Bool)

(assert (=> b!235218 (= e!162596 (and (= (bvand i!546 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!546 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546) #b10000000000000000000000000000000)))))))

(declare-fun lt!370929 () BitStream!9830)

(declare-fun withMovedBitIndex!0 (BitStream!9830 (_ BitVec 64)) BitStream!9830)

(assert (=> b!235218 (= lt!370929 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!19864 0))(
  ( (tuple2!19865 (_1!10836 BitStream!9830) (_2!10836 Bool)) )
))
(declare-fun lt!370928 () tuple2!19864)

(declare-fun readBitPure!0 (BitStream!9830) tuple2!19864)

(assert (=> b!235218 (= lt!370928 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19866 0))(
  ( (tuple2!19867 (_1!10837 BitStream!9830) (_2!10837 (_ BitVec 64))) )
))
(declare-fun lt!370927 () tuple2!19866)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19866)

(assert (=> b!235218 (= lt!370927 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!235219 () Bool)

(declare-fun res!196707 () Bool)

(assert (=> b!235219 (=> (not res!196707) (not e!162596))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235219 (= res!196707 (validate_offset_bits!1 ((_ sign_extend 32) (size!5433 (buf!5908 bs!63))) ((_ sign_extend 32) (currentByte!10999 bs!63)) ((_ sign_extend 32) (currentBit!10994 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun res!196709 () Bool)

(assert (=> start!50040 (=> (not res!196709) (not e!162596))))

(assert (=> start!50040 (= res!196709 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50040 e!162596))

(assert (=> start!50040 true))

(declare-fun inv!12 (BitStream!9830) Bool)

(assert (=> start!50040 (and (inv!12 bs!63) e!162594)))

(declare-fun b!235220 () Bool)

(declare-fun res!196710 () Bool)

(assert (=> b!235220 (=> (not res!196710) (not e!162596))))

(assert (=> b!235220 (= res!196710 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(assert (= (and start!50040 res!196709) b!235219))

(assert (= (and b!235219 res!196707) b!235217))

(assert (= (and b!235217 res!196708) b!235220))

(assert (= (and b!235220 res!196710) b!235218))

(assert (= start!50040 b!235216))

(declare-fun m!357861 () Bool)

(assert (=> start!50040 m!357861))

(declare-fun m!357863 () Bool)

(assert (=> b!235220 m!357863))

(declare-fun m!357865 () Bool)

(assert (=> b!235218 m!357865))

(declare-fun m!357867 () Bool)

(assert (=> b!235218 m!357867))

(declare-fun m!357869 () Bool)

(assert (=> b!235218 m!357869))

(declare-fun m!357871 () Bool)

(assert (=> b!235219 m!357871))

(declare-fun m!357873 () Bool)

(assert (=> b!235216 m!357873))

(declare-fun m!357875 () Bool)

(assert (=> b!235217 m!357875))

(push 1)

(assert (not b!235220))

(assert (not b!235218))

(assert (not start!50040))

(assert (not b!235217))

(assert (not b!235219))

(assert (not b!235216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

