; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43860 () Bool)

(assert start!43860)

(declare-fun b!208772 () Bool)

(declare-fun e!142590 () Bool)

(declare-datatypes ((array!10457 0))(
  ( (array!10458 (arr!5527 (Array (_ BitVec 32) (_ BitVec 8))) (size!4597 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8302 0))(
  ( (BitStream!8303 (buf!5108 array!10457) (currentByte!9638 (_ BitVec 32)) (currentBit!9633 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17906 0))(
  ( (tuple2!17907 (_1!9608 BitStream!8302) (_2!9608 Bool)) )
))
(declare-fun lt!326526 () tuple2!17906)

(declare-fun lt!326542 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208772 (= e!142590 (= (bitIndex!0 (size!4597 (buf!5108 (_1!9608 lt!326526))) (currentByte!9638 (_1!9608 lt!326526)) (currentBit!9633 (_1!9608 lt!326526))) lt!326542))))

(declare-fun b!208773 () Bool)

(declare-fun e!142598 () Bool)

(declare-fun e!142589 () Bool)

(assert (=> b!208773 (= e!142598 e!142589)))

(declare-fun res!175223 () Bool)

(assert (=> b!208773 (=> res!175223 e!142589)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!326531 () (_ BitVec 64))

(declare-fun lt!326540 () (_ BitVec 64))

(declare-datatypes ((tuple2!17908 0))(
  ( (tuple2!17909 (_1!9609 BitStream!8302) (_2!9609 BitStream!8302)) )
))
(declare-fun lt!326543 () tuple2!17908)

(declare-fun lt!326527 () tuple2!17906)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((tuple2!17910 0))(
  ( (tuple2!17911 (_1!9610 BitStream!8302) (_2!9610 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17910)

(assert (=> b!208773 (= res!175223 (not (= (_1!9610 (readNBitsLSBFirstsLoopPure!0 (_1!9609 lt!326543) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!326531 (ite (_2!9608 lt!326527) lt!326540 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9609 lt!326543))))))

(declare-datatypes ((Unit!14866 0))(
  ( (Unit!14867) )
))
(declare-datatypes ((tuple2!17912 0))(
  ( (tuple2!17913 (_1!9611 Unit!14866) (_2!9611 BitStream!8302)) )
))
(declare-fun lt!326525 () tuple2!17912)

(declare-fun lt!326541 () tuple2!17912)

(declare-fun lt!326534 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!208773 (validate_offset_bits!1 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!326525)))) ((_ sign_extend 32) (currentByte!9638 (_2!9611 lt!326541))) ((_ sign_extend 32) (currentBit!9633 (_2!9611 lt!326541))) lt!326534)))

(declare-fun lt!326524 () Unit!14866)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8302 array!10457 (_ BitVec 64)) Unit!14866)

(assert (=> b!208773 (= lt!326524 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9611 lt!326541) (buf!5108 (_2!9611 lt!326525)) lt!326534))))

(assert (=> b!208773 (= lt!326534 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!326539 () tuple2!17908)

(declare-fun lt!326520 () tuple2!17910)

(assert (=> b!208773 (= lt!326520 (readNBitsLSBFirstsLoopPure!0 (_1!9609 lt!326539) nBits!348 i!590 lt!326531))))

(declare-fun thiss!1204 () BitStream!8302)

(declare-fun lt!326523 () (_ BitVec 64))

(assert (=> b!208773 (validate_offset_bits!1 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!326525)))) ((_ sign_extend 32) (currentByte!9638 thiss!1204)) ((_ sign_extend 32) (currentBit!9633 thiss!1204)) lt!326523)))

(declare-fun lt!326530 () Unit!14866)

(assert (=> b!208773 (= lt!326530 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5108 (_2!9611 lt!326525)) lt!326523))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208773 (= lt!326531 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!326532 () Bool)

(assert (=> b!208773 (= (_2!9608 lt!326527) lt!326532)))

(declare-fun readBitPure!0 (BitStream!8302) tuple2!17906)

(assert (=> b!208773 (= lt!326527 (readBitPure!0 (_1!9609 lt!326539)))))

(declare-fun reader!0 (BitStream!8302 BitStream!8302) tuple2!17908)

(assert (=> b!208773 (= lt!326543 (reader!0 (_2!9611 lt!326541) (_2!9611 lt!326525)))))

(assert (=> b!208773 (= lt!326539 (reader!0 thiss!1204 (_2!9611 lt!326525)))))

(declare-fun e!142592 () Bool)

(assert (=> b!208773 e!142592))

(declare-fun res!175217 () Bool)

(assert (=> b!208773 (=> (not res!175217) (not e!142592))))

(declare-fun lt!326535 () tuple2!17906)

(declare-fun lt!326529 () tuple2!17906)

(assert (=> b!208773 (= res!175217 (= (bitIndex!0 (size!4597 (buf!5108 (_1!9608 lt!326535))) (currentByte!9638 (_1!9608 lt!326535)) (currentBit!9633 (_1!9608 lt!326535))) (bitIndex!0 (size!4597 (buf!5108 (_1!9608 lt!326529))) (currentByte!9638 (_1!9608 lt!326529)) (currentBit!9633 (_1!9608 lt!326529)))))))

(declare-fun lt!326533 () Unit!14866)

(declare-fun lt!326521 () BitStream!8302)

(declare-fun readBitPrefixLemma!0 (BitStream!8302 BitStream!8302) Unit!14866)

(assert (=> b!208773 (= lt!326533 (readBitPrefixLemma!0 lt!326521 (_2!9611 lt!326525)))))

(assert (=> b!208773 (= lt!326529 (readBitPure!0 (BitStream!8303 (buf!5108 (_2!9611 lt!326525)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204))))))

(assert (=> b!208773 (= lt!326535 (readBitPure!0 lt!326521))))

(declare-fun e!142594 () Bool)

(assert (=> b!208773 e!142594))

(declare-fun res!175230 () Bool)

(assert (=> b!208773 (=> (not res!175230) (not e!142594))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!208773 (= res!175230 (invariant!0 (currentBit!9633 thiss!1204) (currentByte!9638 thiss!1204) (size!4597 (buf!5108 (_2!9611 lt!326541)))))))

(assert (=> b!208773 (= lt!326521 (BitStream!8303 (buf!5108 (_2!9611 lt!326541)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204)))))

(declare-fun b!208774 () Bool)

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208774 (= e!142589 (= (bvand lt!326531 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!175235 () Bool)

(declare-fun e!142597 () Bool)

(assert (=> start!43860 (=> (not res!175235) (not e!142597))))

(assert (=> start!43860 (= res!175235 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43860 e!142597))

(assert (=> start!43860 true))

(declare-fun e!142596 () Bool)

(declare-fun inv!12 (BitStream!8302) Bool)

(assert (=> start!43860 (and (inv!12 thiss!1204) e!142596)))

(declare-fun b!208775 () Bool)

(declare-fun res!175218 () Bool)

(assert (=> b!208775 (=> res!175218 e!142598)))

(declare-fun lt!326536 () (_ BitVec 64))

(declare-fun lt!326537 () (_ BitVec 64))

(assert (=> b!208775 (= res!175218 (or (not (= (size!4597 (buf!5108 (_2!9611 lt!326525))) (size!4597 (buf!5108 thiss!1204)))) (not (= lt!326537 (bvsub (bvadd lt!326536 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!208776 () Bool)

(declare-fun res!175226 () Bool)

(assert (=> b!208776 (=> res!175226 e!142598)))

(declare-fun isPrefixOf!0 (BitStream!8302 BitStream!8302) Bool)

(assert (=> b!208776 (= res!175226 (not (isPrefixOf!0 thiss!1204 (_2!9611 lt!326541))))))

(declare-fun b!208777 () Bool)

(declare-fun res!175222 () Bool)

(assert (=> b!208777 (=> res!175222 e!142598)))

(assert (=> b!208777 (= res!175222 (not (isPrefixOf!0 (_2!9611 lt!326541) (_2!9611 lt!326525))))))

(declare-fun b!208778 () Bool)

(declare-fun res!175225 () Bool)

(assert (=> b!208778 (=> res!175225 e!142589)))

(assert (=> b!208778 (= res!175225 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4597 (buf!5108 (_1!9609 lt!326539)))) ((_ sign_extend 32) (currentByte!9638 (_1!9609 lt!326539))) ((_ sign_extend 32) (currentBit!9633 (_1!9609 lt!326539))) lt!326523)))))

(declare-fun b!208779 () Bool)

(declare-fun e!142591 () Bool)

(declare-fun e!142588 () Bool)

(assert (=> b!208779 (= e!142591 (not e!142588))))

(declare-fun res!175220 () Bool)

(assert (=> b!208779 (=> res!175220 e!142588)))

(declare-fun lt!326538 () (_ BitVec 64))

(assert (=> b!208779 (= res!175220 (not (= lt!326538 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!326536))))))

(assert (=> b!208779 (= lt!326538 (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326541))) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541))))))

(assert (=> b!208779 (= lt!326536 (bitIndex!0 (size!4597 (buf!5108 thiss!1204)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204)))))

(declare-fun e!142593 () Bool)

(assert (=> b!208779 e!142593))

(declare-fun res!175224 () Bool)

(assert (=> b!208779 (=> (not res!175224) (not e!142593))))

(assert (=> b!208779 (= res!175224 (= (size!4597 (buf!5108 thiss!1204)) (size!4597 (buf!5108 (_2!9611 lt!326541)))))))

(declare-fun appendBit!0 (BitStream!8302 Bool) tuple2!17912)

(assert (=> b!208779 (= lt!326541 (appendBit!0 thiss!1204 lt!326532))))

