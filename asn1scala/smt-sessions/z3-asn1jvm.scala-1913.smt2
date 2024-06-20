; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50050 () Bool)

(assert start!50050)

(declare-fun b!235319 () Bool)

(declare-fun res!196769 () Bool)

(declare-fun e!162656 () Bool)

(assert (=> b!235319 (=> (not res!196769) (not e!162656))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235319 (= res!196769 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!235320 () Bool)

(declare-fun i!546 () (_ BitVec 32))

(assert (=> b!235320 (= e!162656 (bvslt (bvsub nBits!274 i!546) #b00000000000000000000000000000000))))

(declare-datatypes ((array!12379 0))(
  ( (array!12380 (arr!6425 (Array (_ BitVec 32) (_ BitVec 8))) (size!5438 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9840 0))(
  ( (BitStream!9841 (buf!5913 array!12379) (currentByte!11004 (_ BitVec 32)) (currentBit!10999 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19884 0))(
  ( (tuple2!19885 (_1!10846 BitStream!9840) (_2!10846 (_ BitVec 64))) )
))
(declare-fun lt!370958 () tuple2!19884)

(declare-fun bs!63 () BitStream!9840)

(declare-fun e!162655 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19884)

(declare-fun withMovedBitIndex!0 (BitStream!9840 (_ BitVec 64)) BitStream!9840)

(assert (=> b!235320 (= lt!370958 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162655)))))

(declare-fun c!11290 () Bool)

(declare-datatypes ((tuple2!19886 0))(
  ( (tuple2!19887 (_1!10847 BitStream!9840) (_2!10847 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!9840) tuple2!19886)

(assert (=> b!235320 (= c!11290 (_2!10847 (readBitPure!0 bs!63)))))

(declare-fun lt!370959 () tuple2!19884)

(assert (=> b!235320 (= lt!370959 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!235321 () Bool)

(assert (=> b!235321 (= e!162655 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun res!196767 () Bool)

(assert (=> start!50050 (=> (not res!196767) (not e!162656))))

(assert (=> start!50050 (= res!196767 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50050 e!162656))

(assert (=> start!50050 true))

(declare-fun e!162654 () Bool)

(declare-fun inv!12 (BitStream!9840) Bool)

(assert (=> start!50050 (and (inv!12 bs!63) e!162654)))

(declare-fun b!235322 () Bool)

(declare-fun array_inv!5179 (array!12379) Bool)

(assert (=> b!235322 (= e!162654 (array_inv!5179 (buf!5913 bs!63)))))

(declare-fun b!235323 () Bool)

(assert (=> b!235323 (= e!162655 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))))))

(declare-fun b!235324 () Bool)

(declare-fun res!196768 () Bool)

(assert (=> b!235324 (=> (not res!196768) (not e!162656))))

(assert (=> b!235324 (= res!196768 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235325 () Bool)

(declare-fun res!196770 () Bool)

(assert (=> b!235325 (=> (not res!196770) (not e!162656))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235325 (= res!196770 (validate_offset_bits!1 ((_ sign_extend 32) (size!5438 (buf!5913 bs!63))) ((_ sign_extend 32) (currentByte!11004 bs!63)) ((_ sign_extend 32) (currentBit!10999 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(assert (= (and start!50050 res!196767) b!235325))

(assert (= (and b!235325 res!196770) b!235324))

(assert (= (and b!235324 res!196768) b!235319))

(assert (= (and b!235319 res!196769) b!235320))

(assert (= (and b!235320 c!11290) b!235323))

(assert (= (and b!235320 (not c!11290)) b!235321))

(assert (= start!50050 b!235322))

(declare-fun m!357949 () Bool)

(assert (=> b!235324 m!357949))

(declare-fun m!357951 () Bool)

(assert (=> b!235319 m!357951))

(declare-fun m!357953 () Bool)

(assert (=> b!235322 m!357953))

(declare-fun m!357955 () Bool)

(assert (=> b!235325 m!357955))

(declare-fun m!357957 () Bool)

(assert (=> b!235320 m!357957))

(assert (=> b!235320 m!357957))

(declare-fun m!357959 () Bool)

(assert (=> b!235320 m!357959))

(declare-fun m!357961 () Bool)

(assert (=> b!235320 m!357961))

(declare-fun m!357963 () Bool)

(assert (=> b!235320 m!357963))

(declare-fun m!357965 () Bool)

(assert (=> start!50050 m!357965))

(check-sat (not b!235319) (not b!235325) (not b!235322) (not start!50050) (not b!235324) (not b!235320))
(check-sat)
