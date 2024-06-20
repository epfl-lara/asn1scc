; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43862 () Bool)

(assert start!43862)

(declare-fun b!208832 () Bool)

(declare-fun res!175287 () Bool)

(declare-fun e!142627 () Bool)

(assert (=> b!208832 (=> (not res!175287) (not e!142627))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!208832 (= res!175287 (not (= i!590 nBits!348)))))

(declare-fun b!208833 () Bool)

(declare-fun e!142633 () Bool)

(declare-fun e!142628 () Bool)

(assert (=> b!208833 (= e!142633 e!142628)))

(declare-fun res!175276 () Bool)

(assert (=> b!208833 (=> (not res!175276) (not e!142628))))

(declare-datatypes ((array!10459 0))(
  ( (array!10460 (arr!5528 (Array (_ BitVec 32) (_ BitVec 8))) (size!4598 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8304 0))(
  ( (BitStream!8305 (buf!5109 array!10459) (currentByte!9639 (_ BitVec 32)) (currentBit!9634 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17914 0))(
  ( (tuple2!17915 (_1!9612 BitStream!8304) (_2!9612 Bool)) )
))
(declare-fun lt!326592 () tuple2!17914)

(declare-fun lt!326605 () Bool)

(declare-datatypes ((Unit!14868 0))(
  ( (Unit!14869) )
))
(declare-datatypes ((tuple2!17916 0))(
  ( (tuple2!17917 (_1!9613 Unit!14868) (_2!9613 BitStream!8304)) )
))
(declare-fun lt!326609 () tuple2!17916)

(assert (=> b!208833 (= res!175276 (and (= (_2!9612 lt!326592) lt!326605) (= (_1!9612 lt!326592) (_2!9613 lt!326609))))))

(declare-fun thiss!1204 () BitStream!8304)

(declare-fun readBitPure!0 (BitStream!8304) tuple2!17914)

(declare-fun readerFrom!0 (BitStream!8304 (_ BitVec 32) (_ BitVec 32)) BitStream!8304)

(assert (=> b!208833 (= lt!326592 (readBitPure!0 (readerFrom!0 (_2!9613 lt!326609) (currentBit!9634 thiss!1204) (currentByte!9639 thiss!1204))))))

(declare-fun b!208834 () Bool)

(declare-fun lt!326602 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208834 (= e!142628 (= (bitIndex!0 (size!4598 (buf!5109 (_1!9612 lt!326592))) (currentByte!9639 (_1!9612 lt!326592)) (currentBit!9634 (_1!9612 lt!326592))) lt!326602))))

(declare-fun b!208835 () Bool)

(declare-fun res!175279 () Bool)

(declare-fun e!142629 () Bool)

(assert (=> b!208835 (=> res!175279 e!142629)))

(declare-fun lt!326612 () tuple2!17916)

(declare-fun isPrefixOf!0 (BitStream!8304 BitStream!8304) Bool)

(assert (=> b!208835 (= res!175279 (not (isPrefixOf!0 (_2!9613 lt!326609) (_2!9613 lt!326612))))))

(declare-fun b!208836 () Bool)

(declare-fun e!142635 () Bool)

(declare-fun lt!326599 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208836 (= e!142635 (= (bvand lt!326599 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!208837 () Bool)

(declare-fun res!175286 () Bool)

(assert (=> b!208837 (=> res!175286 e!142629)))

(assert (=> b!208837 (= res!175286 (not (isPrefixOf!0 thiss!1204 (_2!9613 lt!326609))))))

(declare-fun b!208838 () Bool)

(declare-fun e!142624 () Bool)

(assert (=> b!208838 (= e!142627 (not e!142624))))

(declare-fun res!175288 () Bool)

(assert (=> b!208838 (=> res!175288 e!142624)))

(declare-fun lt!326600 () (_ BitVec 64))

(declare-fun lt!326607 () (_ BitVec 64))

(assert (=> b!208838 (= res!175288 (not (= lt!326600 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!326607))))))

(assert (=> b!208838 (= lt!326600 (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326609))) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609))))))

(assert (=> b!208838 (= lt!326607 (bitIndex!0 (size!4598 (buf!5109 thiss!1204)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204)))))

(declare-fun e!142632 () Bool)

(assert (=> b!208838 e!142632))

(declare-fun res!175281 () Bool)

(assert (=> b!208838 (=> (not res!175281) (not e!142632))))

(assert (=> b!208838 (= res!175281 (= (size!4598 (buf!5109 thiss!1204)) (size!4598 (buf!5109 (_2!9613 lt!326609)))))))

(declare-fun appendBit!0 (BitStream!8304 Bool) tuple2!17916)

(assert (=> b!208838 (= lt!326609 (appendBit!0 thiss!1204 lt!326605))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!326597 () (_ BitVec 64))

(assert (=> b!208838 (= lt!326605 (not (= (bvand v!189 lt!326597) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208838 (= lt!326597 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!208839 () Bool)

(declare-fun e!142626 () Bool)

(declare-fun lt!326615 () tuple2!17914)

(declare-fun lt!326611 () tuple2!17914)

(assert (=> b!208839 (= e!142626 (= (_2!9612 lt!326615) (_2!9612 lt!326611)))))

(declare-fun b!208840 () Bool)

(declare-fun res!175278 () Bool)

(assert (=> b!208840 (=> res!175278 e!142635)))

(declare-datatypes ((tuple2!17918 0))(
  ( (tuple2!17919 (_1!9614 BitStream!8304) (_2!9614 BitStream!8304)) )
))
(declare-fun lt!326595 () tuple2!17918)

(declare-fun lt!326604 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!208840 (= res!175278 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4598 (buf!5109 (_1!9614 lt!326595)))) ((_ sign_extend 32) (currentByte!9639 (_1!9614 lt!326595))) ((_ sign_extend 32) (currentBit!9634 (_1!9614 lt!326595))) lt!326604)))))

(declare-fun b!208841 () Bool)

(assert (=> b!208841 (= e!142624 e!142629)))

(declare-fun res!175290 () Bool)

(assert (=> b!208841 (=> res!175290 e!142629)))

(declare-fun lt!326614 () (_ BitVec 64))

(assert (=> b!208841 (= res!175290 (not (= lt!326614 (bvsub (bvsub (bvadd lt!326600 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!208841 (= lt!326614 (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326612))) (currentByte!9639 (_2!9613 lt!326612)) (currentBit!9634 (_2!9613 lt!326612))))))

(assert (=> b!208841 (isPrefixOf!0 thiss!1204 (_2!9613 lt!326612))))

(declare-fun lt!326598 () Unit!14868)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8304 BitStream!8304 BitStream!8304) Unit!14868)

(assert (=> b!208841 (= lt!326598 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9613 lt!326609) (_2!9613 lt!326612)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8304 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17916)

(assert (=> b!208841 (= lt!326612 (appendBitsLSBFirstLoopTR!0 (_2!9613 lt!326609) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!208842 () Bool)

(declare-fun res!175291 () Bool)

(assert (=> b!208842 (=> res!175291 e!142635)))

(assert (=> b!208842 (= res!175291 (bvsge i!590 nBits!348))))

(declare-fun b!208843 () Bool)

(declare-fun res!175284 () Bool)

(assert (=> b!208843 (=> res!175284 e!142629)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!208843 (= res!175284 (not (invariant!0 (currentBit!9634 (_2!9613 lt!326612)) (currentByte!9639 (_2!9613 lt!326612)) (size!4598 (buf!5109 (_2!9613 lt!326612))))))))

(declare-fun b!208845 () Bool)

(declare-fun e!142634 () Bool)

(declare-fun array_inv!4339 (array!10459) Bool)

(assert (=> b!208845 (= e!142634 (array_inv!4339 (buf!5109 thiss!1204)))))

(declare-fun b!208846 () Bool)

(assert (=> b!208846 (= e!142629 e!142635)))

(declare-fun res!175289 () Bool)

(assert (=> b!208846 (=> res!175289 e!142635)))

(declare-fun lt!326610 () tuple2!17918)

(declare-fun lt!326594 () tuple2!17914)

(declare-datatypes ((tuple2!17920 0))(
  ( (tuple2!17921 (_1!9615 BitStream!8304) (_2!9615 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17920)

(assert (=> b!208846 (= res!175289 (not (= (_1!9615 (readNBitsLSBFirstsLoopPure!0 (_1!9614 lt!326610) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!326599 (ite (_2!9612 lt!326594) lt!326597 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9614 lt!326610))))))

(declare-fun lt!326593 () (_ BitVec 64))

(assert (=> b!208846 (validate_offset_bits!1 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!326612)))) ((_ sign_extend 32) (currentByte!9639 (_2!9613 lt!326609))) ((_ sign_extend 32) (currentBit!9634 (_2!9613 lt!326609))) lt!326593)))

(declare-fun lt!326608 () Unit!14868)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8304 array!10459 (_ BitVec 64)) Unit!14868)

(assert (=> b!208846 (= lt!326608 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9613 lt!326609) (buf!5109 (_2!9613 lt!326612)) lt!326593))))

(assert (=> b!208846 (= lt!326593 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!326613 () tuple2!17920)

(assert (=> b!208846 (= lt!326613 (readNBitsLSBFirstsLoopPure!0 (_1!9614 lt!326595) nBits!348 i!590 lt!326599))))

(assert (=> b!208846 (validate_offset_bits!1 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!326612)))) ((_ sign_extend 32) (currentByte!9639 thiss!1204)) ((_ sign_extend 32) (currentBit!9634 thiss!1204)) lt!326604)))

(declare-fun lt!326606 () Unit!14868)

(assert (=> b!208846 (= lt!326606 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5109 (_2!9613 lt!326612)) lt!326604))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208846 (= lt!326599 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!208846 (= (_2!9612 lt!326594) lt!326605)))

(assert (=> b!208846 (= lt!326594 (readBitPure!0 (_1!9614 lt!326595)))))

(declare-fun reader!0 (BitStream!8304 BitStream!8304) tuple2!17918)

(assert (=> b!208846 (= lt!326610 (reader!0 (_2!9613 lt!326609) (_2!9613 lt!326612)))))

(assert (=> b!208846 (= lt!326595 (reader!0 thiss!1204 (_2!9613 lt!326612)))))

(assert (=> b!208846 e!142626))

(declare-fun res!175274 () Bool)

(assert (=> b!208846 (=> (not res!175274) (not e!142626))))

(assert (=> b!208846 (= res!175274 (= (bitIndex!0 (size!4598 (buf!5109 (_1!9612 lt!326615))) (currentByte!9639 (_1!9612 lt!326615)) (currentBit!9634 (_1!9612 lt!326615))) (bitIndex!0 (size!4598 (buf!5109 (_1!9612 lt!326611))) (currentByte!9639 (_1!9612 lt!326611)) (currentBit!9634 (_1!9612 lt!326611)))))))

(declare-fun lt!326596 () Unit!14868)

(declare-fun lt!326601 () BitStream!8304)

(declare-fun readBitPrefixLemma!0 (BitStream!8304 BitStream!8304) Unit!14868)

(assert (=> b!208846 (= lt!326596 (readBitPrefixLemma!0 lt!326601 (_2!9613 lt!326612)))))

(assert (=> b!208846 (= lt!326611 (readBitPure!0 (BitStream!8305 (buf!5109 (_2!9613 lt!326612)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204))))))

(assert (=> b!208846 (= lt!326615 (readBitPure!0 lt!326601))))

(declare-fun e!142625 () Bool)

(assert (=> b!208846 e!142625))

(declare-fun res!175275 () Bool)

(assert (=> b!208846 (=> (not res!175275) (not e!142625))))

(assert (=> b!208846 (= res!175275 (invariant!0 (currentBit!9634 thiss!1204) (currentByte!9639 thiss!1204) (size!4598 (buf!5109 (_2!9613 lt!326609)))))))

(assert (=> b!208846 (= lt!326601 (BitStream!8305 (buf!5109 (_2!9613 lt!326609)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204)))))

(declare-fun b!208847 () Bool)

(declare-fun res!175283 () Bool)

(assert (=> b!208847 (=> (not res!175283) (not e!142633))))

(assert (=> b!208847 (= res!175283 (isPrefixOf!0 thiss!1204 (_2!9613 lt!326609)))))

(declare-fun b!208848 () Bool)

(assert (=> b!208848 (= e!142632 e!142633)))

(declare-fun res!175277 () Bool)

(assert (=> b!208848 (=> (not res!175277) (not e!142633))))

(declare-fun lt!326603 () (_ BitVec 64))

(assert (=> b!208848 (= res!175277 (= lt!326602 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!326603)))))

(assert (=> b!208848 (= lt!326602 (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326609))) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609))))))

(assert (=> b!208848 (= lt!326603 (bitIndex!0 (size!4598 (buf!5109 thiss!1204)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204)))))

(declare-fun b!208849 () Bool)

(declare-fun e!142631 () Bool)

(assert (=> b!208849 (= e!142631 e!142627)))

(declare-fun res!175292 () Bool)

(assert (=> b!208849 (=> (not res!175292) (not e!142627))))

(assert (=> b!208849 (= res!175292 (validate_offset_bits!1 ((_ sign_extend 32) (size!4598 (buf!5109 thiss!1204))) ((_ sign_extend 32) (currentByte!9639 thiss!1204)) ((_ sign_extend 32) (currentBit!9634 thiss!1204)) lt!326604))))

