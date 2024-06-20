; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53330 () Bool)

(assert start!53330)

(declare-fun b!247530 () Bool)

(declare-fun res!207152 () Bool)

(declare-fun e!171478 () Bool)

(assert (=> b!247530 (=> (not res!207152) (not e!171478))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!247530 (= res!207152 (bvsge from!289 nBits!297))))

(declare-fun b!247531 () Bool)

(declare-fun e!171479 () Bool)

(assert (=> b!247531 (= e!171478 (not e!171479))))

(declare-fun res!207150 () Bool)

(assert (=> b!247531 (=> res!207150 e!171479)))

(assert (=> b!247531 (= res!207150 (not (= nBits!297 from!289)))))

(declare-datatypes ((array!13500 0))(
  ( (array!13501 (arr!6905 (Array (_ BitVec 32) (_ BitVec 8))) (size!5918 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10758 0))(
  ( (BitStream!10759 (buf!6402 array!13500) (currentByte!11815 (_ BitVec 32)) (currentBit!11810 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10758)

(declare-fun isPrefixOf!0 (BitStream!10758 BitStream!10758) Bool)

(assert (=> b!247531 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17954 0))(
  ( (Unit!17955) )
))
(declare-fun lt!385896 () Unit!17954)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10758) Unit!17954)

(assert (=> b!247531 (= lt!385896 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247532 () Bool)

(declare-fun res!207151 () Bool)

(assert (=> b!247532 (=> (not res!207151) (not e!171478))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247532 (= res!207151 (validate_offset_bits!1 ((_ sign_extend 32) (size!5918 (buf!6402 thiss!1005))) ((_ sign_extend 32) (currentByte!11815 thiss!1005)) ((_ sign_extend 32) (currentBit!11810 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!207149 () Bool)

(assert (=> start!53330 (=> (not res!207149) (not e!171478))))

(assert (=> start!53330 (= res!207149 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53330 e!171478))

(assert (=> start!53330 true))

(declare-fun e!171480 () Bool)

(declare-fun inv!12 (BitStream!10758) Bool)

(assert (=> start!53330 (and (inv!12 thiss!1005) e!171480)))

(declare-fun b!247533 () Bool)

(declare-fun e!171481 () Bool)

(assert (=> b!247533 (= e!171481 true)))

(declare-datatypes ((tuple2!21224 0))(
  ( (tuple2!21225 (_1!11534 BitStream!10758) (_2!11534 BitStream!10758)) )
))
(declare-fun lt!385895 () tuple2!21224)

(declare-fun reader!0 (BitStream!10758 BitStream!10758) tuple2!21224)

(assert (=> b!247533 (= lt!385895 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!247534 () Bool)

(declare-fun array_inv!5659 (array!13500) Bool)

(assert (=> b!247534 (= e!171480 (array_inv!5659 (buf!6402 thiss!1005)))))

(declare-fun b!247535 () Bool)

(assert (=> b!247535 (= e!171479 e!171481)))

(declare-fun res!207153 () Bool)

(assert (=> b!247535 (=> res!207153 e!171481)))

(declare-fun lt!385894 () (_ BitVec 64))

(assert (=> b!247535 (= res!207153 (not (= lt!385894 (bvadd lt!385894 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247535 (= lt!385894 (bitIndex!0 (size!5918 (buf!6402 thiss!1005)) (currentByte!11815 thiss!1005) (currentBit!11810 thiss!1005)))))

(assert (= (and start!53330 res!207149) b!247532))

(assert (= (and b!247532 res!207151) b!247530))

(assert (= (and b!247530 res!207152) b!247531))

(assert (= (and b!247531 (not res!207150)) b!247535))

(assert (= (and b!247535 (not res!207153)) b!247533))

(assert (= start!53330 b!247534))

(declare-fun m!373223 () Bool)

(assert (=> start!53330 m!373223))

(declare-fun m!373225 () Bool)

(assert (=> b!247535 m!373225))

(declare-fun m!373227 () Bool)

(assert (=> b!247532 m!373227))

(declare-fun m!373229 () Bool)

(assert (=> b!247534 m!373229))

(declare-fun m!373231 () Bool)

(assert (=> b!247531 m!373231))

(declare-fun m!373233 () Bool)

(assert (=> b!247531 m!373233))

(declare-fun m!373235 () Bool)

(assert (=> b!247533 m!373235))

(check-sat (not b!247535) (not b!247532) (not start!53330) (not b!247531) (not b!247534) (not b!247533))