(assert (=> b!208779 (= lt!326532 (not (= (bvand v!189 lt!326540) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208779 (= lt!326540 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!208780 () Bool)

(declare-fun e!142599 () Bool)

(assert (=> b!208780 (= e!142599 e!142590)))

(declare-fun res!175234 () Bool)

(assert (=> b!208780 (=> (not res!175234) (not e!142590))))

(assert (=> b!208780 (= res!175234 (and (= (_2!9608 lt!326526) lt!326532) (= (_1!9608 lt!326526) (_2!9611 lt!326541))))))

(declare-fun readerFrom!0 (BitStream!8302 (_ BitVec 32) (_ BitVec 32)) BitStream!8302)

(assert (=> b!208780 (= lt!326526 (readBitPure!0 (readerFrom!0 (_2!9611 lt!326541) (currentBit!9633 thiss!1204) (currentByte!9638 thiss!1204))))))

(declare-fun b!208781 () Bool)

(declare-fun res!175229 () Bool)

(assert (=> b!208781 (=> (not res!175229) (not e!142591))))

(assert (=> b!208781 (= res!175229 (not (= i!590 nBits!348)))))

(declare-fun b!208782 () Bool)

(assert (=> b!208782 (= e!142588 e!142598)))

(declare-fun res!175219 () Bool)

(assert (=> b!208782 (=> res!175219 e!142598)))

(assert (=> b!208782 (= res!175219 (not (= lt!326537 (bvsub (bvsub (bvadd lt!326538 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!208782 (= lt!326537 (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326525))) (currentByte!9638 (_2!9611 lt!326525)) (currentBit!9633 (_2!9611 lt!326525))))))

(assert (=> b!208782 (isPrefixOf!0 thiss!1204 (_2!9611 lt!326525))))

(declare-fun lt!326528 () Unit!14866)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8302 BitStream!8302 BitStream!8302) Unit!14866)

(assert (=> b!208782 (= lt!326528 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9611 lt!326541) (_2!9611 lt!326525)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8302 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17912)

(assert (=> b!208782 (= lt!326525 (appendBitsLSBFirstLoopTR!0 (_2!9611 lt!326541) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!208783 () Bool)

(declare-fun res!175232 () Bool)

(assert (=> b!208783 (=> (not res!175232) (not e!142591))))

(assert (=> b!208783 (= res!175232 (invariant!0 (currentBit!9633 thiss!1204) (currentByte!9638 thiss!1204) (size!4597 (buf!5108 thiss!1204))))))

(declare-fun b!208784 () Bool)

(assert (=> b!208784 (= e!142592 (= (_2!9608 lt!326535) (_2!9608 lt!326529)))))

(declare-fun b!208785 () Bool)

(declare-fun array_inv!4338 (array!10457) Bool)

(assert (=> b!208785 (= e!142596 (array_inv!4338 (buf!5108 thiss!1204)))))

(declare-fun b!208786 () Bool)

(assert (=> b!208786 (= e!142597 e!142591)))

(declare-fun res!175228 () Bool)

(assert (=> b!208786 (=> (not res!175228) (not e!142591))))

(assert (=> b!208786 (= res!175228 (validate_offset_bits!1 ((_ sign_extend 32) (size!4597 (buf!5108 thiss!1204))) ((_ sign_extend 32) (currentByte!9638 thiss!1204)) ((_ sign_extend 32) (currentBit!9633 thiss!1204)) lt!326523))))

(assert (=> b!208786 (= lt!326523 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!208787 () Bool)

(assert (=> b!208787 (= e!142594 (invariant!0 (currentBit!9633 thiss!1204) (currentByte!9638 thiss!1204) (size!4597 (buf!5108 (_2!9611 lt!326525)))))))

(declare-fun b!208788 () Bool)

(declare-fun res!175227 () Bool)

(assert (=> b!208788 (=> (not res!175227) (not e!142599))))

(assert (=> b!208788 (= res!175227 (isPrefixOf!0 thiss!1204 (_2!9611 lt!326541)))))

(declare-fun b!208789 () Bool)

(assert (=> b!208789 (= e!142593 e!142599)))

(declare-fun res!175233 () Bool)

(assert (=> b!208789 (=> (not res!175233) (not e!142599))))

(declare-fun lt!326522 () (_ BitVec 64))

(assert (=> b!208789 (= res!175233 (= lt!326542 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!326522)))))

(assert (=> b!208789 (= lt!326542 (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326541))) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541))))))

(assert (=> b!208789 (= lt!326522 (bitIndex!0 (size!4597 (buf!5108 thiss!1204)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204)))))

(declare-fun b!208790 () Bool)

(declare-fun res!175231 () Bool)

(assert (=> b!208790 (=> res!175231 e!142598)))

(assert (=> b!208790 (= res!175231 (not (invariant!0 (currentBit!9633 (_2!9611 lt!326525)) (currentByte!9638 (_2!9611 lt!326525)) (size!4597 (buf!5108 (_2!9611 lt!326525))))))))

(declare-fun b!208791 () Bool)

(declare-fun res!175221 () Bool)

(assert (=> b!208791 (=> res!175221 e!142589)))

(assert (=> b!208791 (= res!175221 (bvsge i!590 nBits!348))))

(assert (= (and start!43860 res!175235) b!208786))

(assert (= (and b!208786 res!175228) b!208783))

(assert (= (and b!208783 res!175232) b!208781))

(assert (= (and b!208781 res!175229) b!208779))

(assert (= (and b!208779 res!175224) b!208789))

(assert (= (and b!208789 res!175233) b!208788))

(assert (= (and b!208788 res!175227) b!208780))

(assert (= (and b!208780 res!175234) b!208772))

(assert (= (and b!208779 (not res!175220)) b!208782))

(assert (= (and b!208782 (not res!175219)) b!208790))

(assert (= (and b!208790 (not res!175231)) b!208775))

(assert (= (and b!208775 (not res!175218)) b!208777))

(assert (= (and b!208777 (not res!175222)) b!208776))

(assert (= (and b!208776 (not res!175226)) b!208773))

(assert (= (and b!208773 res!175230) b!208787))

(assert (= (and b!208773 res!175217) b!208784))

(assert (= (and b!208773 (not res!175223)) b!208791))

(assert (= (and b!208791 (not res!175221)) b!208778))

(assert (= (and b!208778 (not res!175225)) b!208774))

(assert (= start!43860 b!208785))

(declare-fun m!321261 () Bool)

(assert (=> b!208777 m!321261))

(declare-fun m!321263 () Bool)

(assert (=> b!208785 m!321263))

(declare-fun m!321265 () Bool)

(assert (=> b!208774 m!321265))

(declare-fun m!321267 () Bool)

(assert (=> b!208779 m!321267))

(declare-fun m!321269 () Bool)

(assert (=> b!208779 m!321269))

(declare-fun m!321271 () Bool)

(assert (=> b!208779 m!321271))

(declare-fun m!321273 () Bool)

(assert (=> b!208782 m!321273))

(declare-fun m!321275 () Bool)

(assert (=> b!208782 m!321275))

(declare-fun m!321277 () Bool)

(assert (=> b!208782 m!321277))

(declare-fun m!321279 () Bool)

(assert (=> b!208782 m!321279))

(declare-fun m!321281 () Bool)

(assert (=> b!208790 m!321281))

(declare-fun m!321283 () Bool)

(assert (=> b!208773 m!321283))

(declare-fun m!321285 () Bool)

(assert (=> b!208773 m!321285))

(declare-fun m!321287 () Bool)

(assert (=> b!208773 m!321287))

(declare-fun m!321289 () Bool)

(assert (=> b!208773 m!321289))

(declare-fun m!321291 () Bool)

(assert (=> b!208773 m!321291))

(declare-fun m!321293 () Bool)

(assert (=> b!208773 m!321293))

(declare-fun m!321295 () Bool)

(assert (=> b!208773 m!321295))

(declare-fun m!321297 () Bool)

(assert (=> b!208773 m!321297))

(declare-fun m!321299 () Bool)

(assert (=> b!208773 m!321299))

(declare-fun m!321301 () Bool)

(assert (=> b!208773 m!321301))

(declare-fun m!321303 () Bool)

(assert (=> b!208773 m!321303))

(declare-fun m!321305 () Bool)

(assert (=> b!208773 m!321305))

(declare-fun m!321307 () Bool)

(assert (=> b!208773 m!321307))

(declare-fun m!321309 () Bool)

(assert (=> b!208773 m!321309))

(declare-fun m!321311 () Bool)

(assert (=> b!208773 m!321311))

(declare-fun m!321313 () Bool)

(assert (=> b!208773 m!321313))

(declare-fun m!321315 () Bool)

(assert (=> b!208783 m!321315))

(declare-fun m!321317 () Bool)

(assert (=> b!208776 m!321317))

(declare-fun m!321319 () Bool)

(assert (=> b!208772 m!321319))

(assert (=> b!208789 m!321267))

(assert (=> b!208789 m!321269))

(declare-fun m!321321 () Bool)

(assert (=> b!208786 m!321321))

(declare-fun m!321323 () Bool)

(assert (=> b!208778 m!321323))

(declare-fun m!321325 () Bool)

(assert (=> b!208780 m!321325))

(assert (=> b!208780 m!321325))

(declare-fun m!321327 () Bool)

(assert (=> b!208780 m!321327))

(assert (=> b!208788 m!321317))

(declare-fun m!321329 () Bool)

(assert (=> start!43860 m!321329))

(declare-fun m!321331 () Bool)

(assert (=> b!208787 m!321331))

(push 1)

(assert (not b!208773))

(assert (not b!208776))

(assert (not b!208777))

(assert (not b!208778))

(assert (not b!208774))

(assert (not b!208788))

(assert (not b!208790))

(assert (not b!208783))

(assert (not b!208780))

(assert (not b!208786))

(assert (not b!208779))

(assert (not b!208782))

(assert (not b!208772))

(assert (not b!208785))

(assert (not b!208789))

(assert (not b!208787))

(assert (not start!43860))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70641 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!70641 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!326525)))) ((_ sign_extend 32) (currentByte!9638 (_2!9611 lt!326541))) ((_ sign_extend 32) (currentBit!9633 (_2!9611 lt!326541))) lt!326534) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!326525)))) ((_ sign_extend 32) (currentByte!9638 (_2!9611 lt!326541))) ((_ sign_extend 32) (currentBit!9633 (_2!9611 lt!326541)))) lt!326534))))

(declare-fun bs!17360 () Bool)

(assert (= bs!17360 d!70641))

(declare-fun m!321587 () Bool)

(assert (=> bs!17360 m!321587))

(assert (=> b!208773 d!70641))

(declare-fun d!70643 () Bool)

(declare-datatypes ((tuple2!17934 0))(
  ( (tuple2!17935 (_1!9622 Bool) (_2!9622 BitStream!8302)) )
))
(declare-fun lt!326835 () tuple2!17934)

(declare-fun readBit!0 (BitStream!8302) tuple2!17934)

(assert (=> d!70643 (= lt!326835 (readBit!0 (BitStream!8303 (buf!5108 (_2!9611 lt!326525)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204))))))

(assert (=> d!70643 (= (readBitPure!0 (BitStream!8303 (buf!5108 (_2!9611 lt!326525)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204))) (tuple2!17907 (_2!9622 lt!326835) (_1!9622 lt!326835)))))

(declare-fun bs!17361 () Bool)

(assert (= bs!17361 d!70643))

(declare-fun m!321589 () Bool)

(assert (=> bs!17361 m!321589))

(assert (=> b!208773 d!70643))

(declare-fun d!70645 () Bool)

(assert (=> d!70645 (= (invariant!0 (currentBit!9633 thiss!1204) (currentByte!9638 thiss!1204) (size!4597 (buf!5108 (_2!9611 lt!326541)))) (and (bvsge (currentBit!9633 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9633 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9638 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9638 thiss!1204) (size!4597 (buf!5108 (_2!9611 lt!326541)))) (and (= (currentBit!9633 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9638 thiss!1204) (size!4597 (buf!5108 (_2!9611 lt!326541))))))))))

(assert (=> b!208773 d!70645))

(declare-fun d!70647 () Bool)

(declare-fun e!142704 () Bool)

(assert (=> d!70647 e!142704))

(declare-fun res!175400 () Bool)

(assert (=> d!70647 (=> (not res!175400) (not e!142704))))

(declare-fun lt!326852 () (_ BitVec 64))

(declare-fun lt!326848 () (_ BitVec 64))

(declare-fun lt!326853 () (_ BitVec 64))

(assert (=> d!70647 (= res!175400 (= lt!326852 (bvsub lt!326853 lt!326848)))))

(assert (=> d!70647 (or (= (bvand lt!326853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326848 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326853 lt!326848) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70647 (= lt!326848 (remainingBits!0 ((_ sign_extend 32) (size!4597 (buf!5108 (_1!9608 lt!326529)))) ((_ sign_extend 32) (currentByte!9638 (_1!9608 lt!326529))) ((_ sign_extend 32) (currentBit!9633 (_1!9608 lt!326529)))))))

(declare-fun lt!326850 () (_ BitVec 64))

(declare-fun lt!326849 () (_ BitVec 64))

(assert (=> d!70647 (= lt!326853 (bvmul lt!326850 lt!326849))))

(assert (=> d!70647 (or (= lt!326850 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326849 (bvsdiv (bvmul lt!326850 lt!326849) lt!326850)))))

(assert (=> d!70647 (= lt!326849 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70647 (= lt!326850 ((_ sign_extend 32) (size!4597 (buf!5108 (_1!9608 lt!326529)))))))

(assert (=> d!70647 (= lt!326852 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9638 (_1!9608 lt!326529))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9633 (_1!9608 lt!326529)))))))

(assert (=> d!70647 (invariant!0 (currentBit!9633 (_1!9608 lt!326529)) (currentByte!9638 (_1!9608 lt!326529)) (size!4597 (buf!5108 (_1!9608 lt!326529))))))

(assert (=> d!70647 (= (bitIndex!0 (size!4597 (buf!5108 (_1!9608 lt!326529))) (currentByte!9638 (_1!9608 lt!326529)) (currentBit!9633 (_1!9608 lt!326529))) lt!326852)))

(declare-fun b!208969 () Bool)

(declare-fun res!175401 () Bool)

(assert (=> b!208969 (=> (not res!175401) (not e!142704))))

(assert (=> b!208969 (= res!175401 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326852))))

(declare-fun b!208970 () Bool)

(declare-fun lt!326851 () (_ BitVec 64))

(assert (=> b!208970 (= e!142704 (bvsle lt!326852 (bvmul lt!326851 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208970 (or (= lt!326851 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326851 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326851)))))

(assert (=> b!208970 (= lt!326851 ((_ sign_extend 32) (size!4597 (buf!5108 (_1!9608 lt!326529)))))))

(assert (= (and d!70647 res!175400) b!208969))

(assert (= (and b!208969 res!175401) b!208970))

(declare-fun m!321591 () Bool)

(assert (=> d!70647 m!321591))

(declare-fun m!321593 () Bool)

(assert (=> d!70647 m!321593))

(assert (=> b!208773 d!70647))

(declare-fun d!70649 () Bool)

(assert (=> d!70649 (validate_offset_bits!1 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!326525)))) ((_ sign_extend 32) (currentByte!9638 (_2!9611 lt!326541))) ((_ sign_extend 32) (currentBit!9633 (_2!9611 lt!326541))) lt!326534)))

(declare-fun lt!326856 () Unit!14866)

(declare-fun choose!9 (BitStream!8302 array!10457 (_ BitVec 64) BitStream!8302) Unit!14866)

(assert (=> d!70649 (= lt!326856 (choose!9 (_2!9611 lt!326541) (buf!5108 (_2!9611 lt!326525)) lt!326534 (BitStream!8303 (buf!5108 (_2!9611 lt!326525)) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541)))))))

(assert (=> d!70649 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9611 lt!326541) (buf!5108 (_2!9611 lt!326525)) lt!326534) lt!326856)))

(declare-fun bs!17362 () Bool)

(assert (= bs!17362 d!70649))

(assert (=> bs!17362 m!321307))

(declare-fun m!321595 () Bool)

(assert (=> bs!17362 m!321595))

(assert (=> b!208773 d!70649))

(declare-fun d!70651 () Bool)

(declare-fun lt!326857 () tuple2!17934)

(assert (=> d!70651 (= lt!326857 (readBit!0 lt!326521))))

(assert (=> d!70651 (= (readBitPure!0 lt!326521) (tuple2!17907 (_2!9622 lt!326857) (_1!9622 lt!326857)))))

(declare-fun bs!17363 () Bool)

(assert (= bs!17363 d!70651))

(declare-fun m!321597 () Bool)

(assert (=> bs!17363 m!321597))

(assert (=> b!208773 d!70651))

(declare-fun d!70653 () Bool)

(declare-fun lt!326858 () tuple2!17934)

(assert (=> d!70653 (= lt!326858 (readBit!0 (_1!9609 lt!326539)))))

(assert (=> d!70653 (= (readBitPure!0 (_1!9609 lt!326539)) (tuple2!17907 (_2!9622 lt!326858) (_1!9622 lt!326858)))))

(declare-fun bs!17364 () Bool)

