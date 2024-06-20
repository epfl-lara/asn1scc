; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52460 () Bool)

(assert start!52460)

(declare-fun b!241707 () Bool)

(declare-fun e!167553 () Bool)

(assert (=> b!241707 (= e!167553 true)))

(declare-fun lt!377160 () Bool)

(declare-datatypes ((array!13271 0))(
  ( (array!13272 (arr!6802 (Array (_ BitVec 32) (_ BitVec 8))) (size!5815 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10552 0))(
  ( (BitStream!10553 (buf!6281 array!13271) (currentByte!11644 (_ BitVec 32)) (currentBit!11639 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17713 0))(
  ( (Unit!17714) )
))
(declare-datatypes ((tuple2!20640 0))(
  ( (tuple2!20641 (_1!11242 Unit!17713) (_2!11242 BitStream!10552)) )
))
(declare-fun lt!377159 () tuple2!20640)

(declare-fun lt!377165 () tuple2!20640)

(declare-fun isPrefixOf!0 (BitStream!10552 BitStream!10552) Bool)

(assert (=> b!241707 (= lt!377160 (isPrefixOf!0 (_2!11242 lt!377159) (_2!11242 lt!377165)))))

(declare-fun b!241708 () Bool)

(declare-fun e!167549 () Bool)

(declare-fun e!167551 () Bool)

(assert (=> b!241708 (= e!167549 e!167551)))

(declare-fun res!201790 () Bool)

(assert (=> b!241708 (=> (not res!201790) (not e!167551))))

(declare-fun lt!377166 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241708 (= res!201790 (= (bitIndex!0 (size!5815 (buf!6281 (_2!11242 lt!377165))) (currentByte!11644 (_2!11242 lt!377165)) (currentBit!11639 (_2!11242 lt!377165))) (bvadd (bitIndex!0 (size!5815 (buf!6281 (_2!11242 lt!377159))) (currentByte!11644 (_2!11242 lt!377159)) (currentBit!11639 (_2!11242 lt!377159))) lt!377166)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!241708 (= lt!377166 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!241709 () Bool)

(declare-fun res!201791 () Bool)

(declare-fun e!167547 () Bool)

(assert (=> b!241709 (=> (not res!201791) (not e!167547))))

(declare-fun thiss!1005 () BitStream!10552)

(assert (=> b!241709 (= res!201791 (isPrefixOf!0 thiss!1005 (_2!11242 lt!377159)))))

(declare-fun res!201783 () Bool)

(declare-fun e!167548 () Bool)

(assert (=> start!52460 (=> (not res!201783) (not e!167548))))

(assert (=> start!52460 (= res!201783 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52460 e!167548))

(assert (=> start!52460 true))

(declare-fun e!167552 () Bool)

(declare-fun inv!12 (BitStream!10552) Bool)

(assert (=> start!52460 (and (inv!12 thiss!1005) e!167552)))

(declare-fun b!241710 () Bool)

(declare-fun array_inv!5556 (array!13271) Bool)

(assert (=> b!241710 (= e!167552 (array_inv!5556 (buf!6281 thiss!1005)))))

(declare-fun b!241711 () Bool)

(declare-fun res!201792 () Bool)

(assert (=> b!241711 (=> (not res!201792) (not e!167548))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241711 (= res!201792 (validate_offset_bits!1 ((_ sign_extend 32) (size!5815 (buf!6281 thiss!1005))) ((_ sign_extend 32) (currentByte!11644 thiss!1005)) ((_ sign_extend 32) (currentBit!11639 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241712 () Bool)

(declare-fun e!167550 () Bool)

(assert (=> b!241712 (= e!167550 e!167547)))

(declare-fun res!201788 () Bool)

(assert (=> b!241712 (=> (not res!201788) (not e!167547))))

(declare-fun lt!377161 () (_ BitVec 64))

(declare-fun lt!377164 () (_ BitVec 64))

(assert (=> b!241712 (= res!201788 (= lt!377161 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377164)))))

(assert (=> b!241712 (= lt!377161 (bitIndex!0 (size!5815 (buf!6281 (_2!11242 lt!377159))) (currentByte!11644 (_2!11242 lt!377159)) (currentBit!11639 (_2!11242 lt!377159))))))

(assert (=> b!241712 (= lt!377164 (bitIndex!0 (size!5815 (buf!6281 thiss!1005)) (currentByte!11644 thiss!1005) (currentBit!11639 thiss!1005)))))

(declare-fun b!241713 () Bool)

(declare-fun res!201784 () Bool)

(assert (=> b!241713 (=> (not res!201784) (not e!167551))))

(assert (=> b!241713 (= res!201784 (isPrefixOf!0 (_2!11242 lt!377159) (_2!11242 lt!377165)))))

(declare-fun b!241714 () Bool)

(declare-fun e!167554 () Bool)

(assert (=> b!241714 (= e!167547 e!167554)))

(declare-fun res!201789 () Bool)

(assert (=> b!241714 (=> (not res!201789) (not e!167554))))

(declare-datatypes ((tuple2!20642 0))(
  ( (tuple2!20643 (_1!11243 BitStream!10552) (_2!11243 Bool)) )
))
(declare-fun lt!377157 () tuple2!20642)

(declare-fun bit!26 () Bool)

(assert (=> b!241714 (= res!201789 (and (= (_2!11243 lt!377157) bit!26) (= (_1!11243 lt!377157) (_2!11242 lt!377159))))))

(declare-fun readBitPure!0 (BitStream!10552) tuple2!20642)

(declare-fun readerFrom!0 (BitStream!10552 (_ BitVec 32) (_ BitVec 32)) BitStream!10552)

(assert (=> b!241714 (= lt!377157 (readBitPure!0 (readerFrom!0 (_2!11242 lt!377159) (currentBit!11639 thiss!1005) (currentByte!11644 thiss!1005))))))

(declare-fun b!241715 () Bool)

(declare-fun lt!377158 () tuple2!20642)

(declare-datatypes ((tuple2!20644 0))(
  ( (tuple2!20645 (_1!11244 BitStream!10552) (_2!11244 BitStream!10552)) )
))
(declare-fun lt!377162 () tuple2!20644)

(assert (=> b!241715 (= e!167551 (not (or (not (_2!11243 lt!377158)) (not (= (_1!11243 lt!377158) (_2!11244 lt!377162))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10552 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20642)

(assert (=> b!241715 (= lt!377158 (checkBitsLoopPure!0 (_1!11244 lt!377162) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!241715 (validate_offset_bits!1 ((_ sign_extend 32) (size!5815 (buf!6281 (_2!11242 lt!377165)))) ((_ sign_extend 32) (currentByte!11644 (_2!11242 lt!377159))) ((_ sign_extend 32) (currentBit!11639 (_2!11242 lt!377159))) lt!377166)))

(declare-fun lt!377163 () Unit!17713)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10552 array!13271 (_ BitVec 64)) Unit!17713)

(assert (=> b!241715 (= lt!377163 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11242 lt!377159) (buf!6281 (_2!11242 lt!377165)) lt!377166))))

(declare-fun reader!0 (BitStream!10552 BitStream!10552) tuple2!20644)

(assert (=> b!241715 (= lt!377162 (reader!0 (_2!11242 lt!377159) (_2!11242 lt!377165)))))

(declare-fun b!241716 () Bool)

(assert (=> b!241716 (= e!167548 (not e!167553))))

(declare-fun res!201785 () Bool)

(assert (=> b!241716 (=> res!201785 e!167553)))

(assert (=> b!241716 (= res!201785 (not (isPrefixOf!0 thiss!1005 (_2!11242 lt!377159))))))

(assert (=> b!241716 e!167549))

(declare-fun res!201787 () Bool)

(assert (=> b!241716 (=> (not res!201787) (not e!167549))))

(assert (=> b!241716 (= res!201787 (= (size!5815 (buf!6281 (_2!11242 lt!377159))) (size!5815 (buf!6281 (_2!11242 lt!377165)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10552 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20640)

(assert (=> b!241716 (= lt!377165 (appendNBitsLoop!0 (_2!11242 lt!377159) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!241716 (validate_offset_bits!1 ((_ sign_extend 32) (size!5815 (buf!6281 (_2!11242 lt!377159)))) ((_ sign_extend 32) (currentByte!11644 (_2!11242 lt!377159))) ((_ sign_extend 32) (currentBit!11639 (_2!11242 lt!377159))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377156 () Unit!17713)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10552 BitStream!10552 (_ BitVec 64) (_ BitVec 64)) Unit!17713)

(assert (=> b!241716 (= lt!377156 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11242 lt!377159) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!241716 e!167550))

(declare-fun res!201782 () Bool)

(assert (=> b!241716 (=> (not res!201782) (not e!167550))))

(assert (=> b!241716 (= res!201782 (= (size!5815 (buf!6281 thiss!1005)) (size!5815 (buf!6281 (_2!11242 lt!377159)))))))

(declare-fun appendBit!0 (BitStream!10552 Bool) tuple2!20640)

(assert (=> b!241716 (= lt!377159 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241717 () Bool)

(declare-fun res!201786 () Bool)

(assert (=> b!241717 (=> (not res!201786) (not e!167548))))

(assert (=> b!241717 (= res!201786 (bvslt from!289 nBits!297))))

(declare-fun b!241718 () Bool)

(assert (=> b!241718 (= e!167554 (= (bitIndex!0 (size!5815 (buf!6281 (_1!11243 lt!377157))) (currentByte!11644 (_1!11243 lt!377157)) (currentBit!11639 (_1!11243 lt!377157))) lt!377161))))

(assert (= (and start!52460 res!201783) b!241711))

(assert (= (and b!241711 res!201792) b!241717))

(assert (= (and b!241717 res!201786) b!241716))

(assert (= (and b!241716 res!201782) b!241712))

(assert (= (and b!241712 res!201788) b!241709))

(assert (= (and b!241709 res!201791) b!241714))

(assert (= (and b!241714 res!201789) b!241718))

(assert (= (and b!241716 res!201787) b!241708))

(assert (= (and b!241708 res!201790) b!241713))

(assert (= (and b!241713 res!201784) b!241715))

(assert (= (and b!241716 (not res!201785)) b!241707))

(assert (= start!52460 b!241710))

(declare-fun m!364367 () Bool)

(assert (=> start!52460 m!364367))

(declare-fun m!364369 () Bool)

(assert (=> b!241713 m!364369))

(declare-fun m!364371 () Bool)

(assert (=> b!241714 m!364371))

(assert (=> b!241714 m!364371))

(declare-fun m!364373 () Bool)

(assert (=> b!241714 m!364373))

(declare-fun m!364375 () Bool)

(assert (=> b!241709 m!364375))

(declare-fun m!364377 () Bool)

(assert (=> b!241710 m!364377))

(declare-fun m!364379 () Bool)

(assert (=> b!241715 m!364379))

(declare-fun m!364381 () Bool)

(assert (=> b!241715 m!364381))

(declare-fun m!364383 () Bool)

(assert (=> b!241715 m!364383))

(declare-fun m!364385 () Bool)

(assert (=> b!241715 m!364385))

(assert (=> b!241707 m!364369))

(declare-fun m!364387 () Bool)

(assert (=> b!241712 m!364387))

(declare-fun m!364389 () Bool)

(assert (=> b!241712 m!364389))

(declare-fun m!364391 () Bool)

(assert (=> b!241718 m!364391))

(declare-fun m!364393 () Bool)

(assert (=> b!241708 m!364393))

(assert (=> b!241708 m!364387))

(declare-fun m!364395 () Bool)

(assert (=> b!241711 m!364395))

(declare-fun m!364397 () Bool)

(assert (=> b!241716 m!364397))

(declare-fun m!364399 () Bool)

(assert (=> b!241716 m!364399))

(assert (=> b!241716 m!364375))

(declare-fun m!364401 () Bool)

(assert (=> b!241716 m!364401))

(declare-fun m!364403 () Bool)

(assert (=> b!241716 m!364403))

(push 1)

(assert (not b!241716))

(assert (not b!241710))

(assert (not b!241707))

(assert (not b!241714))

(assert (not b!241718))

(assert (not b!241715))

(assert (not b!241709))

(assert (not b!241708))

(assert (not b!241712))

(assert (not b!241713))

(assert (not start!52460))

(assert (not b!241711))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