(assert (=> b!208849 (= lt!326604 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!208844 () Bool)

(declare-fun res!175285 () Bool)

(assert (=> b!208844 (=> (not res!175285) (not e!142627))))

(assert (=> b!208844 (= res!175285 (invariant!0 (currentBit!9634 thiss!1204) (currentByte!9639 thiss!1204) (size!4598 (buf!5109 thiss!1204))))))

(declare-fun res!175280 () Bool)

(assert (=> start!43862 (=> (not res!175280) (not e!142631))))

(assert (=> start!43862 (= res!175280 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43862 e!142631))

(assert (=> start!43862 true))

(declare-fun inv!12 (BitStream!8304) Bool)

(assert (=> start!43862 (and (inv!12 thiss!1204) e!142634)))

(declare-fun b!208850 () Bool)

(assert (=> b!208850 (= e!142625 (invariant!0 (currentBit!9634 thiss!1204) (currentByte!9639 thiss!1204) (size!4598 (buf!5109 (_2!9613 lt!326612)))))))

(declare-fun b!208851 () Bool)

(declare-fun res!175282 () Bool)

(assert (=> b!208851 (=> res!175282 e!142629)))

(assert (=> b!208851 (= res!175282 (or (not (= (size!4598 (buf!5109 (_2!9613 lt!326612))) (size!4598 (buf!5109 thiss!1204)))) (not (= lt!326614 (bvsub (bvadd lt!326607 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(assert (= (and start!43862 res!175280) b!208849))

(assert (= (and b!208849 res!175292) b!208844))

(assert (= (and b!208844 res!175285) b!208832))

(assert (= (and b!208832 res!175287) b!208838))

(assert (= (and b!208838 res!175281) b!208848))

(assert (= (and b!208848 res!175277) b!208847))

(assert (= (and b!208847 res!175283) b!208833))

(assert (= (and b!208833 res!175276) b!208834))

(assert (= (and b!208838 (not res!175288)) b!208841))

(assert (= (and b!208841 (not res!175290)) b!208843))

(assert (= (and b!208843 (not res!175284)) b!208851))

(assert (= (and b!208851 (not res!175282)) b!208835))

(assert (= (and b!208835 (not res!175279)) b!208837))

(assert (= (and b!208837 (not res!175286)) b!208846))

(assert (= (and b!208846 res!175275) b!208850))

(assert (= (and b!208846 res!175274) b!208839))

(assert (= (and b!208846 (not res!175289)) b!208842))

(assert (= (and b!208842 (not res!175291)) b!208840))

(assert (= (and b!208840 (not res!175278)) b!208836))

(assert (= start!43862 b!208845))

(declare-fun m!321333 () Bool)

(assert (=> b!208846 m!321333))

(declare-fun m!321335 () Bool)

(assert (=> b!208846 m!321335))

(declare-fun m!321337 () Bool)

(assert (=> b!208846 m!321337))

(declare-fun m!321339 () Bool)

(assert (=> b!208846 m!321339))

(declare-fun m!321341 () Bool)

(assert (=> b!208846 m!321341))

(declare-fun m!321343 () Bool)

(assert (=> b!208846 m!321343))

(declare-fun m!321345 () Bool)

(assert (=> b!208846 m!321345))

(declare-fun m!321347 () Bool)

(assert (=> b!208846 m!321347))

(declare-fun m!321349 () Bool)

(assert (=> b!208846 m!321349))

(declare-fun m!321351 () Bool)

(assert (=> b!208846 m!321351))

(declare-fun m!321353 () Bool)

(assert (=> b!208846 m!321353))

(declare-fun m!321355 () Bool)

(assert (=> b!208846 m!321355))

(declare-fun m!321357 () Bool)

(assert (=> b!208846 m!321357))

(declare-fun m!321359 () Bool)

(assert (=> b!208846 m!321359))

(declare-fun m!321361 () Bool)

(assert (=> b!208846 m!321361))

(declare-fun m!321363 () Bool)

(assert (=> b!208846 m!321363))

(declare-fun m!321365 () Bool)

(assert (=> b!208848 m!321365))

(declare-fun m!321367 () Bool)

(assert (=> b!208848 m!321367))

(declare-fun m!321369 () Bool)

(assert (=> b!208845 m!321369))

(declare-fun m!321371 () Bool)

(assert (=> b!208843 m!321371))

(declare-fun m!321373 () Bool)

(assert (=> b!208847 m!321373))

(declare-fun m!321375 () Bool)

(assert (=> b!208834 m!321375))

(assert (=> b!208837 m!321373))

(declare-fun m!321377 () Bool)

(assert (=> b!208850 m!321377))

(declare-fun m!321379 () Bool)

(assert (=> start!43862 m!321379))

(declare-fun m!321381 () Bool)

(assert (=> b!208849 m!321381))

(declare-fun m!321383 () Bool)

(assert (=> b!208844 m!321383))

(declare-fun m!321385 () Bool)

(assert (=> b!208841 m!321385))

(declare-fun m!321387 () Bool)

(assert (=> b!208841 m!321387))

(declare-fun m!321389 () Bool)

(assert (=> b!208841 m!321389))

(declare-fun m!321391 () Bool)

(assert (=> b!208841 m!321391))

(declare-fun m!321393 () Bool)

(assert (=> b!208840 m!321393))

(declare-fun m!321395 () Bool)

(assert (=> b!208836 m!321395))

(declare-fun m!321397 () Bool)

(assert (=> b!208835 m!321397))

(assert (=> b!208838 m!321365))

(assert (=> b!208838 m!321367))

(declare-fun m!321399 () Bool)

(assert (=> b!208838 m!321399))

(declare-fun m!321401 () Bool)

(assert (=> b!208833 m!321401))

(assert (=> b!208833 m!321401))

(declare-fun m!321403 () Bool)

(assert (=> b!208833 m!321403))

(check-sat (not b!208835) (not b!208840) (not b!208849) (not b!208834) (not b!208848) (not b!208836) (not b!208843) (not b!208847) (not b!208844) (not b!208850) (not b!208838) (not b!208833) (not start!43862) (not b!208841) (not b!208837) (not b!208845) (not b!208846))
(check-sat)
(get-model)

(declare-fun d!70583 () Bool)

(declare-fun res!175358 () Bool)

(declare-fun e!142677 () Bool)

(assert (=> d!70583 (=> (not res!175358) (not e!142677))))

(assert (=> d!70583 (= res!175358 (= (size!4598 (buf!5109 thiss!1204)) (size!4598 (buf!5109 (_2!9613 lt!326609)))))))

(assert (=> d!70583 (= (isPrefixOf!0 thiss!1204 (_2!9613 lt!326609)) e!142677)))

(declare-fun b!208918 () Bool)

(declare-fun res!175356 () Bool)

(assert (=> b!208918 (=> (not res!175356) (not e!142677))))

(assert (=> b!208918 (= res!175356 (bvsle (bitIndex!0 (size!4598 (buf!5109 thiss!1204)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204)) (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326609))) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609)))))))

(declare-fun b!208919 () Bool)

(declare-fun e!142676 () Bool)

(assert (=> b!208919 (= e!142677 e!142676)))

(declare-fun res!175357 () Bool)

(assert (=> b!208919 (=> res!175357 e!142676)))

(assert (=> b!208919 (= res!175357 (= (size!4598 (buf!5109 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!208920 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10459 array!10459 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!208920 (= e!142676 (arrayBitRangesEq!0 (buf!5109 thiss!1204) (buf!5109 (_2!9613 lt!326609)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4598 (buf!5109 thiss!1204)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204))))))

(assert (= (and d!70583 res!175358) b!208918))

(assert (= (and b!208918 res!175356) b!208919))

(assert (= (and b!208919 (not res!175357)) b!208920))

(assert (=> b!208918 m!321367))

(assert (=> b!208918 m!321365))

(assert (=> b!208920 m!321367))

(assert (=> b!208920 m!321367))

(declare-fun m!321477 () Bool)

(assert (=> b!208920 m!321477))

(assert (=> b!208847 d!70583))

(declare-fun d!70585 () Bool)

(assert (=> d!70585 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590)) (ite (= (bvsub #b00000000000000000000000001000000 i!590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!590))))))))

(assert (=> b!208836 d!70585))

(declare-fun b!208931 () Bool)

(declare-fun e!142683 () Unit!14868)

(declare-fun lt!326734 () Unit!14868)

(assert (=> b!208931 (= e!142683 lt!326734)))

(declare-fun lt!326738 () (_ BitVec 64))

(assert (=> b!208931 (= lt!326738 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!326732 () (_ BitVec 64))

(assert (=> b!208931 (= lt!326732 (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326609))) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10459 array!10459 (_ BitVec 64) (_ BitVec 64)) Unit!14868)

(assert (=> b!208931 (= lt!326734 (arrayBitRangesEqSymmetric!0 (buf!5109 (_2!9613 lt!326609)) (buf!5109 (_2!9613 lt!326612)) lt!326738 lt!326732))))

(assert (=> b!208931 (arrayBitRangesEq!0 (buf!5109 (_2!9613 lt!326612)) (buf!5109 (_2!9613 lt!326609)) lt!326738 lt!326732)))

(declare-fun b!208932 () Bool)

(declare-fun res!175367 () Bool)

(declare-fun e!142682 () Bool)

(assert (=> b!208932 (=> (not res!175367) (not e!142682))))

(declare-fun lt!326745 () tuple2!17918)

(assert (=> b!208932 (= res!175367 (isPrefixOf!0 (_1!9614 lt!326745) (_2!9613 lt!326609)))))

(declare-fun lt!326730 () (_ BitVec 64))

(declare-fun b!208933 () Bool)

(declare-fun lt!326740 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8304 (_ BitVec 64)) BitStream!8304)

(assert (=> b!208933 (= e!142682 (= (_1!9614 lt!326745) (withMovedBitIndex!0 (_2!9614 lt!326745) (bvsub lt!326730 lt!326740))))))

(assert (=> b!208933 (or (= (bvand lt!326730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326740 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326730 lt!326740) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208933 (= lt!326740 (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326612))) (currentByte!9639 (_2!9613 lt!326612)) (currentBit!9634 (_2!9613 lt!326612))))))

(assert (=> b!208933 (= lt!326730 (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326609))) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609))))))

(declare-fun b!208934 () Bool)

(declare-fun Unit!14872 () Unit!14868)

(assert (=> b!208934 (= e!142683 Unit!14872)))

(declare-fun b!208935 () Bool)

(declare-fun res!175366 () Bool)

(assert (=> b!208935 (=> (not res!175366) (not e!142682))))

(assert (=> b!208935 (= res!175366 (isPrefixOf!0 (_2!9614 lt!326745) (_2!9613 lt!326612)))))

(declare-fun d!70587 () Bool)

(assert (=> d!70587 e!142682))

(declare-fun res!175365 () Bool)

(assert (=> d!70587 (=> (not res!175365) (not e!142682))))

(assert (=> d!70587 (= res!175365 (isPrefixOf!0 (_1!9614 lt!326745) (_2!9614 lt!326745)))))

(declare-fun lt!326735 () BitStream!8304)

(assert (=> d!70587 (= lt!326745 (tuple2!17919 lt!326735 (_2!9613 lt!326612)))))

(declare-fun lt!326733 () Unit!14868)

(declare-fun lt!326741 () Unit!14868)

(assert (=> d!70587 (= lt!326733 lt!326741)))

(assert (=> d!70587 (isPrefixOf!0 lt!326735 (_2!9613 lt!326612))))

(assert (=> d!70587 (= lt!326741 (lemmaIsPrefixTransitive!0 lt!326735 (_2!9613 lt!326612) (_2!9613 lt!326612)))))

(declare-fun lt!326746 () Unit!14868)

(declare-fun lt!326747 () Unit!14868)

(assert (=> d!70587 (= lt!326746 lt!326747)))

(assert (=> d!70587 (isPrefixOf!0 lt!326735 (_2!9613 lt!326612))))

(assert (=> d!70587 (= lt!326747 (lemmaIsPrefixTransitive!0 lt!326735 (_2!9613 lt!326609) (_2!9613 lt!326612)))))

(declare-fun lt!326742 () Unit!14868)

(assert (=> d!70587 (= lt!326742 e!142683)))

(declare-fun c!10271 () Bool)

(assert (=> d!70587 (= c!10271 (not (= (size!4598 (buf!5109 (_2!9613 lt!326609))) #b00000000000000000000000000000000)))))

(declare-fun lt!326736 () Unit!14868)

(declare-fun lt!326739 () Unit!14868)

(assert (=> d!70587 (= lt!326736 lt!326739)))

(assert (=> d!70587 (isPrefixOf!0 (_2!9613 lt!326612) (_2!9613 lt!326612))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8304) Unit!14868)

(assert (=> d!70587 (= lt!326739 (lemmaIsPrefixRefl!0 (_2!9613 lt!326612)))))

(declare-fun lt!326743 () Unit!14868)

(declare-fun lt!326737 () Unit!14868)

(assert (=> d!70587 (= lt!326743 lt!326737)))

(assert (=> d!70587 (= lt!326737 (lemmaIsPrefixRefl!0 (_2!9613 lt!326612)))))

(declare-fun lt!326729 () Unit!14868)

(declare-fun lt!326744 () Unit!14868)

(assert (=> d!70587 (= lt!326729 lt!326744)))

(assert (=> d!70587 (isPrefixOf!0 lt!326735 lt!326735)))

(assert (=> d!70587 (= lt!326744 (lemmaIsPrefixRefl!0 lt!326735))))

(declare-fun lt!326731 () Unit!14868)

(declare-fun lt!326728 () Unit!14868)

(assert (=> d!70587 (= lt!326731 lt!326728)))

(assert (=> d!70587 (isPrefixOf!0 (_2!9613 lt!326609) (_2!9613 lt!326609))))

(assert (=> d!70587 (= lt!326728 (lemmaIsPrefixRefl!0 (_2!9613 lt!326609)))))

(assert (=> d!70587 (= lt!326735 (BitStream!8305 (buf!5109 (_2!9613 lt!326612)) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609))))))

(assert (=> d!70587 (isPrefixOf!0 (_2!9613 lt!326609) (_2!9613 lt!326612))))

(assert (=> d!70587 (= (reader!0 (_2!9613 lt!326609) (_2!9613 lt!326612)) lt!326745)))

(assert (= (and d!70587 c!10271) b!208931))

(assert (= (and d!70587 (not c!10271)) b!208934))

(assert (= (and d!70587 res!175365) b!208932))

(assert (= (and b!208932 res!175367) b!208935))

(assert (= (and b!208935 res!175366) b!208933))

(declare-fun m!321479 () Bool)

(assert (=> d!70587 m!321479))

(declare-fun m!321481 () Bool)

(assert (=> d!70587 m!321481))

(declare-fun m!321483 () Bool)

(assert (=> d!70587 m!321483))

(declare-fun m!321485 () Bool)

(assert (=> d!70587 m!321485))

(declare-fun m!321487 () Bool)

(assert (=> d!70587 m!321487))

(declare-fun m!321489 () Bool)

(assert (=> d!70587 m!321489))

(declare-fun m!321491 () Bool)

(assert (=> d!70587 m!321491))

(assert (=> d!70587 m!321397))

(declare-fun m!321493 () Bool)

(assert (=> d!70587 m!321493))

(declare-fun m!321495 () Bool)

(assert (=> d!70587 m!321495))

(declare-fun m!321497 () Bool)

(assert (=> d!70587 m!321497))

(declare-fun m!321499 () Bool)

(assert (=> b!208932 m!321499))

(declare-fun m!321501 () Bool)

(assert (=> b!208933 m!321501))

(assert (=> b!208933 m!321385))

(assert (=> b!208933 m!321365))

(assert (=> b!208931 m!321365))

(declare-fun m!321503 () Bool)

(assert (=> b!208931 m!321503))

(declare-fun m!321505 () Bool)

(assert (=> b!208931 m!321505))

(declare-fun m!321507 () Bool)

(assert (=> b!208935 m!321507))

(assert (=> b!208846 d!70587))

(declare-fun d!70589 () Bool)

(assert (=> d!70589 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!208846 d!70589))

(declare-fun d!70591 () Bool)

(declare-fun e!142686 () Bool)

(assert (=> d!70591 e!142686))

(declare-fun res!175370 () Bool)

(assert (=> d!70591 (=> (not res!175370) (not e!142686))))

(declare-fun lt!326757 () tuple2!17914)

(declare-fun lt!326758 () tuple2!17914)

(assert (=> d!70591 (= res!175370 (= (bitIndex!0 (size!4598 (buf!5109 (_1!9612 lt!326757))) (currentByte!9639 (_1!9612 lt!326757)) (currentBit!9634 (_1!9612 lt!326757))) (bitIndex!0 (size!4598 (buf!5109 (_1!9612 lt!326758))) (currentByte!9639 (_1!9612 lt!326758)) (currentBit!9634 (_1!9612 lt!326758)))))))

(declare-fun lt!326756 () Unit!14868)

(declare-fun lt!326759 () BitStream!8304)

(declare-fun choose!50 (BitStream!8304 BitStream!8304 BitStream!8304 tuple2!17914 tuple2!17914 BitStream!8304 Bool tuple2!17914 tuple2!17914 BitStream!8304 Bool) Unit!14868)

(assert (=> d!70591 (= lt!326756 (choose!50 lt!326601 (_2!9613 lt!326612) lt!326759 lt!326757 (tuple2!17915 (_1!9612 lt!326757) (_2!9612 lt!326757)) (_1!9612 lt!326757) (_2!9612 lt!326757) lt!326758 (tuple2!17915 (_1!9612 lt!326758) (_2!9612 lt!326758)) (_1!9612 lt!326758) (_2!9612 lt!326758)))))

(assert (=> d!70591 (= lt!326758 (readBitPure!0 lt!326759))))

(assert (=> d!70591 (= lt!326757 (readBitPure!0 lt!326601))))

(assert (=> d!70591 (= lt!326759 (BitStream!8305 (buf!5109 (_2!9613 lt!326612)) (currentByte!9639 lt!326601) (currentBit!9634 lt!326601)))))

(assert (=> d!70591 (invariant!0 (currentBit!9634 lt!326601) (currentByte!9639 lt!326601) (size!4598 (buf!5109 (_2!9613 lt!326612))))))

(assert (=> d!70591 (= (readBitPrefixLemma!0 lt!326601 (_2!9613 lt!326612)) lt!326756)))

(declare-fun b!208938 () Bool)

(assert (=> b!208938 (= e!142686 (= (_2!9612 lt!326757) (_2!9612 lt!326758)))))

(assert (= (and d!70591 res!175370) b!208938))

(assert (=> d!70591 m!321337))

(declare-fun m!321509 () Bool)

(assert (=> d!70591 m!321509))

(declare-fun m!321511 () Bool)

(assert (=> d!70591 m!321511))

(declare-fun m!321513 () Bool)

(assert (=> d!70591 m!321513))

(declare-fun m!321515 () Bool)

(assert (=> d!70591 m!321515))

(declare-fun m!321517 () Bool)

(assert (=> d!70591 m!321517))

(assert (=> b!208846 d!70591))

(declare-fun d!70593 () Bool)

(declare-datatypes ((tuple2!17930 0))(
  ( (tuple2!17931 (_1!9620 (_ BitVec 64)) (_2!9620 BitStream!8304)) )
))
(declare-fun lt!326762 () tuple2!17930)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17930)

(assert (=> d!70593 (= lt!326762 (readNBitsLSBFirstsLoop!0 (_1!9614 lt!326610) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!326599 (ite (_2!9612 lt!326594) lt!326597 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!70593 (= (readNBitsLSBFirstsLoopPure!0 (_1!9614 lt!326610) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!326599 (ite (_2!9612 lt!326594) lt!326597 #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!17921 (_2!9620 lt!326762) (_1!9620 lt!326762)))))

(declare-fun bs!17349 () Bool)

(assert (= bs!17349 d!70593))

(declare-fun m!321519 () Bool)

(assert (=> bs!17349 m!321519))

(assert (=> b!208846 d!70593))

(declare-fun d!70595 () Bool)

(assert (=> d!70595 (validate_offset_bits!1 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!326612)))) ((_ sign_extend 32) (currentByte!9639 (_2!9613 lt!326609))) ((_ sign_extend 32) (currentBit!9634 (_2!9613 lt!326609))) lt!326593)))

(declare-fun lt!326765 () Unit!14868)

(declare-fun choose!9 (BitStream!8304 array!10459 (_ BitVec 64) BitStream!8304) Unit!14868)

(assert (=> d!70595 (= lt!326765 (choose!9 (_2!9613 lt!326609) (buf!5109 (_2!9613 lt!326612)) lt!326593 (BitStream!8305 (buf!5109 (_2!9613 lt!326612)) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609)))))))

(assert (=> d!70595 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9613 lt!326609) (buf!5109 (_2!9613 lt!326612)) lt!326593) lt!326765)))

(declare-fun bs!17350 () Bool)

(assert (= bs!17350 d!70595))

(assert (=> bs!17350 m!321341))

(declare-fun m!321521 () Bool)

(assert (=> bs!17350 m!321521))

(assert (=> b!208846 d!70595))

(declare-fun d!70597 () Bool)

(declare-datatypes ((tuple2!17932 0))(
  ( (tuple2!17933 (_1!9621 Bool) (_2!9621 BitStream!8304)) )
))
(declare-fun lt!326768 () tuple2!17932)

(declare-fun readBit!0 (BitStream!8304) tuple2!17932)

(assert (=> d!70597 (= lt!326768 (readBit!0 (_1!9614 lt!326595)))))

(assert (=> d!70597 (= (readBitPure!0 (_1!9614 lt!326595)) (tuple2!17915 (_2!9621 lt!326768) (_1!9621 lt!326768)))))

(declare-fun bs!17351 () Bool)

(assert (= bs!17351 d!70597))

(declare-fun m!321523 () Bool)

(assert (=> bs!17351 m!321523))

(assert (=> b!208846 d!70597))

(declare-fun d!70599 () Bool)

(declare-fun lt!326769 () tuple2!17930)

(assert (=> d!70599 (= lt!326769 (readNBitsLSBFirstsLoop!0 (_1!9614 lt!326595) nBits!348 i!590 lt!326599))))

(assert (=> d!70599 (= (readNBitsLSBFirstsLoopPure!0 (_1!9614 lt!326595) nBits!348 i!590 lt!326599) (tuple2!17921 (_2!9620 lt!326769) (_1!9620 lt!326769)))))

(declare-fun bs!17352 () Bool)

(assert (= bs!17352 d!70599))

(declare-fun m!321525 () Bool)

(assert (=> bs!17352 m!321525))

(assert (=> b!208846 d!70599))

(declare-fun b!208939 () Bool)

(declare-fun e!142688 () Unit!14868)

(declare-fun lt!326776 () Unit!14868)

(assert (=> b!208939 (= e!142688 lt!326776)))

(declare-fun lt!326780 () (_ BitVec 64))

(assert (=> b!208939 (= lt!326780 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!326774 () (_ BitVec 64))

(assert (=> b!208939 (= lt!326774 (bitIndex!0 (size!4598 (buf!5109 thiss!1204)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204)))))

(assert (=> b!208939 (= lt!326776 (arrayBitRangesEqSymmetric!0 (buf!5109 thiss!1204) (buf!5109 (_2!9613 lt!326612)) lt!326780 lt!326774))))

(assert (=> b!208939 (arrayBitRangesEq!0 (buf!5109 (_2!9613 lt!326612)) (buf!5109 thiss!1204) lt!326780 lt!326774)))

(declare-fun b!208940 () Bool)

(declare-fun res!175373 () Bool)

(declare-fun e!142687 () Bool)

(assert (=> b!208940 (=> (not res!175373) (not e!142687))))

(declare-fun lt!326787 () tuple2!17918)

(assert (=> b!208940 (= res!175373 (isPrefixOf!0 (_1!9614 lt!326787) thiss!1204))))

(declare-fun b!208941 () Bool)

(declare-fun lt!326772 () (_ BitVec 64))

(declare-fun lt!326782 () (_ BitVec 64))

(assert (=> b!208941 (= e!142687 (= (_1!9614 lt!326787) (withMovedBitIndex!0 (_2!9614 lt!326787) (bvsub lt!326772 lt!326782))))))

(assert (=> b!208941 (or (= (bvand lt!326772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326782 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326772 lt!326782) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208941 (= lt!326782 (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326612))) (currentByte!9639 (_2!9613 lt!326612)) (currentBit!9634 (_2!9613 lt!326612))))))

(assert (=> b!208941 (= lt!326772 (bitIndex!0 (size!4598 (buf!5109 thiss!1204)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204)))))

(declare-fun b!208942 () Bool)

(declare-fun Unit!14873 () Unit!14868)

(assert (=> b!208942 (= e!142688 Unit!14873)))

(declare-fun b!208943 () Bool)

(declare-fun res!175372 () Bool)

(assert (=> b!208943 (=> (not res!175372) (not e!142687))))

(assert (=> b!208943 (= res!175372 (isPrefixOf!0 (_2!9614 lt!326787) (_2!9613 lt!326612)))))

(declare-fun d!70601 () Bool)

(assert (=> d!70601 e!142687))

(declare-fun res!175371 () Bool)

(assert (=> d!70601 (=> (not res!175371) (not e!142687))))

(assert (=> d!70601 (= res!175371 (isPrefixOf!0 (_1!9614 lt!326787) (_2!9614 lt!326787)))))

(declare-fun lt!326777 () BitStream!8304)

(assert (=> d!70601 (= lt!326787 (tuple2!17919 lt!326777 (_2!9613 lt!326612)))))

(declare-fun lt!326775 () Unit!14868)

(declare-fun lt!326783 () Unit!14868)

(assert (=> d!70601 (= lt!326775 lt!326783)))

(assert (=> d!70601 (isPrefixOf!0 lt!326777 (_2!9613 lt!326612))))

(assert (=> d!70601 (= lt!326783 (lemmaIsPrefixTransitive!0 lt!326777 (_2!9613 lt!326612) (_2!9613 lt!326612)))))

(declare-fun lt!326788 () Unit!14868)

(declare-fun lt!326789 () Unit!14868)

(assert (=> d!70601 (= lt!326788 lt!326789)))

(assert (=> d!70601 (isPrefixOf!0 lt!326777 (_2!9613 lt!326612))))

(assert (=> d!70601 (= lt!326789 (lemmaIsPrefixTransitive!0 lt!326777 thiss!1204 (_2!9613 lt!326612)))))

(declare-fun lt!326784 () Unit!14868)

(assert (=> d!70601 (= lt!326784 e!142688)))

(declare-fun c!10272 () Bool)

(assert (=> d!70601 (= c!10272 (not (= (size!4598 (buf!5109 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!326778 () Unit!14868)

(declare-fun lt!326781 () Unit!14868)

(assert (=> d!70601 (= lt!326778 lt!326781)))

(assert (=> d!70601 (isPrefixOf!0 (_2!9613 lt!326612) (_2!9613 lt!326612))))

(assert (=> d!70601 (= lt!326781 (lemmaIsPrefixRefl!0 (_2!9613 lt!326612)))))

(declare-fun lt!326785 () Unit!14868)

(declare-fun lt!326779 () Unit!14868)

(assert (=> d!70601 (= lt!326785 lt!326779)))

(assert (=> d!70601 (= lt!326779 (lemmaIsPrefixRefl!0 (_2!9613 lt!326612)))))

(declare-fun lt!326771 () Unit!14868)

(declare-fun lt!326786 () Unit!14868)

(assert (=> d!70601 (= lt!326771 lt!326786)))

(assert (=> d!70601 (isPrefixOf!0 lt!326777 lt!326777)))

(assert (=> d!70601 (= lt!326786 (lemmaIsPrefixRefl!0 lt!326777))))

(declare-fun lt!326773 () Unit!14868)

(declare-fun lt!326770 () Unit!14868)

(assert (=> d!70601 (= lt!326773 lt!326770)))

(assert (=> d!70601 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!70601 (= lt!326770 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!70601 (= lt!326777 (BitStream!8305 (buf!5109 (_2!9613 lt!326612)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204)))))

(assert (=> d!70601 (isPrefixOf!0 thiss!1204 (_2!9613 lt!326612))))

(assert (=> d!70601 (= (reader!0 thiss!1204 (_2!9613 lt!326612)) lt!326787)))

(assert (= (and d!70601 c!10272) b!208939))

(assert (= (and d!70601 (not c!10272)) b!208942))

(assert (= (and d!70601 res!175371) b!208940))

(assert (= (and b!208940 res!175373) b!208943))

(assert (= (and b!208943 res!175372) b!208941))

(assert (=> d!70601 m!321479))

(declare-fun m!321527 () Bool)

(assert (=> d!70601 m!321527))

(declare-fun m!321529 () Bool)

(assert (=> d!70601 m!321529))

(declare-fun m!321531 () Bool)

(assert (=> d!70601 m!321531))

(declare-fun m!321533 () Bool)

(assert (=> d!70601 m!321533))

(declare-fun m!321535 () Bool)

(assert (=> d!70601 m!321535))

(assert (=> d!70601 m!321491))

(assert (=> d!70601 m!321387))

(declare-fun m!321537 () Bool)

(assert (=> d!70601 m!321537))

(declare-fun m!321539 () Bool)

(assert (=> d!70601 m!321539))

(declare-fun m!321541 () Bool)

(assert (=> d!70601 m!321541))

(declare-fun m!321543 () Bool)

(assert (=> b!208940 m!321543))

(declare-fun m!321545 () Bool)

(assert (=> b!208941 m!321545))

(assert (=> b!208941 m!321385))

(assert (=> b!208941 m!321367))

(assert (=> b!208939 m!321367))

(declare-fun m!321547 () Bool)

(assert (=> b!208939 m!321547))

(declare-fun m!321549 () Bool)

(assert (=> b!208939 m!321549))

(declare-fun m!321551 () Bool)

(assert (=> b!208943 m!321551))

(assert (=> b!208846 d!70601))

(declare-fun d!70603 () Bool)

(declare-fun e!142691 () Bool)

(assert (=> d!70603 e!142691))

(declare-fun res!175378 () Bool)

(assert (=> d!70603 (=> (not res!175378) (not e!142691))))

(declare-fun lt!326807 () (_ BitVec 64))

(declare-fun lt!326806 () (_ BitVec 64))

(declare-fun lt!326802 () (_ BitVec 64))

(assert (=> d!70603 (= res!175378 (= lt!326806 (bvsub lt!326802 lt!326807)))))

(assert (=> d!70603 (or (= (bvand lt!326802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326807 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326802 lt!326807) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!70603 (= lt!326807 (remainingBits!0 ((_ sign_extend 32) (size!4598 (buf!5109 (_1!9612 lt!326611)))) ((_ sign_extend 32) (currentByte!9639 (_1!9612 lt!326611))) ((_ sign_extend 32) (currentBit!9634 (_1!9612 lt!326611)))))))

(declare-fun lt!326805 () (_ BitVec 64))

(declare-fun lt!326804 () (_ BitVec 64))

(assert (=> d!70603 (= lt!326802 (bvmul lt!326805 lt!326804))))

(assert (=> d!70603 (or (= lt!326805 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326804 (bvsdiv (bvmul lt!326805 lt!326804) lt!326805)))))

(assert (=> d!70603 (= lt!326804 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70603 (= lt!326805 ((_ sign_extend 32) (size!4598 (buf!5109 (_1!9612 lt!326611)))))))

(assert (=> d!70603 (= lt!326806 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9639 (_1!9612 lt!326611))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9634 (_1!9612 lt!326611)))))))

(assert (=> d!70603 (invariant!0 (currentBit!9634 (_1!9612 lt!326611)) (currentByte!9639 (_1!9612 lt!326611)) (size!4598 (buf!5109 (_1!9612 lt!326611))))))

(assert (=> d!70603 (= (bitIndex!0 (size!4598 (buf!5109 (_1!9612 lt!326611))) (currentByte!9639 (_1!9612 lt!326611)) (currentBit!9634 (_1!9612 lt!326611))) lt!326806)))

(declare-fun b!208948 () Bool)

(declare-fun res!175379 () Bool)

(assert (=> b!208948 (=> (not res!175379) (not e!142691))))

(assert (=> b!208948 (= res!175379 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326806))))

(declare-fun b!208949 () Bool)

(declare-fun lt!326803 () (_ BitVec 64))

(assert (=> b!208949 (= e!142691 (bvsle lt!326806 (bvmul lt!326803 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208949 (or (= lt!326803 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326803 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326803)))))

(assert (=> b!208949 (= lt!326803 ((_ sign_extend 32) (size!4598 (buf!5109 (_1!9612 lt!326611)))))))

(assert (= (and d!70603 res!175378) b!208948))

(assert (= (and b!208948 res!175379) b!208949))

(declare-fun m!321553 () Bool)

(assert (=> d!70603 m!321553))

(declare-fun m!321555 () Bool)

(assert (=> d!70603 m!321555))

(assert (=> b!208846 d!70603))

(declare-fun d!70605 () Bool)

(assert (=> d!70605 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!326612)))) ((_ sign_extend 32) (currentByte!9639 (_2!9613 lt!326609))) ((_ sign_extend 32) (currentBit!9634 (_2!9613 lt!326609))) lt!326593) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!326612)))) ((_ sign_extend 32) (currentByte!9639 (_2!9613 lt!326609))) ((_ sign_extend 32) (currentBit!9634 (_2!9613 lt!326609)))) lt!326593))))

(declare-fun bs!17353 () Bool)

(assert (= bs!17353 d!70605))

(declare-fun m!321557 () Bool)

(assert (=> bs!17353 m!321557))

(assert (=> b!208846 d!70605))

(declare-fun d!70607 () Bool)

(declare-fun e!142692 () Bool)

(assert (=> d!70607 e!142692))

(declare-fun res!175380 () Bool)

(assert (=> d!70607 (=> (not res!175380) (not e!142692))))

(declare-fun lt!326808 () (_ BitVec 64))

(declare-fun lt!326812 () (_ BitVec 64))

(declare-fun lt!326813 () (_ BitVec 64))

(assert (=> d!70607 (= res!175380 (= lt!326812 (bvsub lt!326808 lt!326813)))))

(assert (=> d!70607 (or (= (bvand lt!326808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326813 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326808 lt!326813) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70607 (= lt!326813 (remainingBits!0 ((_ sign_extend 32) (size!4598 (buf!5109 (_1!9612 lt!326615)))) ((_ sign_extend 32) (currentByte!9639 (_1!9612 lt!326615))) ((_ sign_extend 32) (currentBit!9634 (_1!9612 lt!326615)))))))

(declare-fun lt!326811 () (_ BitVec 64))

(declare-fun lt!326810 () (_ BitVec 64))

(assert (=> d!70607 (= lt!326808 (bvmul lt!326811 lt!326810))))

(assert (=> d!70607 (or (= lt!326811 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326810 (bvsdiv (bvmul lt!326811 lt!326810) lt!326811)))))

(assert (=> d!70607 (= lt!326810 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70607 (= lt!326811 ((_ sign_extend 32) (size!4598 (buf!5109 (_1!9612 lt!326615)))))))

(assert (=> d!70607 (= lt!326812 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9639 (_1!9612 lt!326615))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9634 (_1!9612 lt!326615)))))))

(assert (=> d!70607 (invariant!0 (currentBit!9634 (_1!9612 lt!326615)) (currentByte!9639 (_1!9612 lt!326615)) (size!4598 (buf!5109 (_1!9612 lt!326615))))))

(assert (=> d!70607 (= (bitIndex!0 (size!4598 (buf!5109 (_1!9612 lt!326615))) (currentByte!9639 (_1!9612 lt!326615)) (currentBit!9634 (_1!9612 lt!326615))) lt!326812)))

(declare-fun b!208950 () Bool)

(declare-fun res!175381 () Bool)

(assert (=> b!208950 (=> (not res!175381) (not e!142692))))

(assert (=> b!208950 (= res!175381 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326812))))

(declare-fun b!208951 () Bool)

(declare-fun lt!326809 () (_ BitVec 64))

(assert (=> b!208951 (= e!142692 (bvsle lt!326812 (bvmul lt!326809 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208951 (or (= lt!326809 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326809 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326809)))))

(assert (=> b!208951 (= lt!326809 ((_ sign_extend 32) (size!4598 (buf!5109 (_1!9612 lt!326615)))))))

(assert (= (and d!70607 res!175380) b!208950))

(assert (= (and b!208950 res!175381) b!208951))

(declare-fun m!321559 () Bool)

(assert (=> d!70607 m!321559))

(declare-fun m!321561 () Bool)

(assert (=> d!70607 m!321561))

(assert (=> b!208846 d!70607))

(declare-fun d!70609 () Bool)

(declare-fun lt!326814 () tuple2!17932)

(assert (=> d!70609 (= lt!326814 (readBit!0 (BitStream!8305 (buf!5109 (_2!9613 lt!326612)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204))))))

(assert (=> d!70609 (= (readBitPure!0 (BitStream!8305 (buf!5109 (_2!9613 lt!326612)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204))) (tuple2!17915 (_2!9621 lt!326814) (_1!9621 lt!326814)))))

(declare-fun bs!17354 () Bool)

(assert (= bs!17354 d!70609))

(declare-fun m!321563 () Bool)

(assert (=> bs!17354 m!321563))

(assert (=> b!208846 d!70609))

(declare-fun d!70611 () Bool)

(assert (=> d!70611 (validate_offset_bits!1 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!326612)))) ((_ sign_extend 32) (currentByte!9639 thiss!1204)) ((_ sign_extend 32) (currentBit!9634 thiss!1204)) lt!326604)))