(assert (= bs!17364 d!70653))

(declare-fun m!321599 () Bool)

(assert (=> bs!17364 m!321599))

(assert (=> b!208773 d!70653))

(declare-fun d!70655 () Bool)

(assert (=> d!70655 (validate_offset_bits!1 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!326525)))) ((_ sign_extend 32) (currentByte!9638 thiss!1204)) ((_ sign_extend 32) (currentBit!9633 thiss!1204)) lt!326523)))

(declare-fun lt!326859 () Unit!14866)

(assert (=> d!70655 (= lt!326859 (choose!9 thiss!1204 (buf!5108 (_2!9611 lt!326525)) lt!326523 (BitStream!8303 (buf!5108 (_2!9611 lt!326525)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204))))))

(assert (=> d!70655 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5108 (_2!9611 lt!326525)) lt!326523) lt!326859)))

(declare-fun bs!17365 () Bool)

(assert (= bs!17365 d!70655))

(assert (=> bs!17365 m!321289))

(declare-fun m!321601 () Bool)

(assert (=> bs!17365 m!321601))

(assert (=> b!208773 d!70655))

(declare-fun d!70657 () Bool)

(assert (=> d!70657 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!326525)))) ((_ sign_extend 32) (currentByte!9638 thiss!1204)) ((_ sign_extend 32) (currentBit!9633 thiss!1204)) lt!326523) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!326525)))) ((_ sign_extend 32) (currentByte!9638 thiss!1204)) ((_ sign_extend 32) (currentBit!9633 thiss!1204))) lt!326523))))

(declare-fun bs!17366 () Bool)

(assert (= bs!17366 d!70657))

(declare-fun m!321603 () Bool)

(assert (=> bs!17366 m!321603))

(assert (=> b!208773 d!70657))

(declare-fun d!70659 () Bool)

(assert (=> d!70659 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!208773 d!70659))

(declare-fun d!70661 () Bool)

(declare-datatypes ((tuple2!17936 0))(
  ( (tuple2!17937 (_1!9623 (_ BitVec 64)) (_2!9623 BitStream!8302)) )
))
(declare-fun lt!326862 () tuple2!17936)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17936)

(assert (=> d!70661 (= lt!326862 (readNBitsLSBFirstsLoop!0 (_1!9609 lt!326539) nBits!348 i!590 lt!326531))))

(assert (=> d!70661 (= (readNBitsLSBFirstsLoopPure!0 (_1!9609 lt!326539) nBits!348 i!590 lt!326531) (tuple2!17911 (_2!9623 lt!326862) (_1!9623 lt!326862)))))

(declare-fun bs!17367 () Bool)

(assert (= bs!17367 d!70661))

(declare-fun m!321605 () Bool)

(assert (=> bs!17367 m!321605))

(assert (=> b!208773 d!70661))

(declare-fun d!70663 () Bool)

(declare-fun e!142705 () Bool)

(assert (=> d!70663 e!142705))

(declare-fun res!175402 () Bool)

(assert (=> d!70663 (=> (not res!175402) (not e!142705))))

(declare-fun lt!326863 () (_ BitVec 64))

(declare-fun lt!326868 () (_ BitVec 64))

(declare-fun lt!326867 () (_ BitVec 64))

(assert (=> d!70663 (= res!175402 (= lt!326867 (bvsub lt!326868 lt!326863)))))

(assert (=> d!70663 (or (= (bvand lt!326868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326863 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326868 lt!326863) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70663 (= lt!326863 (remainingBits!0 ((_ sign_extend 32) (size!4597 (buf!5108 (_1!9608 lt!326535)))) ((_ sign_extend 32) (currentByte!9638 (_1!9608 lt!326535))) ((_ sign_extend 32) (currentBit!9633 (_1!9608 lt!326535)))))))

(declare-fun lt!326865 () (_ BitVec 64))

(declare-fun lt!326864 () (_ BitVec 64))

(assert (=> d!70663 (= lt!326868 (bvmul lt!326865 lt!326864))))

(assert (=> d!70663 (or (= lt!326865 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326864 (bvsdiv (bvmul lt!326865 lt!326864) lt!326865)))))

(assert (=> d!70663 (= lt!326864 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70663 (= lt!326865 ((_ sign_extend 32) (size!4597 (buf!5108 (_1!9608 lt!326535)))))))

(assert (=> d!70663 (= lt!326867 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9638 (_1!9608 lt!326535))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9633 (_1!9608 lt!326535)))))))

(assert (=> d!70663 (invariant!0 (currentBit!9633 (_1!9608 lt!326535)) (currentByte!9638 (_1!9608 lt!326535)) (size!4597 (buf!5108 (_1!9608 lt!326535))))))

(assert (=> d!70663 (= (bitIndex!0 (size!4597 (buf!5108 (_1!9608 lt!326535))) (currentByte!9638 (_1!9608 lt!326535)) (currentBit!9633 (_1!9608 lt!326535))) lt!326867)))

(declare-fun b!208971 () Bool)

(declare-fun res!175403 () Bool)

(assert (=> b!208971 (=> (not res!175403) (not e!142705))))

(assert (=> b!208971 (= res!175403 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326867))))

(declare-fun b!208972 () Bool)

(declare-fun lt!326866 () (_ BitVec 64))

(assert (=> b!208972 (= e!142705 (bvsle lt!326867 (bvmul lt!326866 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208972 (or (= lt!326866 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326866 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326866)))))

(assert (=> b!208972 (= lt!326866 ((_ sign_extend 32) (size!4597 (buf!5108 (_1!9608 lt!326535)))))))

(assert (= (and d!70663 res!175402) b!208971))

(assert (= (and b!208971 res!175403) b!208972))

(declare-fun m!321607 () Bool)

(assert (=> d!70663 m!321607))

(declare-fun m!321609 () Bool)

(assert (=> d!70663 m!321609))

(assert (=> b!208773 d!70663))

(declare-fun d!70665 () Bool)

(declare-fun e!142711 () Bool)

(assert (=> d!70665 e!142711))

(declare-fun res!175410 () Bool)

(assert (=> d!70665 (=> (not res!175410) (not e!142711))))

(declare-fun lt!326918 () tuple2!17908)

(assert (=> d!70665 (= res!175410 (isPrefixOf!0 (_1!9609 lt!326918) (_2!9609 lt!326918)))))

(declare-fun lt!326927 () BitStream!8302)

(assert (=> d!70665 (= lt!326918 (tuple2!17909 lt!326927 (_2!9611 lt!326525)))))

(declare-fun lt!326925 () Unit!14866)

(declare-fun lt!326921 () Unit!14866)

(assert (=> d!70665 (= lt!326925 lt!326921)))

(assert (=> d!70665 (isPrefixOf!0 lt!326927 (_2!9611 lt!326525))))

(assert (=> d!70665 (= lt!326921 (lemmaIsPrefixTransitive!0 lt!326927 (_2!9611 lt!326525) (_2!9611 lt!326525)))))

(declare-fun lt!326916 () Unit!14866)

(declare-fun lt!326923 () Unit!14866)

(assert (=> d!70665 (= lt!326916 lt!326923)))

(assert (=> d!70665 (isPrefixOf!0 lt!326927 (_2!9611 lt!326525))))

(assert (=> d!70665 (= lt!326923 (lemmaIsPrefixTransitive!0 lt!326927 (_2!9611 lt!326541) (_2!9611 lt!326525)))))

(declare-fun lt!326915 () Unit!14866)

(declare-fun e!142710 () Unit!14866)

(assert (=> d!70665 (= lt!326915 e!142710)))

(declare-fun c!10275 () Bool)

(assert (=> d!70665 (= c!10275 (not (= (size!4597 (buf!5108 (_2!9611 lt!326541))) #b00000000000000000000000000000000)))))

(declare-fun lt!326912 () Unit!14866)

(declare-fun lt!326920 () Unit!14866)

(assert (=> d!70665 (= lt!326912 lt!326920)))

(assert (=> d!70665 (isPrefixOf!0 (_2!9611 lt!326525) (_2!9611 lt!326525))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8302) Unit!14866)

(assert (=> d!70665 (= lt!326920 (lemmaIsPrefixRefl!0 (_2!9611 lt!326525)))))

(declare-fun lt!326919 () Unit!14866)

(declare-fun lt!326917 () Unit!14866)

(assert (=> d!70665 (= lt!326919 lt!326917)))

(assert (=> d!70665 (= lt!326917 (lemmaIsPrefixRefl!0 (_2!9611 lt!326525)))))

(declare-fun lt!326914 () Unit!14866)

(declare-fun lt!326913 () Unit!14866)

(assert (=> d!70665 (= lt!326914 lt!326913)))

(assert (=> d!70665 (isPrefixOf!0 lt!326927 lt!326927)))

(assert (=> d!70665 (= lt!326913 (lemmaIsPrefixRefl!0 lt!326927))))

(declare-fun lt!326922 () Unit!14866)

(declare-fun lt!326910 () Unit!14866)

(assert (=> d!70665 (= lt!326922 lt!326910)))

(assert (=> d!70665 (isPrefixOf!0 (_2!9611 lt!326541) (_2!9611 lt!326541))))

(assert (=> d!70665 (= lt!326910 (lemmaIsPrefixRefl!0 (_2!9611 lt!326541)))))

(assert (=> d!70665 (= lt!326927 (BitStream!8303 (buf!5108 (_2!9611 lt!326525)) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541))))))

(assert (=> d!70665 (isPrefixOf!0 (_2!9611 lt!326541) (_2!9611 lt!326525))))

(assert (=> d!70665 (= (reader!0 (_2!9611 lt!326541) (_2!9611 lt!326525)) lt!326918)))

(declare-fun lt!326924 () (_ BitVec 64))

(declare-fun lt!326926 () (_ BitVec 64))

(declare-fun b!208983 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!8302 (_ BitVec 64)) BitStream!8302)

(assert (=> b!208983 (= e!142711 (= (_1!9609 lt!326918) (withMovedBitIndex!0 (_2!9609 lt!326918) (bvsub lt!326924 lt!326926))))))

(assert (=> b!208983 (or (= (bvand lt!326924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326926 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326924 lt!326926) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208983 (= lt!326926 (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326525))) (currentByte!9638 (_2!9611 lt!326525)) (currentBit!9633 (_2!9611 lt!326525))))))

(assert (=> b!208983 (= lt!326924 (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326541))) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541))))))

(declare-fun b!208984 () Bool)

(declare-fun lt!326909 () Unit!14866)

(assert (=> b!208984 (= e!142710 lt!326909)))

(declare-fun lt!326911 () (_ BitVec 64))

