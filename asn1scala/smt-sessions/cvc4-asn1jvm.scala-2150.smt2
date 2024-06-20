; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54670 () Bool)

(assert start!54670)

(declare-fun res!214793 () Bool)

(declare-fun e!177501 () Bool)

(assert (=> start!54670 (=> (not res!214793) (not e!177501))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!54670 (= res!214793 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54670 e!177501))

(assert (=> start!54670 true))

(declare-datatypes ((array!13817 0))(
  ( (array!13818 (arr!7050 (Array (_ BitVec 32) (_ BitVec 8))) (size!6063 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11048 0))(
  ( (BitStream!11049 (buf!6580 array!13817) (currentByte!12059 (_ BitVec 32)) (currentBit!12054 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11048)

(declare-fun e!177502 () Bool)

(declare-fun inv!12 (BitStream!11048) Bool)

(assert (=> start!54670 (and (inv!12 thiss!1005) e!177502)))

(declare-fun b!256197 () Bool)

(declare-fun e!177499 () Bool)

(assert (=> b!256197 (= e!177499 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!21922 0))(
  ( (tuple2!21923 (_1!11895 BitStream!11048) (_2!11895 BitStream!11048)) )
))
(declare-fun lt!397646 () tuple2!21922)

(declare-fun reader!0 (BitStream!11048 BitStream!11048) tuple2!21922)

(assert (=> b!256197 (= lt!397646 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!256198 () Bool)

(declare-fun e!177503 () Bool)

(assert (=> b!256198 (= e!177503 e!177499)))

(declare-fun res!214796 () Bool)

(assert (=> b!256198 (=> res!214796 e!177499)))

(declare-fun lt!397647 () (_ BitVec 64))

(assert (=> b!256198 (= res!214796 (not (= lt!397647 (bvadd lt!397647 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256198 (= lt!397647 (bitIndex!0 (size!6063 (buf!6580 thiss!1005)) (currentByte!12059 thiss!1005) (currentBit!12054 thiss!1005)))))

(declare-fun b!256199 () Bool)

(declare-fun res!214794 () Bool)

(assert (=> b!256199 (=> (not res!214794) (not e!177501))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256199 (= res!214794 (validate_offset_bits!1 ((_ sign_extend 32) (size!6063 (buf!6580 thiss!1005))) ((_ sign_extend 32) (currentByte!12059 thiss!1005)) ((_ sign_extend 32) (currentBit!12054 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256200 () Bool)

(declare-fun array_inv!5804 (array!13817) Bool)

(assert (=> b!256200 (= e!177502 (array_inv!5804 (buf!6580 thiss!1005)))))

(declare-fun b!256201 () Bool)

(declare-fun res!214797 () Bool)

(assert (=> b!256201 (=> (not res!214797) (not e!177501))))

(assert (=> b!256201 (= res!214797 (bvsge from!289 nBits!297))))

(declare-fun b!256202 () Bool)

(assert (=> b!256202 (= e!177501 (not e!177503))))

(declare-fun res!214795 () Bool)

(assert (=> b!256202 (=> res!214795 e!177503)))

(assert (=> b!256202 (= res!214795 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!11048 BitStream!11048) Bool)

(assert (=> b!256202 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18334 0))(
  ( (Unit!18335) )
))
(declare-fun lt!397645 () Unit!18334)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11048) Unit!18334)

(assert (=> b!256202 (= lt!397645 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (= (and start!54670 res!214793) b!256199))

(assert (= (and b!256199 res!214794) b!256201))

(assert (= (and b!256201 res!214797) b!256202))

(assert (= (and b!256202 (not res!214795)) b!256198))

(assert (= (and b!256198 (not res!214796)) b!256197))

(assert (= start!54670 b!256200))

(declare-fun m!385825 () Bool)

(assert (=> b!256198 m!385825))

(declare-fun m!385827 () Bool)

(assert (=> b!256200 m!385827))

(declare-fun m!385829 () Bool)

(assert (=> b!256197 m!385829))

(declare-fun m!385831 () Bool)

(assert (=> b!256202 m!385831))

(declare-fun m!385833 () Bool)

(assert (=> b!256202 m!385833))

(declare-fun m!385835 () Bool)

(assert (=> b!256199 m!385835))

(declare-fun m!385837 () Bool)

(assert (=> start!54670 m!385837))

(push 1)

(assert (not b!256197))

(assert (not start!54670))

(assert (not b!256199))

(assert (not b!256202))

(assert (not b!256200))

(assert (not b!256198))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

