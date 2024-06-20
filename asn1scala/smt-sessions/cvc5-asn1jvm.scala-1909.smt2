; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50024 () Bool)

(assert start!50024)

(declare-fun b!235096 () Bool)

(declare-fun res!196612 () Bool)

(declare-fun e!162523 () Bool)

(assert (=> b!235096 (=> (not res!196612) (not e!162523))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235096 (= res!196612 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235097 () Bool)

(declare-fun res!196613 () Bool)

(assert (=> b!235097 (=> (not res!196613) (not e!162523))))

(declare-datatypes ((array!12353 0))(
  ( (array!12354 (arr!6412 (Array (_ BitVec 32) (_ BitVec 8))) (size!5425 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9814 0))(
  ( (BitStream!9815 (buf!5900 array!12353) (currentByte!10991 (_ BitVec 32)) (currentBit!10986 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9814)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235097 (= res!196613 (validate_offset_bits!1 ((_ sign_extend 32) (size!5425 (buf!5900 bs!63))) ((_ sign_extend 32) (currentByte!10991 bs!63)) ((_ sign_extend 32) (currentBit!10986 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-datatypes ((tuple2!19832 0))(
  ( (tuple2!19833 (_1!10820 BitStream!9814) (_2!10820 Bool)) )
))
(declare-fun lt!370855 () tuple2!19832)

(declare-fun b!235098 () Bool)

(assert (=> b!235098 (= e!162523 (and (_2!10820 lt!370855) (let ((bdg!14492 (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (and (not (= bdg!14492 (bvand i!546 #b10000000000000000000000000000000))) (not (= bdg!14492 (bvand (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546) #b10000000000000000000000000000000)))))))))

(declare-fun lt!370857 () BitStream!9814)

(declare-fun withMovedBitIndex!0 (BitStream!9814 (_ BitVec 64)) BitStream!9814)

(assert (=> b!235098 (= lt!370857 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!9814) tuple2!19832)

(assert (=> b!235098 (= lt!370855 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19834 0))(
  ( (tuple2!19835 (_1!10821 BitStream!9814) (_2!10821 (_ BitVec 64))) )
))
(declare-fun lt!370856 () tuple2!19834)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19834)

(assert (=> b!235098 (= lt!370856 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun res!196614 () Bool)

(assert (=> start!50024 (=> (not res!196614) (not e!162523))))

(assert (=> start!50024 (= res!196614 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50024 e!162523))

(assert (=> start!50024 true))

(declare-fun e!162522 () Bool)

(declare-fun inv!12 (BitStream!9814) Bool)

(assert (=> start!50024 (and (inv!12 bs!63) e!162522)))

(declare-fun b!235099 () Bool)

(declare-fun array_inv!5166 (array!12353) Bool)

(assert (=> b!235099 (= e!162522 (array_inv!5166 (buf!5900 bs!63)))))

(declare-fun b!235100 () Bool)

(declare-fun res!196611 () Bool)

(assert (=> b!235100 (=> (not res!196611) (not e!162523))))

(assert (=> b!235100 (= res!196611 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(assert (= (and start!50024 res!196614) b!235097))

(assert (= (and b!235097 res!196613) b!235096))

(assert (= (and b!235096 res!196612) b!235100))

(assert (= (and b!235100 res!196611) b!235098))

(assert (= start!50024 b!235099))

(declare-fun m!357733 () Bool)

(assert (=> start!50024 m!357733))

(declare-fun m!357735 () Bool)

(assert (=> b!235097 m!357735))

(declare-fun m!357737 () Bool)

(assert (=> b!235099 m!357737))

(declare-fun m!357739 () Bool)

(assert (=> b!235100 m!357739))

(declare-fun m!357741 () Bool)

(assert (=> b!235096 m!357741))

(declare-fun m!357743 () Bool)

(assert (=> b!235098 m!357743))

(declare-fun m!357745 () Bool)

(assert (=> b!235098 m!357745))

(declare-fun m!357747 () Bool)

(assert (=> b!235098 m!357747))

(push 1)

(assert (not start!50024))

(assert (not b!235100))

(assert (not b!235099))

(assert (not b!235098))

(assert (not b!235097))

(assert (not b!235096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

