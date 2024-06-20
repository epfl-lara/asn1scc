; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52436 () Bool)

(assert start!52436)

(declare-fun b!241412 () Bool)

(declare-fun res!201525 () Bool)

(declare-fun e!167325 () Bool)

(assert (=> b!241412 (=> (not res!201525) (not e!167325))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!241412 (= res!201525 (bvslt from!289 nBits!297))))

(declare-fun b!241413 () Bool)

(declare-fun e!167330 () Bool)

(declare-datatypes ((array!13247 0))(
  ( (array!13248 (arr!6790 (Array (_ BitVec 32) (_ BitVec 8))) (size!5803 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10528 0))(
  ( (BitStream!10529 (buf!6269 array!13247) (currentByte!11632 (_ BitVec 32)) (currentBit!11627 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20592 0))(
  ( (tuple2!20593 (_1!11218 BitStream!10528) (_2!11218 Bool)) )
))
(declare-fun lt!376959 () tuple2!20592)

(declare-fun lt!376962 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241413 (= e!167330 (= (bitIndex!0 (size!5803 (buf!6269 (_1!11218 lt!376959))) (currentByte!11632 (_1!11218 lt!376959)) (currentBit!11627 (_1!11218 lt!376959))) lt!376962))))

(declare-fun b!241414 () Bool)

(assert (=> b!241414 (= e!167325 (not true))))

(declare-fun lt!376960 () (_ BitVec 64))

(declare-datatypes ((Unit!17689 0))(
  ( (Unit!17690) )
))
(declare-datatypes ((tuple2!20594 0))(
  ( (tuple2!20595 (_1!11219 Unit!17689) (_2!11219 BitStream!10528)) )
))
(declare-fun lt!376958 () tuple2!20594)

(assert (=> b!241414 (= lt!376960 (bitIndex!0 (size!5803 (buf!6269 (_2!11219 lt!376958))) (currentByte!11632 (_2!11219 lt!376958)) (currentBit!11627 (_2!11219 lt!376958))))))

(declare-fun lt!376957 () (_ BitVec 64))

(declare-fun thiss!1005 () BitStream!10528)

(assert (=> b!241414 (= lt!376957 (bitIndex!0 (size!5803 (buf!6269 thiss!1005)) (currentByte!11632 thiss!1005) (currentBit!11627 thiss!1005)))))

(declare-fun e!167326 () Bool)

(assert (=> b!241414 e!167326))

(declare-fun res!201527 () Bool)

(assert (=> b!241414 (=> (not res!201527) (not e!167326))))

(assert (=> b!241414 (= res!201527 (= (size!5803 (buf!6269 thiss!1005)) (size!5803 (buf!6269 (_2!11219 lt!376958)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10528 Bool) tuple2!20594)

(assert (=> b!241414 (= lt!376958 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241415 () Bool)

(declare-fun res!201523 () Bool)

(assert (=> b!241415 (=> (not res!201523) (not e!167325))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241415 (= res!201523 (validate_offset_bits!1 ((_ sign_extend 32) (size!5803 (buf!6269 thiss!1005))) ((_ sign_extend 32) (currentByte!11632 thiss!1005)) ((_ sign_extend 32) (currentBit!11627 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241416 () Bool)

(declare-fun e!167328 () Bool)

(assert (=> b!241416 (= e!167326 e!167328)))

(declare-fun res!201522 () Bool)

(assert (=> b!241416 (=> (not res!201522) (not e!167328))))

(declare-fun lt!376961 () (_ BitVec 64))

(assert (=> b!241416 (= res!201522 (= lt!376962 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!376961)))))

(assert (=> b!241416 (= lt!376962 (bitIndex!0 (size!5803 (buf!6269 (_2!11219 lt!376958))) (currentByte!11632 (_2!11219 lt!376958)) (currentBit!11627 (_2!11219 lt!376958))))))

(assert (=> b!241416 (= lt!376961 (bitIndex!0 (size!5803 (buf!6269 thiss!1005)) (currentByte!11632 thiss!1005) (currentBit!11627 thiss!1005)))))

(declare-fun b!241417 () Bool)

(declare-fun e!167329 () Bool)

(declare-fun array_inv!5544 (array!13247) Bool)

(assert (=> b!241417 (= e!167329 (array_inv!5544 (buf!6269 thiss!1005)))))

(declare-fun b!241418 () Bool)

(declare-fun res!201526 () Bool)

(assert (=> b!241418 (=> (not res!201526) (not e!167328))))

(declare-fun isPrefixOf!0 (BitStream!10528 BitStream!10528) Bool)

(assert (=> b!241418 (= res!201526 (isPrefixOf!0 thiss!1005 (_2!11219 lt!376958)))))

(declare-fun res!201524 () Bool)

(assert (=> start!52436 (=> (not res!201524) (not e!167325))))

(assert (=> start!52436 (= res!201524 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52436 e!167325))

(assert (=> start!52436 true))

(declare-fun inv!12 (BitStream!10528) Bool)

(assert (=> start!52436 (and (inv!12 thiss!1005) e!167329)))

(declare-fun b!241411 () Bool)

(assert (=> b!241411 (= e!167328 e!167330)))

(declare-fun res!201528 () Bool)

(assert (=> b!241411 (=> (not res!201528) (not e!167330))))

(assert (=> b!241411 (= res!201528 (and (= (_2!11218 lt!376959) bit!26) (= (_1!11218 lt!376959) (_2!11219 lt!376958))))))

(declare-fun readBitPure!0 (BitStream!10528) tuple2!20592)

(declare-fun readerFrom!0 (BitStream!10528 (_ BitVec 32) (_ BitVec 32)) BitStream!10528)

(assert (=> b!241411 (= lt!376959 (readBitPure!0 (readerFrom!0 (_2!11219 lt!376958) (currentBit!11627 thiss!1005) (currentByte!11632 thiss!1005))))))

(assert (= (and start!52436 res!201524) b!241415))

(assert (= (and b!241415 res!201523) b!241412))

(assert (= (and b!241412 res!201525) b!241414))

(assert (= (and b!241414 res!201527) b!241416))

(assert (= (and b!241416 res!201522) b!241418))

(assert (= (and b!241418 res!201526) b!241411))

(assert (= (and b!241411 res!201528) b!241413))

(assert (= start!52436 b!241417))

(declare-fun m!364091 () Bool)

(assert (=> b!241415 m!364091))

(declare-fun m!364093 () Bool)

(assert (=> b!241414 m!364093))

(declare-fun m!364095 () Bool)

(assert (=> b!241414 m!364095))

(declare-fun m!364097 () Bool)

(assert (=> b!241414 m!364097))

(declare-fun m!364099 () Bool)

(assert (=> b!241417 m!364099))

(declare-fun m!364101 () Bool)

(assert (=> b!241411 m!364101))

(assert (=> b!241411 m!364101))

(declare-fun m!364103 () Bool)

(assert (=> b!241411 m!364103))

(declare-fun m!364105 () Bool)

(assert (=> start!52436 m!364105))

(declare-fun m!364107 () Bool)

(assert (=> b!241418 m!364107))

(assert (=> b!241416 m!364093))

(assert (=> b!241416 m!364095))

(declare-fun m!364109 () Bool)

(assert (=> b!241413 m!364109))

(push 1)

(assert (not b!241415))

(assert (not start!52436))

(assert (not b!241418))

(assert (not b!241411))

(assert (not b!241414))

(assert (not b!241413))

(assert (not b!241416))

(assert (not b!241417))

(check-sat)

(pop 1)

