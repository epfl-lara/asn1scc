; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45496 () Bool)

(assert start!45496)

(declare-fun b!220295 () Bool)

(declare-fun res!185574 () Bool)

(declare-fun e!149606 () Bool)

(assert (=> b!220295 (=> (not res!185574) (not e!149606))))

(declare-datatypes ((array!10735 0))(
  ( (array!10736 (arr!5644 (Array (_ BitVec 32) (_ BitVec 8))) (size!4714 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8536 0))(
  ( (BitStream!8537 (buf!5261 array!10735) (currentByte!9882 (_ BitVec 32)) (currentBit!9877 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8536)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220295 (= res!185574 (validate_offset_bits!1 ((_ sign_extend 32) (size!4714 (buf!5261 bs!62))) ((_ sign_extend 32) (currentByte!9882 bs!62)) ((_ sign_extend 32) (currentBit!9877 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220296 () Bool)

(declare-fun res!185575 () Bool)

(assert (=> b!220296 (=> (not res!185575) (not e!149606))))

(declare-fun acc!113 () (_ BitVec 64))

(assert (=> b!220296 (= res!185575 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220297 () Bool)

(declare-fun e!149607 () Bool)

(declare-fun array_inv!4455 (array!10735) Bool)

(assert (=> b!220297 (= e!149607 (array_inv!4455 (buf!5261 bs!62)))))

(declare-fun res!185573 () Bool)

(assert (=> start!45496 (=> (not res!185573) (not e!149606))))

(assert (=> start!45496 (= res!185573 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45496 e!149606))

(assert (=> start!45496 true))

(declare-fun inv!12 (BitStream!8536) Bool)

(assert (=> start!45496 (and (inv!12 bs!62) e!149607)))

(declare-fun b!220298 () Bool)

(declare-fun res!185576 () Bool)

(assert (=> b!220298 (=> (not res!185576) (not e!149606))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220298 (= res!185576 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220299 () Bool)

(assert (=> b!220299 (= e!149606 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541)))))

(declare-fun lt!348131 () BitStream!8536)

(declare-fun withMovedBitIndex!0 (BitStream!8536 (_ BitVec 64)) BitStream!8536)

(assert (=> b!220299 (= lt!348131 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!18824 0))(
  ( (tuple2!18825 (_1!10070 BitStream!8536) (_2!10070 Bool)) )
))
(declare-fun lt!348129 () tuple2!18824)

(declare-fun readBitPure!0 (BitStream!8536) tuple2!18824)

(assert (=> b!220299 (= lt!348129 (readBitPure!0 bs!62))))

(declare-datatypes ((tuple2!18826 0))(
  ( (tuple2!18827 (_1!10071 BitStream!8536) (_2!10071 (_ BitVec 64))) )
))
(declare-fun lt!348130 () tuple2!18826)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8536 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18826)

(assert (=> b!220299 (= lt!348130 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(assert (= (and start!45496 res!185573) b!220295))

(assert (= (and b!220295 res!185574) b!220298))

(assert (= (and b!220298 res!185576) b!220296))

(assert (= (and b!220296 res!185575) b!220299))

(assert (= start!45496 b!220297))

(declare-fun m!338995 () Bool)

(assert (=> b!220298 m!338995))

(declare-fun m!338997 () Bool)

(assert (=> b!220297 m!338997))

(declare-fun m!338999 () Bool)

(assert (=> b!220295 m!338999))

(declare-fun m!339001 () Bool)

(assert (=> start!45496 m!339001))

(declare-fun m!339003 () Bool)

(assert (=> b!220299 m!339003))

(declare-fun m!339005 () Bool)

(assert (=> b!220299 m!339005))

(declare-fun m!339007 () Bool)

(assert (=> b!220299 m!339007))

(push 1)

(assert (not b!220298))

(assert (not b!220297))

(assert (not b!220295))

(assert (not b!220299))

(assert (not start!45496))

(check-sat)

(pop 1)

(push 1)

(check-sat)

