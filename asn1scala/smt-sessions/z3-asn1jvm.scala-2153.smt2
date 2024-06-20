; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54686 () Bool)

(assert start!54686)

(declare-fun b!256341 () Bool)

(declare-fun res!214913 () Bool)

(declare-fun e!177622 () Bool)

(assert (=> b!256341 (=> (not res!214913) (not e!177622))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!256341 (= res!214913 (bvsge from!289 nBits!297))))

(declare-fun b!256342 () Bool)

(declare-fun e!177619 () Bool)

(assert (=> b!256342 (= e!177619 true)))

(declare-datatypes ((array!13833 0))(
  ( (array!13834 (arr!7058 (Array (_ BitVec 32) (_ BitVec 8))) (size!6071 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11064 0))(
  ( (BitStream!11065 (buf!6588 array!13833) (currentByte!12067 (_ BitVec 32)) (currentBit!12062 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21938 0))(
  ( (tuple2!21939 (_1!11903 BitStream!11064) (_2!11903 BitStream!11064)) )
))
(declare-fun lt!397719 () tuple2!21938)

(declare-fun thiss!1005 () BitStream!11064)

(declare-fun reader!0 (BitStream!11064 BitStream!11064) tuple2!21938)

(assert (=> b!256342 (= lt!397719 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!256343 () Bool)

(declare-fun e!177623 () Bool)

(assert (=> b!256343 (= e!177623 e!177619)))

(declare-fun res!214915 () Bool)

(assert (=> b!256343 (=> res!214915 e!177619)))

(declare-fun lt!397717 () (_ BitVec 64))

(assert (=> b!256343 (= res!214915 (not (= lt!397717 (bvadd lt!397717 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256343 (= lt!397717 (bitIndex!0 (size!6071 (buf!6588 thiss!1005)) (currentByte!12067 thiss!1005) (currentBit!12062 thiss!1005)))))

(declare-fun b!256344 () Bool)

(declare-fun res!214916 () Bool)

(assert (=> b!256344 (=> (not res!214916) (not e!177622))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256344 (= res!214916 (validate_offset_bits!1 ((_ sign_extend 32) (size!6071 (buf!6588 thiss!1005))) ((_ sign_extend 32) (currentByte!12067 thiss!1005)) ((_ sign_extend 32) (currentBit!12062 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!214914 () Bool)

(assert (=> start!54686 (=> (not res!214914) (not e!177622))))

(assert (=> start!54686 (= res!214914 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54686 e!177622))

(assert (=> start!54686 true))

(declare-fun e!177621 () Bool)

(declare-fun inv!12 (BitStream!11064) Bool)

(assert (=> start!54686 (and (inv!12 thiss!1005) e!177621)))

(declare-fun b!256345 () Bool)

(assert (=> b!256345 (= e!177622 (not e!177623))))

(declare-fun res!214917 () Bool)

(assert (=> b!256345 (=> res!214917 e!177623)))

(assert (=> b!256345 (= res!214917 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!11064 BitStream!11064) Bool)

(assert (=> b!256345 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18350 0))(
  ( (Unit!18351) )
))
(declare-fun lt!397718 () Unit!18350)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11064) Unit!18350)

(assert (=> b!256345 (= lt!397718 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!256346 () Bool)

(declare-fun array_inv!5812 (array!13833) Bool)

(assert (=> b!256346 (= e!177621 (array_inv!5812 (buf!6588 thiss!1005)))))

(assert (= (and start!54686 res!214914) b!256344))

(assert (= (and b!256344 res!214916) b!256341))

(assert (= (and b!256341 res!214913) b!256345))

(assert (= (and b!256345 (not res!214917)) b!256343))

(assert (= (and b!256343 (not res!214915)) b!256342))

(assert (= start!54686 b!256346))

(declare-fun m!385937 () Bool)

(assert (=> b!256342 m!385937))

(declare-fun m!385939 () Bool)

(assert (=> start!54686 m!385939))

(declare-fun m!385941 () Bool)

(assert (=> b!256346 m!385941))

(declare-fun m!385943 () Bool)

(assert (=> b!256344 m!385943))

(declare-fun m!385945 () Bool)

(assert (=> b!256345 m!385945))

(declare-fun m!385947 () Bool)

(assert (=> b!256345 m!385947))

(declare-fun m!385949 () Bool)

(assert (=> b!256343 m!385949))

(check-sat (not start!54686) (not b!256345) (not b!256342) (not b!256346) (not b!256344) (not b!256343))