(assert (=> b!208984 (= lt!326911 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!326928 () (_ BitVec 64))

(assert (=> b!208984 (= lt!326928 (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326541))) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10457 array!10457 (_ BitVec 64) (_ BitVec 64)) Unit!14866)

(assert (=> b!208984 (= lt!326909 (arrayBitRangesEqSymmetric!0 (buf!5108 (_2!9611 lt!326541)) (buf!5108 (_2!9611 lt!326525)) lt!326911 lt!326928))))

(declare-fun arrayBitRangesEq!0 (array!10457 array!10457 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!208984 (arrayBitRangesEq!0 (buf!5108 (_2!9611 lt!326525)) (buf!5108 (_2!9611 lt!326541)) lt!326911 lt!326928)))

(declare-fun b!208985 () Bool)

(declare-fun res!175412 () Bool)

(assert (=> b!208985 (=> (not res!175412) (not e!142711))))

(assert (=> b!208985 (= res!175412 (isPrefixOf!0 (_1!9609 lt!326918) (_2!9611 lt!326541)))))

(declare-fun b!208986 () Bool)

(declare-fun res!175411 () Bool)

(assert (=> b!208986 (=> (not res!175411) (not e!142711))))

(assert (=> b!208986 (= res!175411 (isPrefixOf!0 (_2!9609 lt!326918) (_2!9611 lt!326525)))))

(declare-fun b!208987 () Bool)

(declare-fun Unit!14885 () Unit!14866)

(assert (=> b!208987 (= e!142710 Unit!14885)))

(assert (= (and d!70665 c!10275) b!208984))

(assert (= (and d!70665 (not c!10275)) b!208987))

(assert (= (and d!70665 res!175410) b!208985))

(assert (= (and b!208985 res!175412) b!208986))

(assert (= (and b!208986 res!175411) b!208983))

(declare-fun m!321611 () Bool)

(assert (=> b!208985 m!321611))

(declare-fun m!321613 () Bool)

(assert (=> d!70665 m!321613))

(declare-fun m!321615 () Bool)

(assert (=> d!70665 m!321615))

(declare-fun m!321617 () Bool)

(assert (=> d!70665 m!321617))

(declare-fun m!321619 () Bool)

(assert (=> d!70665 m!321619))

(declare-fun m!321621 () Bool)

(assert (=> d!70665 m!321621))

(assert (=> d!70665 m!321261))

(declare-fun m!321623 () Bool)

(assert (=> d!70665 m!321623))

(declare-fun m!321625 () Bool)

(assert (=> d!70665 m!321625))

(declare-fun m!321627 () Bool)

(assert (=> d!70665 m!321627))

(declare-fun m!321629 () Bool)

(assert (=> d!70665 m!321629))

(declare-fun m!321631 () Bool)

(assert (=> d!70665 m!321631))

(assert (=> b!208984 m!321267))

(declare-fun m!321633 () Bool)

(assert (=> b!208984 m!321633))

(declare-fun m!321635 () Bool)

(assert (=> b!208984 m!321635))

(declare-fun m!321637 () Bool)

(assert (=> b!208986 m!321637))

(declare-fun m!321639 () Bool)

(assert (=> b!208983 m!321639))

(assert (=> b!208983 m!321273))

(assert (=> b!208983 m!321267))

(assert (=> b!208773 d!70665))

(declare-fun lt!326929 () tuple2!17936)

(declare-fun d!70667 () Bool)

(assert (=> d!70667 (= lt!326929 (readNBitsLSBFirstsLoop!0 (_1!9609 lt!326543) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!326531 (ite (_2!9608 lt!326527) lt!326540 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!70667 (= (readNBitsLSBFirstsLoopPure!0 (_1!9609 lt!326543) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!326531 (ite (_2!9608 lt!326527) lt!326540 #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!17911 (_2!9623 lt!326929) (_1!9623 lt!326929)))))

(declare-fun bs!17368 () Bool)

(assert (= bs!17368 d!70667))

(declare-fun m!321641 () Bool)

(assert (=> bs!17368 m!321641))

(assert (=> b!208773 d!70667))

(declare-fun d!70669 () Bool)

(declare-fun e!142713 () Bool)

(assert (=> d!70669 e!142713))

(declare-fun res!175413 () Bool)

(assert (=> d!70669 (=> (not res!175413) (not e!142713))))

(declare-fun lt!326939 () tuple2!17908)

(assert (=> d!70669 (= res!175413 (isPrefixOf!0 (_1!9609 lt!326939) (_2!9609 lt!326939)))))

(declare-fun lt!326948 () BitStream!8302)

(assert (=> d!70669 (= lt!326939 (tuple2!17909 lt!326948 (_2!9611 lt!326525)))))

(declare-fun lt!326946 () Unit!14866)

(declare-fun lt!326942 () Unit!14866)

(assert (=> d!70669 (= lt!326946 lt!326942)))

(assert (=> d!70669 (isPrefixOf!0 lt!326948 (_2!9611 lt!326525))))

(assert (=> d!70669 (= lt!326942 (lemmaIsPrefixTransitive!0 lt!326948 (_2!9611 lt!326525) (_2!9611 lt!326525)))))

(declare-fun lt!326937 () Unit!14866)

(declare-fun lt!326944 () Unit!14866)

(assert (=> d!70669 (= lt!326937 lt!326944)))

(assert (=> d!70669 (isPrefixOf!0 lt!326948 (_2!9611 lt!326525))))

(assert (=> d!70669 (= lt!326944 (lemmaIsPrefixTransitive!0 lt!326948 thiss!1204 (_2!9611 lt!326525)))))

(declare-fun lt!326936 () Unit!14866)

(declare-fun e!142712 () Unit!14866)

(assert (=> d!70669 (= lt!326936 e!142712)))

(declare-fun c!10276 () Bool)

(assert (=> d!70669 (= c!10276 (not (= (size!4597 (buf!5108 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!326933 () Unit!14866)

(declare-fun lt!326941 () Unit!14866)

(assert (=> d!70669 (= lt!326933 lt!326941)))

(assert (=> d!70669 (isPrefixOf!0 (_2!9611 lt!326525) (_2!9611 lt!326525))))

(assert (=> d!70669 (= lt!326941 (lemmaIsPrefixRefl!0 (_2!9611 lt!326525)))))

(declare-fun lt!326940 () Unit!14866)

(declare-fun lt!326938 () Unit!14866)

(assert (=> d!70669 (= lt!326940 lt!326938)))

(assert (=> d!70669 (= lt!326938 (lemmaIsPrefixRefl!0 (_2!9611 lt!326525)))))

(declare-fun lt!326935 () Unit!14866)

(declare-fun lt!326934 () Unit!14866)

(assert (=> d!70669 (= lt!326935 lt!326934)))

(assert (=> d!70669 (isPrefixOf!0 lt!326948 lt!326948)))

(assert (=> d!70669 (= lt!326934 (lemmaIsPrefixRefl!0 lt!326948))))

(declare-fun lt!326943 () Unit!14866)

(declare-fun lt!326931 () Unit!14866)

(assert (=> d!70669 (= lt!326943 lt!326931)))

(assert (=> d!70669 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!70669 (= lt!326931 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!70669 (= lt!326948 (BitStream!8303 (buf!5108 (_2!9611 lt!326525)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204)))))

(assert (=> d!70669 (isPrefixOf!0 thiss!1204 (_2!9611 lt!326525))))

(assert (=> d!70669 (= (reader!0 thiss!1204 (_2!9611 lt!326525)) lt!326939)))

(declare-fun b!208988 () Bool)

(declare-fun lt!326945 () (_ BitVec 64))

(declare-fun lt!326947 () (_ BitVec 64))

(assert (=> b!208988 (= e!142713 (= (_1!9609 lt!326939) (withMovedBitIndex!0 (_2!9609 lt!326939) (bvsub lt!326945 lt!326947))))))

(assert (=> b!208988 (or (= (bvand lt!326945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326947 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326945 lt!326947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208988 (= lt!326947 (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326525))) (currentByte!9638 (_2!9611 lt!326525)) (currentBit!9633 (_2!9611 lt!326525))))))

(assert (=> b!208988 (= lt!326945 (bitIndex!0 (size!4597 (buf!5108 thiss!1204)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204)))))

(declare-fun b!208989 () Bool)

(declare-fun lt!326930 () Unit!14866)

(assert (=> b!208989 (= e!142712 lt!326930)))

(declare-fun lt!326932 () (_ BitVec 64))

(assert (=> b!208989 (= lt!326932 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!326949 () (_ BitVec 64))

(assert (=> b!208989 (= lt!326949 (bitIndex!0 (size!4597 (buf!5108 thiss!1204)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204)))))

(assert (=> b!208989 (= lt!326930 (arrayBitRangesEqSymmetric!0 (buf!5108 thiss!1204) (buf!5108 (_2!9611 lt!326525)) lt!326932 lt!326949))))

(assert (=> b!208989 (arrayBitRangesEq!0 (buf!5108 (_2!9611 lt!326525)) (buf!5108 thiss!1204) lt!326932 lt!326949)))

(declare-fun b!208990 () Bool)

(declare-fun res!175415 () Bool)

(assert (=> b!208990 (=> (not res!175415) (not e!142713))))

(assert (=> b!208990 (= res!175415 (isPrefixOf!0 (_1!9609 lt!326939) thiss!1204))))

(declare-fun b!208991 () Bool)

(declare-fun res!175414 () Bool)

(assert (=> b!208991 (=> (not res!175414) (not e!142713))))

(assert (=> b!208991 (= res!175414 (isPrefixOf!0 (_2!9609 lt!326939) (_2!9611 lt!326525)))))

(declare-fun b!208992 () Bool)

(declare-fun Unit!14886 () Unit!14866)

(assert (=> b!208992 (= e!142712 Unit!14886)))

(assert (= (and d!70669 c!10276) b!208989))

(assert (= (and d!70669 (not c!10276)) b!208992))

(assert (= (and d!70669 res!175413) b!208990))

(assert (= (and b!208990 res!175415) b!208991))

(assert (= (and b!208991 res!175414) b!208988))

(declare-fun m!321643 () Bool)

(assert (=> b!208990 m!321643))

(assert (=> d!70669 m!321613))

(declare-fun m!321645 () Bool)

(assert (=> d!70669 m!321645))

(assert (=> d!70669 m!321617))

(declare-fun m!321647 () Bool)

(assert (=> d!70669 m!321647))

(declare-fun m!321649 () Bool)

(assert (=> d!70669 m!321649))

(assert (=> d!70669 m!321275))

(declare-fun m!321651 () Bool)

(assert (=> d!70669 m!321651))

(declare-fun m!321653 () Bool)

(assert (=> d!70669 m!321653))

(declare-fun m!321655 () Bool)

(assert (=> d!70669 m!321655))

(declare-fun m!321657 () Bool)

(assert (=> d!70669 m!321657))

(declare-fun m!321659 () Bool)

(assert (=> d!70669 m!321659))

(assert (=> b!208989 m!321269))

(declare-fun m!321661 () Bool)

(assert (=> b!208989 m!321661))

(declare-fun m!321663 () Bool)

(assert (=> b!208989 m!321663))

(declare-fun m!321665 () Bool)

(assert (=> b!208991 m!321665))

(declare-fun m!321667 () Bool)

(assert (=> b!208988 m!321667))

(assert (=> b!208988 m!321273))

(assert (=> b!208988 m!321269))

(assert (=> b!208773 d!70669))

(declare-fun d!70671 () Bool)

(declare-fun e!142716 () Bool)

(assert (=> d!70671 e!142716))

(declare-fun res!175418 () Bool)

(assert (=> d!70671 (=> (not res!175418) (not e!142716))))

(declare-fun lt!326958 () tuple2!17906)

(declare-fun lt!326961 () tuple2!17906)

(assert (=> d!70671 (= res!175418 (= (bitIndex!0 (size!4597 (buf!5108 (_1!9608 lt!326958))) (currentByte!9638 (_1!9608 lt!326958)) (currentBit!9633 (_1!9608 lt!326958))) (bitIndex!0 (size!4597 (buf!5108 (_1!9608 lt!326961))) (currentByte!9638 (_1!9608 lt!326961)) (currentBit!9633 (_1!9608 lt!326961)))))))

(declare-fun lt!326960 () BitStream!8302)

(declare-fun lt!326959 () Unit!14866)

(declare-fun choose!50 (BitStream!8302 BitStream!8302 BitStream!8302 tuple2!17906 tuple2!17906 BitStream!8302 Bool tuple2!17906 tuple2!17906 BitStream!8302 Bool) Unit!14866)

(assert (=> d!70671 (= lt!326959 (choose!50 lt!326521 (_2!9611 lt!326525) lt!326960 lt!326958 (tuple2!17907 (_1!9608 lt!326958) (_2!9608 lt!326958)) (_1!9608 lt!326958) (_2!9608 lt!326958) lt!326961 (tuple2!17907 (_1!9608 lt!326961) (_2!9608 lt!326961)) (_1!9608 lt!326961) (_2!9608 lt!326961)))))

(assert (=> d!70671 (= lt!326961 (readBitPure!0 lt!326960))))

(assert (=> d!70671 (= lt!326958 (readBitPure!0 lt!326521))))

(assert (=> d!70671 (= lt!326960 (BitStream!8303 (buf!5108 (_2!9611 lt!326525)) (currentByte!9638 lt!326521) (currentBit!9633 lt!326521)))))

(assert (=> d!70671 (invariant!0 (currentBit!9633 lt!326521) (currentByte!9638 lt!326521) (size!4597 (buf!5108 (_2!9611 lt!326525))))))

(assert (=> d!70671 (= (readBitPrefixLemma!0 lt!326521 (_2!9611 lt!326525)) lt!326959)))

(declare-fun b!208995 () Bool)

(assert (=> b!208995 (= e!142716 (= (_2!9608 lt!326958) (_2!9608 lt!326961)))))

(assert (= (and d!70671 res!175418) b!208995))

(declare-fun m!321669 () Bool)

(assert (=> d!70671 m!321669))

(declare-fun m!321671 () Bool)

(assert (=> d!70671 m!321671))

(declare-fun m!321673 () Bool)

(assert (=> d!70671 m!321673))

(declare-fun m!321675 () Bool)

(assert (=> d!70671 m!321675))

(assert (=> d!70671 m!321299))

(declare-fun m!321677 () Bool)

(assert (=> d!70671 m!321677))

(assert (=> b!208773 d!70671))

(declare-fun d!70673 () Bool)

(assert (=> d!70673 (= (invariant!0 (currentBit!9633 thiss!1204) (currentByte!9638 thiss!1204) (size!4597 (buf!5108 thiss!1204))) (and (bvsge (currentBit!9633 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9633 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9638 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9638 thiss!1204) (size!4597 (buf!5108 thiss!1204))) (and (= (currentBit!9633 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9638 thiss!1204) (size!4597 (buf!5108 thiss!1204)))))))))

(assert (=> b!208783 d!70673))

(declare-fun d!70675 () Bool)

(declare-fun e!142717 () Bool)

(assert (=> d!70675 e!142717))

(declare-fun res!175419 () Bool)

(assert (=> d!70675 (=> (not res!175419) (not e!142717))))

(declare-fun lt!326966 () (_ BitVec 64))

(declare-fun lt!326962 () (_ BitVec 64))

(declare-fun lt!326967 () (_ BitVec 64))

(assert (=> d!70675 (= res!175419 (= lt!326966 (bvsub lt!326967 lt!326962)))))

(assert (=> d!70675 (or (= (bvand lt!326967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326962 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326967 lt!326962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70675 (= lt!326962 (remainingBits!0 ((_ sign_extend 32) (size!4597 (buf!5108 (_1!9608 lt!326526)))) ((_ sign_extend 32) (currentByte!9638 (_1!9608 lt!326526))) ((_ sign_extend 32) (currentBit!9633 (_1!9608 lt!326526)))))))

(declare-fun lt!326964 () (_ BitVec 64))

(declare-fun lt!326963 () (_ BitVec 64))

(assert (=> d!70675 (= lt!326967 (bvmul lt!326964 lt!326963))))

(assert (=> d!70675 (or (= lt!326964 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326963 (bvsdiv (bvmul lt!326964 lt!326963) lt!326964)))))

(assert (=> d!70675 (= lt!326963 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70675 (= lt!326964 ((_ sign_extend 32) (size!4597 (buf!5108 (_1!9608 lt!326526)))))))

(assert (=> d!70675 (= lt!326966 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9638 (_1!9608 lt!326526))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9633 (_1!9608 lt!326526)))))))

(assert (=> d!70675 (invariant!0 (currentBit!9633 (_1!9608 lt!326526)) (currentByte!9638 (_1!9608 lt!326526)) (size!4597 (buf!5108 (_1!9608 lt!326526))))))

(assert (=> d!70675 (= (bitIndex!0 (size!4597 (buf!5108 (_1!9608 lt!326526))) (currentByte!9638 (_1!9608 lt!326526)) (currentBit!9633 (_1!9608 lt!326526))) lt!326966)))

(declare-fun b!208996 () Bool)

(declare-fun res!175420 () Bool)

(assert (=> b!208996 (=> (not res!175420) (not e!142717))))

(assert (=> b!208996 (= res!175420 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326966))))

(declare-fun b!208997 () Bool)

(declare-fun lt!326965 () (_ BitVec 64))

(assert (=> b!208997 (= e!142717 (bvsle lt!326966 (bvmul lt!326965 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208997 (or (= lt!326965 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326965 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326965)))))

(assert (=> b!208997 (= lt!326965 ((_ sign_extend 32) (size!4597 (buf!5108 (_1!9608 lt!326526)))))))

(assert (= (and d!70675 res!175419) b!208996))

(assert (= (and b!208996 res!175420) b!208997))

(declare-fun m!321679 () Bool)

(assert (=> d!70675 m!321679))

(declare-fun m!321681 () Bool)

(assert (=> d!70675 m!321681))

(assert (=> b!208772 d!70675))

(declare-fun d!70677 () Bool)

(declare-fun e!142718 () Bool)

(assert (=> d!70677 e!142718))

(declare-fun res!175421 () Bool)

(assert (=> d!70677 (=> (not res!175421) (not e!142718))))

(declare-fun lt!326973 () (_ BitVec 64))

(declare-fun lt!326968 () (_ BitVec 64))

(declare-fun lt!326972 () (_ BitVec 64))

(assert (=> d!70677 (= res!175421 (= lt!326972 (bvsub lt!326973 lt!326968)))))

(assert (=> d!70677 (or (= (bvand lt!326973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326968 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326973 lt!326968) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70677 (= lt!326968 (remainingBits!0 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!326525)))) ((_ sign_extend 32) (currentByte!9638 (_2!9611 lt!326525))) ((_ sign_extend 32) (currentBit!9633 (_2!9611 lt!326525)))))))

(declare-fun lt!326970 () (_ BitVec 64))

(declare-fun lt!326969 () (_ BitVec 64))

(assert (=> d!70677 (= lt!326973 (bvmul lt!326970 lt!326969))))

(assert (=> d!70677 (or (= lt!326970 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326969 (bvsdiv (bvmul lt!326970 lt!326969) lt!326970)))))

(assert (=> d!70677 (= lt!326969 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70677 (= lt!326970 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!326525)))))))

(assert (=> d!70677 (= lt!326972 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9638 (_2!9611 lt!326525))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9633 (_2!9611 lt!326525)))))))

(assert (=> d!70677 (invariant!0 (currentBit!9633 (_2!9611 lt!326525)) (currentByte!9638 (_2!9611 lt!326525)) (size!4597 (buf!5108 (_2!9611 lt!326525))))))

(assert (=> d!70677 (= (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326525))) (currentByte!9638 (_2!9611 lt!326525)) (currentBit!9633 (_2!9611 lt!326525))) lt!326972)))

(declare-fun b!208998 () Bool)

(declare-fun res!175422 () Bool)

(assert (=> b!208998 (=> (not res!175422) (not e!142718))))

(assert (=> b!208998 (= res!175422 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326972))))

(declare-fun b!208999 () Bool)

(declare-fun lt!326971 () (_ BitVec 64))

(assert (=> b!208999 (= e!142718 (bvsle lt!326972 (bvmul lt!326971 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208999 (or (= lt!326971 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326971 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326971)))))

(assert (=> b!208999 (= lt!326971 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!326525)))))))

(assert (= (and d!70677 res!175421) b!208998))

(assert (= (and b!208998 res!175422) b!208999))

(declare-fun m!321683 () Bool)

(assert (=> d!70677 m!321683))

(assert (=> d!70677 m!321281))

(assert (=> b!208782 d!70677))

(declare-fun d!70679 () Bool)

(declare-fun res!175429 () Bool)

(declare-fun e!142723 () Bool)

(assert (=> d!70679 (=> (not res!175429) (not e!142723))))

(assert (=> d!70679 (= res!175429 (= (size!4597 (buf!5108 thiss!1204)) (size!4597 (buf!5108 (_2!9611 lt!326525)))))))

(assert (=> d!70679 (= (isPrefixOf!0 thiss!1204 (_2!9611 lt!326525)) e!142723)))

(declare-fun b!209006 () Bool)

(declare-fun res!175430 () Bool)

(assert (=> b!209006 (=> (not res!175430) (not e!142723))))

(assert (=> b!209006 (= res!175430 (bvsle (bitIndex!0 (size!4597 (buf!5108 thiss!1204)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204)) (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326525))) (currentByte!9638 (_2!9611 lt!326525)) (currentBit!9633 (_2!9611 lt!326525)))))))

