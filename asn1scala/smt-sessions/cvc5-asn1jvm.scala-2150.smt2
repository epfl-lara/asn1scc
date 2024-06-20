; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54666 () Bool)

(assert start!54666)

(declare-fun b!256161 () Bool)

(declare-fun e!177473 () Bool)

(declare-datatypes ((array!13813 0))(
  ( (array!13814 (arr!7048 (Array (_ BitVec 32) (_ BitVec 8))) (size!6061 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11044 0))(
  ( (BitStream!11045 (buf!6578 array!13813) (currentByte!12057 (_ BitVec 32)) (currentBit!12052 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11044)

(declare-fun array_inv!5802 (array!13813) Bool)

(assert (=> b!256161 (= e!177473 (array_inv!5802 (buf!6578 thiss!1005)))))

(declare-fun b!256162 () Bool)

(declare-fun e!177469 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!256162 (= e!177469 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!21918 0))(
  ( (tuple2!21919 (_1!11893 BitStream!11044) (_2!11893 BitStream!11044)) )
))
(declare-fun lt!397629 () tuple2!21918)

(declare-fun reader!0 (BitStream!11044 BitStream!11044) tuple2!21918)

(assert (=> b!256162 (= lt!397629 (reader!0 thiss!1005 thiss!1005))))

(declare-fun res!214764 () Bool)

(declare-fun e!177470 () Bool)

(assert (=> start!54666 (=> (not res!214764) (not e!177470))))

(assert (=> start!54666 (= res!214764 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54666 e!177470))

(assert (=> start!54666 true))

(declare-fun inv!12 (BitStream!11044) Bool)

(assert (=> start!54666 (and (inv!12 thiss!1005) e!177473)))

(declare-fun b!256163 () Bool)

(declare-fun e!177471 () Bool)

(assert (=> b!256163 (= e!177471 e!177469)))

(declare-fun res!214766 () Bool)

(assert (=> b!256163 (=> res!214766 e!177469)))

(declare-fun lt!397628 () (_ BitVec 64))

(assert (=> b!256163 (= res!214766 (not (= lt!397628 (bvadd lt!397628 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256163 (= lt!397628 (bitIndex!0 (size!6061 (buf!6578 thiss!1005)) (currentByte!12057 thiss!1005) (currentBit!12052 thiss!1005)))))

(declare-fun b!256164 () Bool)

(declare-fun res!214767 () Bool)

(assert (=> b!256164 (=> (not res!214767) (not e!177470))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256164 (= res!214767 (validate_offset_bits!1 ((_ sign_extend 32) (size!6061 (buf!6578 thiss!1005))) ((_ sign_extend 32) (currentByte!12057 thiss!1005)) ((_ sign_extend 32) (currentBit!12052 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256165 () Bool)

(declare-fun res!214763 () Bool)

(assert (=> b!256165 (=> (not res!214763) (not e!177470))))

(assert (=> b!256165 (= res!214763 (bvsge from!289 nBits!297))))

(declare-fun b!256166 () Bool)

(assert (=> b!256166 (= e!177470 (not e!177471))))

(declare-fun res!214765 () Bool)

(assert (=> b!256166 (=> res!214765 e!177471)))

(assert (=> b!256166 (= res!214765 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!11044 BitStream!11044) Bool)

(assert (=> b!256166 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18330 0))(
  ( (Unit!18331) )
))
(declare-fun lt!397627 () Unit!18330)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11044) Unit!18330)

(assert (=> b!256166 (= lt!397627 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (= (and start!54666 res!214764) b!256164))

(assert (= (and b!256164 res!214767) b!256165))

(assert (= (and b!256165 res!214763) b!256166))

(assert (= (and b!256166 (not res!214765)) b!256163))

(assert (= (and b!256163 (not res!214766)) b!256162))

(assert (= start!54666 b!256161))

(declare-fun m!385797 () Bool)

(assert (=> b!256164 m!385797))

(declare-fun m!385799 () Bool)

(assert (=> start!54666 m!385799))

(declare-fun m!385801 () Bool)

(assert (=> b!256162 m!385801))

(declare-fun m!385803 () Bool)

(assert (=> b!256161 m!385803))

(declare-fun m!385805 () Bool)

(assert (=> b!256166 m!385805))

(declare-fun m!385807 () Bool)

(assert (=> b!256166 m!385807))

(declare-fun m!385809 () Bool)

(assert (=> b!256163 m!385809))

(push 1)

(assert (not b!256161))

(assert (not start!54666))

(assert (not b!256164))

(assert (not b!256163))

(assert (not b!256166))

(assert (not b!256162))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

