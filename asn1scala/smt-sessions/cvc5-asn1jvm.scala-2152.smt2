; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54678 () Bool)

(assert start!54678)

(declare-fun b!256269 () Bool)

(declare-fun e!177559 () Bool)

(declare-datatypes ((array!13825 0))(
  ( (array!13826 (arr!7054 (Array (_ BitVec 32) (_ BitVec 8))) (size!6067 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11056 0))(
  ( (BitStream!11057 (buf!6584 array!13825) (currentByte!12063 (_ BitVec 32)) (currentBit!12058 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11056)

(declare-fun array_inv!5808 (array!13825) Bool)

(assert (=> b!256269 (= e!177559 (array_inv!5808 (buf!6584 thiss!1005)))))

(declare-fun b!256270 () Bool)

(declare-fun e!177561 () Bool)

(declare-fun e!177560 () Bool)

(assert (=> b!256270 (= e!177561 (not e!177560))))

(declare-fun res!214855 () Bool)

(assert (=> b!256270 (=> res!214855 e!177560)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!256270 (= res!214855 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!11056 BitStream!11056) Bool)

(assert (=> b!256270 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18342 0))(
  ( (Unit!18343) )
))
(declare-fun lt!397682 () Unit!18342)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11056) Unit!18342)

(assert (=> b!256270 (= lt!397682 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun res!214856 () Bool)

(assert (=> start!54678 (=> (not res!214856) (not e!177561))))

(assert (=> start!54678 (= res!214856 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54678 e!177561))

(assert (=> start!54678 true))

(declare-fun inv!12 (BitStream!11056) Bool)

(assert (=> start!54678 (and (inv!12 thiss!1005) e!177559)))

(declare-fun b!256271 () Bool)

(declare-fun e!177562 () Bool)

(assert (=> b!256271 (= e!177560 e!177562)))

(declare-fun res!214853 () Bool)

(assert (=> b!256271 (=> res!214853 e!177562)))

(declare-fun lt!397681 () (_ BitVec 64))

(assert (=> b!256271 (= res!214853 (not (= lt!397681 (bvadd lt!397681 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256271 (= lt!397681 (bitIndex!0 (size!6067 (buf!6584 thiss!1005)) (currentByte!12063 thiss!1005) (currentBit!12058 thiss!1005)))))

(declare-fun b!256272 () Bool)

(declare-fun res!214857 () Bool)

(assert (=> b!256272 (=> (not res!214857) (not e!177561))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256272 (= res!214857 (validate_offset_bits!1 ((_ sign_extend 32) (size!6067 (buf!6584 thiss!1005))) ((_ sign_extend 32) (currentByte!12063 thiss!1005)) ((_ sign_extend 32) (currentBit!12058 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256273 () Bool)

(declare-fun res!214854 () Bool)

(assert (=> b!256273 (=> (not res!214854) (not e!177561))))

(assert (=> b!256273 (= res!214854 (bvsge from!289 nBits!297))))

(declare-fun b!256274 () Bool)

(assert (=> b!256274 (= e!177562 true)))

(declare-datatypes ((tuple2!21930 0))(
  ( (tuple2!21931 (_1!11899 BitStream!11056) (_2!11899 BitStream!11056)) )
))
(declare-fun lt!397683 () tuple2!21930)

(declare-fun reader!0 (BitStream!11056 BitStream!11056) tuple2!21930)

(assert (=> b!256274 (= lt!397683 (reader!0 thiss!1005 thiss!1005))))

(assert (= (and start!54678 res!214856) b!256272))

(assert (= (and b!256272 res!214857) b!256273))

(assert (= (and b!256273 res!214854) b!256270))

(assert (= (and b!256270 (not res!214855)) b!256271))

(assert (= (and b!256271 (not res!214853)) b!256274))

(assert (= start!54678 b!256269))

(declare-fun m!385881 () Bool)

(assert (=> b!256269 m!385881))

(declare-fun m!385883 () Bool)

(assert (=> b!256272 m!385883))

(declare-fun m!385885 () Bool)

(assert (=> b!256270 m!385885))

(declare-fun m!385887 () Bool)

(assert (=> b!256270 m!385887))

(declare-fun m!385889 () Bool)

(assert (=> b!256271 m!385889))

(declare-fun m!385891 () Bool)

(assert (=> b!256274 m!385891))

(declare-fun m!385893 () Bool)

(assert (=> start!54678 m!385893))

(push 1)

(assert (not b!256274))

(assert (not b!256270))

(assert (not b!256271))

(assert (not b!256269))

(assert (not start!54678))

(assert (not b!256272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