(declare-fun b!209007 () Bool)

(declare-fun e!142724 () Bool)

(assert (=> b!209007 (= e!142723 e!142724)))

(declare-fun res!175431 () Bool)

(assert (=> b!209007 (=> res!175431 e!142724)))

(assert (=> b!209007 (= res!175431 (= (size!4597 (buf!5108 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!209008 () Bool)

(assert (=> b!209008 (= e!142724 (arrayBitRangesEq!0 (buf!5108 thiss!1204) (buf!5108 (_2!9611 lt!326525)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4597 (buf!5108 thiss!1204)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204))))))

(assert (= (and d!70679 res!175429) b!209006))

(assert (= (and b!209006 res!175430) b!209007))

(assert (= (and b!209007 (not res!175431)) b!209008))

(assert (=> b!209006 m!321269))

(assert (=> b!209006 m!321273))

(assert (=> b!209008 m!321269))

(assert (=> b!209008 m!321269))

(declare-fun m!321685 () Bool)

(assert (=> b!209008 m!321685))

(assert (=> b!208782 d!70679))

(declare-fun d!70681 () Bool)

(assert (=> d!70681 (isPrefixOf!0 thiss!1204 (_2!9611 lt!326525))))

(declare-fun lt!326976 () Unit!14866)

(declare-fun choose!30 (BitStream!8302 BitStream!8302 BitStream!8302) Unit!14866)

(assert (=> d!70681 (= lt!326976 (choose!30 thiss!1204 (_2!9611 lt!326541) (_2!9611 lt!326525)))))

(assert (=> d!70681 (isPrefixOf!0 thiss!1204 (_2!9611 lt!326541))))

(assert (=> d!70681 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9611 lt!326541) (_2!9611 lt!326525)) lt!326976)))

(declare-fun bs!17369 () Bool)

(assert (= bs!17369 d!70681))

(assert (=> bs!17369 m!321275))

(declare-fun m!321687 () Bool)

(assert (=> bs!17369 m!321687))

(assert (=> bs!17369 m!321317))

(assert (=> b!208782 d!70681))

(declare-fun b!209173 () Bool)

(declare-fun res!175573 () Bool)

(declare-fun lt!327484 () tuple2!17912)

(assert (=> b!209173 (= res!175573 (isPrefixOf!0 (_2!9611 lt!326541) (_2!9611 lt!327484)))))

(declare-fun e!142818 () Bool)

(assert (=> b!209173 (=> (not res!175573) (not e!142818))))

(declare-fun c!10292 () Bool)

(declare-fun lt!327465 () tuple2!17912)

(declare-fun call!3294 () Bool)

(declare-fun bm!3291 () Bool)

(assert (=> bm!3291 (= call!3294 (isPrefixOf!0 (_2!9611 lt!326541) (ite c!10292 (_2!9611 lt!326541) (_2!9611 lt!327465))))))

(declare-fun b!209174 () Bool)

(declare-fun res!175570 () Bool)

(declare-fun e!142817 () Bool)

(assert (=> b!209174 (=> (not res!175570) (not e!142817))))

(declare-fun lt!327454 () tuple2!17912)

(assert (=> b!209174 (= res!175570 (= (size!4597 (buf!5108 (_2!9611 lt!326541))) (size!4597 (buf!5108 (_2!9611 lt!327454)))))))

(declare-fun b!209175 () Bool)

(declare-fun e!142820 () Bool)

(declare-fun lt!327500 () tuple2!17910)

(declare-fun lt!327470 () tuple2!17908)

(assert (=> b!209175 (= e!142820 (= (_1!9610 lt!327500) (_2!9609 lt!327470)))))

(declare-fun d!70683 () Bool)

(assert (=> d!70683 e!142817))

(declare-fun res!175569 () Bool)

(assert (=> d!70683 (=> (not res!175569) (not e!142817))))

(assert (=> d!70683 (= res!175569 (invariant!0 (currentBit!9633 (_2!9611 lt!327454)) (currentByte!9638 (_2!9611 lt!327454)) (size!4597 (buf!5108 (_2!9611 lt!327454)))))))

(declare-fun e!142813 () tuple2!17912)

(assert (=> d!70683 (= lt!327454 e!142813)))

(assert (=> d!70683 (= c!10292 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!70683 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!70683 (= (appendBitsLSBFirstLoopTR!0 (_2!9611 lt!326541) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!327454)))

(declare-fun b!209176 () Bool)

(declare-fun e!142814 () (_ BitVec 64))

(assert (=> b!209176 (= e!142814 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!209177 () Bool)

(assert (=> b!209177 (= e!142813 (tuple2!17913 (_1!9611 lt!327465) (_2!9611 lt!327465)))))

(declare-fun lt!327460 () Bool)

(assert (=> b!209177 (= lt!327460 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209177 (= lt!327484 (appendBit!0 (_2!9611 lt!326541) lt!327460))))

(declare-fun res!175572 () Bool)

(assert (=> b!209177 (= res!175572 (= (size!4597 (buf!5108 (_2!9611 lt!326541))) (size!4597 (buf!5108 (_2!9611 lt!327484)))))))

(assert (=> b!209177 (=> (not res!175572) (not e!142818))))

(assert (=> b!209177 e!142818))

(declare-fun lt!327471 () tuple2!17912)

(assert (=> b!209177 (= lt!327471 lt!327484)))

(assert (=> b!209177 (= lt!327465 (appendBitsLSBFirstLoopTR!0 (_2!9611 lt!327471) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!327498 () Unit!14866)

(assert (=> b!209177 (= lt!327498 (lemmaIsPrefixTransitive!0 (_2!9611 lt!326541) (_2!9611 lt!327471) (_2!9611 lt!327465)))))

(assert (=> b!209177 call!3294))

(declare-fun lt!327488 () Unit!14866)

(assert (=> b!209177 (= lt!327488 lt!327498)))

(assert (=> b!209177 (invariant!0 (currentBit!9633 (_2!9611 lt!326541)) (currentByte!9638 (_2!9611 lt!326541)) (size!4597 (buf!5108 (_2!9611 lt!327471))))))

(declare-fun lt!327472 () BitStream!8302)

(assert (=> b!209177 (= lt!327472 (BitStream!8303 (buf!5108 (_2!9611 lt!327471)) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541))))))

(assert (=> b!209177 (invariant!0 (currentBit!9633 lt!327472) (currentByte!9638 lt!327472) (size!4597 (buf!5108 (_2!9611 lt!327465))))))

(declare-fun lt!327476 () BitStream!8302)

(assert (=> b!209177 (= lt!327476 (BitStream!8303 (buf!5108 (_2!9611 lt!327465)) (currentByte!9638 lt!327472) (currentBit!9633 lt!327472)))))

(declare-fun lt!327461 () tuple2!17906)

(assert (=> b!209177 (= lt!327461 (readBitPure!0 lt!327472))))

(declare-fun lt!327457 () tuple2!17906)

(assert (=> b!209177 (= lt!327457 (readBitPure!0 lt!327476))))

(declare-fun lt!327458 () Unit!14866)

(assert (=> b!209177 (= lt!327458 (readBitPrefixLemma!0 lt!327472 (_2!9611 lt!327465)))))

(declare-fun res!175571 () Bool)

(assert (=> b!209177 (= res!175571 (= (bitIndex!0 (size!4597 (buf!5108 (_1!9608 lt!327461))) (currentByte!9638 (_1!9608 lt!327461)) (currentBit!9633 (_1!9608 lt!327461))) (bitIndex!0 (size!4597 (buf!5108 (_1!9608 lt!327457))) (currentByte!9638 (_1!9608 lt!327457)) (currentBit!9633 (_1!9608 lt!327457)))))))

(declare-fun e!142816 () Bool)

(assert (=> b!209177 (=> (not res!175571) (not e!142816))))

(assert (=> b!209177 e!142816))

(declare-fun lt!327499 () Unit!14866)

(assert (=> b!209177 (= lt!327499 lt!327458)))

(declare-fun lt!327478 () tuple2!17908)

(assert (=> b!209177 (= lt!327478 (reader!0 (_2!9611 lt!326541) (_2!9611 lt!327465)))))

(declare-fun lt!327493 () tuple2!17908)

(assert (=> b!209177 (= lt!327493 (reader!0 (_2!9611 lt!327471) (_2!9611 lt!327465)))))

(declare-fun lt!327449 () tuple2!17906)

(assert (=> b!209177 (= lt!327449 (readBitPure!0 (_1!9609 lt!327478)))))

(assert (=> b!209177 (= (_2!9608 lt!327449) lt!327460)))

(declare-fun lt!327459 () Unit!14866)

(declare-fun Unit!14887 () Unit!14866)

(assert (=> b!209177 (= lt!327459 Unit!14887)))

(declare-fun lt!327481 () (_ BitVec 64))

(assert (=> b!209177 (= lt!327481 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!327474 () (_ BitVec 64))

(assert (=> b!209177 (= lt!327474 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!327494 () Unit!14866)

(assert (=> b!209177 (= lt!327494 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9611 lt!326541) (buf!5108 (_2!9611 lt!327465)) lt!327474))))

(assert (=> b!209177 (validate_offset_bits!1 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!327465)))) ((_ sign_extend 32) (currentByte!9638 (_2!9611 lt!326541))) ((_ sign_extend 32) (currentBit!9633 (_2!9611 lt!326541))) lt!327474)))

(declare-fun lt!327487 () Unit!14866)

(assert (=> b!209177 (= lt!327487 lt!327494)))

(declare-fun lt!327501 () tuple2!17910)

(assert (=> b!209177 (= lt!327501 (readNBitsLSBFirstsLoopPure!0 (_1!9609 lt!327478) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!327481))))

(declare-fun lt!327482 () (_ BitVec 64))

(assert (=> b!209177 (= lt!327482 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!327452 () Unit!14866)

(assert (=> b!209177 (= lt!327452 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9611 lt!327471) (buf!5108 (_2!9611 lt!327465)) lt!327482))))

(assert (=> b!209177 (validate_offset_bits!1 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!327465)))) ((_ sign_extend 32) (currentByte!9638 (_2!9611 lt!327471))) ((_ sign_extend 32) (currentBit!9633 (_2!9611 lt!327471))) lt!327482)))

(declare-fun lt!327502 () Unit!14866)

(assert (=> b!209177 (= lt!327502 lt!327452)))

(declare-fun lt!327489 () tuple2!17910)

(assert (=> b!209177 (= lt!327489 (readNBitsLSBFirstsLoopPure!0 (_1!9609 lt!327493) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!327481 (ite (_2!9608 lt!327449) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!327497 () tuple2!17910)

(assert (=> b!209177 (= lt!327497 (readNBitsLSBFirstsLoopPure!0 (_1!9609 lt!327478) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!327481))))

(declare-fun c!10291 () Bool)

(assert (=> b!209177 (= c!10291 (_2!9608 (readBitPure!0 (_1!9609 lt!327478))))))

(declare-fun lt!327480 () tuple2!17910)

(assert (=> b!209177 (= lt!327480 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9609 lt!327478) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!327481 e!142814)))))

(declare-fun lt!327479 () Unit!14866)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14866)

(assert (=> b!209177 (= lt!327479 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9609 lt!327478) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!327481))))

