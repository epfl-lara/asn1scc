; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50018 () Bool)

(assert start!50018)

(declare-fun b!235051 () Bool)

(declare-fun res!196575 () Bool)

(declare-fun e!162495 () Bool)

(assert (=> b!235051 (=> (not res!196575) (not e!162495))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235051 (= res!196575 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!196577 () Bool)

(assert (=> start!50018 (=> (not res!196577) (not e!162495))))

(assert (=> start!50018 (= res!196577 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50018 e!162495))

(assert (=> start!50018 true))

(declare-datatypes ((array!12347 0))(
  ( (array!12348 (arr!6409 (Array (_ BitVec 32) (_ BitVec 8))) (size!5422 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9808 0))(
  ( (BitStream!9809 (buf!5897 array!12347) (currentByte!10988 (_ BitVec 32)) (currentBit!10983 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9808)

(declare-fun e!162496 () Bool)

(declare-fun inv!12 (BitStream!9808) Bool)

(assert (=> start!50018 (and (inv!12 bs!63) e!162496)))

(declare-fun b!235052 () Bool)

(declare-datatypes ((tuple2!19820 0))(
  ( (tuple2!19821 (_1!10814 BitStream!9808) (_2!10814 Bool)) )
))
(declare-fun lt!370830 () tuple2!19820)

(assert (=> b!235052 (= e!162495 (and (_2!10814 lt!370830) (not (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun lt!370829 () BitStream!9808)

(declare-fun withMovedBitIndex!0 (BitStream!9808 (_ BitVec 64)) BitStream!9808)

(assert (=> b!235052 (= lt!370829 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!9808) tuple2!19820)

(assert (=> b!235052 (= lt!370830 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19822 0))(
  ( (tuple2!19823 (_1!10815 BitStream!9808) (_2!10815 (_ BitVec 64))) )
))
(declare-fun lt!370828 () tuple2!19822)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19822)

(assert (=> b!235052 (= lt!370828 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!235053 () Bool)

(declare-fun array_inv!5163 (array!12347) Bool)

(assert (=> b!235053 (= e!162496 (array_inv!5163 (buf!5897 bs!63)))))

(declare-fun b!235054 () Bool)

(declare-fun res!196578 () Bool)

(assert (=> b!235054 (=> (not res!196578) (not e!162495))))

(assert (=> b!235054 (= res!196578 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!235055 () Bool)

(declare-fun res!196576 () Bool)

(assert (=> b!235055 (=> (not res!196576) (not e!162495))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235055 (= res!196576 (validate_offset_bits!1 ((_ sign_extend 32) (size!5422 (buf!5897 bs!63))) ((_ sign_extend 32) (currentByte!10988 bs!63)) ((_ sign_extend 32) (currentBit!10983 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(assert (= (and start!50018 res!196577) b!235055))

(assert (= (and b!235055 res!196576) b!235051))

(assert (= (and b!235051 res!196575) b!235054))

(assert (= (and b!235054 res!196578) b!235052))

(assert (= start!50018 b!235053))

(declare-fun m!357685 () Bool)

(assert (=> b!235055 m!357685))

(declare-fun m!357687 () Bool)

(assert (=> start!50018 m!357687))

(declare-fun m!357689 () Bool)

(assert (=> b!235052 m!357689))

(declare-fun m!357691 () Bool)

(assert (=> b!235052 m!357691))

(declare-fun m!357693 () Bool)

(assert (=> b!235052 m!357693))

(declare-fun m!357695 () Bool)

(assert (=> b!235053 m!357695))

(declare-fun m!357697 () Bool)

(assert (=> b!235051 m!357697))

(declare-fun m!357699 () Bool)

(assert (=> b!235054 m!357699))

(push 1)

(assert (not start!50018))

(assert (not b!235052))

(assert (not b!235055))

(assert (not b!235054))

(assert (not b!235051))

(assert (not b!235053))

(check-sat)

(pop 1)

(push 1)

(check-sat)

