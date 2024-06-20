; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54664 () Bool)

(assert start!54664)

(declare-fun b!256144 () Bool)

(declare-fun e!177455 () Bool)

(declare-fun e!177458 () Bool)

(assert (=> b!256144 (= e!177455 (not e!177458))))

(declare-fun res!214750 () Bool)

(assert (=> b!256144 (=> res!214750 e!177458)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!256144 (= res!214750 (not (= nBits!297 from!289)))))

(declare-datatypes ((array!13811 0))(
  ( (array!13812 (arr!7047 (Array (_ BitVec 32) (_ BitVec 8))) (size!6060 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11042 0))(
  ( (BitStream!11043 (buf!6577 array!13811) (currentByte!12056 (_ BitVec 32)) (currentBit!12051 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11042)

(declare-fun isPrefixOf!0 (BitStream!11042 BitStream!11042) Bool)

(assert (=> b!256144 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18328 0))(
  ( (Unit!18329) )
))
(declare-fun lt!397620 () Unit!18328)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11042) Unit!18328)

(assert (=> b!256144 (= lt!397620 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!256145 () Bool)

(declare-fun res!214751 () Bool)

(assert (=> b!256145 (=> (not res!214751) (not e!177455))))

(assert (=> b!256145 (= res!214751 (bvsge from!289 nBits!297))))

(declare-fun lt!397619 () (_ BitVec 64))

(declare-fun lt!397618 () (_ BitVec 64))

(declare-fun b!256146 () Bool)

(assert (=> b!256146 (= e!177458 (or (not (= lt!397618 (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!397618 (bvand (bvadd lt!397619 (bvsub nBits!297 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256146 (= lt!397618 (bvand lt!397619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256146 (= lt!397619 (bitIndex!0 (size!6060 (buf!6577 thiss!1005)) (currentByte!12056 thiss!1005) (currentBit!12051 thiss!1005)))))

(declare-fun b!256147 () Bool)

(declare-fun res!214752 () Bool)

(assert (=> b!256147 (=> (not res!214752) (not e!177455))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256147 (= res!214752 (validate_offset_bits!1 ((_ sign_extend 32) (size!6060 (buf!6577 thiss!1005))) ((_ sign_extend 32) (currentByte!12056 thiss!1005)) ((_ sign_extend 32) (currentBit!12051 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256148 () Bool)

(declare-fun e!177457 () Bool)

(declare-fun array_inv!5801 (array!13811) Bool)

(assert (=> b!256148 (= e!177457 (array_inv!5801 (buf!6577 thiss!1005)))))

(declare-fun res!214749 () Bool)

(assert (=> start!54664 (=> (not res!214749) (not e!177455))))

(assert (=> start!54664 (= res!214749 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54664 e!177455))

(assert (=> start!54664 true))

(declare-fun inv!12 (BitStream!11042) Bool)

(assert (=> start!54664 (and (inv!12 thiss!1005) e!177457)))

(assert (= (and start!54664 res!214749) b!256147))

(assert (= (and b!256147 res!214752) b!256145))

(assert (= (and b!256145 res!214751) b!256144))

(assert (= (and b!256144 (not res!214750)) b!256146))

(assert (= start!54664 b!256148))

(declare-fun m!385785 () Bool)

(assert (=> b!256146 m!385785))

(declare-fun m!385787 () Bool)

(assert (=> b!256148 m!385787))

(declare-fun m!385789 () Bool)

(assert (=> b!256144 m!385789))

(declare-fun m!385791 () Bool)

(assert (=> b!256144 m!385791))

(declare-fun m!385793 () Bool)

(assert (=> b!256147 m!385793))

(declare-fun m!385795 () Bool)

(assert (=> start!54664 m!385795))

(push 1)

(assert (not b!256148))

(assert (not b!256147))

(assert (not start!54664))

(assert (not b!256146))

(assert (not b!256144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