(declare-fun lt!326815 () Unit!14868)

(assert (=> d!70611 (= lt!326815 (choose!9 thiss!1204 (buf!5109 (_2!9613 lt!326612)) lt!326604 (BitStream!8305 (buf!5109 (_2!9613 lt!326612)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204))))))

(assert (=> d!70611 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5109 (_2!9613 lt!326612)) lt!326604) lt!326815)))

(declare-fun bs!17355 () Bool)

(assert (= bs!17355 d!70611))

(assert (=> bs!17355 m!321347))

(declare-fun m!321565 () Bool)

(assert (=> bs!17355 m!321565))

(assert (=> b!208846 d!70611))

(declare-fun d!70613 () Bool)

(assert (=> d!70613 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!326612)))) ((_ sign_extend 32) (currentByte!9639 thiss!1204)) ((_ sign_extend 32) (currentBit!9634 thiss!1204)) lt!326604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!326612)))) ((_ sign_extend 32) (currentByte!9639 thiss!1204)) ((_ sign_extend 32) (currentBit!9634 thiss!1204))) lt!326604))))

(declare-fun bs!17356 () Bool)

(assert (= bs!17356 d!70613))

(declare-fun m!321567 () Bool)

(assert (=> bs!17356 m!321567))

(assert (=> b!208846 d!70613))

