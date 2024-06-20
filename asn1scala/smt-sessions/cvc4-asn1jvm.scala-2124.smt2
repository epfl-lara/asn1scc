; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53734 () Bool)

(assert start!53734)

(declare-fun b!250150 () Bool)

(declare-fun res!209394 () Bool)

(declare-fun e!173389 () Bool)

(assert (=> b!250150 (=> (not res!209394) (not e!173389))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!250150 (= res!209394 (bvslt from!289 nBits!297))))

(declare-fun b!250151 () Bool)

(declare-fun e!173383 () Bool)

(declare-fun e!173390 () Bool)

(assert (=> b!250151 (= e!173383 e!173390)))

(declare-fun res!209397 () Bool)

(assert (=> b!250151 (=> (not res!209397) (not e!173390))))

(declare-datatypes ((array!13643 0))(
  ( (array!13644 (arr!6972 (Array (_ BitVec 32) (_ BitVec 8))) (size!5985 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10892 0))(
  ( (BitStream!10893 (buf!6478 array!13643) (currentByte!11909 (_ BitVec 32)) (currentBit!11904 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21462 0))(
  ( (tuple2!21463 (_1!11656 BitStream!10892) (_2!11656 Bool)) )
))
(declare-fun lt!388736 () tuple2!21462)

(declare-fun bit!26 () Bool)

(declare-datatypes ((Unit!18106 0))(
  ( (Unit!18107) )
))
(declare-datatypes ((tuple2!21464 0))(
  ( (tuple2!21465 (_1!11657 Unit!18106) (_2!11657 BitStream!10892)) )
))
(declare-fun lt!388728 () tuple2!21464)

(assert (=> b!250151 (= res!209397 (and (= (_2!11656 lt!388736) bit!26) (= (_1!11656 lt!388736) (_2!11657 lt!388728))))))

(declare-fun thiss!1005 () BitStream!10892)

(declare-fun readBitPure!0 (BitStream!10892) tuple2!21462)

(declare-fun readerFrom!0 (BitStream!10892 (_ BitVec 32) (_ BitVec 32)) BitStream!10892)

(assert (=> b!250151 (= lt!388736 (readBitPure!0 (readerFrom!0 (_2!11657 lt!388728) (currentBit!11904 thiss!1005) (currentByte!11909 thiss!1005))))))

(declare-fun res!209399 () Bool)

(assert (=> start!53734 (=> (not res!209399) (not e!173389))))

(assert (=> start!53734 (= res!209399 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53734 e!173389))

(assert (=> start!53734 true))

(declare-fun e!173384 () Bool)

(declare-fun inv!12 (BitStream!10892) Bool)

(assert (=> start!53734 (and (inv!12 thiss!1005) e!173384)))

(declare-fun b!250152 () Bool)

(declare-fun res!209403 () Bool)

(assert (=> b!250152 (=> (not res!209403) (not e!173389))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250152 (= res!209403 (validate_offset_bits!1 ((_ sign_extend 32) (size!5985 (buf!6478 thiss!1005))) ((_ sign_extend 32) (currentByte!11909 thiss!1005)) ((_ sign_extend 32) (currentBit!11904 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!250153 () Bool)

(declare-fun e!173387 () Bool)

(declare-fun e!173385 () Bool)

(assert (=> b!250153 (= e!173387 e!173385)))

(declare-fun res!209398 () Bool)

(assert (=> b!250153 (=> (not res!209398) (not e!173385))))

(declare-fun lt!388730 () (_ BitVec 64))

(declare-fun lt!388737 () tuple2!21464)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!250153 (= res!209398 (= (bitIndex!0 (size!5985 (buf!6478 (_2!11657 lt!388737))) (currentByte!11909 (_2!11657 lt!388737)) (currentBit!11904 (_2!11657 lt!388737))) (bvadd (bitIndex!0 (size!5985 (buf!6478 (_2!11657 lt!388728))) (currentByte!11909 (_2!11657 lt!388728)) (currentBit!11904 (_2!11657 lt!388728))) lt!388730)))))

(assert (=> b!250153 (= lt!388730 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!250154 () Bool)

(declare-fun res!209395 () Bool)

(assert (=> b!250154 (=> (not res!209395) (not e!173385))))

(declare-fun isPrefixOf!0 (BitStream!10892 BitStream!10892) Bool)

(assert (=> b!250154 (= res!209395 (isPrefixOf!0 (_2!11657 lt!388728) (_2!11657 lt!388737)))))

(declare-fun b!250155 () Bool)

(declare-fun lt!388731 () tuple2!21462)

(declare-datatypes ((tuple2!21466 0))(
  ( (tuple2!21467 (_1!11658 BitStream!10892) (_2!11658 BitStream!10892)) )
))
(declare-fun lt!388732 () tuple2!21466)

(assert (=> b!250155 (= e!173385 (not (or (not (_2!11656 lt!388731)) (not (= (_1!11656 lt!388731) (_2!11658 lt!388732))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10892 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21462)

(assert (=> b!250155 (= lt!388731 (checkBitsLoopPure!0 (_1!11658 lt!388732) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250155 (validate_offset_bits!1 ((_ sign_extend 32) (size!5985 (buf!6478 (_2!11657 lt!388737)))) ((_ sign_extend 32) (currentByte!11909 (_2!11657 lt!388728))) ((_ sign_extend 32) (currentBit!11904 (_2!11657 lt!388728))) lt!388730)))

(declare-fun lt!388734 () Unit!18106)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10892 array!13643 (_ BitVec 64)) Unit!18106)

(assert (=> b!250155 (= lt!388734 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11657 lt!388728) (buf!6478 (_2!11657 lt!388737)) lt!388730))))

(declare-fun reader!0 (BitStream!10892 BitStream!10892) tuple2!21466)

(assert (=> b!250155 (= lt!388732 (reader!0 (_2!11657 lt!388728) (_2!11657 lt!388737)))))

(declare-fun b!250156 () Bool)

(assert (=> b!250156 (= e!173389 (not true))))

(assert (=> b!250156 (isPrefixOf!0 thiss!1005 (_2!11657 lt!388737))))

(declare-fun lt!388727 () Unit!18106)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10892 BitStream!10892 BitStream!10892) Unit!18106)

(assert (=> b!250156 (= lt!388727 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11657 lt!388728) (_2!11657 lt!388737)))))

(assert (=> b!250156 e!173387))

(declare-fun res!209400 () Bool)

(assert (=> b!250156 (=> (not res!209400) (not e!173387))))

(assert (=> b!250156 (= res!209400 (= (size!5985 (buf!6478 (_2!11657 lt!388728))) (size!5985 (buf!6478 (_2!11657 lt!388737)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10892 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21464)

(assert (=> b!250156 (= lt!388737 (appendNBitsLoop!0 (_2!11657 lt!388728) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250156 (validate_offset_bits!1 ((_ sign_extend 32) (size!5985 (buf!6478 (_2!11657 lt!388728)))) ((_ sign_extend 32) (currentByte!11909 (_2!11657 lt!388728))) ((_ sign_extend 32) (currentBit!11904 (_2!11657 lt!388728))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388733 () Unit!18106)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10892 BitStream!10892 (_ BitVec 64) (_ BitVec 64)) Unit!18106)

(assert (=> b!250156 (= lt!388733 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11657 lt!388728) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!173388 () Bool)

(assert (=> b!250156 e!173388))

(declare-fun res!209402 () Bool)

(assert (=> b!250156 (=> (not res!209402) (not e!173388))))

(assert (=> b!250156 (= res!209402 (= (size!5985 (buf!6478 thiss!1005)) (size!5985 (buf!6478 (_2!11657 lt!388728)))))))

(declare-fun appendBit!0 (BitStream!10892 Bool) tuple2!21464)

(assert (=> b!250156 (= lt!388728 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!250157 () Bool)

(declare-fun array_inv!5726 (array!13643) Bool)

(assert (=> b!250157 (= e!173384 (array_inv!5726 (buf!6478 thiss!1005)))))

(declare-fun b!250158 () Bool)

(declare-fun res!209401 () Bool)

(assert (=> b!250158 (=> (not res!209401) (not e!173383))))

(assert (=> b!250158 (= res!209401 (isPrefixOf!0 thiss!1005 (_2!11657 lt!388728)))))

(declare-fun b!250159 () Bool)

(assert (=> b!250159 (= e!173388 e!173383)))

(declare-fun res!209396 () Bool)

(assert (=> b!250159 (=> (not res!209396) (not e!173383))))

(declare-fun lt!388735 () (_ BitVec 64))

(declare-fun lt!388729 () (_ BitVec 64))

(assert (=> b!250159 (= res!209396 (= lt!388735 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388729)))))

(assert (=> b!250159 (= lt!388735 (bitIndex!0 (size!5985 (buf!6478 (_2!11657 lt!388728))) (currentByte!11909 (_2!11657 lt!388728)) (currentBit!11904 (_2!11657 lt!388728))))))

(assert (=> b!250159 (= lt!388729 (bitIndex!0 (size!5985 (buf!6478 thiss!1005)) (currentByte!11909 thiss!1005) (currentBit!11904 thiss!1005)))))

(declare-fun b!250160 () Bool)

(assert (=> b!250160 (= e!173390 (= (bitIndex!0 (size!5985 (buf!6478 (_1!11656 lt!388736))) (currentByte!11909 (_1!11656 lt!388736)) (currentBit!11904 (_1!11656 lt!388736))) lt!388735))))

(assert (= (and start!53734 res!209399) b!250152))

(assert (= (and b!250152 res!209403) b!250150))

(assert (= (and b!250150 res!209394) b!250156))

(assert (= (and b!250156 res!209402) b!250159))

(assert (= (and b!250159 res!209396) b!250158))

(assert (= (and b!250158 res!209401) b!250151))

(assert (= (and b!250151 res!209397) b!250160))

(assert (= (and b!250156 res!209400) b!250153))

(assert (= (and b!250153 res!209398) b!250154))

(assert (= (and b!250154 res!209395) b!250155))

(assert (= start!53734 b!250157))

(declare-fun m!376569 () Bool)

(assert (=> b!250154 m!376569))

(declare-fun m!376571 () Bool)

(assert (=> b!250156 m!376571))

(declare-fun m!376573 () Bool)

(assert (=> b!250156 m!376573))

(declare-fun m!376575 () Bool)

(assert (=> b!250156 m!376575))

(declare-fun m!376577 () Bool)

(assert (=> b!250156 m!376577))

(declare-fun m!376579 () Bool)

(assert (=> b!250156 m!376579))

(declare-fun m!376581 () Bool)

(assert (=> b!250156 m!376581))

(declare-fun m!376583 () Bool)

(assert (=> b!250155 m!376583))

(declare-fun m!376585 () Bool)

(assert (=> b!250155 m!376585))

(declare-fun m!376587 () Bool)

(assert (=> b!250155 m!376587))

(declare-fun m!376589 () Bool)

(assert (=> b!250155 m!376589))

(declare-fun m!376591 () Bool)

(assert (=> b!250158 m!376591))

(declare-fun m!376593 () Bool)

(assert (=> b!250160 m!376593))

(declare-fun m!376595 () Bool)

(assert (=> b!250157 m!376595))

(declare-fun m!376597 () Bool)

(assert (=> start!53734 m!376597))

(declare-fun m!376599 () Bool)

(assert (=> b!250152 m!376599))

(declare-fun m!376601 () Bool)

(assert (=> b!250153 m!376601))

(declare-fun m!376603 () Bool)

(assert (=> b!250153 m!376603))

(assert (=> b!250159 m!376603))

(declare-fun m!376605 () Bool)

(assert (=> b!250159 m!376605))

(declare-fun m!376607 () Bool)

(assert (=> b!250151 m!376607))

(assert (=> b!250151 m!376607))

(declare-fun m!376609 () Bool)

(assert (=> b!250151 m!376609))

(push 1)

(assert (not b!250151))

(assert (not b!250152))

(assert (not b!250158))

(assert (not start!53734))

(assert (not b!250153))

(assert (not b!250156))

(assert (not b!250155))

(assert (not b!250157))

(assert (not b!250154))

(assert (not b!250159))

(assert (not b!250160))

(check-sat)

