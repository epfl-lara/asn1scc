; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53348 () Bool)

(assert start!53348)

(declare-fun b!247692 () Bool)

(declare-fun res!207284 () Bool)

(declare-fun e!171617 () Bool)

(assert (=> b!247692 (=> (not res!207284) (not e!171617))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!247692 (= res!207284 (bvsge from!289 nBits!297))))

(declare-fun b!247693 () Bool)

(declare-fun e!171615 () Bool)

(declare-fun e!171613 () Bool)

(assert (=> b!247693 (= e!171615 e!171613)))

(declare-fun res!207286 () Bool)

(assert (=> b!247693 (=> res!207286 e!171613)))

(declare-fun lt!385991 () (_ BitVec 64))

(assert (=> b!247693 (= res!207286 (not (= lt!385991 (bvadd lt!385991 (bvsub nBits!297 from!289)))))))

(declare-datatypes ((array!13518 0))(
  ( (array!13519 (arr!6914 (Array (_ BitVec 32) (_ BitVec 8))) (size!5927 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10776 0))(
  ( (BitStream!10777 (buf!6411 array!13518) (currentByte!11824 (_ BitVec 32)) (currentBit!11819 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10776)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247693 (= lt!385991 (bitIndex!0 (size!5927 (buf!6411 thiss!1005)) (currentByte!11824 thiss!1005) (currentBit!11819 thiss!1005)))))

(declare-fun b!247694 () Bool)

(assert (=> b!247694 (= e!171617 (not e!171615))))

(declare-fun res!207285 () Bool)

(assert (=> b!247694 (=> res!207285 e!171615)))

(assert (=> b!247694 (= res!207285 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10776 BitStream!10776) Bool)

(assert (=> b!247694 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17972 0))(
  ( (Unit!17973) )
))
(declare-fun lt!385990 () Unit!17972)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10776) Unit!17972)

(assert (=> b!247694 (= lt!385990 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247696 () Bool)

(assert (=> b!247696 (= e!171613 true)))

(declare-fun lt!385992 () Unit!17972)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10776 array!13518 (_ BitVec 64)) Unit!17972)

(assert (=> b!247696 (= lt!385992 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6411 thiss!1005) (bvsub nBits!297 from!289)))))

(declare-datatypes ((tuple2!21242 0))(
  ( (tuple2!21243 (_1!11543 BitStream!10776) (_2!11543 BitStream!10776)) )
))
(declare-fun lt!385989 () tuple2!21242)

(declare-fun reader!0 (BitStream!10776 BitStream!10776) tuple2!21242)

(assert (=> b!247696 (= lt!385989 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!247697 () Bool)

(declare-fun res!207288 () Bool)

(assert (=> b!247697 (=> (not res!207288) (not e!171617))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247697 (= res!207288 (validate_offset_bits!1 ((_ sign_extend 32) (size!5927 (buf!6411 thiss!1005))) ((_ sign_extend 32) (currentByte!11824 thiss!1005)) ((_ sign_extend 32) (currentBit!11819 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!207287 () Bool)

(assert (=> start!53348 (=> (not res!207287) (not e!171617))))

(assert (=> start!53348 (= res!207287 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53348 e!171617))

(assert (=> start!53348 true))

(declare-fun e!171614 () Bool)

(declare-fun inv!12 (BitStream!10776) Bool)

(assert (=> start!53348 (and (inv!12 thiss!1005) e!171614)))

(declare-fun b!247695 () Bool)

(declare-fun array_inv!5668 (array!13518) Bool)

(assert (=> b!247695 (= e!171614 (array_inv!5668 (buf!6411 thiss!1005)))))

(assert (= (and start!53348 res!207287) b!247697))

(assert (= (and b!247697 res!207288) b!247692))

(assert (= (and b!247692 res!207284) b!247694))

(assert (= (and b!247694 (not res!207285)) b!247693))

(assert (= (and b!247693 (not res!207286)) b!247696))

(assert (= start!53348 b!247695))

(declare-fun m!373357 () Bool)

(assert (=> b!247693 m!373357))

(declare-fun m!373359 () Bool)

(assert (=> b!247695 m!373359))

(declare-fun m!373361 () Bool)

(assert (=> b!247697 m!373361))

(declare-fun m!373363 () Bool)

(assert (=> b!247694 m!373363))

(declare-fun m!373365 () Bool)

(assert (=> b!247694 m!373365))

(declare-fun m!373367 () Bool)

(assert (=> start!53348 m!373367))

(declare-fun m!373369 () Bool)

(assert (=> b!247696 m!373369))

(declare-fun m!373371 () Bool)

(assert (=> b!247696 m!373371))

(check-sat (not b!247697) (not b!247694) (not b!247693) (not start!53348) (not b!247695) (not b!247696))