(declare-fun d!70615 () Bool)

(declare-fun lt!326816 () tuple2!17932)

(assert (=> d!70615 (= lt!326816 (readBit!0 lt!326601))))

(assert (=> d!70615 (= (readBitPure!0 lt!326601) (tuple2!17915 (_2!9621 lt!326816) (_1!9621 lt!326816)))))

(declare-fun bs!17357 () Bool)

(assert (= bs!17357 d!70615))

(declare-fun m!321569 () Bool)

(assert (=> bs!17357 m!321569))

(assert (=> b!208846 d!70615))

(declare-fun d!70617 () Bool)

(assert (=> d!70617 (= (invariant!0 (currentBit!9634 thiss!1204) (currentByte!9639 thiss!1204) (size!4598 (buf!5109 (_2!9613 lt!326609)))) (and (bvsge (currentBit!9634 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9634 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9639 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9639 thiss!1204) (size!4598 (buf!5109 (_2!9613 lt!326609)))) (and (= (currentBit!9634 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9639 thiss!1204) (size!4598 (buf!5109 (_2!9613 lt!326609))))))))))

(assert (=> b!208846 d!70617))

(declare-fun d!70619 () Bool)

(declare-fun res!175384 () Bool)

(declare-fun e!142694 () Bool)

(assert (=> d!70619 (=> (not res!175384) (not e!142694))))

