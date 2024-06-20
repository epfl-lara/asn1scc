; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52446 () Bool)

(assert start!52446)

(declare-fun b!241531 () Bool)

(declare-fun e!167415 () Bool)

(declare-datatypes ((array!13257 0))(
  ( (array!13258 (arr!6795 (Array (_ BitVec 32) (_ BitVec 8))) (size!5808 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10538 0))(
  ( (BitStream!10539 (buf!6274 array!13257) (currentByte!11637 (_ BitVec 32)) (currentBit!11632 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20612 0))(
  ( (tuple2!20613 (_1!11228 BitStream!10538) (_2!11228 Bool)) )
))
(declare-fun lt!377042 () tuple2!20612)

(declare-fun lt!377040 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241531 (= e!167415 (= (bitIndex!0 (size!5808 (buf!6274 (_1!11228 lt!377042))) (currentByte!11637 (_1!11228 lt!377042)) (currentBit!11632 (_1!11228 lt!377042))) lt!377040))))

(declare-fun b!241532 () Bool)

(declare-fun e!167419 () Bool)

(assert (=> b!241532 (= e!167419 e!167415)))

(declare-fun res!201633 () Bool)

(assert (=> b!241532 (=> (not res!201633) (not e!167415))))

(declare-datatypes ((Unit!17699 0))(
  ( (Unit!17700) )
))
(declare-datatypes ((tuple2!20614 0))(
  ( (tuple2!20615 (_1!11229 Unit!17699) (_2!11229 BitStream!10538)) )
))
(declare-fun lt!377041 () tuple2!20614)

(declare-fun bit!26 () Bool)

(assert (=> b!241532 (= res!201633 (and (= (_2!11228 lt!377042) bit!26) (= (_1!11228 lt!377042) (_2!11229 lt!377041))))))

(declare-fun thiss!1005 () BitStream!10538)

(declare-fun readBitPure!0 (BitStream!10538) tuple2!20612)

(declare-fun readerFrom!0 (BitStream!10538 (_ BitVec 32) (_ BitVec 32)) BitStream!10538)

(assert (=> b!241532 (= lt!377042 (readBitPure!0 (readerFrom!0 (_2!11229 lt!377041) (currentBit!11632 thiss!1005) (currentByte!11637 thiss!1005))))))

(declare-fun b!241533 () Bool)

(declare-fun e!167417 () Bool)

(declare-fun array_inv!5549 (array!13257) Bool)

(assert (=> b!241533 (= e!167417 (array_inv!5549 (buf!6274 thiss!1005)))))

(declare-fun res!201628 () Bool)

(declare-fun e!167418 () Bool)

(assert (=> start!52446 (=> (not res!201628) (not e!167418))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!52446 (= res!201628 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52446 e!167418))

(assert (=> start!52446 true))

(declare-fun inv!12 (BitStream!10538) Bool)

(assert (=> start!52446 (and (inv!12 thiss!1005) e!167417)))

(declare-fun b!241534 () Bool)

(declare-fun res!201631 () Bool)

(assert (=> b!241534 (=> (not res!201631) (not e!167418))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241534 (= res!201631 (validate_offset_bits!1 ((_ sign_extend 32) (size!5808 (buf!6274 thiss!1005))) ((_ sign_extend 32) (currentByte!11637 thiss!1005)) ((_ sign_extend 32) (currentBit!11632 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241535 () Bool)

(declare-fun e!167420 () Bool)

(assert (=> b!241535 (= e!167420 e!167419)))

(declare-fun res!201632 () Bool)

(assert (=> b!241535 (=> (not res!201632) (not e!167419))))

(declare-fun lt!377043 () (_ BitVec 64))

(assert (=> b!241535 (= res!201632 (= lt!377040 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377043)))))

(assert (=> b!241535 (= lt!377040 (bitIndex!0 (size!5808 (buf!6274 (_2!11229 lt!377041))) (currentByte!11637 (_2!11229 lt!377041)) (currentBit!11632 (_2!11229 lt!377041))))))

(assert (=> b!241535 (= lt!377043 (bitIndex!0 (size!5808 (buf!6274 thiss!1005)) (currentByte!11637 thiss!1005) (currentBit!11632 thiss!1005)))))

(declare-fun b!241536 () Bool)

(declare-fun res!201627 () Bool)

(assert (=> b!241536 (=> (not res!201627) (not e!167418))))

(assert (=> b!241536 (= res!201627 (bvslt from!289 nBits!297))))

(declare-fun b!241537 () Bool)

(declare-fun res!201629 () Bool)

(assert (=> b!241537 (=> (not res!201629) (not e!167419))))

(declare-fun isPrefixOf!0 (BitStream!10538 BitStream!10538) Bool)

(assert (=> b!241537 (= res!201629 (isPrefixOf!0 thiss!1005 (_2!11229 lt!377041)))))

(declare-fun b!241538 () Bool)

(assert (=> b!241538 (= e!167418 (not true))))

(assert (=> b!241538 (validate_offset_bits!1 ((_ sign_extend 32) (size!5808 (buf!6274 (_2!11229 lt!377041)))) ((_ sign_extend 32) (currentByte!11637 (_2!11229 lt!377041))) ((_ sign_extend 32) (currentBit!11632 (_2!11229 lt!377041))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377039 () Unit!17699)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10538 BitStream!10538 (_ BitVec 64) (_ BitVec 64)) Unit!17699)

(assert (=> b!241538 (= lt!377039 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11229 lt!377041) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!241538 e!167420))

(declare-fun res!201630 () Bool)

(assert (=> b!241538 (=> (not res!201630) (not e!167420))))

(assert (=> b!241538 (= res!201630 (= (size!5808 (buf!6274 thiss!1005)) (size!5808 (buf!6274 (_2!11229 lt!377041)))))))

(declare-fun appendBit!0 (BitStream!10538 Bool) tuple2!20614)

(assert (=> b!241538 (= lt!377041 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!52446 res!201628) b!241534))

(assert (= (and b!241534 res!201631) b!241536))

(assert (= (and b!241536 res!201627) b!241538))

(assert (= (and b!241538 res!201630) b!241535))

(assert (= (and b!241535 res!201632) b!241537))

(assert (= (and b!241537 res!201629) b!241532))

(assert (= (and b!241532 res!201633) b!241531))

(assert (= start!52446 b!241533))

(declare-fun m!364199 () Bool)

(assert (=> start!52446 m!364199))

(declare-fun m!364201 () Bool)

(assert (=> b!241531 m!364201))

(declare-fun m!364203 () Bool)

(assert (=> b!241533 m!364203))

(declare-fun m!364205 () Bool)

(assert (=> b!241532 m!364205))

(assert (=> b!241532 m!364205))

(declare-fun m!364207 () Bool)

(assert (=> b!241532 m!364207))

(declare-fun m!364209 () Bool)

(assert (=> b!241537 m!364209))

(declare-fun m!364211 () Bool)

(assert (=> b!241538 m!364211))

(declare-fun m!364213 () Bool)

(assert (=> b!241538 m!364213))

(declare-fun m!364215 () Bool)

(assert (=> b!241538 m!364215))

(declare-fun m!364217 () Bool)

(assert (=> b!241535 m!364217))

(declare-fun m!364219 () Bool)

(assert (=> b!241535 m!364219))

(declare-fun m!364221 () Bool)

(assert (=> b!241534 m!364221))

(push 1)

(assert (not b!241537))

(assert (not b!241533))

(assert (not b!241535))

