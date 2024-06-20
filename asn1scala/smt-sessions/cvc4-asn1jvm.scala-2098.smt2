; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53286 () Bool)

(assert start!53286)

(declare-fun b!247369 () Bool)

(declare-fun e!171351 () Bool)

(declare-fun e!171353 () Bool)

(assert (=> b!247369 (= e!171351 (not e!171353))))

(declare-fun res!207014 () Bool)

(assert (=> b!247369 (=> res!207014 e!171353)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!247369 (= res!207014 (not (= nBits!297 from!289)))))

(declare-datatypes ((array!13482 0))(
  ( (array!13483 (arr!6897 (Array (_ BitVec 32) (_ BitVec 8))) (size!5910 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10742 0))(
  ( (BitStream!10743 (buf!6394 array!13482) (currentByte!11802 (_ BitVec 32)) (currentBit!11797 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10742)

(declare-fun isPrefixOf!0 (BitStream!10742 BitStream!10742) Bool)

(assert (=> b!247369 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17938 0))(
  ( (Unit!17939) )
))
(declare-fun lt!385827 () Unit!17938)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10742) Unit!17938)

(assert (=> b!247369 (= lt!385827 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247370 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247370 (= e!171353 (invariant!0 (currentBit!11797 thiss!1005) (currentByte!11802 thiss!1005) (size!5910 (buf!6394 thiss!1005))))))

(declare-fun b!247371 () Bool)

(declare-fun e!171352 () Bool)

(declare-fun array_inv!5651 (array!13482) Bool)

(assert (=> b!247371 (= e!171352 (array_inv!5651 (buf!6394 thiss!1005)))))

(declare-fun res!207015 () Bool)

(assert (=> start!53286 (=> (not res!207015) (not e!171351))))

(assert (=> start!53286 (= res!207015 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53286 e!171351))

(assert (=> start!53286 true))

(declare-fun inv!12 (BitStream!10742) Bool)

(assert (=> start!53286 (and (inv!12 thiss!1005) e!171352)))

(declare-fun b!247372 () Bool)

(declare-fun res!207013 () Bool)

(assert (=> b!247372 (=> (not res!207013) (not e!171351))))

(assert (=> b!247372 (= res!207013 (bvsge from!289 nBits!297))))

(declare-fun b!247373 () Bool)

(declare-fun res!207012 () Bool)

(assert (=> b!247373 (=> (not res!207012) (not e!171351))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247373 (= res!207012 (validate_offset_bits!1 ((_ sign_extend 32) (size!5910 (buf!6394 thiss!1005))) ((_ sign_extend 32) (currentByte!11802 thiss!1005)) ((_ sign_extend 32) (currentBit!11797 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53286 res!207015) b!247373))

(assert (= (and b!247373 res!207012) b!247372))

(assert (= (and b!247372 res!207013) b!247369))

(assert (= (and b!247369 (not res!207014)) b!247370))

(assert (= start!53286 b!247371))

(declare-fun m!373103 () Bool)

(assert (=> b!247370 m!373103))

(declare-fun m!373105 () Bool)

(assert (=> b!247369 m!373105))

(declare-fun m!373107 () Bool)

(assert (=> b!247369 m!373107))

(declare-fun m!373109 () Bool)

(assert (=> b!247373 m!373109))

(declare-fun m!373111 () Bool)

(assert (=> b!247371 m!373111))

(declare-fun m!373113 () Bool)

(assert (=> start!53286 m!373113))

(push 1)

(assert (not b!247370))

(assert (not b!247369))

(assert (not b!247373))

(assert (not start!53286))

(assert (not b!247371))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