(assert (=> d!70619 (= res!175384 (= (size!4598 (buf!5109 (_2!9613 lt!326609))) (size!4598 (buf!5109 (_2!9613 lt!326612)))))))

(assert (=> d!70619 (= (isPrefixOf!0 (_2!9613 lt!326609) (_2!9613 lt!326612)) e!142694)))

(declare-fun b!208952 () Bool)

(declare-fun res!175382 () Bool)

(assert (=> b!208952 (=> (not res!175382) (not e!142694))))

(assert (=> b!208952 (= res!175382 (bvsle (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326609))) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609))) (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326612))) (currentByte!9639 (_2!9613 lt!326612)) (currentBit!9634 (_2!9613 lt!326612)))))))

(declare-fun b!208953 () Bool)

(declare-fun e!142693 () Bool)

(assert (=> b!208953 (= e!142694 e!142693)))

(declare-fun res!175383 () Bool)

(assert (=> b!208953 (=> res!175383 e!142693)))

(assert (=> b!208953 (= res!175383 (= (size!4598 (buf!5109 (_2!9613 lt!326609))) #b00000000000000000000000000000000))))

(declare-fun b!208954 () Bool)

(assert (=> b!208954 (= e!142693 (arrayBitRangesEq!0 (buf!5109 (_2!9613 lt!326609)) (buf!5109 (_2!9613 lt!326612)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326609))) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609)))))))

(assert (= (and d!70619 res!175384) b!208952))

(assert (= (and b!208952 res!175382) b!208953))

(assert (= (and b!208953 (not res!175383)) b!208954))

(assert (=> b!208952 m!321365))

(assert (=> b!208952 m!321385))

(assert (=> b!208954 m!321365))

(assert (=> b!208954 m!321365))

(declare-fun m!321571 () Bool)

(assert (=> b!208954 m!321571))

(assert (=> b!208835 d!70619))

(declare-fun d!70621 () Bool)

(assert (=> d!70621 (= (array_inv!4339 (buf!5109 thiss!1204)) (bvsge (size!4598 (buf!5109 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!208845 d!70621))

(declare-fun d!70623 () Bool)

(declare-fun e!142695 () Bool)

(assert (=> d!70623 e!142695))

(declare-fun res!175385 () Bool)

(assert (=> d!70623 (=> (not res!175385) (not e!142695))))

(declare-fun lt!326822 () (_ BitVec 64))

(declare-fun lt!326821 () (_ BitVec 64))

(declare-fun lt!326817 () (_ BitVec 64))

(assert (=> d!70623 (= res!175385 (= lt!326821 (bvsub lt!326817 lt!326822)))))

(assert (=> d!70623 (or (= (bvand lt!326817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326822 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326817 lt!326822) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70623 (= lt!326822 (remainingBits!0 ((_ sign_extend 32) (size!4598 (buf!5109 (_1!9612 lt!326592)))) ((_ sign_extend 32) (currentByte!9639 (_1!9612 lt!326592))) ((_ sign_extend 32) (currentBit!9634 (_1!9612 lt!326592)))))))

(declare-fun lt!326820 () (_ BitVec 64))

(declare-fun lt!326819 () (_ BitVec 64))

(assert (=> d!70623 (= lt!326817 (bvmul lt!326820 lt!326819))))

(assert (=> d!70623 (or (= lt!326820 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326819 (bvsdiv (bvmul lt!326820 lt!326819) lt!326820)))))

(assert (=> d!70623 (= lt!326819 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70623 (= lt!326820 ((_ sign_extend 32) (size!4598 (buf!5109 (_1!9612 lt!326592)))))))

(assert (=> d!70623 (= lt!326821 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9639 (_1!9612 lt!326592))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9634 (_1!9612 lt!326592)))))))

(assert (=> d!70623 (invariant!0 (currentBit!9634 (_1!9612 lt!326592)) (currentByte!9639 (_1!9612 lt!326592)) (size!4598 (buf!5109 (_1!9612 lt!326592))))))

(assert (=> d!70623 (= (bitIndex!0 (size!4598 (buf!5109 (_1!9612 lt!326592))) (currentByte!9639 (_1!9612 lt!326592)) (currentBit!9634 (_1!9612 lt!326592))) lt!326821)))

(declare-fun b!208955 () Bool)

(declare-fun res!175386 () Bool)

(assert (=> b!208955 (=> (not res!175386) (not e!142695))))

(assert (=> b!208955 (= res!175386 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326821))))

(declare-fun b!208956 () Bool)

(declare-fun lt!326818 () (_ BitVec 64))

(assert (=> b!208956 (= e!142695 (bvsle lt!326821 (bvmul lt!326818 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208956 (or (= lt!326818 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326818 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326818)))))

(assert (=> b!208956 (= lt!326818 ((_ sign_extend 32) (size!4598 (buf!5109 (_1!9612 lt!326592)))))))

(assert (= (and d!70623 res!175385) b!208955))

(assert (= (and b!208955 res!175386) b!208956))

(declare-fun m!321573 () Bool)

(assert (=> d!70623 m!321573))

(declare-fun m!321575 () Bool)

(assert (=> d!70623 m!321575))

(assert (=> b!208834 d!70623))

(declare-fun d!70625 () Bool)

(assert (=> d!70625 (= (invariant!0 (currentBit!9634 thiss!1204) (currentByte!9639 thiss!1204) (size!4598 (buf!5109 thiss!1204))) (and (bvsge (currentBit!9634 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9634 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9639 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9639 thiss!1204) (size!4598 (buf!5109 thiss!1204))) (and (= (currentBit!9634 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9639 thiss!1204) (size!4598 (buf!5109 thiss!1204)))))))))

(assert (=> b!208844 d!70625))

(declare-fun d!70627 () Bool)

(declare-fun lt!326823 () tuple2!17932)

(assert (=> d!70627 (= lt!326823 (readBit!0 (readerFrom!0 (_2!9613 lt!326609) (currentBit!9634 thiss!1204) (currentByte!9639 thiss!1204))))))

(assert (=> d!70627 (= (readBitPure!0 (readerFrom!0 (_2!9613 lt!326609) (currentBit!9634 thiss!1204) (currentByte!9639 thiss!1204))) (tuple2!17915 (_2!9621 lt!326823) (_1!9621 lt!326823)))))

(declare-fun bs!17358 () Bool)

(assert (= bs!17358 d!70627))

(assert (=> bs!17358 m!321401))

(declare-fun m!321577 () Bool)

(assert (=> bs!17358 m!321577))

(assert (=> b!208833 d!70627))

(declare-fun d!70629 () Bool)

(declare-fun e!142698 () Bool)

(assert (=> d!70629 e!142698))

(declare-fun res!175390 () Bool)

(assert (=> d!70629 (=> (not res!175390) (not e!142698))))

(assert (=> d!70629 (= res!175390 (invariant!0 (currentBit!9634 (_2!9613 lt!326609)) (currentByte!9639 (_2!9613 lt!326609)) (size!4598 (buf!5109 (_2!9613 lt!326609)))))))

(assert (=> d!70629 (= (readerFrom!0 (_2!9613 lt!326609) (currentBit!9634 thiss!1204) (currentByte!9639 thiss!1204)) (BitStream!8305 (buf!5109 (_2!9613 lt!326609)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204)))))

(declare-fun b!208959 () Bool)

(assert (=> b!208959 (= e!142698 (invariant!0 (currentBit!9634 thiss!1204) (currentByte!9639 thiss!1204) (size!4598 (buf!5109 (_2!9613 lt!326609)))))))

(assert (= (and d!70629 res!175390) b!208959))

(declare-fun m!321579 () Bool)

(assert (=> d!70629 m!321579))

(assert (=> b!208959 m!321351))

(assert (=> b!208833 d!70629))

(declare-fun d!70631 () Bool)

(assert (=> d!70631 (= (invariant!0 (currentBit!9634 (_2!9613 lt!326612)) (currentByte!9639 (_2!9613 lt!326612)) (size!4598 (buf!5109 (_2!9613 lt!326612)))) (and (bvsge (currentBit!9634 (_2!9613 lt!326612)) #b00000000000000000000000000000000) (bvslt (currentBit!9634 (_2!9613 lt!326612)) #b00000000000000000000000000001000) (bvsge (currentByte!9639 (_2!9613 lt!326612)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9639 (_2!9613 lt!326612)) (size!4598 (buf!5109 (_2!9613 lt!326612)))) (and (= (currentBit!9634 (_2!9613 lt!326612)) #b00000000000000000000000000000000) (= (currentByte!9639 (_2!9613 lt!326612)) (size!4598 (buf!5109 (_2!9613 lt!326612))))))))))

(assert (=> b!208843 d!70631))

(declare-fun d!70633 () Bool)

(declare-fun e!142699 () Bool)

(assert (=> d!70633 e!142699))

(declare-fun res!175391 () Bool)

(assert (=> d!70633 (=> (not res!175391) (not e!142699))))

(declare-fun lt!326824 () (_ BitVec 64))

(declare-fun lt!326828 () (_ BitVec 64))

(declare-fun lt!326829 () (_ BitVec 64))

(assert (=> d!70633 (= res!175391 (= lt!326828 (bvsub lt!326824 lt!326829)))))

(assert (=> d!70633 (or (= (bvand lt!326824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326829 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326824 lt!326829) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70633 (= lt!326829 (remainingBits!0 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!326612)))) ((_ sign_extend 32) (currentByte!9639 (_2!9613 lt!326612))) ((_ sign_extend 32) (currentBit!9634 (_2!9613 lt!326612)))))))

(declare-fun lt!326827 () (_ BitVec 64))

(declare-fun lt!326826 () (_ BitVec 64))

(assert (=> d!70633 (= lt!326824 (bvmul lt!326827 lt!326826))))

(assert (=> d!70633 (or (= lt!326827 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326826 (bvsdiv (bvmul lt!326827 lt!326826) lt!326827)))))

(assert (=> d!70633 (= lt!326826 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70633 (= lt!326827 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!326612)))))))

(assert (=> d!70633 (= lt!326828 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9639 (_2!9613 lt!326612))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9634 (_2!9613 lt!326612)))))))

(assert (=> d!70633 (invariant!0 (currentBit!9634 (_2!9613 lt!326612)) (currentByte!9639 (_2!9613 lt!326612)) (size!4598 (buf!5109 (_2!9613 lt!326612))))))

(assert (=> d!70633 (= (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326612))) (currentByte!9639 (_2!9613 lt!326612)) (currentBit!9634 (_2!9613 lt!326612))) lt!326828)))

(declare-fun b!208960 () Bool)

(declare-fun res!175392 () Bool)

(assert (=> b!208960 (=> (not res!175392) (not e!142699))))

(assert (=> b!208960 (= res!175392 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326828))))

(declare-fun b!208961 () Bool)

(declare-fun lt!326825 () (_ BitVec 64))

(assert (=> b!208961 (= e!142699 (bvsle lt!326828 (bvmul lt!326825 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208961 (or (= lt!326825 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326825 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326825)))))

(assert (=> b!208961 (= lt!326825 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!326612)))))))

(assert (= (and d!70633 res!175391) b!208960))

(assert (= (and b!208960 res!175392) b!208961))

(declare-fun m!321581 () Bool)

(assert (=> d!70633 m!321581))

(assert (=> d!70633 m!321371))

(assert (=> b!208841 d!70633))

(declare-fun d!70635 () Bool)

(declare-fun res!175395 () Bool)

(declare-fun e!142701 () Bool)

(assert (=> d!70635 (=> (not res!175395) (not e!142701))))

(assert (=> d!70635 (= res!175395 (= (size!4598 (buf!5109 thiss!1204)) (size!4598 (buf!5109 (_2!9613 lt!326612)))))))

(assert (=> d!70635 (= (isPrefixOf!0 thiss!1204 (_2!9613 lt!326612)) e!142701)))

(declare-fun b!208962 () Bool)

(declare-fun res!175393 () Bool)

(assert (=> b!208962 (=> (not res!175393) (not e!142701))))

(assert (=> b!208962 (= res!175393 (bvsle (bitIndex!0 (size!4598 (buf!5109 thiss!1204)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204)) (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326612))) (currentByte!9639 (_2!9613 lt!326612)) (currentBit!9634 (_2!9613 lt!326612)))))))

(declare-fun b!208963 () Bool)

(declare-fun e!142700 () Bool)

(assert (=> b!208963 (= e!142701 e!142700)))

(declare-fun res!175394 () Bool)

(assert (=> b!208963 (=> res!175394 e!142700)))

