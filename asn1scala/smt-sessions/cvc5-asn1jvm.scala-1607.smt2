; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45658 () Bool)

(assert start!45658)

(declare-fun res!185912 () Bool)

(declare-fun e!149882 () Bool)

(assert (=> start!45658 (=> (not res!185912) (not e!149882))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45658 (= res!185912 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45658 e!149882))

(assert (=> start!45658 true))

(declare-datatypes ((array!10771 0))(
  ( (array!10772 (arr!5659 (Array (_ BitVec 32) (_ BitVec 8))) (size!4729 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8566 0))(
  ( (BitStream!8567 (buf!5276 array!10771) (currentByte!9912 (_ BitVec 32)) (currentBit!9907 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8566)

(declare-fun e!149883 () Bool)

(declare-fun inv!12 (BitStream!8566) Bool)

(assert (=> start!45658 (and (inv!12 bs!62) e!149883)))

(declare-fun b!220700 () Bool)

(declare-fun res!185913 () Bool)

(assert (=> b!220700 (=> (not res!185913) (not e!149882))))

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220700 (= res!185913 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220701 () Bool)

(declare-fun res!185914 () Bool)

(assert (=> b!220701 (=> (not res!185914) (not e!149882))))

(assert (=> b!220701 (= res!185914 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220702 () Bool)

(declare-fun array_inv!4470 (array!10771) Bool)

(assert (=> b!220702 (= e!149883 (array_inv!4470 (buf!5276 bs!62)))))

(declare-fun b!220703 () Bool)

(declare-fun res!185915 () Bool)

(assert (=> b!220703 (=> (not res!185915) (not e!149882))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220703 (= res!185915 (validate_offset_bits!1 ((_ sign_extend 32) (size!4729 (buf!5276 bs!62))) ((_ sign_extend 32) (currentByte!9912 bs!62)) ((_ sign_extend 32) (currentBit!9907 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220704 () Bool)

(declare-datatypes ((tuple2!18908 0))(
  ( (tuple2!18909 (_1!10112 BitStream!8566) (_2!10112 Bool)) )
))
(declare-fun lt!348581 () tuple2!18908)

(assert (=> b!220704 (= e!149882 (and (_2!10112 lt!348581) (or (bvslt ((_ sign_extend 32) i!541) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) i!541) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun lt!348580 () BitStream!8566)

(declare-fun withMovedBitIndex!0 (BitStream!8566 (_ BitVec 64)) BitStream!8566)

(assert (=> b!220704 (= lt!348580 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!8566) tuple2!18908)

(assert (=> b!220704 (= lt!348581 (readBitPure!0 bs!62))))

(declare-datatypes ((tuple2!18910 0))(
  ( (tuple2!18911 (_1!10113 BitStream!8566) (_2!10113 (_ BitVec 64))) )
))
(declare-fun lt!348579 () tuple2!18910)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18910)

(assert (=> b!220704 (= lt!348579 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(assert (= (and start!45658 res!185912) b!220703))

(assert (= (and b!220703 res!185915) b!220700))

(assert (= (and b!220700 res!185913) b!220701))

(assert (= (and b!220701 res!185914) b!220704))

(assert (= start!45658 b!220702))

(declare-fun m!339391 () Bool)

(assert (=> b!220704 m!339391))

(declare-fun m!339393 () Bool)

(assert (=> b!220704 m!339393))

(declare-fun m!339395 () Bool)

(assert (=> b!220704 m!339395))

(declare-fun m!339397 () Bool)

(assert (=> b!220702 m!339397))

(declare-fun m!339399 () Bool)

(assert (=> start!45658 m!339399))

(declare-fun m!339401 () Bool)

(assert (=> b!220700 m!339401))

(declare-fun m!339403 () Bool)

(assert (=> b!220703 m!339403))

(push 1)

(assert (not b!220703))

(assert (not b!220702))

(assert (not b!220704))

(assert (not b!220700))

(assert (not start!45658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

