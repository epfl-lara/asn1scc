; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54660 () Bool)

(assert start!54660)

(declare-fun b!256114 () Bool)

(declare-fun e!177432 () Bool)

(declare-fun e!177431 () Bool)

(assert (=> b!256114 (= e!177432 (not e!177431))))

(declare-fun res!214725 () Bool)

(assert (=> b!256114 (=> res!214725 e!177431)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!256114 (= res!214725 (not (= nBits!297 from!289)))))

(declare-datatypes ((array!13807 0))(
  ( (array!13808 (arr!7045 (Array (_ BitVec 32) (_ BitVec 8))) (size!6058 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11038 0))(
  ( (BitStream!11039 (buf!6575 array!13807) (currentByte!12054 (_ BitVec 32)) (currentBit!12049 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11038)

(declare-fun isPrefixOf!0 (BitStream!11038 BitStream!11038) Bool)

(assert (=> b!256114 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18324 0))(
  ( (Unit!18325) )
))
(declare-fun lt!397600 () Unit!18324)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11038) Unit!18324)

(assert (=> b!256114 (= lt!397600 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!256115 () Bool)

(declare-fun e!177433 () Bool)

(declare-fun array_inv!5799 (array!13807) Bool)

(assert (=> b!256115 (= e!177433 (array_inv!5799 (buf!6575 thiss!1005)))))

(declare-fun b!256116 () Bool)

(declare-fun res!214728 () Bool)

(assert (=> b!256116 (=> (not res!214728) (not e!177432))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256116 (= res!214728 (validate_offset_bits!1 ((_ sign_extend 32) (size!6058 (buf!6575 thiss!1005))) ((_ sign_extend 32) (currentByte!12054 thiss!1005)) ((_ sign_extend 32) (currentBit!12049 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256117 () Bool)

(declare-fun res!214727 () Bool)

(assert (=> b!256117 (=> (not res!214727) (not e!177432))))

(assert (=> b!256117 (= res!214727 (bvsge from!289 nBits!297))))

(declare-fun res!214726 () Bool)

(assert (=> start!54660 (=> (not res!214726) (not e!177432))))

(assert (=> start!54660 (= res!214726 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54660 e!177432))

(assert (=> start!54660 true))

(declare-fun inv!12 (BitStream!11038) Bool)

(assert (=> start!54660 (and (inv!12 thiss!1005) e!177433)))

(declare-fun b!256118 () Bool)

(declare-fun lt!397601 () (_ BitVec 64))

(declare-fun lt!397602 () (_ BitVec 64))

(assert (=> b!256118 (= e!177431 (or (not (= lt!397602 (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!397602 (bvand (bvadd lt!397601 (bvsub nBits!297 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256118 (= lt!397602 (bvand lt!397601 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256118 (= lt!397601 (bitIndex!0 (size!6058 (buf!6575 thiss!1005)) (currentByte!12054 thiss!1005) (currentBit!12049 thiss!1005)))))

(assert (= (and start!54660 res!214726) b!256116))

(assert (= (and b!256116 res!214728) b!256117))

(assert (= (and b!256117 res!214727) b!256114))

(assert (= (and b!256114 (not res!214725)) b!256118))

(assert (= start!54660 b!256115))

(declare-fun m!385761 () Bool)

(assert (=> start!54660 m!385761))

(declare-fun m!385763 () Bool)

(assert (=> b!256115 m!385763))

(declare-fun m!385765 () Bool)

(assert (=> b!256118 m!385765))

(declare-fun m!385767 () Bool)

(assert (=> b!256116 m!385767))

(declare-fun m!385769 () Bool)

(assert (=> b!256114 m!385769))

(declare-fun m!385771 () Bool)

(assert (=> b!256114 m!385771))

(push 1)

(assert (not b!256118))

(assert (not b!256116))

(assert (not b!256115))

(assert (not start!54660))

(assert (not b!256114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