(assert (=> b!208963 (= res!175394 (= (size!4598 (buf!5109 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!208964 () Bool)

(assert (=> b!208964 (= e!142700 (arrayBitRangesEq!0 (buf!5109 thiss!1204) (buf!5109 (_2!9613 lt!326612)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4598 (buf!5109 thiss!1204)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204))))))

(assert (= (and d!70635 res!175395) b!208962))

(assert (= (and b!208962 res!175393) b!208963))

(assert (= (and b!208963 (not res!175394)) b!208964))

(assert (=> b!208962 m!321367))

(assert (=> b!208962 m!321385))

(assert (=> b!208964 m!321367))

(assert (=> b!208964 m!321367))

(declare-fun m!321583 () Bool)

(assert (=> b!208964 m!321583))

(assert (=> b!208841 d!70635))

(declare-fun d!70637 () Bool)

(assert (=> d!70637 (isPrefixOf!0 thiss!1204 (_2!9613 lt!326612))))

(declare-fun lt!326832 () Unit!14868)

(declare-fun choose!30 (BitStream!8304 BitStream!8304 BitStream!8304) Unit!14868)

(assert (=> d!70637 (= lt!326832 (choose!30 thiss!1204 (_2!9613 lt!326609) (_2!9613 lt!326612)))))

(assert (=> d!70637 (isPrefixOf!0 thiss!1204 (_2!9613 lt!326609))))

(assert (=> d!70637 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9613 lt!326609) (_2!9613 lt!326612)) lt!326832)))

(declare-fun bs!17359 () Bool)

(assert (= bs!17359 d!70637))

(assert (=> bs!17359 m!321387))

(declare-fun m!321585 () Bool)

(assert (=> bs!17359 m!321585))

(assert (=> bs!17359 m!321373))

(assert (=> b!208841 d!70637))

(declare-fun b!209108 () Bool)

(declare-fun e!142779 () Bool)

(declare-fun lt!327296 () tuple2!17920)

(declare-fun lt!327297 () tuple2!17918)

(assert (=> b!209108 (= e!142779 (= (_1!9615 lt!327296) (_2!9614 lt!327297)))))

(declare-fun b!209109 () Bool)

(declare-fun lt!327311 () tuple2!17914)

(declare-fun lt!327277 () tuple2!17916)

(assert (=> b!209109 (= lt!327311 (readBitPure!0 (readerFrom!0 (_2!9613 lt!327277) (currentBit!9634 (_2!9613 lt!326609)) (currentByte!9639 (_2!9613 lt!326609)))))))

(declare-fun res!175519 () Bool)

(declare-fun lt!327304 () Bool)

(assert (=> b!209109 (= res!175519 (and (= (_2!9612 lt!327311) lt!327304) (= (_1!9612 lt!327311) (_2!9613 lt!327277))))))

(declare-fun e!142785 () Bool)

(assert (=> b!209109 (=> (not res!175519) (not e!142785))))

(declare-fun e!142781 () Bool)

(assert (=> b!209109 (= e!142781 e!142785)))

(declare-fun b!209110 () Bool)

(declare-fun res!175522 () Bool)

(declare-fun e!142778 () Bool)

(assert (=> b!209110 (=> (not res!175522) (not e!142778))))

(declare-fun lt!327283 () (_ BitVec 64))

(declare-fun lt!327274 () (_ BitVec 64))

(declare-fun lt!327270 () tuple2!17916)

(assert (=> b!209110 (= res!175522 (= (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!327270))) (currentByte!9639 (_2!9613 lt!327270)) (currentBit!9634 (_2!9613 lt!327270))) (bvsub lt!327283 lt!327274)))))

(assert (=> b!209110 (or (= (bvand lt!327283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327274 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!327283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!327283 lt!327274) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209110 (= lt!327274 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!327292 () (_ BitVec 64))

(declare-fun lt!327268 () (_ BitVec 64))

(assert (=> b!209110 (= lt!327283 (bvadd lt!327292 lt!327268))))

(assert (=> b!209110 (or (not (= (bvand lt!327292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327268 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!327292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!327292 lt!327268) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209110 (= lt!327268 ((_ sign_extend 32) nBits!348))))

(assert (=> b!209110 (= lt!327292 (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326609))) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609))))))

(declare-fun b!209111 () Bool)

(declare-fun res!175514 () Bool)

(assert (=> b!209111 (=> (not res!175514) (not e!142778))))

(assert (=> b!209111 (= res!175514 (isPrefixOf!0 (_2!9613 lt!326609) (_2!9613 lt!327270)))))

(declare-fun b!209113 () Bool)

(declare-fun e!142784 () (_ BitVec 64))

(assert (=> b!209113 (= e!142784 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!209114 () Bool)

(declare-fun e!142782 () tuple2!17916)

(declare-fun lt!327281 () tuple2!17916)

(assert (=> b!209114 (= e!142782 (tuple2!17917 (_1!9613 lt!327281) (_2!9613 lt!327281)))))

(assert (=> b!209114 (= lt!327304 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209114 (= lt!327277 (appendBit!0 (_2!9613 lt!326609) lt!327304))))

(declare-fun res!175521 () Bool)

(assert (=> b!209114 (= res!175521 (= (size!4598 (buf!5109 (_2!9613 lt!326609))) (size!4598 (buf!5109 (_2!9613 lt!327277)))))))

(assert (=> b!209114 (=> (not res!175521) (not e!142781))))

(assert (=> b!209114 e!142781))

(declare-fun lt!327301 () tuple2!17916)

(assert (=> b!209114 (= lt!327301 lt!327277)))

(assert (=> b!209114 (= lt!327281 (appendBitsLSBFirstLoopTR!0 (_2!9613 lt!327301) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!327300 () Unit!14868)

(assert (=> b!209114 (= lt!327300 (lemmaIsPrefixTransitive!0 (_2!9613 lt!326609) (_2!9613 lt!327301) (_2!9613 lt!327281)))))

(assert (=> b!209114 (isPrefixOf!0 (_2!9613 lt!326609) (_2!9613 lt!327281))))

(declare-fun lt!327282 () Unit!14868)

(assert (=> b!209114 (= lt!327282 lt!327300)))

(assert (=> b!209114 (invariant!0 (currentBit!9634 (_2!9613 lt!326609)) (currentByte!9639 (_2!9613 lt!326609)) (size!4598 (buf!5109 (_2!9613 lt!327301))))))

(declare-fun lt!327280 () BitStream!8304)

(assert (=> b!209114 (= lt!327280 (BitStream!8305 (buf!5109 (_2!9613 lt!327301)) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609))))))

(assert (=> b!209114 (invariant!0 (currentBit!9634 lt!327280) (currentByte!9639 lt!327280) (size!4598 (buf!5109 (_2!9613 lt!327281))))))

(declare-fun lt!327266 () BitStream!8304)

(assert (=> b!209114 (= lt!327266 (BitStream!8305 (buf!5109 (_2!9613 lt!327281)) (currentByte!9639 lt!327280) (currentBit!9634 lt!327280)))))

(declare-fun lt!327259 () tuple2!17914)

(assert (=> b!209114 (= lt!327259 (readBitPure!0 lt!327280))))

(declare-fun lt!327265 () tuple2!17914)

(assert (=> b!209114 (= lt!327265 (readBitPure!0 lt!327266))))

(declare-fun lt!327275 () Unit!14868)

(assert (=> b!209114 (= lt!327275 (readBitPrefixLemma!0 lt!327280 (_2!9613 lt!327281)))))

(declare-fun res!175516 () Bool)

(assert (=> b!209114 (= res!175516 (= (bitIndex!0 (size!4598 (buf!5109 (_1!9612 lt!327259))) (currentByte!9639 (_1!9612 lt!327259)) (currentBit!9634 (_1!9612 lt!327259))) (bitIndex!0 (size!4598 (buf!5109 (_1!9612 lt!327265))) (currentByte!9639 (_1!9612 lt!327265)) (currentBit!9634 (_1!9612 lt!327265)))))))

(declare-fun e!142783 () Bool)

(assert (=> b!209114 (=> (not res!175516) (not e!142783))))

(assert (=> b!209114 e!142783))

(declare-fun lt!327293 () Unit!14868)

(assert (=> b!209114 (= lt!327293 lt!327275)))

(declare-fun lt!327276 () tuple2!17918)

(assert (=> b!209114 (= lt!327276 (reader!0 (_2!9613 lt!326609) (_2!9613 lt!327281)))))

(declare-fun lt!327306 () tuple2!17918)

(assert (=> b!209114 (= lt!327306 (reader!0 (_2!9613 lt!327301) (_2!9613 lt!327281)))))

(declare-fun lt!327271 () tuple2!17914)

(assert (=> b!209114 (= lt!327271 (readBitPure!0 (_1!9614 lt!327276)))))

(assert (=> b!209114 (= (_2!9612 lt!327271) lt!327304)))

(declare-fun lt!327305 () Unit!14868)

(declare-fun Unit!14874 () Unit!14868)

(assert (=> b!209114 (= lt!327305 Unit!14874)))

(declare-fun lt!327309 () (_ BitVec 64))

(assert (=> b!209114 (= lt!327309 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!327288 () (_ BitVec 64))

(assert (=> b!209114 (= lt!327288 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!327289 () Unit!14868)

(assert (=> b!209114 (= lt!327289 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9613 lt!326609) (buf!5109 (_2!9613 lt!327281)) lt!327288))))

(assert (=> b!209114 (validate_offset_bits!1 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!327281)))) ((_ sign_extend 32) (currentByte!9639 (_2!9613 lt!326609))) ((_ sign_extend 32) (currentBit!9634 (_2!9613 lt!326609))) lt!327288)))

(declare-fun lt!327273 () Unit!14868)

(assert (=> b!209114 (= lt!327273 lt!327289)))

(declare-fun lt!327302 () tuple2!17920)

(assert (=> b!209114 (= lt!327302 (readNBitsLSBFirstsLoopPure!0 (_1!9614 lt!327276) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!327309))))

(declare-fun lt!327264 () (_ BitVec 64))

(assert (=> b!209114 (= lt!327264 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!327295 () Unit!14868)

(assert (=> b!209114 (= lt!327295 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9613 lt!327301) (buf!5109 (_2!9613 lt!327281)) lt!327264))))

(assert (=> b!209114 (validate_offset_bits!1 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!327281)))) ((_ sign_extend 32) (currentByte!9639 (_2!9613 lt!327301))) ((_ sign_extend 32) (currentBit!9634 (_2!9613 lt!327301))) lt!327264)))

(declare-fun lt!327269 () Unit!14868)

(assert (=> b!209114 (= lt!327269 lt!327295)))

(declare-fun lt!327262 () tuple2!17920)

(assert (=> b!209114 (= lt!327262 (readNBitsLSBFirstsLoopPure!0 (_1!9614 lt!327306) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!327309 (ite (_2!9612 lt!327271) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!327261 () tuple2!17920)

(assert (=> b!209114 (= lt!327261 (readNBitsLSBFirstsLoopPure!0 (_1!9614 lt!327276) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!327309))))

(declare-fun c!10286 () Bool)

(assert (=> b!209114 (= c!10286 (_2!9612 (readBitPure!0 (_1!9614 lt!327276))))))

(declare-fun lt!327303 () tuple2!17920)

(assert (=> b!209114 (= lt!327303 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9614 lt!327276) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!327309 e!142784)))))

(declare-fun lt!327312 () Unit!14868)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14868)

(assert (=> b!209114 (= lt!327312 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9614 lt!327276) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!327309))))

(assert (=> b!209114 (and (= (_2!9615 lt!327261) (_2!9615 lt!327303)) (= (_1!9615 lt!327261) (_1!9615 lt!327303)))))

(declare-fun lt!327286 () Unit!14868)

(assert (=> b!209114 (= lt!327286 lt!327312)))

(assert (=> b!209114 (= (_1!9614 lt!327276) (withMovedBitIndex!0 (_2!9614 lt!327276) (bvsub (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326609))) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609))) (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!327281))) (currentByte!9639 (_2!9613 lt!327281)) (currentBit!9634 (_2!9613 lt!327281))))))))

(declare-fun lt!327307 () Unit!14868)

(declare-fun Unit!14875 () Unit!14868)

(assert (=> b!209114 (= lt!327307 Unit!14875)))

(assert (=> b!209114 (= (_1!9614 lt!327306) (withMovedBitIndex!0 (_2!9614 lt!327306) (bvsub (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!327301))) (currentByte!9639 (_2!9613 lt!327301)) (currentBit!9634 (_2!9613 lt!327301))) (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!327281))) (currentByte!9639 (_2!9613 lt!327281)) (currentBit!9634 (_2!9613 lt!327281))))))))

(declare-fun lt!327291 () Unit!14868)

(declare-fun Unit!14876 () Unit!14868)

(assert (=> b!209114 (= lt!327291 Unit!14876)))

(assert (=> b!209114 (= (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326609))) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609))) (bvsub (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!327301))) (currentByte!9639 (_2!9613 lt!327301)) (currentBit!9634 (_2!9613 lt!327301))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!327310 () Unit!14868)

(declare-fun Unit!14877 () Unit!14868)

(assert (=> b!209114 (= lt!327310 Unit!14877)))

(assert (=> b!209114 (= (_2!9615 lt!327302) (_2!9615 lt!327262))))

(declare-fun lt!327260 () Unit!14868)

(declare-fun Unit!14878 () Unit!14868)

(assert (=> b!209114 (= lt!327260 Unit!14878)))

