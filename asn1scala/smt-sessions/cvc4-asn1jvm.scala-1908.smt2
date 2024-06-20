; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50022 () Bool)

(assert start!50022)

(declare-fun b!235081 () Bool)

(declare-fun res!196599 () Bool)

(declare-fun e!162514 () Bool)

(assert (=> b!235081 (=> (not res!196599) (not e!162514))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235081 (= res!196599 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!235082 () Bool)

(declare-fun e!162513 () Bool)

(declare-datatypes ((array!12351 0))(
  ( (array!12352 (arr!6411 (Array (_ BitVec 32) (_ BitVec 8))) (size!5424 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9812 0))(
  ( (BitStream!9813 (buf!5899 array!12351) (currentByte!10990 (_ BitVec 32)) (currentBit!10985 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9812)

(declare-fun array_inv!5165 (array!12351) Bool)

(assert (=> b!235082 (= e!162513 (array_inv!5165 (buf!5899 bs!63)))))

(declare-fun res!196601 () Bool)

(assert (=> start!50022 (=> (not res!196601) (not e!162514))))

(declare-fun i!546 () (_ BitVec 32))

(assert (=> start!50022 (= res!196601 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50022 e!162514))

(assert (=> start!50022 true))

(declare-fun inv!12 (BitStream!9812) Bool)

(assert (=> start!50022 (and (inv!12 bs!63) e!162513)))

(declare-fun b!235083 () Bool)

(declare-fun res!196602 () Bool)

(assert (=> b!235083 (=> (not res!196602) (not e!162514))))

(assert (=> b!235083 (= res!196602 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235084 () Bool)

(declare-datatypes ((tuple2!19828 0))(
  ( (tuple2!19829 (_1!10818 BitStream!9812) (_2!10818 Bool)) )
))
(declare-fun lt!370846 () tuple2!19828)

(assert (=> b!235084 (= e!162514 (and (_2!10818 lt!370846) (not (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun lt!370847 () BitStream!9812)

(declare-fun withMovedBitIndex!0 (BitStream!9812 (_ BitVec 64)) BitStream!9812)

(assert (=> b!235084 (= lt!370847 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!9812) tuple2!19828)

(assert (=> b!235084 (= lt!370846 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19830 0))(
  ( (tuple2!19831 (_1!10819 BitStream!9812) (_2!10819 (_ BitVec 64))) )
))
(declare-fun lt!370848 () tuple2!19830)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19830)

(assert (=> b!235084 (= lt!370848 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!235085 () Bool)

(declare-fun res!196600 () Bool)

(assert (=> b!235085 (=> (not res!196600) (not e!162514))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235085 (= res!196600 (validate_offset_bits!1 ((_ sign_extend 32) (size!5424 (buf!5899 bs!63))) ((_ sign_extend 32) (currentByte!10990 bs!63)) ((_ sign_extend 32) (currentBit!10985 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(assert (= (and start!50022 res!196601) b!235085))

(assert (= (and b!235085 res!196600) b!235083))

(assert (= (and b!235083 res!196602) b!235081))

(assert (= (and b!235081 res!196599) b!235084))

(assert (= start!50022 b!235082))

(declare-fun m!357717 () Bool)

(assert (=> b!235083 m!357717))

(declare-fun m!357719 () Bool)

(assert (=> b!235085 m!357719))

(declare-fun m!357721 () Bool)

(assert (=> start!50022 m!357721))

(declare-fun m!357723 () Bool)

(assert (=> b!235081 m!357723))

(declare-fun m!357725 () Bool)

(assert (=> b!235084 m!357725))

(declare-fun m!357727 () Bool)

(assert (=> b!235084 m!357727))

(declare-fun m!357729 () Bool)

(assert (=> b!235084 m!357729))

(declare-fun m!357731 () Bool)

(assert (=> b!235082 m!357731))

(push 1)

(assert (not b!235084))

(assert (not b!235081))

(assert (not b!235082))

(assert (not b!235085))

(assert (not b!235083))

(assert (not start!50022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

