; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45500 () Bool)

(assert start!45500)

(declare-fun b!220325 () Bool)

(declare-fun res!185598 () Bool)

(declare-fun e!149623 () Bool)

(assert (=> b!220325 (=> (not res!185598) (not e!149623))))

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220325 (= res!185598 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220326 () Bool)

(declare-fun e!149624 () Bool)

(declare-datatypes ((array!10739 0))(
  ( (array!10740 (arr!5646 (Array (_ BitVec 32) (_ BitVec 8))) (size!4716 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8540 0))(
  ( (BitStream!8541 (buf!5263 array!10739) (currentByte!9884 (_ BitVec 32)) (currentBit!9879 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8540)

(declare-fun array_inv!4457 (array!10739) Bool)

(assert (=> b!220326 (= e!149624 (array_inv!4457 (buf!5263 bs!62)))))

(declare-fun res!185597 () Bool)

(assert (=> start!45500 (=> (not res!185597) (not e!149623))))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45500 (= res!185597 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45500 e!149623))

(assert (=> start!45500 true))

(declare-fun inv!12 (BitStream!8540) Bool)

(assert (=> start!45500 (and (inv!12 bs!62) e!149624)))

(declare-fun b!220327 () Bool)

(declare-fun res!185600 () Bool)

(assert (=> b!220327 (=> (not res!185600) (not e!149623))))

(assert (=> b!220327 (= res!185600 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220328 () Bool)

(assert (=> b!220328 (= e!149623 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541)))))

(declare-fun lt!348149 () BitStream!8540)

(declare-fun withMovedBitIndex!0 (BitStream!8540 (_ BitVec 64)) BitStream!8540)

(assert (=> b!220328 (= lt!348149 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!18832 0))(
  ( (tuple2!18833 (_1!10074 BitStream!8540) (_2!10074 Bool)) )
))
(declare-fun lt!348148 () tuple2!18832)

(declare-fun readBitPure!0 (BitStream!8540) tuple2!18832)

(assert (=> b!220328 (= lt!348148 (readBitPure!0 bs!62))))

(declare-datatypes ((tuple2!18834 0))(
  ( (tuple2!18835 (_1!10075 BitStream!8540) (_2!10075 (_ BitVec 64))) )
))
(declare-fun lt!348147 () tuple2!18834)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8540 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18834)

(assert (=> b!220328 (= lt!348147 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220329 () Bool)

(declare-fun res!185599 () Bool)

(assert (=> b!220329 (=> (not res!185599) (not e!149623))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220329 (= res!185599 (validate_offset_bits!1 ((_ sign_extend 32) (size!4716 (buf!5263 bs!62))) ((_ sign_extend 32) (currentByte!9884 bs!62)) ((_ sign_extend 32) (currentBit!9879 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(assert (= (and start!45500 res!185597) b!220329))

(assert (= (and b!220329 res!185599) b!220325))

(assert (= (and b!220325 res!185598) b!220327))

(assert (= (and b!220327 res!185600) b!220328))

(assert (= start!45500 b!220326))

(declare-fun m!339023 () Bool)

(assert (=> b!220328 m!339023))

(declare-fun m!339025 () Bool)

(assert (=> b!220328 m!339025))

(declare-fun m!339027 () Bool)

(assert (=> b!220328 m!339027))

(declare-fun m!339029 () Bool)

(assert (=> b!220326 m!339029))

(declare-fun m!339031 () Bool)

(assert (=> b!220325 m!339031))

(declare-fun m!339033 () Bool)

(assert (=> b!220329 m!339033))

(declare-fun m!339035 () Bool)

(assert (=> start!45500 m!339035))

(push 1)

(assert (not b!220326))

(assert (not b!220329))

(assert (not b!220325))

(assert (not b!220328))

(assert (not start!45500))

(check-sat)

