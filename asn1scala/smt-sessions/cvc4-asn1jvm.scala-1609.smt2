; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45674 () Bool)

(assert start!45674)

(declare-fun res!186011 () Bool)

(declare-fun e!149961 () Bool)

(assert (=> start!45674 (=> (not res!186011) (not e!149961))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45674 (= res!186011 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45674 e!149961))

(assert (=> start!45674 true))

(declare-datatypes ((array!10787 0))(
  ( (array!10788 (arr!5667 (Array (_ BitVec 32) (_ BitVec 8))) (size!4737 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8582 0))(
  ( (BitStream!8583 (buf!5284 array!10787) (currentByte!9920 (_ BitVec 32)) (currentBit!9915 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8582)

(declare-fun e!149964 () Bool)

(declare-fun inv!12 (BitStream!8582) Bool)

(assert (=> start!45674 (and (inv!12 bs!62) e!149964)))

(declare-fun b!220836 () Bool)

(declare-fun res!186010 () Bool)

(assert (=> b!220836 (=> (not res!186010) (not e!149961))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220836 (= res!186010 (validate_offset_bits!1 ((_ sign_extend 32) (size!4737 (buf!5284 bs!62))) ((_ sign_extend 32) (currentByte!9920 bs!62)) ((_ sign_extend 32) (currentBit!9915 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220837 () Bool)

(assert (=> b!220837 (= e!149961 (and (not (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand i!541 #b10000000000000000000000000000000))) (not (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 i!541) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!18940 0))(
  ( (tuple2!18941 (_1!10128 BitStream!8582) (_2!10128 (_ BitVec 64))) )
))
(declare-fun lt!348643 () tuple2!18940)

(declare-fun e!149962 () (_ BitVec 64))

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18940)

(declare-fun withMovedBitIndex!0 (BitStream!8582 (_ BitVec 64)) BitStream!8582)

(assert (=> b!220837 (= lt!348643 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!149962)))))

(declare-fun c!10685 () Bool)

(declare-datatypes ((tuple2!18942 0))(
  ( (tuple2!18943 (_1!10129 BitStream!8582) (_2!10129 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8582) tuple2!18942)

(assert (=> b!220837 (= c!10685 (_2!10129 (readBitPure!0 bs!62)))))

(declare-fun lt!348644 () tuple2!18940)

(assert (=> b!220837 (= lt!348644 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220838 () Bool)

(assert (=> b!220838 (= e!149962 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!220839 () Bool)

(declare-fun res!186009 () Bool)

(assert (=> b!220839 (=> (not res!186009) (not e!149961))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220839 (= res!186009 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220840 () Bool)

(assert (=> b!220840 (= e!149962 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)))))

(declare-fun b!220841 () Bool)

(declare-fun res!186008 () Bool)

(assert (=> b!220841 (=> (not res!186008) (not e!149961))))

(assert (=> b!220841 (= res!186008 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220842 () Bool)

(declare-fun array_inv!4478 (array!10787) Bool)

(assert (=> b!220842 (= e!149964 (array_inv!4478 (buf!5284 bs!62)))))

(assert (= (and start!45674 res!186011) b!220836))

(assert (= (and b!220836 res!186010) b!220839))

(assert (= (and b!220839 res!186009) b!220841))

(assert (= (and b!220841 res!186008) b!220837))

(assert (= (and b!220837 c!10685) b!220840))

(assert (= (and b!220837 (not c!10685)) b!220838))

(assert (= start!45674 b!220842))

(declare-fun m!339507 () Bool)

(assert (=> b!220836 m!339507))

(declare-fun m!339509 () Bool)

(assert (=> b!220837 m!339509))

(assert (=> b!220837 m!339509))

(declare-fun m!339511 () Bool)

(assert (=> b!220837 m!339511))

(declare-fun m!339513 () Bool)

(assert (=> b!220837 m!339513))

(declare-fun m!339515 () Bool)

(assert (=> b!220837 m!339515))

(declare-fun m!339517 () Bool)

(assert (=> start!45674 m!339517))

(declare-fun m!339519 () Bool)

(assert (=> b!220842 m!339519))

(declare-fun m!339521 () Bool)

(assert (=> b!220839 m!339521))

(push 1)

(assert (not b!220842))

(assert (not b!220836))

(assert (not b!220837))

(assert (not b!220839))

(assert (not start!45674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

