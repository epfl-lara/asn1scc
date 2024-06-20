; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49816 () Bool)

(assert start!49816)

(declare-fun b!234652 () Bool)

(declare-fun e!162203 () Bool)

(declare-fun i!546 () (_ BitVec 32))

(assert (=> b!234652 (= e!162203 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-datatypes ((array!12310 0))(
  ( (array!12311 (arr!6395 (Array (_ BitVec 32) (_ BitVec 8))) (size!5408 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9780 0))(
  ( (BitStream!9781 (buf!5883 array!12310) (currentByte!10956 (_ BitVec 32)) (currentBit!10951 (_ BitVec 32))) )
))
(declare-fun lt!370308 () BitStream!9780)

(declare-fun bs!63 () BitStream!9780)

(declare-fun withMovedBitIndex!0 (BitStream!9780 (_ BitVec 64)) BitStream!9780)

(assert (=> b!234652 (= lt!370308 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!19722 0))(
  ( (tuple2!19723 (_1!10765 BitStream!9780) (_2!10765 Bool)) )
))
(declare-fun lt!370307 () tuple2!19722)

(declare-fun readBitPure!0 (BitStream!9780) tuple2!19722)

(assert (=> b!234652 (= lt!370307 (readBitPure!0 bs!63))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-datatypes ((tuple2!19724 0))(
  ( (tuple2!19725 (_1!10766 BitStream!9780) (_2!10766 (_ BitVec 64))) )
))
(declare-fun lt!370306 () tuple2!19724)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19724)

(assert (=> b!234652 (= lt!370306 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!234653 () Bool)

(declare-fun res!196242 () Bool)

(assert (=> b!234653 (=> (not res!196242) (not e!162203))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234653 (= res!196242 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!234654 () Bool)

(declare-fun e!162202 () Bool)

(declare-fun array_inv!5149 (array!12310) Bool)

(assert (=> b!234654 (= e!162202 (array_inv!5149 (buf!5883 bs!63)))))

(declare-fun b!234655 () Bool)

(declare-fun res!196240 () Bool)

(assert (=> b!234655 (=> (not res!196240) (not e!162203))))

(assert (=> b!234655 (= res!196240 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!196239 () Bool)

(assert (=> start!49816 (=> (not res!196239) (not e!162203))))

(assert (=> start!49816 (= res!196239 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49816 e!162203))

(assert (=> start!49816 true))

(declare-fun inv!12 (BitStream!9780) Bool)

(assert (=> start!49816 (and (inv!12 bs!63) e!162202)))

(declare-fun b!234656 () Bool)

(declare-fun res!196241 () Bool)

(assert (=> b!234656 (=> (not res!196241) (not e!162203))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234656 (= res!196241 (validate_offset_bits!1 ((_ sign_extend 32) (size!5408 (buf!5883 bs!63))) ((_ sign_extend 32) (currentByte!10956 bs!63)) ((_ sign_extend 32) (currentBit!10951 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(assert (= (and start!49816 res!196239) b!234656))

(assert (= (and b!234656 res!196241) b!234655))

(assert (= (and b!234655 res!196240) b!234653))

(assert (= (and b!234653 res!196242) b!234652))

(assert (= start!49816 b!234654))

(declare-fun m!357239 () Bool)

(assert (=> b!234655 m!357239))

(declare-fun m!357241 () Bool)

(assert (=> b!234654 m!357241))

(declare-fun m!357243 () Bool)

(assert (=> b!234656 m!357243))

(declare-fun m!357245 () Bool)

(assert (=> b!234653 m!357245))

(declare-fun m!357247 () Bool)

(assert (=> start!49816 m!357247))

(declare-fun m!357249 () Bool)

(assert (=> b!234652 m!357249))

(declare-fun m!357251 () Bool)

(assert (=> b!234652 m!357251))

(declare-fun m!357253 () Bool)

(assert (=> b!234652 m!357253))

(check-sat (not b!234653) (not b!234656) (not b!234654) (not start!49816) (not b!234655) (not b!234652))
(check-sat)