(assert (=> b!209114 (invariant!0 (currentBit!9634 (_2!9613 lt!327281)) (currentByte!9639 (_2!9613 lt!327281)) (size!4598 (buf!5109 (_2!9613 lt!327281))))))

(declare-fun lt!327267 () Unit!14868)

(declare-fun Unit!14879 () Unit!14868)

(assert (=> b!209114 (= lt!327267 Unit!14879)))

(assert (=> b!209114 (= (size!4598 (buf!5109 (_2!9613 lt!326609))) (size!4598 (buf!5109 (_2!9613 lt!327281))))))

(declare-fun lt!327287 () Unit!14868)

(declare-fun Unit!14880 () Unit!14868)

(assert (=> b!209114 (= lt!327287 Unit!14880)))

(assert (=> b!209114 (= (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!327281))) (currentByte!9639 (_2!9613 lt!327281)) (currentBit!9634 (_2!9613 lt!327281))) (bvsub (bvadd (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326609))) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!327278 () Unit!14868)

(declare-fun Unit!14881 () Unit!14868)

(assert (=> b!209114 (= lt!327278 Unit!14881)))

(declare-fun lt!327257 () Unit!14868)

(declare-fun Unit!14882 () Unit!14868)

(assert (=> b!209114 (= lt!327257 Unit!14882)))

(assert (=> b!209114 (= lt!327297 (reader!0 (_2!9613 lt!326609) (_2!9613 lt!327281)))))

(declare-fun lt!327258 () (_ BitVec 64))

(assert (=> b!209114 (= lt!327258 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!327299 () Unit!14868)

(assert (=> b!209114 (= lt!327299 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9613 lt!326609) (buf!5109 (_2!9613 lt!327281)) lt!327258))))

(assert (=> b!209114 (validate_offset_bits!1 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!327281)))) ((_ sign_extend 32) (currentByte!9639 (_2!9613 lt!326609))) ((_ sign_extend 32) (currentBit!9634 (_2!9613 lt!326609))) lt!327258)))

(declare-fun lt!327294 () Unit!14868)

(assert (=> b!209114 (= lt!327294 lt!327299)))

(assert (=> b!209114 (= lt!327296 (readNBitsLSBFirstsLoopPure!0 (_1!9614 lt!327297) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!175525 () Bool)

(assert (=> b!209114 (= res!175525 (= (_2!9615 lt!327296) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!209114 (=> (not res!175525) (not e!142779))))

(assert (=> b!209114 e!142779))

(declare-fun lt!327285 () Unit!14868)

(declare-fun Unit!14883 () Unit!14868)

(assert (=> b!209114 (= lt!327285 Unit!14883)))

(declare-fun b!209115 () Bool)

(declare-fun e!142780 () Bool)

(declare-fun lt!327308 () (_ BitVec 64))

(assert (=> b!209115 (= e!142780 (validate_offset_bits!1 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!326609)))) ((_ sign_extend 32) (currentByte!9639 (_2!9613 lt!326609))) ((_ sign_extend 32) (currentBit!9634 (_2!9613 lt!326609))) lt!327308))))

(declare-fun b!209116 () Bool)

(declare-fun e!142786 () Bool)

(declare-fun lt!327290 () tuple2!17920)

(declare-fun lt!327298 () tuple2!17918)

(assert (=> b!209116 (= e!142786 (= (_1!9615 lt!327290) (_2!9614 lt!327298)))))

(declare-fun b!209117 () Bool)

(assert (=> b!209117 (= e!142778 e!142786)))

(declare-fun res!175524 () Bool)

(assert (=> b!209117 (=> (not res!175524) (not e!142786))))

(assert (=> b!209117 (= res!175524 (= (_2!9615 lt!327290) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!209117 (= lt!327290 (readNBitsLSBFirstsLoopPure!0 (_1!9614 lt!327298) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!327263 () Unit!14868)

(declare-fun lt!327272 () Unit!14868)

(assert (=> b!209117 (= lt!327263 lt!327272)))

(assert (=> b!209117 (validate_offset_bits!1 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!327270)))) ((_ sign_extend 32) (currentByte!9639 (_2!9613 lt!326609))) ((_ sign_extend 32) (currentBit!9634 (_2!9613 lt!326609))) lt!327308)))

(assert (=> b!209117 (= lt!327272 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9613 lt!326609) (buf!5109 (_2!9613 lt!327270)) lt!327308))))

(assert (=> b!209117 e!142780))

(declare-fun res!175523 () Bool)

(assert (=> b!209117 (=> (not res!175523) (not e!142780))))

(assert (=> b!209117 (= res!175523 (and (= (size!4598 (buf!5109 (_2!9613 lt!326609))) (size!4598 (buf!5109 (_2!9613 lt!327270)))) (bvsge lt!327308 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209117 (= lt!327308 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!209117 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!209117 (= lt!327298 (reader!0 (_2!9613 lt!326609) (_2!9613 lt!327270)))))

(declare-fun bm!3288 () Bool)

(declare-fun c!10285 () Bool)

(declare-fun call!3291 () Bool)

(assert (=> bm!3288 (= call!3291 (isPrefixOf!0 (_2!9613 lt!326609) (ite c!10285 (_2!9613 lt!326609) (_2!9613 lt!327277))))))

(declare-fun b!209118 () Bool)

(assert (=> b!209118 (= e!142784 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!209119 () Bool)

(declare-fun res!175515 () Bool)

(assert (=> b!209119 (= res!175515 call!3291)))

(assert (=> b!209119 (=> (not res!175515) (not e!142781))))

(declare-fun d!70639 () Bool)

(assert (=> d!70639 e!142778))

(declare-fun res!175517 () Bool)

(assert (=> d!70639 (=> (not res!175517) (not e!142778))))

(assert (=> d!70639 (= res!175517 (invariant!0 (currentBit!9634 (_2!9613 lt!327270)) (currentByte!9639 (_2!9613 lt!327270)) (size!4598 (buf!5109 (_2!9613 lt!327270)))))))

(assert (=> d!70639 (= lt!327270 e!142782)))

(assert (=> d!70639 (= c!10285 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!70639 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!70639 (= (appendBitsLSBFirstLoopTR!0 (_2!9613 lt!326609) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!327270)))

(declare-fun b!209112 () Bool)

(declare-fun res!175520 () Bool)

(assert (=> b!209112 (= res!175520 (= (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!327277))) (currentByte!9639 (_2!9613 lt!327277)) (currentBit!9634 (_2!9613 lt!327277))) (bvadd (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326609))) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!209112 (=> (not res!175520) (not e!142781))))

(declare-fun b!209120 () Bool)

(declare-fun res!175518 () Bool)

(assert (=> b!209120 (=> (not res!175518) (not e!142778))))

(assert (=> b!209120 (= res!175518 (= (size!4598 (buf!5109 (_2!9613 lt!326609))) (size!4598 (buf!5109 (_2!9613 lt!327270)))))))

(declare-fun b!209121 () Bool)

(declare-fun Unit!14884 () Unit!14868)

(assert (=> b!209121 (= e!142782 (tuple2!17917 Unit!14884 (_2!9613 lt!326609)))))

(declare-fun lt!327279 () Unit!14868)

(assert (=> b!209121 (= lt!327279 (lemmaIsPrefixRefl!0 (_2!9613 lt!326609)))))

(assert (=> b!209121 call!3291))

(declare-fun lt!327284 () Unit!14868)

(assert (=> b!209121 (= lt!327284 lt!327279)))

(declare-fun b!209122 () Bool)

(assert (=> b!209122 (= e!142783 (= (_2!9612 lt!327259) (_2!9612 lt!327265)))))

(declare-fun b!209123 () Bool)

(assert (=> b!209123 (= e!142785 (= (bitIndex!0 (size!4598 (buf!5109 (_1!9612 lt!327311))) (currentByte!9639 (_1!9612 lt!327311)) (currentBit!9634 (_1!9612 lt!327311))) (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!327277))) (currentByte!9639 (_2!9613 lt!327277)) (currentBit!9634 (_2!9613 lt!327277)))))))

(assert (= (and d!70639 c!10285) b!209121))

(assert (= (and d!70639 (not c!10285)) b!209114))

(assert (= (and b!209114 res!175521) b!209112))

(assert (= (and b!209112 res!175520) b!209119))

(assert (= (and b!209119 res!175515) b!209109))

(assert (= (and b!209109 res!175519) b!209123))

(assert (= (and b!209114 res!175516) b!209122))

(assert (= (and b!209114 c!10286) b!209113))

(assert (= (and b!209114 (not c!10286)) b!209118))

(assert (= (and b!209114 res!175525) b!209108))

(assert (= (or b!209121 b!209119) bm!3288))

(assert (= (and d!70639 res!175517) b!209120))

(assert (= (and b!209120 res!175518) b!209110))

(assert (= (and b!209110 res!175522) b!209111))

(assert (= (and b!209111 res!175514) b!209117))

(assert (= (and b!209117 res!175523) b!209115))

(assert (= (and b!209117 res!175524) b!209116))

(assert (=> b!209121 m!321481))

(declare-fun m!321817 () Bool)

(assert (=> b!209123 m!321817))

(declare-fun m!321819 () Bool)

(assert (=> b!209123 m!321819))

(declare-fun m!321821 () Bool)

(assert (=> b!209111 m!321821))

(declare-fun m!321823 () Bool)

(assert (=> b!209117 m!321823))

(declare-fun m!321825 () Bool)

(assert (=> b!209117 m!321825))

(declare-fun m!321827 () Bool)

(assert (=> b!209117 m!321827))

(declare-fun m!321829 () Bool)

(assert (=> b!209117 m!321829))

(declare-fun m!321831 () Bool)

(assert (=> b!209117 m!321831))

(declare-fun m!321833 () Bool)

(assert (=> b!209117 m!321833))

(declare-fun m!321835 () Bool)

(assert (=> bm!3288 m!321835))

(declare-fun m!321837 () Bool)

(assert (=> b!209115 m!321837))

(declare-fun m!321839 () Bool)

(assert (=> b!209110 m!321839))

(assert (=> b!209110 m!321365))

(declare-fun m!321841 () Bool)

(assert (=> b!209114 m!321841))

(declare-fun m!321843 () Bool)

(assert (=> b!209114 m!321843))

(declare-fun m!321845 () Bool)

(assert (=> b!209114 m!321845))

(declare-fun m!321847 () Bool)

(assert (=> b!209114 m!321847))

(declare-fun m!321849 () Bool)

(assert (=> b!209114 m!321849))

(declare-fun m!321851 () Bool)

(assert (=> b!209114 m!321851))

(declare-fun m!321853 () Bool)

(assert (=> b!209114 m!321853))

(declare-fun m!321855 () Bool)

(assert (=> b!209114 m!321855))

(declare-fun m!321857 () Bool)

(assert (=> b!209114 m!321857))

(declare-fun m!321859 () Bool)

(assert (=> b!209114 m!321859))

(declare-fun m!321861 () Bool)

(assert (=> b!209114 m!321861))

(declare-fun m!321863 () Bool)

(assert (=> b!209114 m!321863))

(declare-fun m!321865 () Bool)

(assert (=> b!209114 m!321865))

(declare-fun m!321867 () Bool)

(assert (=> b!209114 m!321867))

(declare-fun m!321869 () Bool)

(assert (=> b!209114 m!321869))

(declare-fun m!321871 () Bool)

(assert (=> b!209114 m!321871))

(declare-fun m!321873 () Bool)

(assert (=> b!209114 m!321873))

(declare-fun m!321875 () Bool)

(assert (=> b!209114 m!321875))

(declare-fun m!321877 () Bool)

(assert (=> b!209114 m!321877))

(assert (=> b!209114 m!321365))

(declare-fun m!321879 () Bool)

(assert (=> b!209114 m!321879))

(declare-fun m!321881 () Bool)

(assert (=> b!209114 m!321881))

(assert (=> b!209114 m!321825))

(declare-fun m!321883 () Bool)

(assert (=> b!209114 m!321883))

(assert (=> b!209114 m!321849))

(declare-fun m!321885 () Bool)

(assert (=> b!209114 m!321885))

(declare-fun m!321887 () Bool)

(assert (=> b!209114 m!321887))

(declare-fun m!321889 () Bool)

(assert (=> b!209114 m!321889))

(declare-fun m!321891 () Bool)

(assert (=> b!209114 m!321891))

(declare-fun m!321893 () Bool)

(assert (=> b!209114 m!321893))

(declare-fun m!321895 () Bool)

(assert (=> b!209114 m!321895))

(declare-fun m!321897 () Bool)

(assert (=> b!209114 m!321897))

(declare-fun m!321899 () Bool)

(assert (=> b!209114 m!321899))

(assert (=> b!209114 m!321833))

(declare-fun m!321901 () Bool)

(assert (=> b!209114 m!321901))

(assert (=> b!209112 m!321819))

(assert (=> b!209112 m!321365))

(declare-fun m!321903 () Bool)

(assert (=> b!209109 m!321903))

(assert (=> b!209109 m!321903))

(declare-fun m!321905 () Bool)

(assert (=> b!209109 m!321905))

(declare-fun m!321907 () Bool)

(assert (=> d!70639 m!321907))

(assert (=> b!208841 d!70639))

(declare-fun d!70747 () Bool)

(assert (=> d!70747 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4598 (buf!5109 (_1!9614 lt!326595)))) ((_ sign_extend 32) (currentByte!9639 (_1!9614 lt!326595))) ((_ sign_extend 32) (currentBit!9634 (_1!9614 lt!326595))) lt!326604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4598 (buf!5109 (_1!9614 lt!326595)))) ((_ sign_extend 32) (currentByte!9639 (_1!9614 lt!326595))) ((_ sign_extend 32) (currentBit!9634 (_1!9614 lt!326595)))) lt!326604))))

