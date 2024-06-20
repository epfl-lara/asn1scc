; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45662 () Bool)

(assert start!45662)

(declare-fun b!220730 () Bool)

(declare-fun res!185938 () Bool)

(declare-fun e!149901 () Bool)

(assert (=> b!220730 (=> (not res!185938) (not e!149901))))

(declare-datatypes ((array!10775 0))(
  ( (array!10776 (arr!5661 (Array (_ BitVec 32) (_ BitVec 8))) (size!4731 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8570 0))(
  ( (BitStream!8571 (buf!5278 array!10775) (currentByte!9914 (_ BitVec 32)) (currentBit!9909 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8570)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220730 (= res!185938 (validate_offset_bits!1 ((_ sign_extend 32) (size!4731 (buf!5278 bs!62))) ((_ sign_extend 32) (currentByte!9914 bs!62)) ((_ sign_extend 32) (currentBit!9909 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220731 () Bool)

(declare-datatypes ((tuple2!18916 0))(
  ( (tuple2!18917 (_1!10116 BitStream!8570) (_2!10116 Bool)) )
))
(declare-fun lt!348599 () tuple2!18916)

(assert (=> b!220731 (= e!149901 (and (_2!10116 lt!348599) (or (bvslt ((_ sign_extend 32) i!541) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) i!541) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun lt!348597 () BitStream!8570)

(declare-fun withMovedBitIndex!0 (BitStream!8570 (_ BitVec 64)) BitStream!8570)

(assert (=> b!220731 (= lt!348597 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!8570) tuple2!18916)

(assert (=> b!220731 (= lt!348599 (readBitPure!0 bs!62))))

(declare-fun acc!113 () (_ BitVec 64))

(declare-datatypes ((tuple2!18918 0))(
  ( (tuple2!18919 (_1!10117 BitStream!8570) (_2!10117 (_ BitVec 64))) )
))
(declare-fun lt!348598 () tuple2!18918)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18918)

(assert (=> b!220731 (= lt!348598 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220733 () Bool)

(declare-fun e!149900 () Bool)

(declare-fun array_inv!4472 (array!10775) Bool)

(assert (=> b!220733 (= e!149900 (array_inv!4472 (buf!5278 bs!62)))))

(declare-fun b!220734 () Bool)

(declare-fun res!185936 () Bool)

(assert (=> b!220734 (=> (not res!185936) (not e!149901))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220734 (= res!185936 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!185937 () Bool)

(assert (=> start!45662 (=> (not res!185937) (not e!149901))))

(assert (=> start!45662 (= res!185937 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45662 e!149901))

(assert (=> start!45662 true))

(declare-fun inv!12 (BitStream!8570) Bool)

(assert (=> start!45662 (and (inv!12 bs!62) e!149900)))

(declare-fun b!220732 () Bool)

(declare-fun res!185939 () Bool)

(assert (=> b!220732 (=> (not res!185939) (not e!149901))))

(assert (=> b!220732 (= res!185939 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(assert (= (and start!45662 res!185937) b!220730))

(assert (= (and b!220730 res!185938) b!220734))

(assert (= (and b!220734 res!185936) b!220732))

(assert (= (and b!220732 res!185939) b!220731))

(assert (= start!45662 b!220733))

(declare-fun m!339419 () Bool)

(assert (=> b!220733 m!339419))

(declare-fun m!339421 () Bool)

(assert (=> start!45662 m!339421))

(declare-fun m!339423 () Bool)

(assert (=> b!220730 m!339423))

(declare-fun m!339425 () Bool)

(assert (=> b!220734 m!339425))

(declare-fun m!339427 () Bool)

(assert (=> b!220731 m!339427))

(declare-fun m!339429 () Bool)

(assert (=> b!220731 m!339429))

(declare-fun m!339431 () Bool)

(assert (=> b!220731 m!339431))

(push 1)

(assert (not b!220733))

(assert (not b!220731))

(assert (not b!220734))

(assert (not start!45662))

(assert (not b!220730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