(assert (=> b!209177 (and (= (_2!9610 lt!327497) (_2!9610 lt!327480)) (= (_1!9610 lt!327497) (_1!9610 lt!327480)))))

(declare-fun lt!327473 () Unit!14866)

(assert (=> b!209177 (= lt!327473 lt!327479)))

(assert (=> b!209177 (= (_1!9609 lt!327478) (withMovedBitIndex!0 (_2!9609 lt!327478) (bvsub (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326541))) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541))) (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!327465))) (currentByte!9638 (_2!9611 lt!327465)) (currentBit!9633 (_2!9611 lt!327465))))))))

(declare-fun lt!327469 () Unit!14866)

(declare-fun Unit!14888 () Unit!14866)

(assert (=> b!209177 (= lt!327469 Unit!14888)))

(assert (=> b!209177 (= (_1!9609 lt!327493) (withMovedBitIndex!0 (_2!9609 lt!327493) (bvsub (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!327471))) (currentByte!9638 (_2!9611 lt!327471)) (currentBit!9633 (_2!9611 lt!327471))) (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!327465))) (currentByte!9638 (_2!9611 lt!327465)) (currentBit!9633 (_2!9611 lt!327465))))))))

(declare-fun lt!327503 () Unit!14866)

(declare-fun Unit!14889 () Unit!14866)

(assert (=> b!209177 (= lt!327503 Unit!14889)))

(assert (=> b!209177 (= (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326541))) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541))) (bvsub (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!327471))) (currentByte!9638 (_2!9611 lt!327471)) (currentBit!9633 (_2!9611 lt!327471))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!327492 () Unit!14866)

(declare-fun Unit!14890 () Unit!14866)

(assert (=> b!209177 (= lt!327492 Unit!14890)))

(assert (=> b!209177 (= (_2!9610 lt!327501) (_2!9610 lt!327489))))

(declare-fun lt!327455 () Unit!14866)

(declare-fun Unit!14891 () Unit!14866)

(assert (=> b!209177 (= lt!327455 Unit!14891)))

(assert (=> b!209177 (invariant!0 (currentBit!9633 (_2!9611 lt!327465)) (currentByte!9638 (_2!9611 lt!327465)) (size!4597 (buf!5108 (_2!9611 lt!327465))))))

(declare-fun lt!327495 () Unit!14866)

(declare-fun Unit!14892 () Unit!14866)

(assert (=> b!209177 (= lt!327495 Unit!14892)))

(assert (=> b!209177 (= (size!4597 (buf!5108 (_2!9611 lt!326541))) (size!4597 (buf!5108 (_2!9611 lt!327465))))))

(declare-fun lt!327486 () Unit!14866)

(declare-fun Unit!14893 () Unit!14866)

(assert (=> b!209177 (= lt!327486 Unit!14893)))

(assert (=> b!209177 (= (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!327465))) (currentByte!9638 (_2!9611 lt!327465)) (currentBit!9633 (_2!9611 lt!327465))) (bvsub (bvadd (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326541))) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!327483 () Unit!14866)

(declare-fun Unit!14894 () Unit!14866)

(assert (=> b!209177 (= lt!327483 Unit!14894)))

(declare-fun lt!327477 () Unit!14866)

(declare-fun Unit!14895 () Unit!14866)

(assert (=> b!209177 (= lt!327477 Unit!14895)))

(assert (=> b!209177 (= lt!327470 (reader!0 (_2!9611 lt!326541) (_2!9611 lt!327465)))))

(declare-fun lt!327468 () (_ BitVec 64))

(assert (=> b!209177 (= lt!327468 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!327467 () Unit!14866)

(assert (=> b!209177 (= lt!327467 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9611 lt!326541) (buf!5108 (_2!9611 lt!327465)) lt!327468))))

(assert (=> b!209177 (validate_offset_bits!1 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!327465)))) ((_ sign_extend 32) (currentByte!9638 (_2!9611 lt!326541))) ((_ sign_extend 32) (currentBit!9633 (_2!9611 lt!326541))) lt!327468)))

(declare-fun lt!327453 () Unit!14866)

(assert (=> b!209177 (= lt!327453 lt!327467)))

(assert (=> b!209177 (= lt!327500 (readNBitsLSBFirstsLoopPure!0 (_1!9609 lt!327470) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!175577 () Bool)

(assert (=> b!209177 (= res!175577 (= (_2!9610 lt!327500) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!209177 (=> (not res!175577) (not e!142820))))

(assert (=> b!209177 e!142820))

(declare-fun lt!327496 () Unit!14866)

(declare-fun Unit!14896 () Unit!14866)

(assert (=> b!209177 (= lt!327496 Unit!14896)))

(declare-fun b!209178 () Bool)

(declare-fun e!142821 () Bool)

(declare-fun lt!327462 () tuple2!17906)

(assert (=> b!209178 (= e!142821 (= (bitIndex!0 (size!4597 (buf!5108 (_1!9608 lt!327462))) (currentByte!9638 (_1!9608 lt!327462)) (currentBit!9633 (_1!9608 lt!327462))) (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!327484))) (currentByte!9638 (_2!9611 lt!327484)) (currentBit!9633 (_2!9611 lt!327484)))))))

(declare-fun b!209179 () Bool)

(declare-fun Unit!14897 () Unit!14866)

(assert (=> b!209179 (= e!142813 (tuple2!17913 Unit!14897 (_2!9611 lt!326541)))))

(declare-fun lt!327485 () Unit!14866)

(assert (=> b!209179 (= lt!327485 (lemmaIsPrefixRefl!0 (_2!9611 lt!326541)))))

(assert (=> b!209179 call!3294))

(declare-fun lt!327475 () Unit!14866)

(assert (=> b!209179 (= lt!327475 lt!327485)))

(declare-fun b!209180 () Bool)

(declare-fun e!142819 () Bool)

(declare-fun lt!327456 () (_ BitVec 64))

(assert (=> b!209180 (= e!142819 (validate_offset_bits!1 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!326541)))) ((_ sign_extend 32) (currentByte!9638 (_2!9611 lt!326541))) ((_ sign_extend 32) (currentBit!9633 (_2!9611 lt!326541))) lt!327456))))

(declare-fun b!209181 () Bool)

(declare-fun res!175567 () Bool)

(assert (=> b!209181 (= res!175567 (= (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!327484))) (currentByte!9638 (_2!9611 lt!327484)) (currentBit!9633 (_2!9611 lt!327484))) (bvadd (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326541))) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!209181 (=> (not res!175567) (not e!142818))))

(declare-fun b!209182 () Bool)

(declare-fun res!175576 () Bool)

(assert (=> b!209182 (=> (not res!175576) (not e!142817))))

(assert (=> b!209182 (= res!175576 (isPrefixOf!0 (_2!9611 lt!326541) (_2!9611 lt!327454)))))

(declare-fun b!209183 () Bool)

(assert (=> b!209183 (= e!142814 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!209184 () Bool)

(declare-fun res!175575 () Bool)

(assert (=> b!209184 (=> (not res!175575) (not e!142817))))

(declare-fun lt!327504 () (_ BitVec 64))

(declare-fun lt!327464 () (_ BitVec 64))

(assert (=> b!209184 (= res!175575 (= (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!327454))) (currentByte!9638 (_2!9611 lt!327454)) (currentBit!9633 (_2!9611 lt!327454))) (bvsub lt!327504 lt!327464)))))

