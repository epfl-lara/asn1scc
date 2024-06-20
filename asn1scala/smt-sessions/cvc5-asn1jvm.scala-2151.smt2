; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54672 () Bool)

(assert start!54672)

(declare-fun b!256215 () Bool)

(declare-fun res!214808 () Bool)

(declare-fun e!177516 () Bool)

(assert (=> b!256215 (=> (not res!214808) (not e!177516))))

(declare-datatypes ((array!13819 0))(
  ( (array!13820 (arr!7051 (Array (_ BitVec 32) (_ BitVec 8))) (size!6064 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11050 0))(
  ( (BitStream!11051 (buf!6581 array!13819) (currentByte!12060 (_ BitVec 32)) (currentBit!12055 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11050)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256215 (= res!214808 (validate_offset_bits!1 ((_ sign_extend 32) (size!6064 (buf!6581 thiss!1005))) ((_ sign_extend 32) (currentByte!12060 thiss!1005)) ((_ sign_extend 32) (currentBit!12055 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256216 () Bool)

(declare-fun e!177517 () Bool)

(declare-fun e!177514 () Bool)

(assert (=> b!256216 (= e!177517 e!177514)))

(declare-fun res!214811 () Bool)

(assert (=> b!256216 (=> res!214811 e!177514)))

(declare-fun lt!397654 () (_ BitVec 64))

(assert (=> b!256216 (= res!214811 (not (= lt!397654 (bvadd lt!397654 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256216 (= lt!397654 (bitIndex!0 (size!6064 (buf!6581 thiss!1005)) (currentByte!12060 thiss!1005) (currentBit!12055 thiss!1005)))))

(declare-fun b!256217 () Bool)

(assert (=> b!256217 (= e!177516 (not e!177517))))

(declare-fun res!214812 () Bool)

(assert (=> b!256217 (=> res!214812 e!177517)))

(assert (=> b!256217 (= res!214812 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!11050 BitStream!11050) Bool)

(assert (=> b!256217 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18336 0))(
  ( (Unit!18337) )
))
(declare-fun lt!397655 () Unit!18336)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11050) Unit!18336)

(assert (=> b!256217 (= lt!397655 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!256218 () Bool)

(declare-fun res!214810 () Bool)

(assert (=> b!256218 (=> (not res!214810) (not e!177516))))

(assert (=> b!256218 (= res!214810 (bvsge from!289 nBits!297))))

(declare-fun b!256219 () Bool)

(declare-fun e!177518 () Bool)

(declare-fun array_inv!5805 (array!13819) Bool)

(assert (=> b!256219 (= e!177518 (array_inv!5805 (buf!6581 thiss!1005)))))

(declare-fun b!256220 () Bool)

(assert (=> b!256220 (= e!177514 true)))

(declare-datatypes ((tuple2!21924 0))(
  ( (tuple2!21925 (_1!11896 BitStream!11050) (_2!11896 BitStream!11050)) )
))
(declare-fun lt!397656 () tuple2!21924)

(declare-fun reader!0 (BitStream!11050 BitStream!11050) tuple2!21924)

(assert (=> b!256220 (= lt!397656 (reader!0 thiss!1005 thiss!1005))))

(declare-fun res!214809 () Bool)

(assert (=> start!54672 (=> (not res!214809) (not e!177516))))

(assert (=> start!54672 (= res!214809 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54672 e!177516))

(assert (=> start!54672 true))

(declare-fun inv!12 (BitStream!11050) Bool)

(assert (=> start!54672 (and (inv!12 thiss!1005) e!177518)))

(assert (= (and start!54672 res!214809) b!256215))

(assert (= (and b!256215 res!214808) b!256218))

(assert (= (and b!256218 res!214810) b!256217))

(assert (= (and b!256217 (not res!214812)) b!256216))

(assert (= (and b!256216 (not res!214811)) b!256220))

(assert (= start!54672 b!256219))

(declare-fun m!385839 () Bool)

(assert (=> start!54672 m!385839))

(declare-fun m!385841 () Bool)

(assert (=> b!256219 m!385841))

(declare-fun m!385843 () Bool)

(assert (=> b!256215 m!385843))

(declare-fun m!385845 () Bool)

(assert (=> b!256217 m!385845))

(declare-fun m!385847 () Bool)

(assert (=> b!256217 m!385847))

(declare-fun m!385849 () Bool)

(assert (=> b!256220 m!385849))

(declare-fun m!385851 () Bool)

(assert (=> b!256216 m!385851))

(push 1)

(assert (not b!256215))

(assert (not b!256216))

(assert (not b!256220))

(assert (not start!54672))

(assert (not b!256217))

(assert (not b!256219))

(check-sat)

(pop 1)

(push 1)

(check-sat)

