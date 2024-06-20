; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54676 () Bool)

(assert start!54676)

(declare-fun b!256251 () Bool)

(declare-fun res!214838 () Bool)

(declare-fun e!177545 () Bool)

(assert (=> b!256251 (=> (not res!214838) (not e!177545))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!256251 (= res!214838 (bvsge from!289 nBits!297))))

(declare-fun b!256252 () Bool)

(declare-fun res!214840 () Bool)

(assert (=> b!256252 (=> (not res!214840) (not e!177545))))

(declare-datatypes ((array!13823 0))(
  ( (array!13824 (arr!7053 (Array (_ BitVec 32) (_ BitVec 8))) (size!6066 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11054 0))(
  ( (BitStream!11055 (buf!6583 array!13823) (currentByte!12062 (_ BitVec 32)) (currentBit!12057 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11054)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256252 (= res!214840 (validate_offset_bits!1 ((_ sign_extend 32) (size!6066 (buf!6583 thiss!1005))) ((_ sign_extend 32) (currentByte!12062 thiss!1005)) ((_ sign_extend 32) (currentBit!12057 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256253 () Bool)

(declare-fun e!177547 () Bool)

(assert (=> b!256253 (= e!177547 true)))

(declare-datatypes ((tuple2!21928 0))(
  ( (tuple2!21929 (_1!11898 BitStream!11054) (_2!11898 BitStream!11054)) )
))
(declare-fun lt!397672 () tuple2!21928)

(declare-fun reader!0 (BitStream!11054 BitStream!11054) tuple2!21928)

(assert (=> b!256253 (= lt!397672 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!256254 () Bool)

(declare-fun e!177546 () Bool)

(assert (=> b!256254 (= e!177545 (not e!177546))))

(declare-fun res!214842 () Bool)

(assert (=> b!256254 (=> res!214842 e!177546)))

(assert (=> b!256254 (= res!214842 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!11054 BitStream!11054) Bool)

(assert (=> b!256254 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18340 0))(
  ( (Unit!18341) )
))
(declare-fun lt!397673 () Unit!18340)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11054) Unit!18340)

(assert (=> b!256254 (= lt!397673 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!256255 () Bool)

(assert (=> b!256255 (= e!177546 e!177547)))

(declare-fun res!214841 () Bool)

(assert (=> b!256255 (=> res!214841 e!177547)))

(declare-fun lt!397674 () (_ BitVec 64))

(assert (=> b!256255 (= res!214841 (not (= lt!397674 (bvadd lt!397674 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256255 (= lt!397674 (bitIndex!0 (size!6066 (buf!6583 thiss!1005)) (currentByte!12062 thiss!1005) (currentBit!12057 thiss!1005)))))

(declare-fun b!256256 () Bool)

(declare-fun e!177544 () Bool)

(declare-fun array_inv!5807 (array!13823) Bool)

(assert (=> b!256256 (= e!177544 (array_inv!5807 (buf!6583 thiss!1005)))))

(declare-fun res!214839 () Bool)

(assert (=> start!54676 (=> (not res!214839) (not e!177545))))

(assert (=> start!54676 (= res!214839 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54676 e!177545))

(assert (=> start!54676 true))

(declare-fun inv!12 (BitStream!11054) Bool)

(assert (=> start!54676 (and (inv!12 thiss!1005) e!177544)))

(assert (= (and start!54676 res!214839) b!256252))

(assert (= (and b!256252 res!214840) b!256251))

(assert (= (and b!256251 res!214838) b!256254))

(assert (= (and b!256254 (not res!214842)) b!256255))

(assert (= (and b!256255 (not res!214841)) b!256253))

(assert (= start!54676 b!256256))

(declare-fun m!385867 () Bool)

(assert (=> start!54676 m!385867))

(declare-fun m!385869 () Bool)

(assert (=> b!256256 m!385869))

(declare-fun m!385871 () Bool)

(assert (=> b!256252 m!385871))

(declare-fun m!385873 () Bool)

(assert (=> b!256255 m!385873))

(declare-fun m!385875 () Bool)

(assert (=> b!256253 m!385875))

(declare-fun m!385877 () Bool)

(assert (=> b!256254 m!385877))

(declare-fun m!385879 () Bool)

(assert (=> b!256254 m!385879))

(push 1)

(assert (not b!256254))

(assert (not b!256252))

(assert (not b!256253))

(assert (not b!256255))

(assert (not b!256256))

(assert (not start!54676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

