; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53698 () Bool)

(assert start!53698)

(declare-fun b!249604 () Bool)

(declare-fun res!208902 () Bool)

(declare-fun e!172971 () Bool)

(assert (=> b!249604 (=> (not res!208902) (not e!172971))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13607 0))(
  ( (array!13608 (arr!6954 (Array (_ BitVec 32) (_ BitVec 8))) (size!5967 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10856 0))(
  ( (BitStream!10857 (buf!6460 array!13607) (currentByte!11891 (_ BitVec 32)) (currentBit!11886 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10856)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249604 (= res!208902 (validate_offset_bits!1 ((_ sign_extend 32) (size!5967 (buf!6460 thiss!1005))) ((_ sign_extend 32) (currentByte!11891 thiss!1005)) ((_ sign_extend 32) (currentBit!11886 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249605 () Bool)

(assert (=> b!249605 (= e!172971 (not true))))

(declare-datatypes ((Unit!18070 0))(
  ( (Unit!18071) )
))
(declare-datatypes ((tuple2!21374 0))(
  ( (tuple2!21375 (_1!11612 Unit!18070) (_2!11612 BitStream!10856)) )
))
(declare-fun lt!388313 () tuple2!21374)

(assert (=> b!249605 (validate_offset_bits!1 ((_ sign_extend 32) (size!5967 (buf!6460 (_2!11612 lt!388313)))) ((_ sign_extend 32) (currentByte!11891 (_2!11612 lt!388313))) ((_ sign_extend 32) (currentBit!11886 (_2!11612 lt!388313))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388311 () Unit!18070)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10856 BitStream!10856 (_ BitVec 64) (_ BitVec 64)) Unit!18070)

(assert (=> b!249605 (= lt!388311 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11612 lt!388313) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!172972 () Bool)

(assert (=> b!249605 e!172972))

(declare-fun res!208904 () Bool)

(assert (=> b!249605 (=> (not res!208904) (not e!172972))))

(assert (=> b!249605 (= res!208904 (= (size!5967 (buf!6460 thiss!1005)) (size!5967 (buf!6460 (_2!11612 lt!388313)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10856 Bool) tuple2!21374)

(assert (=> b!249605 (= lt!388313 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249606 () Bool)

(declare-fun e!172974 () Bool)

(declare-fun array_inv!5708 (array!13607) Bool)

(assert (=> b!249606 (= e!172974 (array_inv!5708 (buf!6460 thiss!1005)))))

(declare-fun b!249607 () Bool)

(declare-fun e!172976 () Bool)

(declare-datatypes ((tuple2!21376 0))(
  ( (tuple2!21377 (_1!11613 BitStream!10856) (_2!11613 Bool)) )
))
(declare-fun lt!388312 () tuple2!21376)

(declare-fun lt!388310 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249607 (= e!172976 (= (bitIndex!0 (size!5967 (buf!6460 (_1!11613 lt!388312))) (currentByte!11891 (_1!11613 lt!388312)) (currentBit!11886 (_1!11613 lt!388312))) lt!388310))))

(declare-fun b!249608 () Bool)

(declare-fun e!172973 () Bool)

(assert (=> b!249608 (= e!172972 e!172973)))

(declare-fun res!208905 () Bool)

(assert (=> b!249608 (=> (not res!208905) (not e!172973))))

(declare-fun lt!388314 () (_ BitVec 64))

(assert (=> b!249608 (= res!208905 (= lt!388310 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388314)))))

(assert (=> b!249608 (= lt!388310 (bitIndex!0 (size!5967 (buf!6460 (_2!11612 lt!388313))) (currentByte!11891 (_2!11612 lt!388313)) (currentBit!11886 (_2!11612 lt!388313))))))

(assert (=> b!249608 (= lt!388314 (bitIndex!0 (size!5967 (buf!6460 thiss!1005)) (currentByte!11891 thiss!1005) (currentBit!11886 thiss!1005)))))

(declare-fun b!249609 () Bool)

(declare-fun res!208906 () Bool)

(assert (=> b!249609 (=> (not res!208906) (not e!172973))))

(declare-fun isPrefixOf!0 (BitStream!10856 BitStream!10856) Bool)

(assert (=> b!249609 (= res!208906 (isPrefixOf!0 thiss!1005 (_2!11612 lt!388313)))))

(declare-fun b!249611 () Bool)

(assert (=> b!249611 (= e!172973 e!172976)))

(declare-fun res!208907 () Bool)

(assert (=> b!249611 (=> (not res!208907) (not e!172976))))

(assert (=> b!249611 (= res!208907 (and (= (_2!11613 lt!388312) bit!26) (= (_1!11613 lt!388312) (_2!11612 lt!388313))))))

(declare-fun readBitPure!0 (BitStream!10856) tuple2!21376)

(declare-fun readerFrom!0 (BitStream!10856 (_ BitVec 32) (_ BitVec 32)) BitStream!10856)

(assert (=> b!249611 (= lt!388312 (readBitPure!0 (readerFrom!0 (_2!11612 lt!388313) (currentBit!11886 thiss!1005) (currentByte!11891 thiss!1005))))))

(declare-fun res!208908 () Bool)

(assert (=> start!53698 (=> (not res!208908) (not e!172971))))

(assert (=> start!53698 (= res!208908 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53698 e!172971))

(assert (=> start!53698 true))

(declare-fun inv!12 (BitStream!10856) Bool)

(assert (=> start!53698 (and (inv!12 thiss!1005) e!172974)))

(declare-fun b!249610 () Bool)

(declare-fun res!208903 () Bool)

(assert (=> b!249610 (=> (not res!208903) (not e!172971))))

(assert (=> b!249610 (= res!208903 (bvslt from!289 nBits!297))))

(assert (= (and start!53698 res!208908) b!249604))

(assert (= (and b!249604 res!208902) b!249610))

(assert (= (and b!249610 res!208903) b!249605))

(assert (= (and b!249605 res!208904) b!249608))

(assert (= (and b!249608 res!208905) b!249609))

(assert (= (and b!249609 res!208906) b!249611))

(assert (= (and b!249611 res!208907) b!249607))

(assert (= start!53698 b!249606))

(declare-fun m!376005 () Bool)

(assert (=> b!249606 m!376005))

(declare-fun m!376007 () Bool)

(assert (=> b!249609 m!376007))

(declare-fun m!376009 () Bool)

(assert (=> b!249608 m!376009))

(declare-fun m!376011 () Bool)

(assert (=> b!249608 m!376011))

(declare-fun m!376013 () Bool)

(assert (=> b!249607 m!376013))

(declare-fun m!376015 () Bool)

(assert (=> b!249611 m!376015))

(assert (=> b!249611 m!376015))

(declare-fun m!376017 () Bool)

(assert (=> b!249611 m!376017))

(declare-fun m!376019 () Bool)

(assert (=> b!249604 m!376019))

(declare-fun m!376021 () Bool)

(assert (=> start!53698 m!376021))

(declare-fun m!376023 () Bool)

(assert (=> b!249605 m!376023))

(declare-fun m!376025 () Bool)

(assert (=> b!249605 m!376025))

(declare-fun m!376027 () Bool)

(assert (=> b!249605 m!376027))

(push 1)

(assert (not b!249607))

(assert (not b!249605))

(assert (not b!249609))

(assert (not b!249604))

(assert (not start!53698))

(assert (not b!249611))

(assert (not b!249606))

(assert (not b!249608))

(check-sat)

