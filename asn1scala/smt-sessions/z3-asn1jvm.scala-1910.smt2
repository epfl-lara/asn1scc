; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50032 () Bool)

(assert start!50032)

(declare-fun b!235156 () Bool)

(declare-fun res!196659 () Bool)

(declare-fun e!162559 () Bool)

(assert (=> b!235156 (=> (not res!196659) (not e!162559))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235156 (= res!196659 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun res!196662 () Bool)

(assert (=> start!50032 (=> (not res!196662) (not e!162559))))

(declare-fun i!546 () (_ BitVec 32))

(assert (=> start!50032 (= res!196662 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50032 e!162559))

(assert (=> start!50032 true))

(declare-datatypes ((array!12361 0))(
  ( (array!12362 (arr!6416 (Array (_ BitVec 32) (_ BitVec 8))) (size!5429 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9822 0))(
  ( (BitStream!9823 (buf!5904 array!12361) (currentByte!10995 (_ BitVec 32)) (currentBit!10990 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9822)

(declare-fun e!162558 () Bool)

(declare-fun inv!12 (BitStream!9822) Bool)

(assert (=> start!50032 (and (inv!12 bs!63) e!162558)))

(declare-fun b!235157 () Bool)

(declare-fun res!196660 () Bool)

(assert (=> b!235157 (=> (not res!196660) (not e!162559))))

(assert (=> b!235157 (= res!196660 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235158 () Bool)

(declare-fun res!196661 () Bool)

(assert (=> b!235158 (=> (not res!196661) (not e!162559))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235158 (= res!196661 (validate_offset_bits!1 ((_ sign_extend 32) (size!5429 (buf!5904 bs!63))) ((_ sign_extend 32) (currentByte!10995 bs!63)) ((_ sign_extend 32) (currentBit!10990 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235159 () Bool)

(declare-fun array_inv!5170 (array!12361) Bool)

(assert (=> b!235159 (= e!162558 (array_inv!5170 (buf!5904 bs!63)))))

(declare-datatypes ((tuple2!19848 0))(
  ( (tuple2!19849 (_1!10828 BitStream!9822) (_2!10828 Bool)) )
))
(declare-fun lt!370892 () tuple2!19848)

(declare-fun b!235160 () Bool)

(assert (=> b!235160 (= e!162559 (and (_2!10828 lt!370892) (let ((bdg!14496 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546)))) (or (bvslt bdg!14496 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!14496 #b0000000000000000000000000000000000000000000000000000000001000000)))))))

(declare-fun lt!370891 () BitStream!9822)

(declare-fun withMovedBitIndex!0 (BitStream!9822 (_ BitVec 64)) BitStream!9822)

(assert (=> b!235160 (= lt!370891 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!9822) tuple2!19848)

(assert (=> b!235160 (= lt!370892 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19850 0))(
  ( (tuple2!19851 (_1!10829 BitStream!9822) (_2!10829 (_ BitVec 64))) )
))
(declare-fun lt!370893 () tuple2!19850)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9822 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19850)

(assert (=> b!235160 (= lt!370893 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(assert (= (and start!50032 res!196662) b!235158))

(assert (= (and b!235158 res!196661) b!235157))

(assert (= (and b!235157 res!196660) b!235156))

(assert (= (and b!235156 res!196659) b!235160))

(assert (= start!50032 b!235159))

(declare-fun m!357797 () Bool)

(assert (=> b!235160 m!357797))

(declare-fun m!357799 () Bool)

(assert (=> b!235160 m!357799))

(declare-fun m!357801 () Bool)

(assert (=> b!235160 m!357801))

(declare-fun m!357803 () Bool)

(assert (=> start!50032 m!357803))

(declare-fun m!357805 () Bool)

(assert (=> b!235156 m!357805))

(declare-fun m!357807 () Bool)

(assert (=> b!235159 m!357807))

(declare-fun m!357809 () Bool)

(assert (=> b!235158 m!357809))

(declare-fun m!357811 () Bool)

(assert (=> b!235157 m!357811))

(check-sat (not b!235157) (not start!50032) (not b!235160) (not b!235156) (not b!235159) (not b!235158))
(check-sat)
