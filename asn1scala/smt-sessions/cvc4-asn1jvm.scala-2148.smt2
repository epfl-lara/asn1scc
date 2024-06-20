; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54658 () Bool)

(assert start!54658)

(declare-fun b!256099 () Bool)

(declare-fun res!214716 () Bool)

(declare-fun e!177422 () Bool)

(assert (=> b!256099 (=> (not res!214716) (not e!177422))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13805 0))(
  ( (array!13806 (arr!7044 (Array (_ BitVec 32) (_ BitVec 8))) (size!6057 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11036 0))(
  ( (BitStream!11037 (buf!6574 array!13805) (currentByte!12053 (_ BitVec 32)) (currentBit!12048 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11036)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256099 (= res!214716 (validate_offset_bits!1 ((_ sign_extend 32) (size!6057 (buf!6574 thiss!1005))) ((_ sign_extend 32) (currentByte!12053 thiss!1005)) ((_ sign_extend 32) (currentBit!12048 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256100 () Bool)

(declare-fun e!177421 () Bool)

(assert (=> b!256100 (= e!177421 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!397593 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256100 (= lt!397593 (bitIndex!0 (size!6057 (buf!6574 thiss!1005)) (currentByte!12053 thiss!1005) (currentBit!12048 thiss!1005)))))

(declare-fun res!214713 () Bool)

(assert (=> start!54658 (=> (not res!214713) (not e!177422))))

(assert (=> start!54658 (= res!214713 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54658 e!177422))

(assert (=> start!54658 true))

(declare-fun e!177419 () Bool)

(declare-fun inv!12 (BitStream!11036) Bool)

(assert (=> start!54658 (and (inv!12 thiss!1005) e!177419)))

(declare-fun b!256101 () Bool)

(declare-fun res!214715 () Bool)

(assert (=> b!256101 (=> (not res!214715) (not e!177422))))

(assert (=> b!256101 (= res!214715 (bvsge from!289 nBits!297))))

(declare-fun b!256102 () Bool)

(declare-fun array_inv!5798 (array!13805) Bool)

(assert (=> b!256102 (= e!177419 (array_inv!5798 (buf!6574 thiss!1005)))))

(declare-fun b!256103 () Bool)

(assert (=> b!256103 (= e!177422 (not e!177421))))

(declare-fun res!214714 () Bool)

(assert (=> b!256103 (=> res!214714 e!177421)))

(assert (=> b!256103 (= res!214714 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!11036 BitStream!11036) Bool)

(assert (=> b!256103 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18322 0))(
  ( (Unit!18323) )
))
(declare-fun lt!397592 () Unit!18322)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11036) Unit!18322)

(assert (=> b!256103 (= lt!397592 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (= (and start!54658 res!214713) b!256099))

(assert (= (and b!256099 res!214716) b!256101))

(assert (= (and b!256101 res!214715) b!256103))

(assert (= (and b!256103 (not res!214714)) b!256100))

(assert (= start!54658 b!256102))

(declare-fun m!385749 () Bool)

(assert (=> b!256103 m!385749))

(declare-fun m!385751 () Bool)

(assert (=> b!256103 m!385751))

(declare-fun m!385753 () Bool)

(assert (=> start!54658 m!385753))

(declare-fun m!385755 () Bool)

(assert (=> b!256100 m!385755))

(declare-fun m!385757 () Bool)

(assert (=> b!256102 m!385757))

(declare-fun m!385759 () Bool)

(assert (=> b!256099 m!385759))

(push 1)

(assert (not b!256099))

(assert (not b!256100))

(assert (not b!256103))

(assert (not b!256102))

(assert (not start!54658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