(assert (=> b!209184 (or (= (bvand lt!327504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327464 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!327504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!327504 lt!327464) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209184 (= lt!327464 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!327450 () (_ BitVec 64))

(declare-fun lt!327491 () (_ BitVec 64))

(assert (=> b!209184 (= lt!327504 (bvadd lt!327450 lt!327491))))

(assert (=> b!209184 (or (not (= (bvand lt!327450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327491 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!327450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!327450 lt!327491) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209184 (= lt!327491 ((_ sign_extend 32) nBits!348))))

(assert (=> b!209184 (= lt!327450 (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326541))) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541))))))

(declare-fun b!209185 () Bool)

(assert (=> b!209185 (= e!142816 (= (_2!9608 lt!327461) (_2!9608 lt!327457)))))

(declare-fun b!209186 () Bool)

(assert (=> b!209186 (= lt!327462 (readBitPure!0 (readerFrom!0 (_2!9611 lt!327484) (currentBit!9633 (_2!9611 lt!326541)) (currentByte!9638 (_2!9611 lt!326541)))))))

(declare-fun res!175568 () Bool)

(assert (=> b!209186 (= res!175568 (and (= (_2!9608 lt!327462) lt!327460) (= (_1!9608 lt!327462) (_2!9611 lt!327484))))))

(assert (=> b!209186 (=> (not res!175568) (not e!142821))))

(assert (=> b!209186 (= e!142818 e!142821)))

(declare-fun b!209187 () Bool)

(declare-fun e!142815 () Bool)

(declare-fun lt!327463 () tuple2!17910)

(declare-fun lt!327490 () tuple2!17908)

(assert (=> b!209187 (= e!142815 (= (_1!9610 lt!327463) (_2!9609 lt!327490)))))

(declare-fun b!209188 () Bool)

(assert (=> b!209188 (= e!142817 e!142815)))

(declare-fun res!175574 () Bool)

(assert (=> b!209188 (=> (not res!175574) (not e!142815))))

(assert (=> b!209188 (= res!175574 (= (_2!9610 lt!327463) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!209188 (= lt!327463 (readNBitsLSBFirstsLoopPure!0 (_1!9609 lt!327490) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!327466 () Unit!14866)

(declare-fun lt!327451 () Unit!14866)

(assert (=> b!209188 (= lt!327466 lt!327451)))

(assert (=> b!209188 (validate_offset_bits!1 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!327454)))) ((_ sign_extend 32) (currentByte!9638 (_2!9611 lt!326541))) ((_ sign_extend 32) (currentBit!9633 (_2!9611 lt!326541))) lt!327456)))

(assert (=> b!209188 (= lt!327451 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9611 lt!326541) (buf!5108 (_2!9611 lt!327454)) lt!327456))))

(assert (=> b!209188 e!142819))

(declare-fun res!175566 () Bool)

(assert (=> b!209188 (=> (not res!175566) (not e!142819))))

(assert (=> b!209188 (= res!175566 (and (= (size!4597 (buf!5108 (_2!9611 lt!326541))) (size!4597 (buf!5108 (_2!9611 lt!327454)))) (bvsge lt!327456 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209188 (= lt!327456 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!209188 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!209188 (= lt!327490 (reader!0 (_2!9611 lt!326541) (_2!9611 lt!327454)))))

(assert (= (and d!70683 c!10292) b!209179))

(assert (= (and d!70683 (not c!10292)) b!209177))

(assert (= (and b!209177 res!175572) b!209181))

(assert (= (and b!209181 res!175567) b!209173))

(assert (= (and b!209173 res!175573) b!209186))

(assert (= (and b!209186 res!175568) b!209178))

(assert (= (and b!209177 res!175571) b!209185))

(assert (= (and b!209177 c!10291) b!209176))

(assert (= (and b!209177 (not c!10291)) b!209183))

(assert (= (and b!209177 res!175577) b!209175))

(assert (= (or b!209179 b!209177) bm!3291))

(assert (= (and d!70683 res!175569) b!209174))

(assert (= (and b!209174 res!175570) b!209184))

(assert (= (and b!209184 res!175575) b!209182))

(assert (= (and b!209182 res!175576) b!209188))

(assert (= (and b!209188 res!175566) b!209180))

(assert (= (and b!209188 res!175574) b!209187))

(declare-fun m!321929 () Bool)

(assert (=> b!209186 m!321929))

(assert (=> b!209186 m!321929))

(declare-fun m!321931 () Bool)

(assert (=> b!209186 m!321931))

(declare-fun m!321933 () Bool)

(assert (=> bm!3291 m!321933))

(declare-fun m!321935 () Bool)

(assert (=> b!209188 m!321935))

(declare-fun m!321937 () Bool)

(assert (=> b!209188 m!321937))

(declare-fun m!321939 () Bool)

(assert (=> b!209188 m!321939))

(declare-fun m!321941 () Bool)

(assert (=> b!209188 m!321941))

(declare-fun m!321943 () Bool)

(assert (=> b!209188 m!321943))

(declare-fun m!321945 () Bool)

(assert (=> b!209188 m!321945))

(assert (=> b!209179 m!321631))

(declare-fun m!321947 () Bool)

(assert (=> b!209182 m!321947))

(declare-fun m!321949 () Bool)

(assert (=> b!209178 m!321949))

(declare-fun m!321951 () Bool)

(assert (=> b!209178 m!321951))

(declare-fun m!321953 () Bool)

(assert (=> d!70683 m!321953))

(assert (=> b!209181 m!321951))

(assert (=> b!209181 m!321267))

(assert (=> b!209177 m!321267))

(assert (=> b!209177 m!321937))

(declare-fun m!321955 () Bool)

(assert (=> b!209177 m!321955))

(declare-fun m!321957 () Bool)

(assert (=> b!209177 m!321957))

(declare-fun m!321959 () Bool)

(assert (=> b!209177 m!321959))

(declare-fun m!321961 () Bool)

(assert (=> b!209177 m!321961))

(declare-fun m!321963 () Bool)

(assert (=> b!209177 m!321963))

(assert (=> b!209177 m!321941))

(declare-fun m!321965 () Bool)

(assert (=> b!209177 m!321965))

(declare-fun m!321967 () Bool)

(assert (=> b!209177 m!321967))

(declare-fun m!321969 () Bool)

(assert (=> b!209177 m!321969))

(declare-fun m!321971 () Bool)

(assert (=> b!209177 m!321971))

(declare-fun m!321973 () Bool)

(assert (=> b!209177 m!321973))

(declare-fun m!321975 () Bool)

(assert (=> b!209177 m!321975))

(declare-fun m!321977 () Bool)

(assert (=> b!209177 m!321977))

(declare-fun m!321979 () Bool)

(assert (=> b!209177 m!321979))

(declare-fun m!321981 () Bool)

(assert (=> b!209177 m!321981))

(declare-fun m!321983 () Bool)

(assert (=> b!209177 m!321983))

(declare-fun m!321985 () Bool)

(assert (=> b!209177 m!321985))

(declare-fun m!321987 () Bool)

(assert (=> b!209177 m!321987))

(declare-fun m!321989 () Bool)

(assert (=> b!209177 m!321989))

(assert (=> b!209177 m!321955))

(declare-fun m!321991 () Bool)

(assert (=> b!209177 m!321991))

(declare-fun m!321993 () Bool)

(assert (=> b!209177 m!321993))

(declare-fun m!321995 () Bool)

(assert (=> b!209177 m!321995))

(declare-fun m!321997 () Bool)

(assert (=> b!209177 m!321997))

(declare-fun m!321999 () Bool)

(assert (=> b!209177 m!321999))

(declare-fun m!322001 () Bool)

(assert (=> b!209177 m!322001))

(declare-fun m!322003 () Bool)

(assert (=> b!209177 m!322003))

(declare-fun m!322005 () Bool)

(assert (=> b!209177 m!322005))

(declare-fun m!322007 () Bool)

(assert (=> b!209177 m!322007))

(declare-fun m!322009 () Bool)

(assert (=> b!209177 m!322009))

(declare-fun m!322011 () Bool)

(assert (=> b!209177 m!322011))

(declare-fun m!322013 () Bool)

(assert (=> b!209177 m!322013))

(declare-fun m!322015 () Bool)

(assert (=> b!209180 m!322015))

(declare-fun m!322017 () Bool)

(assert (=> b!209173 m!322017))

(declare-fun m!322019 () Bool)

(assert (=> b!209184 m!322019))

(assert (=> b!209184 m!321267))

(assert (=> b!208782 d!70683))

(declare-fun d!70761 () Bool)

(declare-fun lt!327505 () tuple2!17934)

(assert (=> d!70761 (= lt!327505 (readBit!0 (readerFrom!0 (_2!9611 lt!326541) (currentBit!9633 thiss!1204) (currentByte!9638 thiss!1204))))))

(assert (=> d!70761 (= (readBitPure!0 (readerFrom!0 (_2!9611 lt!326541) (currentBit!9633 thiss!1204) (currentByte!9638 thiss!1204))) (tuple2!17907 (_2!9622 lt!327505) (_1!9622 lt!327505)))))

(declare-fun bs!17385 () Bool)

(assert (= bs!17385 d!70761))

(assert (=> bs!17385 m!321325))

(declare-fun m!322021 () Bool)

(assert (=> bs!17385 m!322021))

(assert (=> b!208780 d!70761))

(declare-fun d!70763 () Bool)

(declare-fun e!142824 () Bool)

(assert (=> d!70763 e!142824))

(declare-fun res!175581 () Bool)

(assert (=> d!70763 (=> (not res!175581) (not e!142824))))

(assert (=> d!70763 (= res!175581 (invariant!0 (currentBit!9633 (_2!9611 lt!326541)) (currentByte!9638 (_2!9611 lt!326541)) (size!4597 (buf!5108 (_2!9611 lt!326541)))))))

(assert (=> d!70763 (= (readerFrom!0 (_2!9611 lt!326541) (currentBit!9633 thiss!1204) (currentByte!9638 thiss!1204)) (BitStream!8303 (buf!5108 (_2!9611 lt!326541)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204)))))

(declare-fun b!209191 () Bool)

(assert (=> b!209191 (= e!142824 (invariant!0 (currentBit!9633 thiss!1204) (currentByte!9638 thiss!1204) (size!4597 (buf!5108 (_2!9611 lt!326541)))))))

(assert (= (and d!70763 res!175581) b!209191))

(declare-fun m!322023 () Bool)

(assert (=> d!70763 m!322023))

(assert (=> b!209191 m!321283))

(assert (=> b!208780 d!70763))

(declare-fun d!70765 () Bool)

(assert (=> d!70765 (= (invariant!0 (currentBit!9633 (_2!9611 lt!326525)) (currentByte!9638 (_2!9611 lt!326525)) (size!4597 (buf!5108 (_2!9611 lt!326525)))) (and (bvsge (currentBit!9633 (_2!9611 lt!326525)) #b00000000000000000000000000000000) (bvslt (currentBit!9633 (_2!9611 lt!326525)) #b00000000000000000000000000001000) (bvsge (currentByte!9638 (_2!9611 lt!326525)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9638 (_2!9611 lt!326525)) (size!4597 (buf!5108 (_2!9611 lt!326525)))) (and (= (currentBit!9633 (_2!9611 lt!326525)) #b00000000000000000000000000000000) (= (currentByte!9638 (_2!9611 lt!326525)) (size!4597 (buf!5108 (_2!9611 lt!326525))))))))))

(assert (=> b!208790 d!70765))

(declare-fun d!70767 () Bool)

(assert (=> d!70767 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9633 thiss!1204) (currentByte!9638 thiss!1204) (size!4597 (buf!5108 thiss!1204))))))

(declare-fun bs!17386 () Bool)

(assert (= bs!17386 d!70767))

(assert (=> bs!17386 m!321315))

(assert (=> start!43860 d!70767))

(declare-fun d!70769 () Bool)

(declare-fun e!142825 () Bool)

(assert (=> d!70769 e!142825))

(declare-fun res!175582 () Bool)

(assert (=> d!70769 (=> (not res!175582) (not e!142825))))

(declare-fun lt!327506 () (_ BitVec 64))

(declare-fun lt!327511 () (_ BitVec 64))

(declare-fun lt!327510 () (_ BitVec 64))

(assert (=> d!70769 (= res!175582 (= lt!327510 (bvsub lt!327511 lt!327506)))))

(assert (=> d!70769 (or (= (bvand lt!327511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327506 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!327511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!327511 lt!327506) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70769 (= lt!327506 (remainingBits!0 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!326541)))) ((_ sign_extend 32) (currentByte!9638 (_2!9611 lt!326541))) ((_ sign_extend 32) (currentBit!9633 (_2!9611 lt!326541)))))))

(declare-fun lt!327508 () (_ BitVec 64))

(declare-fun lt!327507 () (_ BitVec 64))

(assert (=> d!70769 (= lt!327511 (bvmul lt!327508 lt!327507))))

(assert (=> d!70769 (or (= lt!327508 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!327507 (bvsdiv (bvmul lt!327508 lt!327507) lt!327508)))))

(assert (=> d!70769 (= lt!327507 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70769 (= lt!327508 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!326541)))))))

(assert (=> d!70769 (= lt!327510 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9638 (_2!9611 lt!326541))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9633 (_2!9611 lt!326541)))))))

(assert (=> d!70769 (invariant!0 (currentBit!9633 (_2!9611 lt!326541)) (currentByte!9638 (_2!9611 lt!326541)) (size!4597 (buf!5108 (_2!9611 lt!326541))))))

(assert (=> d!70769 (= (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326541))) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541))) lt!327510)))

(declare-fun b!209192 () Bool)

(declare-fun res!175583 () Bool)

(assert (=> b!209192 (=> (not res!175583) (not e!142825))))

(assert (=> b!209192 (= res!175583 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!327510))))

(declare-fun b!209193 () Bool)

(declare-fun lt!327509 () (_ BitVec 64))

