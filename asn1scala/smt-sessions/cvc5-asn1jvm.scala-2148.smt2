; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54654 () Bool)

(assert start!54654)

(declare-fun b!256069 () Bool)

(declare-fun e!177396 () Bool)

(declare-fun e!177397 () Bool)

(assert (=> b!256069 (= e!177396 (not e!177397))))

(declare-fun res!214689 () Bool)

(assert (=> b!256069 (=> res!214689 e!177397)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!256069 (= res!214689 (not (= nBits!297 from!289)))))

(declare-datatypes ((array!13801 0))(
  ( (array!13802 (arr!7042 (Array (_ BitVec 32) (_ BitVec 8))) (size!6055 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11032 0))(
  ( (BitStream!11033 (buf!6572 array!13801) (currentByte!12051 (_ BitVec 32)) (currentBit!12046 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11032)

(declare-fun isPrefixOf!0 (BitStream!11032 BitStream!11032) Bool)

(assert (=> b!256069 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18318 0))(
  ( (Unit!18319) )
))
(declare-fun lt!397580 () Unit!18318)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11032) Unit!18318)

(assert (=> b!256069 (= lt!397580 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!256070 () Bool)

(declare-fun res!214692 () Bool)

(assert (=> b!256070 (=> (not res!214692) (not e!177396))))

(assert (=> b!256070 (= res!214692 (bvsge from!289 nBits!297))))

(declare-fun res!214690 () Bool)

(assert (=> start!54654 (=> (not res!214690) (not e!177396))))

(assert (=> start!54654 (= res!214690 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54654 e!177396))

(assert (=> start!54654 true))

(declare-fun e!177395 () Bool)

(declare-fun inv!12 (BitStream!11032) Bool)

(assert (=> start!54654 (and (inv!12 thiss!1005) e!177395)))

(declare-fun b!256071 () Bool)

(declare-fun array_inv!5796 (array!13801) Bool)

(assert (=> b!256071 (= e!177395 (array_inv!5796 (buf!6572 thiss!1005)))))

(declare-fun b!256072 () Bool)

(assert (=> b!256072 (= e!177397 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!397581 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256072 (= lt!397581 (bitIndex!0 (size!6055 (buf!6572 thiss!1005)) (currentByte!12051 thiss!1005) (currentBit!12046 thiss!1005)))))

(declare-fun b!256073 () Bool)

(declare-fun res!214691 () Bool)

(assert (=> b!256073 (=> (not res!214691) (not e!177396))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256073 (= res!214691 (validate_offset_bits!1 ((_ sign_extend 32) (size!6055 (buf!6572 thiss!1005))) ((_ sign_extend 32) (currentByte!12051 thiss!1005)) ((_ sign_extend 32) (currentBit!12046 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!54654 res!214690) b!256073))

(assert (= (and b!256073 res!214691) b!256070))

(assert (= (and b!256070 res!214692) b!256069))

(assert (= (and b!256069 (not res!214689)) b!256072))

(assert (= start!54654 b!256071))

(declare-fun m!385725 () Bool)

(assert (=> start!54654 m!385725))

(declare-fun m!385727 () Bool)

(assert (=> b!256072 m!385727))

(declare-fun m!385729 () Bool)

(assert (=> b!256073 m!385729))

(declare-fun m!385731 () Bool)

(assert (=> b!256069 m!385731))

(declare-fun m!385733 () Bool)

(assert (=> b!256069 m!385733))

(declare-fun m!385735 () Bool)

(assert (=> b!256071 m!385735))

(push 1)

(assert (not b!256069))

(assert (not b!256071))

(assert (not b!256073))

(assert (not start!54654))

(assert (not b!256072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

