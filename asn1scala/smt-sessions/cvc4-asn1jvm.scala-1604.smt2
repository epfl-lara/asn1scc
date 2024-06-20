; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45644 () Bool)

(assert start!45644)

(declare-fun b!220655 () Bool)

(declare-fun e!149847 () Bool)

(declare-datatypes ((array!10763 0))(
  ( (array!10764 (arr!5655 (Array (_ BitVec 32) (_ BitVec 8))) (size!4725 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8558 0))(
  ( (BitStream!8559 (buf!5272 array!10763) (currentByte!9908 (_ BitVec 32)) (currentBit!9903 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8558)

(declare-fun array_inv!4466 (array!10763) Bool)

(assert (=> b!220655 (= e!149847 (array_inv!4466 (buf!5272 bs!62)))))

(declare-fun b!220656 () Bool)

(declare-fun e!149845 () Bool)

(declare-fun e!149844 () Bool)

(assert (=> b!220656 (= e!149845 e!149844)))

(declare-fun res!185883 () Bool)

(assert (=> b!220656 (=> (not res!185883) (not e!149844))))

(declare-fun i!541 () (_ BitVec 32))

(assert (=> b!220656 (= res!185883 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541)))))

(declare-datatypes ((tuple2!18904 0))(
  ( (tuple2!18905 (_1!10110 BitStream!8558) (_2!10110 Bool)) )
))
(declare-fun lt!348569 () tuple2!18904)

(declare-fun lt!348572 () (_ BitVec 64))

(declare-fun acc!113 () (_ BitVec 64))

(assert (=> b!220656 (= lt!348572 (bvor acc!113 (ite (_2!10110 lt!348569) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!348568 () BitStream!8558)

(declare-fun withMovedBitIndex!0 (BitStream!8558 (_ BitVec 64)) BitStream!8558)

(assert (=> b!220656 (= lt!348568 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!8558) tuple2!18904)

(assert (=> b!220656 (= lt!348569 (readBitPure!0 bs!62))))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-datatypes ((tuple2!18906 0))(
  ( (tuple2!18907 (_1!10111 BitStream!8558) (_2!10111 (_ BitVec 64))) )
))
(declare-fun lt!348570 () tuple2!18906)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18906)

(assert (=> b!220656 (= lt!348570 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220657 () Bool)

(declare-fun res!185885 () Bool)

(declare-fun e!149846 () Bool)

(assert (=> b!220657 (=> (not res!185885) (not e!149846))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220657 (= res!185885 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220658 () Bool)

(declare-fun res!185881 () Bool)

(assert (=> b!220658 (=> (not res!185881) (not e!149844))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220658 (= res!185881 (validate_offset_bits!1 ((_ sign_extend 32) (size!4725 (buf!5272 lt!348568))) ((_ sign_extend 32) (currentByte!9908 lt!348568)) ((_ sign_extend 32) (currentBit!9903 lt!348568)) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))))))

(declare-fun res!185879 () Bool)

(assert (=> start!45644 (=> (not res!185879) (not e!149846))))

(assert (=> start!45644 (= res!185879 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45644 e!149846))

(assert (=> start!45644 true))

(declare-fun inv!12 (BitStream!8558) Bool)

(assert (=> start!45644 (and (inv!12 bs!62) e!149847)))

(declare-fun b!220659 () Bool)

(declare-fun lt!348571 () (_ BitVec 64))

(assert (=> b!220659 (= e!149844 (not (= (bvand lt!348572 lt!348571) lt!348572)))))

(declare-fun b!220660 () Bool)

(declare-fun res!185882 () Bool)

(assert (=> b!220660 (=> (not res!185882) (not e!149844))))

(assert (=> b!220660 (= res!185882 (= (bvand lt!348572 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541)))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220661 () Bool)

(assert (=> b!220661 (= e!149846 e!149845)))

(declare-fun res!185884 () Bool)

(assert (=> b!220661 (=> (not res!185884) (not e!149845))))

(assert (=> b!220661 (= res!185884 (= (bvand acc!113 lt!348571) acc!113))))

(assert (=> b!220661 (= lt!348571 #b1111111111111111111111111111111111111111111111111111111111111111)))

(declare-fun b!220662 () Bool)

(declare-fun res!185880 () Bool)

(assert (=> b!220662 (=> (not res!185880) (not e!149846))))

(assert (=> b!220662 (= res!185880 (validate_offset_bits!1 ((_ sign_extend 32) (size!4725 (buf!5272 bs!62))) ((_ sign_extend 32) (currentByte!9908 bs!62)) ((_ sign_extend 32) (currentBit!9903 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(assert (= (and start!45644 res!185879) b!220662))

(assert (= (and b!220662 res!185880) b!220657))

(assert (= (and b!220657 res!185885) b!220661))

(assert (= (and b!220661 res!185884) b!220656))

(assert (= (and b!220656 res!185883) b!220658))

(assert (= (and b!220658 res!185881) b!220660))

(assert (= (and b!220660 res!185882) b!220659))

(assert (= start!45644 b!220655))

(declare-fun m!339355 () Bool)

(assert (=> start!45644 m!339355))

(declare-fun m!339357 () Bool)

(assert (=> b!220658 m!339357))

(declare-fun m!339359 () Bool)

(assert (=> b!220660 m!339359))

(declare-fun m!339361 () Bool)

(assert (=> b!220655 m!339361))

(declare-fun m!339363 () Bool)

(assert (=> b!220662 m!339363))

(declare-fun m!339365 () Bool)

(assert (=> b!220657 m!339365))

(declare-fun m!339367 () Bool)

(assert (=> b!220656 m!339367))

(declare-fun m!339369 () Bool)

(assert (=> b!220656 m!339369))

(declare-fun m!339371 () Bool)

(assert (=> b!220656 m!339371))

(push 1)

(assert (not b!220657))

(assert (not start!45644))

(assert (not b!220655))

(assert (not b!220662))

(assert (not b!220656))

(assert (not b!220658))

(assert (not b!220660))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