(assert (=> b!209193 (= e!142825 (bvsle lt!327510 (bvmul lt!327509 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209193 (or (= lt!327509 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!327509 #b0000000000000000000000000000000000000000000000000000000000001000) lt!327509)))))

(assert (=> b!209193 (= lt!327509 ((_ sign_extend 32) (size!4597 (buf!5108 (_2!9611 lt!326541)))))))

(assert (= (and d!70769 res!175582) b!209192))

(assert (= (and b!209192 res!175583) b!209193))

(declare-fun m!322025 () Bool)

(assert (=> d!70769 m!322025))

(assert (=> d!70769 m!322023))

(assert (=> b!208779 d!70769))

(declare-fun d!70771 () Bool)

(declare-fun e!142826 () Bool)

(assert (=> d!70771 e!142826))

(declare-fun res!175584 () Bool)

(assert (=> d!70771 (=> (not res!175584) (not e!142826))))

(declare-fun lt!327516 () (_ BitVec 64))

(declare-fun lt!327512 () (_ BitVec 64))

(declare-fun lt!327517 () (_ BitVec 64))

(assert (=> d!70771 (= res!175584 (= lt!327516 (bvsub lt!327517 lt!327512)))))

(assert (=> d!70771 (or (= (bvand lt!327517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327512 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!327517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!327517 lt!327512) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70771 (= lt!327512 (remainingBits!0 ((_ sign_extend 32) (size!4597 (buf!5108 thiss!1204))) ((_ sign_extend 32) (currentByte!9638 thiss!1204)) ((_ sign_extend 32) (currentBit!9633 thiss!1204))))))

(declare-fun lt!327514 () (_ BitVec 64))

(declare-fun lt!327513 () (_ BitVec 64))

(assert (=> d!70771 (= lt!327517 (bvmul lt!327514 lt!327513))))

(assert (=> d!70771 (or (= lt!327514 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!327513 (bvsdiv (bvmul lt!327514 lt!327513) lt!327514)))))

(assert (=> d!70771 (= lt!327513 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70771 (= lt!327514 ((_ sign_extend 32) (size!4597 (buf!5108 thiss!1204))))))

(assert (=> d!70771 (= lt!327516 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9638 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9633 thiss!1204))))))

(assert (=> d!70771 (invariant!0 (currentBit!9633 thiss!1204) (currentByte!9638 thiss!1204) (size!4597 (buf!5108 thiss!1204)))))

(assert (=> d!70771 (= (bitIndex!0 (size!4597 (buf!5108 thiss!1204)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204)) lt!327516)))

(declare-fun b!209194 () Bool)

(declare-fun res!175585 () Bool)

(assert (=> b!209194 (=> (not res!175585) (not e!142826))))

(assert (=> b!209194 (= res!175585 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!327516))))

(declare-fun b!209195 () Bool)

(declare-fun lt!327515 () (_ BitVec 64))

(assert (=> b!209195 (= e!142826 (bvsle lt!327516 (bvmul lt!327515 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209195 (or (= lt!327515 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!327515 #b0000000000000000000000000000000000000000000000000000000000001000) lt!327515)))))

(assert (=> b!209195 (= lt!327515 ((_ sign_extend 32) (size!4597 (buf!5108 thiss!1204))))))

(assert (= (and d!70771 res!175584) b!209194))

(assert (= (and b!209194 res!175585) b!209195))

(declare-fun m!322027 () Bool)

(assert (=> d!70771 m!322027))

(assert (=> d!70771 m!321315))

(assert (=> b!208779 d!70771))

(declare-fun b!209208 () Bool)

(declare-fun e!142832 () Bool)

(declare-fun lt!327528 () tuple2!17906)

(declare-fun lt!327526 () tuple2!17912)

(assert (=> b!209208 (= e!142832 (= (bitIndex!0 (size!4597 (buf!5108 (_1!9608 lt!327528))) (currentByte!9638 (_1!9608 lt!327528)) (currentBit!9633 (_1!9608 lt!327528))) (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!327526))) (currentByte!9638 (_2!9611 lt!327526)) (currentBit!9633 (_2!9611 lt!327526)))))))

(declare-fun b!209206 () Bool)

(declare-fun res!175594 () Bool)

(declare-fun e!142831 () Bool)

(assert (=> b!209206 (=> (not res!175594) (not e!142831))))

(assert (=> b!209206 (= res!175594 (isPrefixOf!0 thiss!1204 (_2!9611 lt!327526)))))

(declare-fun d!70773 () Bool)

(assert (=> d!70773 e!142831))

(declare-fun res!175596 () Bool)

(assert (=> d!70773 (=> (not res!175596) (not e!142831))))

(assert (=> d!70773 (= res!175596 (= (size!4597 (buf!5108 thiss!1204)) (size!4597 (buf!5108 (_2!9611 lt!327526)))))))

(declare-fun choose!16 (BitStream!8302 Bool) tuple2!17912)

(assert (=> d!70773 (= lt!327526 (choose!16 thiss!1204 lt!326532))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!70773 (validate_offset_bit!0 ((_ sign_extend 32) (size!4597 (buf!5108 thiss!1204))) ((_ sign_extend 32) (currentByte!9638 thiss!1204)) ((_ sign_extend 32) (currentBit!9633 thiss!1204)))))

(assert (=> d!70773 (= (appendBit!0 thiss!1204 lt!326532) lt!327526)))

(declare-fun b!209205 () Bool)

(declare-fun res!175597 () Bool)

(assert (=> b!209205 (=> (not res!175597) (not e!142831))))

(declare-fun lt!327527 () (_ BitVec 64))

(declare-fun lt!327529 () (_ BitVec 64))

(assert (=> b!209205 (= res!175597 (= (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!327526))) (currentByte!9638 (_2!9611 lt!327526)) (currentBit!9633 (_2!9611 lt!327526))) (bvadd lt!327527 lt!327529)))))

(assert (=> b!209205 (or (not (= (bvand lt!327527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327529 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!327527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!327527 lt!327529) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209205 (= lt!327529 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!209205 (= lt!327527 (bitIndex!0 (size!4597 (buf!5108 thiss!1204)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204)))))

(declare-fun b!209207 () Bool)

(assert (=> b!209207 (= e!142831 e!142832)))

(declare-fun res!175595 () Bool)

(assert (=> b!209207 (=> (not res!175595) (not e!142832))))

(assert (=> b!209207 (= res!175595 (and (= (_2!9608 lt!327528) lt!326532) (= (_1!9608 lt!327528) (_2!9611 lt!327526))))))

(assert (=> b!209207 (= lt!327528 (readBitPure!0 (readerFrom!0 (_2!9611 lt!327526) (currentBit!9633 thiss!1204) (currentByte!9638 thiss!1204))))))

(assert (= (and d!70773 res!175596) b!209205))

(assert (= (and b!209205 res!175597) b!209206))

(assert (= (and b!209206 res!175594) b!209207))

(assert (= (and b!209207 res!175595) b!209208))

(declare-fun m!322029 () Bool)

(assert (=> d!70773 m!322029))

(declare-fun m!322031 () Bool)

(assert (=> d!70773 m!322031))

(declare-fun m!322033 () Bool)

(assert (=> b!209208 m!322033))

(declare-fun m!322035 () Bool)

(assert (=> b!209208 m!322035))

(declare-fun m!322037 () Bool)

(assert (=> b!209207 m!322037))

(assert (=> b!209207 m!322037))

(declare-fun m!322039 () Bool)

(assert (=> b!209207 m!322039))

(declare-fun m!322041 () Bool)

(assert (=> b!209206 m!322041))

(assert (=> b!209205 m!322035))

(assert (=> b!209205 m!321269))

(assert (=> b!208779 d!70773))

(assert (=> b!208789 d!70769))

(assert (=> b!208789 d!70771))

(declare-fun d!70775 () Bool)

(assert (=> d!70775 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4597 (buf!5108 (_1!9609 lt!326539)))) ((_ sign_extend 32) (currentByte!9638 (_1!9609 lt!326539))) ((_ sign_extend 32) (currentBit!9633 (_1!9609 lt!326539))) lt!326523) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4597 (buf!5108 (_1!9609 lt!326539)))) ((_ sign_extend 32) (currentByte!9638 (_1!9609 lt!326539))) ((_ sign_extend 32) (currentBit!9633 (_1!9609 lt!326539)))) lt!326523))))

(declare-fun bs!17387 () Bool)

(assert (= bs!17387 d!70775))

(declare-fun m!322043 () Bool)

(assert (=> bs!17387 m!322043))

(assert (=> b!208778 d!70775))

(declare-fun d!70777 () Bool)

(declare-fun res!175598 () Bool)

(declare-fun e!142833 () Bool)

(assert (=> d!70777 (=> (not res!175598) (not e!142833))))

(assert (=> d!70777 (= res!175598 (= (size!4597 (buf!5108 thiss!1204)) (size!4597 (buf!5108 (_2!9611 lt!326541)))))))

(assert (=> d!70777 (= (isPrefixOf!0 thiss!1204 (_2!9611 lt!326541)) e!142833)))

(declare-fun b!209209 () Bool)

(declare-fun res!175599 () Bool)

(assert (=> b!209209 (=> (not res!175599) (not e!142833))))

(assert (=> b!209209 (= res!175599 (bvsle (bitIndex!0 (size!4597 (buf!5108 thiss!1204)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204)) (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326541))) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541)))))))

(declare-fun b!209210 () Bool)

(declare-fun e!142834 () Bool)

(assert (=> b!209210 (= e!142833 e!142834)))

(declare-fun res!175600 () Bool)

(assert (=> b!209210 (=> res!175600 e!142834)))

(assert (=> b!209210 (= res!175600 (= (size!4597 (buf!5108 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!209211 () Bool)

(assert (=> b!209211 (= e!142834 (arrayBitRangesEq!0 (buf!5108 thiss!1204) (buf!5108 (_2!9611 lt!326541)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4597 (buf!5108 thiss!1204)) (currentByte!9638 thiss!1204) (currentBit!9633 thiss!1204))))))

(assert (= (and d!70777 res!175598) b!209209))

(assert (= (and b!209209 res!175599) b!209210))

(assert (= (and b!209210 (not res!175600)) b!209211))

(assert (=> b!209209 m!321269))

(assert (=> b!209209 m!321267))

(assert (=> b!209211 m!321269))

(assert (=> b!209211 m!321269))

(declare-fun m!322045 () Bool)

(assert (=> b!209211 m!322045))

(assert (=> b!208788 d!70777))

(declare-fun d!70779 () Bool)

(declare-fun res!175601 () Bool)

(declare-fun e!142835 () Bool)

(assert (=> d!70779 (=> (not res!175601) (not e!142835))))

(assert (=> d!70779 (= res!175601 (= (size!4597 (buf!5108 (_2!9611 lt!326541))) (size!4597 (buf!5108 (_2!9611 lt!326525)))))))

(assert (=> d!70779 (= (isPrefixOf!0 (_2!9611 lt!326541) (_2!9611 lt!326525)) e!142835)))

(declare-fun b!209212 () Bool)

(declare-fun res!175602 () Bool)

(assert (=> b!209212 (=> (not res!175602) (not e!142835))))

(assert (=> b!209212 (= res!175602 (bvsle (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326541))) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541))) (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326525))) (currentByte!9638 (_2!9611 lt!326525)) (currentBit!9633 (_2!9611 lt!326525)))))))

(declare-fun b!209213 () Bool)

(declare-fun e!142836 () Bool)

(assert (=> b!209213 (= e!142835 e!142836)))

(declare-fun res!175603 () Bool)

(assert (=> b!209213 (=> res!175603 e!142836)))

(assert (=> b!209213 (= res!175603 (= (size!4597 (buf!5108 (_2!9611 lt!326541))) #b00000000000000000000000000000000))))

(declare-fun b!209214 () Bool)

(assert (=> b!209214 (= e!142836 (arrayBitRangesEq!0 (buf!5108 (_2!9611 lt!326541)) (buf!5108 (_2!9611 lt!326525)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4597 (buf!5108 (_2!9611 lt!326541))) (currentByte!9638 (_2!9611 lt!326541)) (currentBit!9633 (_2!9611 lt!326541)))))))

(assert (= (and d!70779 res!175601) b!209212))

(assert (= (and b!209212 res!175602) b!209213))

(assert (= (and b!209213 (not res!175603)) b!209214))

(assert (=> b!209212 m!321267))

(assert (=> b!209212 m!321273))

(assert (=> b!209214 m!321267))

(assert (=> b!209214 m!321267))

(declare-fun m!322047 () Bool)

(assert (=> b!209214 m!322047))

(assert (=> b!208777 d!70779))

(declare-fun d!70781 () Bool)

(assert (=> d!70781 (= (invariant!0 (currentBit!9633 thiss!1204) (currentByte!9638 thiss!1204) (size!4597 (buf!5108 (_2!9611 lt!326525)))) (and (bvsge (currentBit!9633 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9633 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9638 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9638 thiss!1204) (size!4597 (buf!5108 (_2!9611 lt!326525)))) (and (= (currentBit!9633 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9638 thiss!1204) (size!4597 (buf!5108 (_2!9611 lt!326525))))))))))

(assert (=> b!208787 d!70781))

(assert (=> b!208776 d!70777))

(declare-fun d!70783 () Bool)

(assert (=> d!70783 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4597 (buf!5108 thiss!1204))) ((_ sign_extend 32) (currentByte!9638 thiss!1204)) ((_ sign_extend 32) (currentBit!9633 thiss!1204)) lt!326523) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4597 (buf!5108 thiss!1204))) ((_ sign_extend 32) (currentByte!9638 thiss!1204)) ((_ sign_extend 32) (currentBit!9633 thiss!1204))) lt!326523))))

(declare-fun bs!17388 () Bool)

(assert (= bs!17388 d!70783))

(assert (=> bs!17388 m!322027))

(assert (=> b!208786 d!70783))

(declare-fun d!70785 () Bool)

(assert (=> d!70785 (= (array_inv!4338 (buf!5108 thiss!1204)) (bvsge (size!4597 (buf!5108 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!208785 d!70785))

(declare-fun d!70787 () Bool)

(assert (=> d!70787 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590)) (ite (= (bvsub #b00000000000000000000000001000000 i!590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!590))))))))

(assert (=> b!208774 d!70787))

(push 1)

(assert (not b!209208))

(assert (not d!70657))

(assert (not b!209186))

(assert (not b!208985))

(assert (not b!209006))

(assert (not b!209178))

(assert (not bm!3291))

(assert (not d!70667))

(assert (not d!70669))

(assert (not b!209008))

(assert (not b!209184))

(assert (not d!70681))

(assert (not d!70661))

(assert (not b!209211))

(assert (not b!209181))

(assert (not d!70773))

(assert (not d!70671))

(assert (not d!70643))

(assert (not d!70767))

(assert (not d!70647))

(assert (not d!70653))

(assert (not b!209209))

(assert (not b!208984))

(assert (not d!70783))

(assert (not b!209205))

(assert (not b!209180))

(assert (not d!70763))

(assert (not d!70655))

(assert (not d!70761))

(assert (not d!70665))

(assert (not b!208991))

(assert (not b!208989))

(assert (not d!70683))

(assert (not b!208990))

(assert (not d!70771))

(assert (not d!70651))

(assert (not d!70675))

(assert (not b!209214))

(assert (not b!209207))

(assert (not b!209191))

(assert (not d!70769))

(assert (not b!208988))

(assert (not b!209177))

(assert (not d!70663))

(assert (not b!209173))

(assert (not b!208983))

(assert (not b!209182))

(assert (not d!70677))

(assert (not d!70641))

(assert (not b!209179))

(assert (not b!209206))

(assert (not d!70775))

(assert (not b!209212))

(assert (not b!209188))

(assert (not b!208986))

(assert (not d!70649))

(check-sat)

(pop 1)

(push 1)

(check-sat)

