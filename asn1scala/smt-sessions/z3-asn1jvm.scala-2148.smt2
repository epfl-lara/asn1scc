; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54656 () Bool)

(assert start!54656)

(declare-fun b!256084 () Bool)

(declare-fun e!177407 () Bool)

(declare-datatypes ((array!13803 0))(
  ( (array!13804 (arr!7043 (Array (_ BitVec 32) (_ BitVec 8))) (size!6056 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11034 0))(
  ( (BitStream!11035 (buf!6573 array!13803) (currentByte!12052 (_ BitVec 32)) (currentBit!12047 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11034)

(declare-fun array_inv!5797 (array!13803) Bool)

(assert (=> b!256084 (= e!177407 (array_inv!5797 (buf!6573 thiss!1005)))))

(declare-fun b!256085 () Bool)

(declare-fun e!177409 () Bool)

(declare-fun e!177410 () Bool)

(assert (=> b!256085 (= e!177409 (not e!177410))))

(declare-fun res!214703 () Bool)

(assert (=> b!256085 (=> res!214703 e!177410)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!256085 (= res!214703 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!11034 BitStream!11034) Bool)

(assert (=> b!256085 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18320 0))(
  ( (Unit!18321) )
))
(declare-fun lt!397586 () Unit!18320)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11034) Unit!18320)

(assert (=> b!256085 (= lt!397586 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!256086 () Bool)

(declare-fun res!214702 () Bool)

(assert (=> b!256086 (=> (not res!214702) (not e!177409))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256086 (= res!214702 (validate_offset_bits!1 ((_ sign_extend 32) (size!6056 (buf!6573 thiss!1005))) ((_ sign_extend 32) (currentByte!12052 thiss!1005)) ((_ sign_extend 32) (currentBit!12047 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!214701 () Bool)

(assert (=> start!54656 (=> (not res!214701) (not e!177409))))

(assert (=> start!54656 (= res!214701 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54656 e!177409))

(assert (=> start!54656 true))

(declare-fun inv!12 (BitStream!11034) Bool)

(assert (=> start!54656 (and (inv!12 thiss!1005) e!177407)))

(declare-fun b!256087 () Bool)

(assert (=> b!256087 (= e!177410 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!397587 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256087 (= lt!397587 (bitIndex!0 (size!6056 (buf!6573 thiss!1005)) (currentByte!12052 thiss!1005) (currentBit!12047 thiss!1005)))))

(declare-fun b!256088 () Bool)

(declare-fun res!214704 () Bool)

(assert (=> b!256088 (=> (not res!214704) (not e!177409))))

(assert (=> b!256088 (= res!214704 (bvsge from!289 nBits!297))))

(assert (= (and start!54656 res!214701) b!256086))

(assert (= (and b!256086 res!214702) b!256088))

(assert (= (and b!256088 res!214704) b!256085))

(assert (= (and b!256085 (not res!214703)) b!256087))

(assert (= start!54656 b!256084))

(declare-fun m!385737 () Bool)

(assert (=> b!256086 m!385737))

(declare-fun m!385739 () Bool)

(assert (=> b!256087 m!385739))

(declare-fun m!385741 () Bool)

(assert (=> b!256084 m!385741))

(declare-fun m!385743 () Bool)

(assert (=> b!256085 m!385743))

(declare-fun m!385745 () Bool)

(assert (=> b!256085 m!385745))

(declare-fun m!385747 () Bool)

(assert (=> start!54656 m!385747))

(check-sat (not start!54656) (not b!256087) (not b!256085) (not b!256084) (not b!256086))
