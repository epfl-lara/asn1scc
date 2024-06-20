; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53342 () Bool)

(assert start!53342)

(declare-fun b!247638 () Bool)

(declare-fun e!171569 () Bool)

(declare-datatypes ((array!13512 0))(
  ( (array!13513 (arr!6911 (Array (_ BitVec 32) (_ BitVec 8))) (size!5924 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10770 0))(
  ( (BitStream!10771 (buf!6408 array!13512) (currentByte!11821 (_ BitVec 32)) (currentBit!11816 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10770)

(declare-fun array_inv!5665 (array!13512) Bool)

(assert (=> b!247638 (= e!171569 (array_inv!5665 (buf!6408 thiss!1005)))))

(declare-fun b!247639 () Bool)

(declare-fun res!207241 () Bool)

(declare-fun e!171568 () Bool)

(assert (=> b!247639 (=> (not res!207241) (not e!171568))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247639 (= res!207241 (validate_offset_bits!1 ((_ sign_extend 32) (size!5924 (buf!6408 thiss!1005))) ((_ sign_extend 32) (currentByte!11821 thiss!1005)) ((_ sign_extend 32) (currentBit!11816 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247641 () Bool)

(declare-fun e!171571 () Bool)

(declare-fun e!171572 () Bool)

(assert (=> b!247641 (= e!171571 e!171572)))

(declare-fun res!207240 () Bool)

(assert (=> b!247641 (=> res!207240 e!171572)))

(declare-fun lt!385954 () (_ BitVec 64))

(assert (=> b!247641 (= res!207240 (not (= lt!385954 (bvadd lt!385954 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247641 (= lt!385954 (bitIndex!0 (size!5924 (buf!6408 thiss!1005)) (currentByte!11821 thiss!1005) (currentBit!11816 thiss!1005)))))

(declare-fun b!247642 () Bool)

(declare-fun res!207239 () Bool)

(assert (=> b!247642 (=> (not res!207239) (not e!171568))))

(assert (=> b!247642 (= res!207239 (bvsge from!289 nBits!297))))

(declare-fun b!247643 () Bool)

(assert (=> b!247643 (= e!171568 (not e!171571))))

(declare-fun res!207242 () Bool)

(assert (=> b!247643 (=> res!207242 e!171571)))

(assert (=> b!247643 (= res!207242 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10770 BitStream!10770) Bool)

(assert (=> b!247643 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17966 0))(
  ( (Unit!17967) )
))
(declare-fun lt!385953 () Unit!17966)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10770) Unit!17966)

(assert (=> b!247643 (= lt!385953 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247640 () Bool)

(assert (=> b!247640 (= e!171572 true)))

(declare-fun lt!385956 () Unit!17966)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10770 array!13512 (_ BitVec 64)) Unit!17966)

(assert (=> b!247640 (= lt!385956 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6408 thiss!1005) (bvsub nBits!297 from!289)))))

(declare-datatypes ((tuple2!21236 0))(
  ( (tuple2!21237 (_1!11540 BitStream!10770) (_2!11540 BitStream!10770)) )
))
(declare-fun lt!385955 () tuple2!21236)

(declare-fun reader!0 (BitStream!10770 BitStream!10770) tuple2!21236)

(assert (=> b!247640 (= lt!385955 (reader!0 thiss!1005 thiss!1005))))

(declare-fun res!207243 () Bool)

(assert (=> start!53342 (=> (not res!207243) (not e!171568))))

(assert (=> start!53342 (= res!207243 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53342 e!171568))

(assert (=> start!53342 true))

(declare-fun inv!12 (BitStream!10770) Bool)

(assert (=> start!53342 (and (inv!12 thiss!1005) e!171569)))

(assert (= (and start!53342 res!207243) b!247639))

(assert (= (and b!247639 res!207241) b!247642))

(assert (= (and b!247642 res!207239) b!247643))

(assert (= (and b!247643 (not res!207242)) b!247641))

(assert (= (and b!247641 (not res!207240)) b!247640))

(assert (= start!53342 b!247638))

(declare-fun m!373309 () Bool)

(assert (=> b!247641 m!373309))

(declare-fun m!373311 () Bool)

(assert (=> b!247640 m!373311))

(declare-fun m!373313 () Bool)

(assert (=> b!247640 m!373313))

(declare-fun m!373315 () Bool)

(assert (=> b!247638 m!373315))

(declare-fun m!373317 () Bool)

(assert (=> b!247639 m!373317))

(declare-fun m!373319 () Bool)

(assert (=> b!247643 m!373319))

(declare-fun m!373321 () Bool)

(assert (=> b!247643 m!373321))

(declare-fun m!373323 () Bool)

(assert (=> start!53342 m!373323))

(check-sat (not b!247643) (not b!247639) (not b!247641) (not b!247640) (not b!247638) (not start!53342))
