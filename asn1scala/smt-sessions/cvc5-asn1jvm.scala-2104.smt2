; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53346 () Bool)

(assert start!53346)

(declare-fun res!207271 () Bool)

(declare-fun e!171602 () Bool)

(assert (=> start!53346 (=> (not res!207271) (not e!171602))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53346 (= res!207271 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53346 e!171602))

(assert (=> start!53346 true))

(declare-datatypes ((array!13516 0))(
  ( (array!13517 (arr!6913 (Array (_ BitVec 32) (_ BitVec 8))) (size!5926 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10774 0))(
  ( (BitStream!10775 (buf!6410 array!13516) (currentByte!11823 (_ BitVec 32)) (currentBit!11818 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10774)

(declare-fun e!171599 () Bool)

(declare-fun inv!12 (BitStream!10774) Bool)

(assert (=> start!53346 (and (inv!12 thiss!1005) e!171599)))

(declare-fun b!247674 () Bool)

(declare-fun e!171601 () Bool)

(assert (=> b!247674 (= e!171601 true)))

(declare-datatypes ((Unit!17970 0))(
  ( (Unit!17971) )
))
(declare-fun lt!385979 () Unit!17970)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10774 array!13516 (_ BitVec 64)) Unit!17970)

(assert (=> b!247674 (= lt!385979 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6410 thiss!1005) (bvsub nBits!297 from!289)))))

(declare-datatypes ((tuple2!21240 0))(
  ( (tuple2!21241 (_1!11542 BitStream!10774) (_2!11542 BitStream!10774)) )
))
(declare-fun lt!385978 () tuple2!21240)

(declare-fun reader!0 (BitStream!10774 BitStream!10774) tuple2!21240)

(assert (=> b!247674 (= lt!385978 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!247675 () Bool)

(declare-fun array_inv!5667 (array!13516) Bool)

(assert (=> b!247675 (= e!171599 (array_inv!5667 (buf!6410 thiss!1005)))))

(declare-fun b!247676 () Bool)

(declare-fun res!207270 () Bool)

(assert (=> b!247676 (=> (not res!207270) (not e!171602))))

(assert (=> b!247676 (= res!207270 (bvsge from!289 nBits!297))))

(declare-fun b!247677 () Bool)

(declare-fun res!207272 () Bool)

(assert (=> b!247677 (=> (not res!207272) (not e!171602))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247677 (= res!207272 (validate_offset_bits!1 ((_ sign_extend 32) (size!5926 (buf!6410 thiss!1005))) ((_ sign_extend 32) (currentByte!11823 thiss!1005)) ((_ sign_extend 32) (currentBit!11818 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247678 () Bool)

(declare-fun e!171600 () Bool)

(assert (=> b!247678 (= e!171602 (not e!171600))))

(declare-fun res!207269 () Bool)

(assert (=> b!247678 (=> res!207269 e!171600)))

(assert (=> b!247678 (= res!207269 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10774 BitStream!10774) Bool)

(assert (=> b!247678 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!385977 () Unit!17970)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10774) Unit!17970)

(assert (=> b!247678 (= lt!385977 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247679 () Bool)

(assert (=> b!247679 (= e!171600 e!171601)))

(declare-fun res!207273 () Bool)

(assert (=> b!247679 (=> res!207273 e!171601)))

(declare-fun lt!385980 () (_ BitVec 64))

(assert (=> b!247679 (= res!207273 (not (= lt!385980 (bvadd lt!385980 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247679 (= lt!385980 (bitIndex!0 (size!5926 (buf!6410 thiss!1005)) (currentByte!11823 thiss!1005) (currentBit!11818 thiss!1005)))))

(assert (= (and start!53346 res!207271) b!247677))

(assert (= (and b!247677 res!207272) b!247676))

(assert (= (and b!247676 res!207270) b!247678))

(assert (= (and b!247678 (not res!207269)) b!247679))

(assert (= (and b!247679 (not res!207273)) b!247674))

(assert (= start!53346 b!247675))

(declare-fun m!373341 () Bool)

(assert (=> b!247678 m!373341))

(declare-fun m!373343 () Bool)

(assert (=> b!247678 m!373343))

(declare-fun m!373345 () Bool)

(assert (=> b!247675 m!373345))

(declare-fun m!373347 () Bool)

(assert (=> b!247677 m!373347))

(declare-fun m!373349 () Bool)

(assert (=> start!53346 m!373349))

(declare-fun m!373351 () Bool)

(assert (=> b!247679 m!373351))

(declare-fun m!373353 () Bool)

(assert (=> b!247674 m!373353))

(declare-fun m!373355 () Bool)

(assert (=> b!247674 m!373355))

(push 1)

(assert (not b!247677))

(assert (not b!247675))

(assert (not b!247679))

(assert (not start!53346))

(assert (not b!247674))

(assert (not b!247678))

(check-sat)

(pop 1)