(declare-fun bs!17382 () Bool)

(assert (= bs!17382 d!70747))

(declare-fun m!321909 () Bool)

(assert (=> bs!17382 m!321909))

(assert (=> b!208840 d!70747))

(declare-fun d!70749 () Bool)

(assert (=> d!70749 (= (invariant!0 (currentBit!9634 thiss!1204) (currentByte!9639 thiss!1204) (size!4598 (buf!5109 (_2!9613 lt!326612)))) (and (bvsge (currentBit!9634 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9634 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9639 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9639 thiss!1204) (size!4598 (buf!5109 (_2!9613 lt!326612)))) (and (= (currentBit!9634 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9639 thiss!1204) (size!4598 (buf!5109 (_2!9613 lt!326612))))))))))

(assert (=> b!208850 d!70749))

(declare-fun d!70751 () Bool)

(assert (=> d!70751 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9634 thiss!1204) (currentByte!9639 thiss!1204) (size!4598 (buf!5109 thiss!1204))))))

(declare-fun bs!17383 () Bool)

(assert (= bs!17383 d!70751))

(assert (=> bs!17383 m!321383))

(assert (=> start!43862 d!70751))

(declare-fun d!70753 () Bool)

(assert (=> d!70753 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4598 (buf!5109 thiss!1204))) ((_ sign_extend 32) (currentByte!9639 thiss!1204)) ((_ sign_extend 32) (currentBit!9634 thiss!1204)) lt!326604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4598 (buf!5109 thiss!1204))) ((_ sign_extend 32) (currentByte!9639 thiss!1204)) ((_ sign_extend 32) (currentBit!9634 thiss!1204))) lt!326604))))

(declare-fun bs!17384 () Bool)

(assert (= bs!17384 d!70753))

(declare-fun m!321911 () Bool)

(assert (=> bs!17384 m!321911))

(assert (=> b!208849 d!70753))

(declare-fun d!70755 () Bool)

(declare-fun e!142787 () Bool)

(assert (=> d!70755 e!142787))

(declare-fun res!175526 () Bool)

(assert (=> d!70755 (=> (not res!175526) (not e!142787))))

(declare-fun lt!327313 () (_ BitVec 64))

(declare-fun lt!327317 () (_ BitVec 64))

(declare-fun lt!327318 () (_ BitVec 64))

(assert (=> d!70755 (= res!175526 (= lt!327317 (bvsub lt!327313 lt!327318)))))

(assert (=> d!70755 (or (= (bvand lt!327313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327318 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!327313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!327313 lt!327318) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70755 (= lt!327318 (remainingBits!0 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!326609)))) ((_ sign_extend 32) (currentByte!9639 (_2!9613 lt!326609))) ((_ sign_extend 32) (currentBit!9634 (_2!9613 lt!326609)))))))

(declare-fun lt!327316 () (_ BitVec 64))

(declare-fun lt!327315 () (_ BitVec 64))

(assert (=> d!70755 (= lt!327313 (bvmul lt!327316 lt!327315))))

(assert (=> d!70755 (or (= lt!327316 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!327315 (bvsdiv (bvmul lt!327316 lt!327315) lt!327316)))))

(assert (=> d!70755 (= lt!327315 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70755 (= lt!327316 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!326609)))))))

(assert (=> d!70755 (= lt!327317 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9639 (_2!9613 lt!326609))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9634 (_2!9613 lt!326609)))))))

(assert (=> d!70755 (invariant!0 (currentBit!9634 (_2!9613 lt!326609)) (currentByte!9639 (_2!9613 lt!326609)) (size!4598 (buf!5109 (_2!9613 lt!326609))))))

(assert (=> d!70755 (= (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!326609))) (currentByte!9639 (_2!9613 lt!326609)) (currentBit!9634 (_2!9613 lt!326609))) lt!327317)))

(declare-fun b!209124 () Bool)

(declare-fun res!175527 () Bool)

(assert (=> b!209124 (=> (not res!175527) (not e!142787))))

(assert (=> b!209124 (= res!175527 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!327317))))

(declare-fun b!209125 () Bool)

(declare-fun lt!327314 () (_ BitVec 64))

(assert (=> b!209125 (= e!142787 (bvsle lt!327317 (bvmul lt!327314 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209125 (or (= lt!327314 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!327314 #b0000000000000000000000000000000000000000000000000000000000001000) lt!327314)))))

(assert (=> b!209125 (= lt!327314 ((_ sign_extend 32) (size!4598 (buf!5109 (_2!9613 lt!326609)))))))

(assert (= (and d!70755 res!175526) b!209124))

(assert (= (and b!209124 res!175527) b!209125))

(declare-fun m!321913 () Bool)

(assert (=> d!70755 m!321913))

(assert (=> d!70755 m!321579))

(assert (=> b!208838 d!70755))

(declare-fun d!70757 () Bool)

(declare-fun e!142788 () Bool)

(assert (=> d!70757 e!142788))

(declare-fun res!175528 () Bool)

(assert (=> d!70757 (=> (not res!175528) (not e!142788))))

(declare-fun lt!327323 () (_ BitVec 64))

(declare-fun lt!327319 () (_ BitVec 64))

(declare-fun lt!327324 () (_ BitVec 64))

(assert (=> d!70757 (= res!175528 (= lt!327323 (bvsub lt!327319 lt!327324)))))

(assert (=> d!70757 (or (= (bvand lt!327319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327324 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!327319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!327319 lt!327324) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70757 (= lt!327324 (remainingBits!0 ((_ sign_extend 32) (size!4598 (buf!5109 thiss!1204))) ((_ sign_extend 32) (currentByte!9639 thiss!1204)) ((_ sign_extend 32) (currentBit!9634 thiss!1204))))))

(declare-fun lt!327322 () (_ BitVec 64))

(declare-fun lt!327321 () (_ BitVec 64))

(assert (=> d!70757 (= lt!327319 (bvmul lt!327322 lt!327321))))

(assert (=> d!70757 (or (= lt!327322 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!327321 (bvsdiv (bvmul lt!327322 lt!327321) lt!327322)))))

(assert (=> d!70757 (= lt!327321 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70757 (= lt!327322 ((_ sign_extend 32) (size!4598 (buf!5109 thiss!1204))))))

(assert (=> d!70757 (= lt!327323 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9639 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9634 thiss!1204))))))

(assert (=> d!70757 (invariant!0 (currentBit!9634 thiss!1204) (currentByte!9639 thiss!1204) (size!4598 (buf!5109 thiss!1204)))))

(assert (=> d!70757 (= (bitIndex!0 (size!4598 (buf!5109 thiss!1204)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204)) lt!327323)))

(declare-fun b!209126 () Bool)

(declare-fun res!175529 () Bool)

(assert (=> b!209126 (=> (not res!175529) (not e!142788))))

(assert (=> b!209126 (= res!175529 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!327323))))

(declare-fun b!209127 () Bool)

(declare-fun lt!327320 () (_ BitVec 64))

(assert (=> b!209127 (= e!142788 (bvsle lt!327323 (bvmul lt!327320 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209127 (or (= lt!327320 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!327320 #b0000000000000000000000000000000000000000000000000000000000001000) lt!327320)))))

(assert (=> b!209127 (= lt!327320 ((_ sign_extend 32) (size!4598 (buf!5109 thiss!1204))))))

(assert (= (and d!70757 res!175528) b!209126))

(assert (= (and b!209126 res!175529) b!209127))

(assert (=> d!70757 m!321911))

(assert (=> d!70757 m!321383))

(assert (=> b!208838 d!70757))

(declare-fun b!209137 () Bool)

(declare-fun res!175540 () Bool)

(declare-fun e!142793 () Bool)

(assert (=> b!209137 (=> (not res!175540) (not e!142793))))

(declare-fun lt!327333 () (_ BitVec 64))

(declare-fun lt!327336 () tuple2!17916)

(declare-fun lt!327334 () (_ BitVec 64))

(assert (=> b!209137 (= res!175540 (= (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!327336))) (currentByte!9639 (_2!9613 lt!327336)) (currentBit!9634 (_2!9613 lt!327336))) (bvadd lt!327333 lt!327334)))))

(assert (=> b!209137 (or (not (= (bvand lt!327333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327334 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!327333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!327333 lt!327334) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209137 (= lt!327334 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!209137 (= lt!327333 (bitIndex!0 (size!4598 (buf!5109 thiss!1204)) (currentByte!9639 thiss!1204) (currentBit!9634 thiss!1204)))))

(declare-fun b!209140 () Bool)

(declare-fun e!142794 () Bool)

(declare-fun lt!327335 () tuple2!17914)

(assert (=> b!209140 (= e!142794 (= (bitIndex!0 (size!4598 (buf!5109 (_1!9612 lt!327335))) (currentByte!9639 (_1!9612 lt!327335)) (currentBit!9634 (_1!9612 lt!327335))) (bitIndex!0 (size!4598 (buf!5109 (_2!9613 lt!327336))) (currentByte!9639 (_2!9613 lt!327336)) (currentBit!9634 (_2!9613 lt!327336)))))))

(declare-fun d!70759 () Bool)

(assert (=> d!70759 e!142793))

(declare-fun res!175538 () Bool)

(assert (=> d!70759 (=> (not res!175538) (not e!142793))))

(assert (=> d!70759 (= res!175538 (= (size!4598 (buf!5109 thiss!1204)) (size!4598 (buf!5109 (_2!9613 lt!327336)))))))

(declare-fun choose!16 (BitStream!8304 Bool) tuple2!17916)

(assert (=> d!70759 (= lt!327336 (choose!16 thiss!1204 lt!326605))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!70759 (validate_offset_bit!0 ((_ sign_extend 32) (size!4598 (buf!5109 thiss!1204))) ((_ sign_extend 32) (currentByte!9639 thiss!1204)) ((_ sign_extend 32) (currentBit!9634 thiss!1204)))))

(assert (=> d!70759 (= (appendBit!0 thiss!1204 lt!326605) lt!327336)))

(declare-fun b!209139 () Bool)

(assert (=> b!209139 (= e!142793 e!142794)))

(declare-fun res!175541 () Bool)

(assert (=> b!209139 (=> (not res!175541) (not e!142794))))

(assert (=> b!209139 (= res!175541 (and (= (_2!9612 lt!327335) lt!326605) (= (_1!9612 lt!327335) (_2!9613 lt!327336))))))

(assert (=> b!209139 (= lt!327335 (readBitPure!0 (readerFrom!0 (_2!9613 lt!327336) (currentBit!9634 thiss!1204) (currentByte!9639 thiss!1204))))))

(declare-fun b!209138 () Bool)

(declare-fun res!175539 () Bool)

(assert (=> b!209138 (=> (not res!175539) (not e!142793))))

(assert (=> b!209138 (= res!175539 (isPrefixOf!0 thiss!1204 (_2!9613 lt!327336)))))

(assert (= (and d!70759 res!175538) b!209137))

(assert (= (and b!209137 res!175540) b!209138))

(assert (= (and b!209138 res!175539) b!209139))

(assert (= (and b!209139 res!175541) b!209140))

(declare-fun m!321915 () Bool)

(assert (=> b!209140 m!321915))

(declare-fun m!321917 () Bool)

(assert (=> b!209140 m!321917))

(declare-fun m!321919 () Bool)

(assert (=> d!70759 m!321919))

(declare-fun m!321921 () Bool)

(assert (=> d!70759 m!321921))

(declare-fun m!321923 () Bool)

(assert (=> b!209139 m!321923))

(assert (=> b!209139 m!321923))

(declare-fun m!321925 () Bool)

(assert (=> b!209139 m!321925))

(assert (=> b!209137 m!321917))

(assert (=> b!209137 m!321367))

(declare-fun m!321927 () Bool)

(assert (=> b!209138 m!321927))

(assert (=> b!208838 d!70759))

(assert (=> b!208848 d!70755))

(assert (=> b!208848 d!70757))

(assert (=> b!208837 d!70583))

(check-sat (not b!208933) (not b!209121) (not b!208920) (not b!209117) (not b!208952) (not d!70753) (not b!208954) (not b!208943) (not d!70633) (not d!70587) (not d!70605) (not d!70759) (not d!70595) (not d!70597) (not d!70615) (not b!208935) (not d!70611) (not b!209110) (not d!70593) (not d!70601) (not d!70591) (not b!208962) (not b!209112) (not d!70639) (not b!208941) (not b!208939) (not d!70755) (not d!70757) (not b!209137) (not d!70603) (not b!208964) (not b!209115) (not b!209109) (not b!208932) (not bm!3288) (not d!70623) (not b!209140) (not d!70637) (not d!70609) (not d!70629) (not b!208931) (not b!209111) (not b!208918) (not b!209139) (not b!209123) (not d!70747) (not b!209138) (not b!208959) (not b!209114) (not d!70613) (not d!70607) (not d!70599) (not d!70751) (not b!208940) (not d!70627))
(check-sat)
