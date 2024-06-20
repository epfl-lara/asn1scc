; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52454 () Bool)

(assert start!52454)

(declare-fun b!241627 () Bool)

(declare-fun e!167492 () Bool)

(assert (=> b!241627 (= e!167492 (not true))))

(declare-datatypes ((array!13265 0))(
  ( (array!13266 (arr!6799 (Array (_ BitVec 32) (_ BitVec 8))) (size!5812 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10546 0))(
  ( (BitStream!10547 (buf!6278 array!13265) (currentByte!11641 (_ BitVec 32)) (currentBit!11636 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17707 0))(
  ( (Unit!17708) )
))
(declare-datatypes ((tuple2!20628 0))(
  ( (tuple2!20629 (_1!11236 Unit!17707) (_2!11236 BitStream!10546)) )
))
(declare-fun lt!377103 () tuple2!20628)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241627 (validate_offset_bits!1 ((_ sign_extend 32) (size!5812 (buf!6278 (_2!11236 lt!377103)))) ((_ sign_extend 32) (currentByte!11641 (_2!11236 lt!377103))) ((_ sign_extend 32) (currentBit!11636 (_2!11236 lt!377103))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun thiss!1005 () BitStream!10546)

(declare-fun lt!377102 () Unit!17707)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10546 BitStream!10546 (_ BitVec 64) (_ BitVec 64)) Unit!17707)

(assert (=> b!241627 (= lt!377102 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11236 lt!377103) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!167491 () Bool)

(assert (=> b!241627 e!167491))

(declare-fun res!201716 () Bool)

(assert (=> b!241627 (=> (not res!201716) (not e!167491))))

(assert (=> b!241627 (= res!201716 (= (size!5812 (buf!6278 thiss!1005)) (size!5812 (buf!6278 (_2!11236 lt!377103)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10546 Bool) tuple2!20628)

(assert (=> b!241627 (= lt!377103 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241628 () Bool)

(declare-fun res!201715 () Bool)

(assert (=> b!241628 (=> (not res!201715) (not e!167492))))

(assert (=> b!241628 (= res!201715 (bvslt from!289 nBits!297))))

(declare-fun b!241629 () Bool)

(declare-fun e!167490 () Bool)

(declare-datatypes ((tuple2!20630 0))(
  ( (tuple2!20631 (_1!11237 BitStream!10546) (_2!11237 Bool)) )
))
(declare-fun lt!377101 () tuple2!20630)

(declare-fun lt!377100 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241629 (= e!167490 (= (bitIndex!0 (size!5812 (buf!6278 (_1!11237 lt!377101))) (currentByte!11641 (_1!11237 lt!377101)) (currentBit!11636 (_1!11237 lt!377101))) lt!377100))))

(declare-fun b!241630 () Bool)

(declare-fun e!167488 () Bool)

(declare-fun array_inv!5553 (array!13265) Bool)

(assert (=> b!241630 (= e!167488 (array_inv!5553 (buf!6278 thiss!1005)))))

(declare-fun b!241631 () Bool)

(declare-fun e!167489 () Bool)

(assert (=> b!241631 (= e!167489 e!167490)))

(declare-fun res!201713 () Bool)

(assert (=> b!241631 (=> (not res!201713) (not e!167490))))

(assert (=> b!241631 (= res!201713 (and (= (_2!11237 lt!377101) bit!26) (= (_1!11237 lt!377101) (_2!11236 lt!377103))))))

(declare-fun readBitPure!0 (BitStream!10546) tuple2!20630)

(declare-fun readerFrom!0 (BitStream!10546 (_ BitVec 32) (_ BitVec 32)) BitStream!10546)

(assert (=> b!241631 (= lt!377101 (readBitPure!0 (readerFrom!0 (_2!11236 lt!377103) (currentBit!11636 thiss!1005) (currentByte!11641 thiss!1005))))))

(declare-fun b!241632 () Bool)

(declare-fun res!201714 () Bool)

(assert (=> b!241632 (=> (not res!201714) (not e!167492))))

(assert (=> b!241632 (= res!201714 (validate_offset_bits!1 ((_ sign_extend 32) (size!5812 (buf!6278 thiss!1005))) ((_ sign_extend 32) (currentByte!11641 thiss!1005)) ((_ sign_extend 32) (currentBit!11636 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241633 () Bool)

(assert (=> b!241633 (= e!167491 e!167489)))

(declare-fun res!201712 () Bool)

(assert (=> b!241633 (=> (not res!201712) (not e!167489))))

(declare-fun lt!377099 () (_ BitVec 64))

(assert (=> b!241633 (= res!201712 (= lt!377100 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377099)))))

(assert (=> b!241633 (= lt!377100 (bitIndex!0 (size!5812 (buf!6278 (_2!11236 lt!377103))) (currentByte!11641 (_2!11236 lt!377103)) (currentBit!11636 (_2!11236 lt!377103))))))

(assert (=> b!241633 (= lt!377099 (bitIndex!0 (size!5812 (buf!6278 thiss!1005)) (currentByte!11641 thiss!1005) (currentBit!11636 thiss!1005)))))

(declare-fun b!241634 () Bool)

(declare-fun res!201711 () Bool)

(assert (=> b!241634 (=> (not res!201711) (not e!167489))))

(declare-fun isPrefixOf!0 (BitStream!10546 BitStream!10546) Bool)

(assert (=> b!241634 (= res!201711 (isPrefixOf!0 thiss!1005 (_2!11236 lt!377103)))))

(declare-fun res!201717 () Bool)

(assert (=> start!52454 (=> (not res!201717) (not e!167492))))

(assert (=> start!52454 (= res!201717 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52454 e!167492))

(assert (=> start!52454 true))

(declare-fun inv!12 (BitStream!10546) Bool)

(assert (=> start!52454 (and (inv!12 thiss!1005) e!167488)))

(assert (= (and start!52454 res!201717) b!241632))

(assert (= (and b!241632 res!201714) b!241628))

(assert (= (and b!241628 res!201715) b!241627))

(assert (= (and b!241627 res!201716) b!241633))

(assert (= (and b!241633 res!201712) b!241634))

(assert (= (and b!241634 res!201711) b!241631))

(assert (= (and b!241631 res!201713) b!241629))

(assert (= start!52454 b!241630))

(declare-fun m!364295 () Bool)

(assert (=> b!241631 m!364295))

(assert (=> b!241631 m!364295))

(declare-fun m!364297 () Bool)

(assert (=> b!241631 m!364297))

(declare-fun m!364299 () Bool)

(assert (=> b!241630 m!364299))

(declare-fun m!364301 () Bool)

(assert (=> b!241629 m!364301))

(declare-fun m!364303 () Bool)

(assert (=> b!241627 m!364303))

(declare-fun m!364305 () Bool)

(assert (=> b!241627 m!364305))

(declare-fun m!364307 () Bool)

(assert (=> b!241627 m!364307))

(declare-fun m!364309 () Bool)

(assert (=> b!241634 m!364309))

(declare-fun m!364311 () Bool)

(assert (=> start!52454 m!364311))

(declare-fun m!364313 () Bool)

(assert (=> b!241633 m!364313))

(declare-fun m!364315 () Bool)

(assert (=> b!241633 m!364315))

(declare-fun m!364317 () Bool)

(assert (=> b!241632 m!364317))

(push 1)

(assert (not start!52454))

(assert (not b!241627))

(assert (not b!241629))

(assert (not b!241634))

(assert (not b!241632))

(assert (not b!241630))

(assert (not b!241633))

(assert (not b!241631))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

