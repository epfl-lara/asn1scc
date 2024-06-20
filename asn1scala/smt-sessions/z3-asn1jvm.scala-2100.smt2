; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53324 () Bool)

(assert start!53324)

(declare-fun b!247476 () Bool)

(declare-fun e!171436 () Bool)

(declare-fun e!171433 () Bool)

(assert (=> b!247476 (= e!171436 (not e!171433))))

(declare-fun res!207108 () Bool)

(assert (=> b!247476 (=> res!207108 e!171433)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!247476 (= res!207108 (not (= nBits!297 from!289)))))

(declare-datatypes ((array!13494 0))(
  ( (array!13495 (arr!6902 (Array (_ BitVec 32) (_ BitVec 8))) (size!5915 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10752 0))(
  ( (BitStream!10753 (buf!6399 array!13494) (currentByte!11812 (_ BitVec 32)) (currentBit!11807 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10752)

(declare-fun isPrefixOf!0 (BitStream!10752 BitStream!10752) Bool)

(assert (=> b!247476 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17948 0))(
  ( (Unit!17949) )
))
(declare-fun lt!385868 () Unit!17948)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10752) Unit!17948)

(assert (=> b!247476 (= lt!385868 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247477 () Bool)

(declare-fun e!171437 () Bool)

(assert (=> b!247477 (= e!171437 true)))

(declare-datatypes ((tuple2!21218 0))(
  ( (tuple2!21219 (_1!11531 BitStream!10752) (_2!11531 BitStream!10752)) )
))
(declare-fun lt!385867 () tuple2!21218)

(declare-fun reader!0 (BitStream!10752 BitStream!10752) tuple2!21218)

(assert (=> b!247477 (= lt!385867 (reader!0 thiss!1005 thiss!1005))))

(declare-fun res!207107 () Bool)

(assert (=> start!53324 (=> (not res!207107) (not e!171436))))

(assert (=> start!53324 (= res!207107 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53324 e!171436))

(assert (=> start!53324 true))

(declare-fun e!171435 () Bool)

(declare-fun inv!12 (BitStream!10752) Bool)

(assert (=> start!53324 (and (inv!12 thiss!1005) e!171435)))

(declare-fun b!247478 () Bool)

(declare-fun res!207106 () Bool)

(assert (=> b!247478 (=> (not res!207106) (not e!171436))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247478 (= res!207106 (validate_offset_bits!1 ((_ sign_extend 32) (size!5915 (buf!6399 thiss!1005))) ((_ sign_extend 32) (currentByte!11812 thiss!1005)) ((_ sign_extend 32) (currentBit!11807 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247479 () Bool)

(declare-fun array_inv!5656 (array!13494) Bool)

(assert (=> b!247479 (= e!171435 (array_inv!5656 (buf!6399 thiss!1005)))))

(declare-fun b!247480 () Bool)

(declare-fun res!207105 () Bool)

(assert (=> b!247480 (=> (not res!207105) (not e!171436))))

(assert (=> b!247480 (= res!207105 (bvsge from!289 nBits!297))))

(declare-fun b!247481 () Bool)

(assert (=> b!247481 (= e!171433 e!171437)))

(declare-fun res!207104 () Bool)

(assert (=> b!247481 (=> res!207104 e!171437)))

(declare-fun lt!385869 () (_ BitVec 64))

(assert (=> b!247481 (= res!207104 (not (= lt!385869 (bvadd lt!385869 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247481 (= lt!385869 (bitIndex!0 (size!5915 (buf!6399 thiss!1005)) (currentByte!11812 thiss!1005) (currentBit!11807 thiss!1005)))))

(assert (= (and start!53324 res!207107) b!247478))

(assert (= (and b!247478 res!207106) b!247480))

(assert (= (and b!247480 res!207105) b!247476))

(assert (= (and b!247476 (not res!207108)) b!247481))

(assert (= (and b!247481 (not res!207104)) b!247477))

(assert (= start!53324 b!247479))

(declare-fun m!373181 () Bool)

(assert (=> b!247479 m!373181))

(declare-fun m!373183 () Bool)

(assert (=> b!247477 m!373183))

(declare-fun m!373185 () Bool)

(assert (=> b!247481 m!373185))

(declare-fun m!373187 () Bool)

(assert (=> b!247478 m!373187))

(declare-fun m!373189 () Bool)

(assert (=> b!247476 m!373189))

(declare-fun m!373191 () Bool)

(assert (=> b!247476 m!373191))

(declare-fun m!373193 () Bool)

(assert (=> start!53324 m!373193))

(check-sat (not b!247478) (not b!247481) (not start!53324) (not b!247477) (not b!247479) (not b!247476))
