; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39514 () Bool)

(assert start!39514)

(declare-fun res!147446 () Bool)

(declare-fun e!123898 () Bool)

(assert (=> start!39514 (=> (not res!147446) (not e!123898))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39514 (= res!147446 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39514 e!123898))

(assert (=> start!39514 true))

(declare-datatypes ((array!9592 0))(
  ( (array!9593 (arr!5159 (Array (_ BitVec 32) (_ BitVec 8))) (size!4229 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7566 0))(
  ( (BitStream!7567 (buf!4672 array!9592) (currentByte!8861 (_ BitVec 32)) (currentBit!8856 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7566)

(declare-fun e!123894 () Bool)

(declare-fun inv!12 (BitStream!7566) Bool)

(assert (=> start!39514 (and (inv!12 thiss!1204) e!123894)))

(declare-fun b!177840 () Bool)

(declare-fun res!147450 () Bool)

(assert (=> b!177840 (=> (not res!147450) (not e!123898))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177840 (= res!147450 (validate_offset_bits!1 ((_ sign_extend 32) (size!4229 (buf!4672 thiss!1204))) ((_ sign_extend 32) (currentByte!8861 thiss!1204)) ((_ sign_extend 32) (currentBit!8856 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!177841 () Bool)

(declare-fun res!147448 () Bool)

(assert (=> b!177841 (=> (not res!147448) (not e!123898))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177841 (= res!147448 (invariant!0 (currentBit!8856 thiss!1204) (currentByte!8861 thiss!1204) (size!4229 (buf!4672 thiss!1204))))))

(declare-fun b!177842 () Bool)

(declare-fun e!123895 () Bool)

(declare-datatypes ((tuple2!15330 0))(
  ( (tuple2!15331 (_1!8310 BitStream!7566) (_2!8310 Bool)) )
))
(declare-fun lt!273228 () tuple2!15330)

(declare-fun lt!273229 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177842 (= e!123895 (= (bitIndex!0 (size!4229 (buf!4672 (_1!8310 lt!273228))) (currentByte!8861 (_1!8310 lt!273228)) (currentBit!8856 (_1!8310 lt!273228))) lt!273229))))

(declare-fun b!177843 () Bool)

(declare-fun array_inv!3970 (array!9592) Bool)

(assert (=> b!177843 (= e!123894 (array_inv!3970 (buf!4672 thiss!1204)))))

(declare-fun b!177844 () Bool)

(declare-fun e!123893 () Bool)

(assert (=> b!177844 (= e!123893 e!123895)))

(declare-fun res!147451 () Bool)

(assert (=> b!177844 (=> (not res!147451) (not e!123895))))

(declare-datatypes ((Unit!12805 0))(
  ( (Unit!12806) )
))
(declare-datatypes ((tuple2!15332 0))(
  ( (tuple2!15333 (_1!8311 Unit!12805) (_2!8311 BitStream!7566)) )
))
(declare-fun lt!273232 () tuple2!15332)

(declare-fun lt!273233 () Bool)

(assert (=> b!177844 (= res!147451 (and (= (_2!8310 lt!273228) lt!273233) (= (_1!8310 lt!273228) (_2!8311 lt!273232))))))

(declare-fun readBitPure!0 (BitStream!7566) tuple2!15330)

(declare-fun readerFrom!0 (BitStream!7566 (_ BitVec 32) (_ BitVec 32)) BitStream!7566)

(assert (=> b!177844 (= lt!273228 (readBitPure!0 (readerFrom!0 (_2!8311 lt!273232) (currentBit!8856 thiss!1204) (currentByte!8861 thiss!1204))))))

(declare-fun b!177845 () Bool)

(declare-fun res!147447 () Bool)

(assert (=> b!177845 (=> (not res!147447) (not e!123893))))

(declare-fun isPrefixOf!0 (BitStream!7566 BitStream!7566) Bool)

(assert (=> b!177845 (= res!147447 (isPrefixOf!0 thiss!1204 (_2!8311 lt!273232)))))

(declare-fun b!177846 () Bool)

(declare-fun res!147449 () Bool)

(assert (=> b!177846 (=> (not res!147449) (not e!123898))))

(assert (=> b!177846 (= res!147449 (not (= i!590 nBits!348)))))

(declare-fun b!177847 () Bool)

(declare-fun e!123892 () Bool)

(assert (=> b!177847 (= e!123892 (invariant!0 (currentBit!8856 (_2!8311 lt!273232)) (currentByte!8861 (_2!8311 lt!273232)) (size!4229 (buf!4672 (_2!8311 lt!273232)))))))

(declare-fun lt!273230 () tuple2!15332)

(assert (=> b!177847 (isPrefixOf!0 thiss!1204 (_2!8311 lt!273230))))

(declare-fun lt!273231 () Unit!12805)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7566 BitStream!7566 BitStream!7566) Unit!12805)

(assert (=> b!177847 (= lt!273231 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8311 lt!273232) (_2!8311 lt!273230)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7566 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15332)

(assert (=> b!177847 (= lt!273230 (appendBitsLSBFirstLoopTR!0 (_2!8311 lt!273232) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!177848 () Bool)

(declare-fun e!123897 () Bool)

(assert (=> b!177848 (= e!123897 e!123893)))

(declare-fun res!147452 () Bool)

(assert (=> b!177848 (=> (not res!147452) (not e!123893))))

(declare-fun lt!273227 () (_ BitVec 64))

(assert (=> b!177848 (= res!147452 (= lt!273229 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!273227)))))

(assert (=> b!177848 (= lt!273229 (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273232))) (currentByte!8861 (_2!8311 lt!273232)) (currentBit!8856 (_2!8311 lt!273232))))))

(assert (=> b!177848 (= lt!273227 (bitIndex!0 (size!4229 (buf!4672 thiss!1204)) (currentByte!8861 thiss!1204) (currentBit!8856 thiss!1204)))))

(declare-fun b!177849 () Bool)

(assert (=> b!177849 (= e!123898 (not e!123892))))

(declare-fun res!147445 () Bool)

(assert (=> b!177849 (=> res!147445 e!123892)))

(assert (=> b!177849 (= res!147445 (not (= (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273232))) (currentByte!8861 (_2!8311 lt!273232)) (currentBit!8856 (_2!8311 lt!273232))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4229 (buf!4672 thiss!1204)) (currentByte!8861 thiss!1204) (currentBit!8856 thiss!1204))))))))

(assert (=> b!177849 e!123897))

(declare-fun res!147453 () Bool)

(assert (=> b!177849 (=> (not res!147453) (not e!123897))))

(assert (=> b!177849 (= res!147453 (= (size!4229 (buf!4672 thiss!1204)) (size!4229 (buf!4672 (_2!8311 lt!273232)))))))

(declare-fun appendBit!0 (BitStream!7566 Bool) tuple2!15332)

(assert (=> b!177849 (= lt!273232 (appendBit!0 thiss!1204 lt!273233))))

(assert (=> b!177849 (= lt!273233 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39514 res!147446) b!177840))

(assert (= (and b!177840 res!147450) b!177841))

(assert (= (and b!177841 res!147448) b!177846))

(assert (= (and b!177846 res!147449) b!177849))

(assert (= (and b!177849 res!147453) b!177848))

(assert (= (and b!177848 res!147452) b!177845))

(assert (= (and b!177845 res!147447) b!177844))

(assert (= (and b!177844 res!147451) b!177842))

(assert (= (and b!177849 (not res!147445)) b!177847))

(assert (= start!39514 b!177843))

(declare-fun m!277867 () Bool)

(assert (=> b!177843 m!277867))

(declare-fun m!277869 () Bool)

(assert (=> b!177844 m!277869))

(assert (=> b!177844 m!277869))

(declare-fun m!277871 () Bool)

(assert (=> b!177844 m!277871))

(declare-fun m!277873 () Bool)

(assert (=> b!177842 m!277873))

(declare-fun m!277875 () Bool)

(assert (=> b!177848 m!277875))

(declare-fun m!277877 () Bool)

(assert (=> b!177848 m!277877))

(declare-fun m!277879 () Bool)

(assert (=> start!39514 m!277879))

(declare-fun m!277881 () Bool)

(assert (=> b!177845 m!277881))

(declare-fun m!277883 () Bool)

(assert (=> b!177841 m!277883))

(declare-fun m!277885 () Bool)

(assert (=> b!177840 m!277885))

(declare-fun m!277887 () Bool)

(assert (=> b!177847 m!277887))

(declare-fun m!277889 () Bool)

(assert (=> b!177847 m!277889))

(declare-fun m!277891 () Bool)

(assert (=> b!177847 m!277891))

(declare-fun m!277893 () Bool)

(assert (=> b!177847 m!277893))

(assert (=> b!177849 m!277875))

(assert (=> b!177849 m!277877))

(declare-fun m!277895 () Bool)

(assert (=> b!177849 m!277895))

(check-sat (not b!177841) (not b!177848) (not b!177849) (not b!177842) (not b!177845) (not b!177843) (not b!177844) (not b!177840) (not start!39514) (not b!177847))
(check-sat)
(get-model)

(declare-fun d!62537 () Bool)

(assert (=> d!62537 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8856 thiss!1204) (currentByte!8861 thiss!1204) (size!4229 (buf!4672 thiss!1204))))))

(declare-fun bs!15592 () Bool)

(assert (= bs!15592 d!62537))

(assert (=> bs!15592 m!277883))

(assert (=> start!39514 d!62537))

(declare-fun d!62539 () Bool)

(assert (=> d!62539 (= (invariant!0 (currentBit!8856 thiss!1204) (currentByte!8861 thiss!1204) (size!4229 (buf!4672 thiss!1204))) (and (bvsge (currentBit!8856 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8856 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8861 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8861 thiss!1204) (size!4229 (buf!4672 thiss!1204))) (and (= (currentBit!8856 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8861 thiss!1204) (size!4229 (buf!4672 thiss!1204)))))))))

(assert (=> b!177841 d!62539))

(declare-fun d!62541 () Bool)

(assert (=> d!62541 (= (invariant!0 (currentBit!8856 (_2!8311 lt!273232)) (currentByte!8861 (_2!8311 lt!273232)) (size!4229 (buf!4672 (_2!8311 lt!273232)))) (and (bvsge (currentBit!8856 (_2!8311 lt!273232)) #b00000000000000000000000000000000) (bvslt (currentBit!8856 (_2!8311 lt!273232)) #b00000000000000000000000000001000) (bvsge (currentByte!8861 (_2!8311 lt!273232)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8861 (_2!8311 lt!273232)) (size!4229 (buf!4672 (_2!8311 lt!273232)))) (and (= (currentBit!8856 (_2!8311 lt!273232)) #b00000000000000000000000000000000) (= (currentByte!8861 (_2!8311 lt!273232)) (size!4229 (buf!4672 (_2!8311 lt!273232))))))))))

(assert (=> b!177847 d!62541))

(declare-fun d!62543 () Bool)

(declare-fun res!147487 () Bool)

(declare-fun e!123924 () Bool)

(assert (=> d!62543 (=> (not res!147487) (not e!123924))))

(assert (=> d!62543 (= res!147487 (= (size!4229 (buf!4672 thiss!1204)) (size!4229 (buf!4672 (_2!8311 lt!273230)))))))

(assert (=> d!62543 (= (isPrefixOf!0 thiss!1204 (_2!8311 lt!273230)) e!123924)))

(declare-fun b!177886 () Bool)

(declare-fun res!147489 () Bool)

(assert (=> b!177886 (=> (not res!147489) (not e!123924))))

(assert (=> b!177886 (= res!147489 (bvsle (bitIndex!0 (size!4229 (buf!4672 thiss!1204)) (currentByte!8861 thiss!1204) (currentBit!8856 thiss!1204)) (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273230))) (currentByte!8861 (_2!8311 lt!273230)) (currentBit!8856 (_2!8311 lt!273230)))))))

(declare-fun b!177887 () Bool)

(declare-fun e!123925 () Bool)

(assert (=> b!177887 (= e!123924 e!123925)))

(declare-fun res!147488 () Bool)

(assert (=> b!177887 (=> res!147488 e!123925)))

(assert (=> b!177887 (= res!147488 (= (size!4229 (buf!4672 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!177888 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9592 array!9592 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177888 (= e!123925 (arrayBitRangesEq!0 (buf!4672 thiss!1204) (buf!4672 (_2!8311 lt!273230)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4229 (buf!4672 thiss!1204)) (currentByte!8861 thiss!1204) (currentBit!8856 thiss!1204))))))

(assert (= (and d!62543 res!147487) b!177886))

(assert (= (and b!177886 res!147489) b!177887))

(assert (= (and b!177887 (not res!147488)) b!177888))

(assert (=> b!177886 m!277877))

(declare-fun m!277927 () Bool)

(assert (=> b!177886 m!277927))

(assert (=> b!177888 m!277877))

(assert (=> b!177888 m!277877))

(declare-fun m!277929 () Bool)

(assert (=> b!177888 m!277929))

(assert (=> b!177847 d!62543))

(declare-fun d!62545 () Bool)

(assert (=> d!62545 (isPrefixOf!0 thiss!1204 (_2!8311 lt!273230))))

(declare-fun lt!273257 () Unit!12805)

(declare-fun choose!30 (BitStream!7566 BitStream!7566 BitStream!7566) Unit!12805)

(assert (=> d!62545 (= lt!273257 (choose!30 thiss!1204 (_2!8311 lt!273232) (_2!8311 lt!273230)))))

(assert (=> d!62545 (isPrefixOf!0 thiss!1204 (_2!8311 lt!273232))))

(assert (=> d!62545 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8311 lt!273232) (_2!8311 lt!273230)) lt!273257)))

(declare-fun bs!15593 () Bool)

(assert (= bs!15593 d!62545))

(assert (=> bs!15593 m!277889))

(declare-fun m!277931 () Bool)

(assert (=> bs!15593 m!277931))

(assert (=> bs!15593 m!277881))

(assert (=> b!177847 d!62545))

(declare-fun b!177972 () Bool)

(declare-fun res!147565 () Bool)

(declare-fun lt!273427 () tuple2!15332)

(assert (=> b!177972 (= res!147565 (= (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273427))) (currentByte!8861 (_2!8311 lt!273427)) (currentBit!8856 (_2!8311 lt!273427))) (bvadd (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273232))) (currentByte!8861 (_2!8311 lt!273232)) (currentBit!8856 (_2!8311 lt!273232))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!123976 () Bool)

(assert (=> b!177972 (=> (not res!147565) (not e!123976))))

(declare-fun b!177973 () Bool)

(declare-fun e!123982 () Bool)

(declare-fun lt!273430 () tuple2!15330)

(declare-fun lt!273466 () tuple2!15330)

(assert (=> b!177973 (= e!123982 (= (_2!8310 lt!273430) (_2!8310 lt!273466)))))

(declare-fun b!177974 () Bool)

(declare-fun e!123981 () tuple2!15332)

(declare-fun lt!273444 () tuple2!15332)

(assert (=> b!177974 (= e!123981 (tuple2!15333 (_1!8311 lt!273444) (_2!8311 lt!273444)))))

(declare-fun lt!273465 () Bool)

(assert (=> b!177974 (= lt!273465 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177974 (= lt!273427 (appendBit!0 (_2!8311 lt!273232) lt!273465))))

(declare-fun res!147572 () Bool)

(assert (=> b!177974 (= res!147572 (= (size!4229 (buf!4672 (_2!8311 lt!273232))) (size!4229 (buf!4672 (_2!8311 lt!273427)))))))

(assert (=> b!177974 (=> (not res!147572) (not e!123976))))

(assert (=> b!177974 e!123976))

(declare-fun lt!273458 () tuple2!15332)

(assert (=> b!177974 (= lt!273458 lt!273427)))

(assert (=> b!177974 (= lt!273444 (appendBitsLSBFirstLoopTR!0 (_2!8311 lt!273458) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!273440 () Unit!12805)

(assert (=> b!177974 (= lt!273440 (lemmaIsPrefixTransitive!0 (_2!8311 lt!273232) (_2!8311 lt!273458) (_2!8311 lt!273444)))))

(declare-fun call!2921 () Bool)

(assert (=> b!177974 call!2921))

(declare-fun lt!273438 () Unit!12805)

(assert (=> b!177974 (= lt!273438 lt!273440)))

(assert (=> b!177974 (invariant!0 (currentBit!8856 (_2!8311 lt!273232)) (currentByte!8861 (_2!8311 lt!273232)) (size!4229 (buf!4672 (_2!8311 lt!273458))))))

(declare-fun lt!273451 () BitStream!7566)

(assert (=> b!177974 (= lt!273451 (BitStream!7567 (buf!4672 (_2!8311 lt!273458)) (currentByte!8861 (_2!8311 lt!273232)) (currentBit!8856 (_2!8311 lt!273232))))))

(assert (=> b!177974 (invariant!0 (currentBit!8856 lt!273451) (currentByte!8861 lt!273451) (size!4229 (buf!4672 (_2!8311 lt!273444))))))

(declare-fun lt!273429 () BitStream!7566)

(assert (=> b!177974 (= lt!273429 (BitStream!7567 (buf!4672 (_2!8311 lt!273444)) (currentByte!8861 lt!273451) (currentBit!8856 lt!273451)))))

(assert (=> b!177974 (= lt!273430 (readBitPure!0 lt!273451))))

(assert (=> b!177974 (= lt!273466 (readBitPure!0 lt!273429))))

(declare-fun lt!273428 () Unit!12805)

(declare-fun readBitPrefixLemma!0 (BitStream!7566 BitStream!7566) Unit!12805)

(assert (=> b!177974 (= lt!273428 (readBitPrefixLemma!0 lt!273451 (_2!8311 lt!273444)))))

(declare-fun res!147569 () Bool)

(assert (=> b!177974 (= res!147569 (= (bitIndex!0 (size!4229 (buf!4672 (_1!8310 lt!273430))) (currentByte!8861 (_1!8310 lt!273430)) (currentBit!8856 (_1!8310 lt!273430))) (bitIndex!0 (size!4229 (buf!4672 (_1!8310 lt!273466))) (currentByte!8861 (_1!8310 lt!273466)) (currentBit!8856 (_1!8310 lt!273466)))))))

(assert (=> b!177974 (=> (not res!147569) (not e!123982))))

(assert (=> b!177974 e!123982))

(declare-fun lt!273473 () Unit!12805)

(assert (=> b!177974 (= lt!273473 lt!273428)))

(declare-datatypes ((tuple2!15338 0))(
  ( (tuple2!15339 (_1!8314 BitStream!7566) (_2!8314 BitStream!7566)) )
))
(declare-fun lt!273436 () tuple2!15338)

(declare-fun reader!0 (BitStream!7566 BitStream!7566) tuple2!15338)

(assert (=> b!177974 (= lt!273436 (reader!0 (_2!8311 lt!273232) (_2!8311 lt!273444)))))

(declare-fun lt!273459 () tuple2!15338)

(assert (=> b!177974 (= lt!273459 (reader!0 (_2!8311 lt!273458) (_2!8311 lt!273444)))))

(declare-fun lt!273439 () tuple2!15330)

(assert (=> b!177974 (= lt!273439 (readBitPure!0 (_1!8314 lt!273436)))))

(assert (=> b!177974 (= (_2!8310 lt!273439) lt!273465)))

(declare-fun lt!273437 () Unit!12805)

(declare-fun Unit!12809 () Unit!12805)

(assert (=> b!177974 (= lt!273437 Unit!12809)))

(declare-fun lt!273442 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177974 (= lt!273442 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273453 () (_ BitVec 64))

(assert (=> b!177974 (= lt!273453 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273479 () Unit!12805)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7566 array!9592 (_ BitVec 64)) Unit!12805)

(assert (=> b!177974 (= lt!273479 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8311 lt!273232) (buf!4672 (_2!8311 lt!273444)) lt!273453))))

(assert (=> b!177974 (validate_offset_bits!1 ((_ sign_extend 32) (size!4229 (buf!4672 (_2!8311 lt!273444)))) ((_ sign_extend 32) (currentByte!8861 (_2!8311 lt!273232))) ((_ sign_extend 32) (currentBit!8856 (_2!8311 lt!273232))) lt!273453)))

(declare-fun lt!273469 () Unit!12805)

(assert (=> b!177974 (= lt!273469 lt!273479)))

(declare-datatypes ((tuple2!15340 0))(
  ( (tuple2!15341 (_1!8315 BitStream!7566) (_2!8315 (_ BitVec 64))) )
))
(declare-fun lt!273472 () tuple2!15340)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15340)

(assert (=> b!177974 (= lt!273472 (readNBitsLSBFirstsLoopPure!0 (_1!8314 lt!273436) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!273442))))

(declare-fun lt!273441 () (_ BitVec 64))

(assert (=> b!177974 (= lt!273441 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!273450 () Unit!12805)

(assert (=> b!177974 (= lt!273450 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8311 lt!273458) (buf!4672 (_2!8311 lt!273444)) lt!273441))))

(assert (=> b!177974 (validate_offset_bits!1 ((_ sign_extend 32) (size!4229 (buf!4672 (_2!8311 lt!273444)))) ((_ sign_extend 32) (currentByte!8861 (_2!8311 lt!273458))) ((_ sign_extend 32) (currentBit!8856 (_2!8311 lt!273458))) lt!273441)))

(declare-fun lt!273476 () Unit!12805)

(assert (=> b!177974 (= lt!273476 lt!273450)))

(declare-fun lt!273478 () tuple2!15340)

(assert (=> b!177974 (= lt!273478 (readNBitsLSBFirstsLoopPure!0 (_1!8314 lt!273459) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!273442 (ite (_2!8310 lt!273439) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!273443 () tuple2!15340)

(assert (=> b!177974 (= lt!273443 (readNBitsLSBFirstsLoopPure!0 (_1!8314 lt!273436) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!273442))))

(declare-fun c!9263 () Bool)

(assert (=> b!177974 (= c!9263 (_2!8310 (readBitPure!0 (_1!8314 lt!273436))))))

(declare-fun lt!273431 () tuple2!15340)

(declare-fun e!123980 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7566 (_ BitVec 64)) BitStream!7566)

(assert (=> b!177974 (= lt!273431 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8314 lt!273436) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!273442 e!123980)))))

(declare-fun lt!273452 () Unit!12805)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12805)

(assert (=> b!177974 (= lt!273452 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8314 lt!273436) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!273442))))

(assert (=> b!177974 (and (= (_2!8315 lt!273443) (_2!8315 lt!273431)) (= (_1!8315 lt!273443) (_1!8315 lt!273431)))))

(declare-fun lt!273425 () Unit!12805)

(assert (=> b!177974 (= lt!273425 lt!273452)))

(assert (=> b!177974 (= (_1!8314 lt!273436) (withMovedBitIndex!0 (_2!8314 lt!273436) (bvsub (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273232))) (currentByte!8861 (_2!8311 lt!273232)) (currentBit!8856 (_2!8311 lt!273232))) (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273444))) (currentByte!8861 (_2!8311 lt!273444)) (currentBit!8856 (_2!8311 lt!273444))))))))

(declare-fun lt!273477 () Unit!12805)

(declare-fun Unit!12810 () Unit!12805)

(assert (=> b!177974 (= lt!273477 Unit!12810)))

(assert (=> b!177974 (= (_1!8314 lt!273459) (withMovedBitIndex!0 (_2!8314 lt!273459) (bvsub (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273458))) (currentByte!8861 (_2!8311 lt!273458)) (currentBit!8856 (_2!8311 lt!273458))) (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273444))) (currentByte!8861 (_2!8311 lt!273444)) (currentBit!8856 (_2!8311 lt!273444))))))))

(declare-fun lt!273468 () Unit!12805)

(declare-fun Unit!12811 () Unit!12805)

(assert (=> b!177974 (= lt!273468 Unit!12811)))

(assert (=> b!177974 (= (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273232))) (currentByte!8861 (_2!8311 lt!273232)) (currentBit!8856 (_2!8311 lt!273232))) (bvsub (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273458))) (currentByte!8861 (_2!8311 lt!273458)) (currentBit!8856 (_2!8311 lt!273458))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!273446 () Unit!12805)

(declare-fun Unit!12812 () Unit!12805)

(assert (=> b!177974 (= lt!273446 Unit!12812)))

(assert (=> b!177974 (= (_2!8315 lt!273472) (_2!8315 lt!273478))))

(declare-fun lt!273457 () Unit!12805)

(declare-fun Unit!12813 () Unit!12805)

(assert (=> b!177974 (= lt!273457 Unit!12813)))

(assert (=> b!177974 (invariant!0 (currentBit!8856 (_2!8311 lt!273444)) (currentByte!8861 (_2!8311 lt!273444)) (size!4229 (buf!4672 (_2!8311 lt!273444))))))

(declare-fun lt!273448 () Unit!12805)

(declare-fun Unit!12814 () Unit!12805)

(assert (=> b!177974 (= lt!273448 Unit!12814)))

(assert (=> b!177974 (= (size!4229 (buf!4672 (_2!8311 lt!273232))) (size!4229 (buf!4672 (_2!8311 lt!273444))))))

(declare-fun lt!273435 () Unit!12805)

(declare-fun Unit!12815 () Unit!12805)

(assert (=> b!177974 (= lt!273435 Unit!12815)))

(assert (=> b!177974 (= (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273444))) (currentByte!8861 (_2!8311 lt!273444)) (currentBit!8856 (_2!8311 lt!273444))) (bvsub (bvadd (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273232))) (currentByte!8861 (_2!8311 lt!273232)) (currentBit!8856 (_2!8311 lt!273232))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273455 () Unit!12805)

(declare-fun Unit!12816 () Unit!12805)

(assert (=> b!177974 (= lt!273455 Unit!12816)))

(declare-fun lt!273475 () Unit!12805)

(declare-fun Unit!12817 () Unit!12805)

(assert (=> b!177974 (= lt!273475 Unit!12817)))

(declare-fun lt!273470 () tuple2!15338)

(assert (=> b!177974 (= lt!273470 (reader!0 (_2!8311 lt!273232) (_2!8311 lt!273444)))))

(declare-fun lt!273447 () (_ BitVec 64))

(assert (=> b!177974 (= lt!273447 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273461 () Unit!12805)

(assert (=> b!177974 (= lt!273461 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8311 lt!273232) (buf!4672 (_2!8311 lt!273444)) lt!273447))))

(assert (=> b!177974 (validate_offset_bits!1 ((_ sign_extend 32) (size!4229 (buf!4672 (_2!8311 lt!273444)))) ((_ sign_extend 32) (currentByte!8861 (_2!8311 lt!273232))) ((_ sign_extend 32) (currentBit!8856 (_2!8311 lt!273232))) lt!273447)))

(declare-fun lt!273464 () Unit!12805)

(assert (=> b!177974 (= lt!273464 lt!273461)))

(declare-fun lt!273463 () tuple2!15340)

(assert (=> b!177974 (= lt!273463 (readNBitsLSBFirstsLoopPure!0 (_1!8314 lt!273470) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!147570 () Bool)

(assert (=> b!177974 (= res!147570 (= (_2!8315 lt!273463) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!123983 () Bool)

(assert (=> b!177974 (=> (not res!147570) (not e!123983))))

(assert (=> b!177974 e!123983))

(declare-fun lt!273474 () Unit!12805)

(declare-fun Unit!12818 () Unit!12805)

(assert (=> b!177974 (= lt!273474 Unit!12818)))

(declare-fun b!177975 () Bool)

(declare-fun res!147571 () Bool)

(declare-fun e!123975 () Bool)

(assert (=> b!177975 (=> (not res!147571) (not e!123975))))

(declare-fun lt!273434 () tuple2!15332)

(assert (=> b!177975 (= res!147571 (= (size!4229 (buf!4672 (_2!8311 lt!273232))) (size!4229 (buf!4672 (_2!8311 lt!273434)))))))

(declare-fun b!177976 () Bool)

(assert (=> b!177976 (= e!123983 (= (_1!8315 lt!273463) (_2!8314 lt!273470)))))

(declare-fun b!177977 () Bool)

(assert (=> b!177977 (= e!123980 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!177978 () Bool)

(declare-fun lt!273471 () tuple2!15330)

(assert (=> b!177978 (= lt!273471 (readBitPure!0 (readerFrom!0 (_2!8311 lt!273427) (currentBit!8856 (_2!8311 lt!273232)) (currentByte!8861 (_2!8311 lt!273232)))))))

(declare-fun res!147574 () Bool)

(assert (=> b!177978 (= res!147574 (and (= (_2!8310 lt!273471) lt!273465) (= (_1!8310 lt!273471) (_2!8311 lt!273427))))))

(declare-fun e!123979 () Bool)

(assert (=> b!177978 (=> (not res!147574) (not e!123979))))

(assert (=> b!177978 (= e!123976 e!123979)))

(declare-fun d!62547 () Bool)

(assert (=> d!62547 e!123975))

(declare-fun res!147576 () Bool)

(assert (=> d!62547 (=> (not res!147576) (not e!123975))))

(assert (=> d!62547 (= res!147576 (invariant!0 (currentBit!8856 (_2!8311 lt!273434)) (currentByte!8861 (_2!8311 lt!273434)) (size!4229 (buf!4672 (_2!8311 lt!273434)))))))

(assert (=> d!62547 (= lt!273434 e!123981)))

(declare-fun c!9264 () Bool)

(assert (=> d!62547 (= c!9264 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!62547 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!62547 (= (appendBitsLSBFirstLoopTR!0 (_2!8311 lt!273232) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!273434)))

(declare-fun b!177971 () Bool)

(declare-fun res!147575 () Bool)

(assert (=> b!177971 (=> (not res!147575) (not e!123975))))

(assert (=> b!177971 (= res!147575 (isPrefixOf!0 (_2!8311 lt!273232) (_2!8311 lt!273434)))))

(declare-fun b!177979 () Bool)

(declare-fun res!147566 () Bool)

(assert (=> b!177979 (=> (not res!147566) (not e!123975))))

(declare-fun lt!273467 () (_ BitVec 64))

(declare-fun lt!273460 () (_ BitVec 64))

(assert (=> b!177979 (= res!147566 (= (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273434))) (currentByte!8861 (_2!8311 lt!273434)) (currentBit!8856 (_2!8311 lt!273434))) (bvsub lt!273467 lt!273460)))))

(assert (=> b!177979 (or (= (bvand lt!273467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273460 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273467 lt!273460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177979 (= lt!273460 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!273432 () (_ BitVec 64))

(declare-fun lt!273454 () (_ BitVec 64))

(assert (=> b!177979 (= lt!273467 (bvadd lt!273432 lt!273454))))

(assert (=> b!177979 (or (not (= (bvand lt!273432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273454 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!273432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!273432 lt!273454) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177979 (= lt!273454 ((_ sign_extend 32) nBits!348))))

(assert (=> b!177979 (= lt!273432 (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273232))) (currentByte!8861 (_2!8311 lt!273232)) (currentBit!8856 (_2!8311 lt!273232))))))

(declare-fun b!177980 () Bool)

(declare-fun Unit!12819 () Unit!12805)

(assert (=> b!177980 (= e!123981 (tuple2!15333 Unit!12819 (_2!8311 lt!273232)))))

(declare-fun lt!273456 () Unit!12805)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7566) Unit!12805)

(assert (=> b!177980 (= lt!273456 (lemmaIsPrefixRefl!0 (_2!8311 lt!273232)))))

(assert (=> b!177980 call!2921))

(declare-fun lt!273449 () Unit!12805)

(assert (=> b!177980 (= lt!273449 lt!273456)))

(declare-fun b!177981 () Bool)

(assert (=> b!177981 (= e!123980 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun bm!2918 () Bool)

(assert (=> bm!2918 (= call!2921 (isPrefixOf!0 (_2!8311 lt!273232) (ite c!9264 (_2!8311 lt!273232) (_2!8311 lt!273444))))))

(declare-fun b!177982 () Bool)

(assert (=> b!177982 (= e!123979 (= (bitIndex!0 (size!4229 (buf!4672 (_1!8310 lt!273471))) (currentByte!8861 (_1!8310 lt!273471)) (currentBit!8856 (_1!8310 lt!273471))) (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273427))) (currentByte!8861 (_2!8311 lt!273427)) (currentBit!8856 (_2!8311 lt!273427)))))))

(declare-fun b!177983 () Bool)

(declare-fun e!123978 () Bool)

(assert (=> b!177983 (= e!123975 e!123978)))

(declare-fun res!147567 () Bool)

(assert (=> b!177983 (=> (not res!147567) (not e!123978))))

(declare-fun lt!273433 () tuple2!15340)

(assert (=> b!177983 (= res!147567 (= (_2!8315 lt!273433) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!273426 () tuple2!15338)

(assert (=> b!177983 (= lt!273433 (readNBitsLSBFirstsLoopPure!0 (_1!8314 lt!273426) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!273424 () Unit!12805)

(declare-fun lt!273462 () Unit!12805)

(assert (=> b!177983 (= lt!273424 lt!273462)))

(declare-fun lt!273445 () (_ BitVec 64))

(assert (=> b!177983 (validate_offset_bits!1 ((_ sign_extend 32) (size!4229 (buf!4672 (_2!8311 lt!273434)))) ((_ sign_extend 32) (currentByte!8861 (_2!8311 lt!273232))) ((_ sign_extend 32) (currentBit!8856 (_2!8311 lt!273232))) lt!273445)))

(assert (=> b!177983 (= lt!273462 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8311 lt!273232) (buf!4672 (_2!8311 lt!273434)) lt!273445))))

(declare-fun e!123977 () Bool)

(assert (=> b!177983 e!123977))

(declare-fun res!147568 () Bool)

(assert (=> b!177983 (=> (not res!147568) (not e!123977))))

(assert (=> b!177983 (= res!147568 (and (= (size!4229 (buf!4672 (_2!8311 lt!273232))) (size!4229 (buf!4672 (_2!8311 lt!273434)))) (bvsge lt!273445 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177983 (= lt!273445 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!177983 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!177983 (= lt!273426 (reader!0 (_2!8311 lt!273232) (_2!8311 lt!273434)))))

(declare-fun b!177984 () Bool)

(assert (=> b!177984 (= e!123978 (= (_1!8315 lt!273433) (_2!8314 lt!273426)))))

(declare-fun b!177985 () Bool)

(declare-fun res!147573 () Bool)

(assert (=> b!177985 (= res!147573 (isPrefixOf!0 (_2!8311 lt!273232) (_2!8311 lt!273427)))))

(assert (=> b!177985 (=> (not res!147573) (not e!123976))))

(declare-fun b!177986 () Bool)

(assert (=> b!177986 (= e!123977 (validate_offset_bits!1 ((_ sign_extend 32) (size!4229 (buf!4672 (_2!8311 lt!273232)))) ((_ sign_extend 32) (currentByte!8861 (_2!8311 lt!273232))) ((_ sign_extend 32) (currentBit!8856 (_2!8311 lt!273232))) lt!273445))))

(assert (= (and d!62547 c!9264) b!177980))

(assert (= (and d!62547 (not c!9264)) b!177974))

(assert (= (and b!177974 res!147572) b!177972))

(assert (= (and b!177972 res!147565) b!177985))

(assert (= (and b!177985 res!147573) b!177978))

(assert (= (and b!177978 res!147574) b!177982))

(assert (= (and b!177974 res!147569) b!177973))

(assert (= (and b!177974 c!9263) b!177981))

(assert (= (and b!177974 (not c!9263)) b!177977))

(assert (= (and b!177974 res!147570) b!177976))

(assert (= (or b!177980 b!177974) bm!2918))

(assert (= (and d!62547 res!147576) b!177975))

(assert (= (and b!177975 res!147571) b!177979))

(assert (= (and b!177979 res!147566) b!177971))

(assert (= (and b!177971 res!147575) b!177983))

(assert (= (and b!177983 res!147568) b!177986))

(assert (= (and b!177983 res!147567) b!177984))

(declare-fun m!277979 () Bool)

(assert (=> b!177980 m!277979))

(declare-fun m!277981 () Bool)

(assert (=> b!177985 m!277981))

(declare-fun m!277983 () Bool)

(assert (=> d!62547 m!277983))

(declare-fun m!277985 () Bool)

(assert (=> b!177982 m!277985))

(declare-fun m!277987 () Bool)

(assert (=> b!177982 m!277987))

(declare-fun m!277989 () Bool)

(assert (=> b!177979 m!277989))

(assert (=> b!177979 m!277875))

(declare-fun m!277991 () Bool)

(assert (=> b!177986 m!277991))

(declare-fun m!277993 () Bool)

(assert (=> b!177978 m!277993))

(assert (=> b!177978 m!277993))

(declare-fun m!277995 () Bool)

(assert (=> b!177978 m!277995))

(assert (=> b!177972 m!277987))

(assert (=> b!177972 m!277875))

(declare-fun m!277997 () Bool)

(assert (=> b!177983 m!277997))

(declare-fun m!277999 () Bool)

(assert (=> b!177983 m!277999))

(declare-fun m!278001 () Bool)

(assert (=> b!177983 m!278001))

(declare-fun m!278003 () Bool)

(assert (=> b!177983 m!278003))

(declare-fun m!278005 () Bool)

(assert (=> b!177983 m!278005))

(declare-fun m!278007 () Bool)

(assert (=> b!177983 m!278007))

(declare-fun m!278009 () Bool)

(assert (=> b!177974 m!278009))

(assert (=> b!177974 m!277997))

(declare-fun m!278011 () Bool)

(assert (=> b!177974 m!278011))

(declare-fun m!278013 () Bool)

(assert (=> b!177974 m!278013))

(assert (=> b!177974 m!277875))

(declare-fun m!278015 () Bool)

(assert (=> b!177974 m!278015))

(declare-fun m!278017 () Bool)

(assert (=> b!177974 m!278017))

(declare-fun m!278019 () Bool)

(assert (=> b!177974 m!278019))

(declare-fun m!278021 () Bool)

(assert (=> b!177974 m!278021))

(declare-fun m!278023 () Bool)

(assert (=> b!177974 m!278023))

(declare-fun m!278025 () Bool)

(assert (=> b!177974 m!278025))

(declare-fun m!278027 () Bool)

(assert (=> b!177974 m!278027))

(declare-fun m!278029 () Bool)

(assert (=> b!177974 m!278029))

(declare-fun m!278031 () Bool)

(assert (=> b!177974 m!278031))

(declare-fun m!278033 () Bool)

(assert (=> b!177974 m!278033))

(declare-fun m!278035 () Bool)

(assert (=> b!177974 m!278035))

(declare-fun m!278037 () Bool)

(assert (=> b!177974 m!278037))

(assert (=> b!177974 m!278017))

(declare-fun m!278039 () Bool)

(assert (=> b!177974 m!278039))

(assert (=> b!177974 m!277999))

(declare-fun m!278041 () Bool)

(assert (=> b!177974 m!278041))

(declare-fun m!278043 () Bool)

(assert (=> b!177974 m!278043))

(declare-fun m!278045 () Bool)

(assert (=> b!177974 m!278045))

(declare-fun m!278047 () Bool)

(assert (=> b!177974 m!278047))

(declare-fun m!278049 () Bool)

(assert (=> b!177974 m!278049))

(declare-fun m!278051 () Bool)

(assert (=> b!177974 m!278051))

(declare-fun m!278053 () Bool)

(assert (=> b!177974 m!278053))

(declare-fun m!278055 () Bool)

(assert (=> b!177974 m!278055))

(declare-fun m!278057 () Bool)

(assert (=> b!177974 m!278057))

(declare-fun m!278059 () Bool)

(assert (=> b!177974 m!278059))

(declare-fun m!278061 () Bool)

(assert (=> b!177974 m!278061))

(declare-fun m!278063 () Bool)

(assert (=> b!177974 m!278063))

(declare-fun m!278065 () Bool)

(assert (=> b!177974 m!278065))

(declare-fun m!278067 () Bool)

(assert (=> b!177974 m!278067))

(declare-fun m!278069 () Bool)

(assert (=> b!177971 m!278069))

(declare-fun m!278071 () Bool)

(assert (=> bm!2918 m!278071))

(assert (=> b!177847 d!62547))

(declare-fun d!62593 () Bool)

(declare-fun e!123986 () Bool)

(assert (=> d!62593 e!123986))

(declare-fun res!147582 () Bool)

(assert (=> d!62593 (=> (not res!147582) (not e!123986))))

(declare-fun lt!273495 () (_ BitVec 64))

(declare-fun lt!273494 () (_ BitVec 64))

(declare-fun lt!273496 () (_ BitVec 64))

(assert (=> d!62593 (= res!147582 (= lt!273496 (bvsub lt!273495 lt!273494)))))

(assert (=> d!62593 (or (= (bvand lt!273495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273494 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273495 lt!273494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62593 (= lt!273494 (remainingBits!0 ((_ sign_extend 32) (size!4229 (buf!4672 (_1!8310 lt!273228)))) ((_ sign_extend 32) (currentByte!8861 (_1!8310 lt!273228))) ((_ sign_extend 32) (currentBit!8856 (_1!8310 lt!273228)))))))

(declare-fun lt!273497 () (_ BitVec 64))

(declare-fun lt!273492 () (_ BitVec 64))

(assert (=> d!62593 (= lt!273495 (bvmul lt!273497 lt!273492))))

(assert (=> d!62593 (or (= lt!273497 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!273492 (bvsdiv (bvmul lt!273497 lt!273492) lt!273497)))))

(assert (=> d!62593 (= lt!273492 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62593 (= lt!273497 ((_ sign_extend 32) (size!4229 (buf!4672 (_1!8310 lt!273228)))))))

(assert (=> d!62593 (= lt!273496 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8861 (_1!8310 lt!273228))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8856 (_1!8310 lt!273228)))))))

(assert (=> d!62593 (invariant!0 (currentBit!8856 (_1!8310 lt!273228)) (currentByte!8861 (_1!8310 lt!273228)) (size!4229 (buf!4672 (_1!8310 lt!273228))))))

(assert (=> d!62593 (= (bitIndex!0 (size!4229 (buf!4672 (_1!8310 lt!273228))) (currentByte!8861 (_1!8310 lt!273228)) (currentBit!8856 (_1!8310 lt!273228))) lt!273496)))

(declare-fun b!177991 () Bool)

(declare-fun res!147581 () Bool)

(assert (=> b!177991 (=> (not res!147581) (not e!123986))))

(assert (=> b!177991 (= res!147581 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!273496))))

(declare-fun b!177992 () Bool)

(declare-fun lt!273493 () (_ BitVec 64))

(assert (=> b!177992 (= e!123986 (bvsle lt!273496 (bvmul lt!273493 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177992 (or (= lt!273493 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!273493 #b0000000000000000000000000000000000000000000000000000000000001000) lt!273493)))))

(assert (=> b!177992 (= lt!273493 ((_ sign_extend 32) (size!4229 (buf!4672 (_1!8310 lt!273228)))))))

(assert (= (and d!62593 res!147582) b!177991))

(assert (= (and b!177991 res!147581) b!177992))

(declare-fun m!278073 () Bool)

(assert (=> d!62593 m!278073))

(declare-fun m!278075 () Bool)

(assert (=> d!62593 m!278075))

(assert (=> b!177842 d!62593))

(declare-fun d!62595 () Bool)

(declare-fun e!123987 () Bool)

(assert (=> d!62595 e!123987))

(declare-fun res!147584 () Bool)

(assert (=> d!62595 (=> (not res!147584) (not e!123987))))

(declare-fun lt!273500 () (_ BitVec 64))

(declare-fun lt!273501 () (_ BitVec 64))

(declare-fun lt!273502 () (_ BitVec 64))

(assert (=> d!62595 (= res!147584 (= lt!273502 (bvsub lt!273501 lt!273500)))))

(assert (=> d!62595 (or (= (bvand lt!273501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273500 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273501 lt!273500) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62595 (= lt!273500 (remainingBits!0 ((_ sign_extend 32) (size!4229 (buf!4672 (_2!8311 lt!273232)))) ((_ sign_extend 32) (currentByte!8861 (_2!8311 lt!273232))) ((_ sign_extend 32) (currentBit!8856 (_2!8311 lt!273232)))))))

(declare-fun lt!273503 () (_ BitVec 64))

(declare-fun lt!273498 () (_ BitVec 64))

(assert (=> d!62595 (= lt!273501 (bvmul lt!273503 lt!273498))))

(assert (=> d!62595 (or (= lt!273503 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!273498 (bvsdiv (bvmul lt!273503 lt!273498) lt!273503)))))

(assert (=> d!62595 (= lt!273498 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62595 (= lt!273503 ((_ sign_extend 32) (size!4229 (buf!4672 (_2!8311 lt!273232)))))))

(assert (=> d!62595 (= lt!273502 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8861 (_2!8311 lt!273232))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8856 (_2!8311 lt!273232)))))))

(assert (=> d!62595 (invariant!0 (currentBit!8856 (_2!8311 lt!273232)) (currentByte!8861 (_2!8311 lt!273232)) (size!4229 (buf!4672 (_2!8311 lt!273232))))))

(assert (=> d!62595 (= (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273232))) (currentByte!8861 (_2!8311 lt!273232)) (currentBit!8856 (_2!8311 lt!273232))) lt!273502)))

(declare-fun b!177993 () Bool)

(declare-fun res!147583 () Bool)

(assert (=> b!177993 (=> (not res!147583) (not e!123987))))

(assert (=> b!177993 (= res!147583 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!273502))))

(declare-fun b!177994 () Bool)

(declare-fun lt!273499 () (_ BitVec 64))

(assert (=> b!177994 (= e!123987 (bvsle lt!273502 (bvmul lt!273499 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177994 (or (= lt!273499 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!273499 #b0000000000000000000000000000000000000000000000000000000000001000) lt!273499)))))

(assert (=> b!177994 (= lt!273499 ((_ sign_extend 32) (size!4229 (buf!4672 (_2!8311 lt!273232)))))))

(assert (= (and d!62595 res!147584) b!177993))

(assert (= (and b!177993 res!147583) b!177994))

(declare-fun m!278077 () Bool)

(assert (=> d!62595 m!278077))

(assert (=> d!62595 m!277887))

(assert (=> b!177848 d!62595))

(declare-fun d!62597 () Bool)

(declare-fun e!123988 () Bool)

(assert (=> d!62597 e!123988))

(declare-fun res!147586 () Bool)

(assert (=> d!62597 (=> (not res!147586) (not e!123988))))

(declare-fun lt!273506 () (_ BitVec 64))

(declare-fun lt!273508 () (_ BitVec 64))

(declare-fun lt!273507 () (_ BitVec 64))

(assert (=> d!62597 (= res!147586 (= lt!273508 (bvsub lt!273507 lt!273506)))))

(assert (=> d!62597 (or (= (bvand lt!273507 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273506 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273507 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273507 lt!273506) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62597 (= lt!273506 (remainingBits!0 ((_ sign_extend 32) (size!4229 (buf!4672 thiss!1204))) ((_ sign_extend 32) (currentByte!8861 thiss!1204)) ((_ sign_extend 32) (currentBit!8856 thiss!1204))))))

(declare-fun lt!273509 () (_ BitVec 64))

(declare-fun lt!273504 () (_ BitVec 64))

(assert (=> d!62597 (= lt!273507 (bvmul lt!273509 lt!273504))))

(assert (=> d!62597 (or (= lt!273509 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!273504 (bvsdiv (bvmul lt!273509 lt!273504) lt!273509)))))

(assert (=> d!62597 (= lt!273504 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62597 (= lt!273509 ((_ sign_extend 32) (size!4229 (buf!4672 thiss!1204))))))

(assert (=> d!62597 (= lt!273508 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8861 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8856 thiss!1204))))))

(assert (=> d!62597 (invariant!0 (currentBit!8856 thiss!1204) (currentByte!8861 thiss!1204) (size!4229 (buf!4672 thiss!1204)))))

(assert (=> d!62597 (= (bitIndex!0 (size!4229 (buf!4672 thiss!1204)) (currentByte!8861 thiss!1204) (currentBit!8856 thiss!1204)) lt!273508)))

(declare-fun b!177995 () Bool)

(declare-fun res!147585 () Bool)

(assert (=> b!177995 (=> (not res!147585) (not e!123988))))

(assert (=> b!177995 (= res!147585 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!273508))))

(declare-fun b!177996 () Bool)

(declare-fun lt!273505 () (_ BitVec 64))

(assert (=> b!177996 (= e!123988 (bvsle lt!273508 (bvmul lt!273505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177996 (or (= lt!273505 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!273505 #b0000000000000000000000000000000000000000000000000000000000001000) lt!273505)))))

(assert (=> b!177996 (= lt!273505 ((_ sign_extend 32) (size!4229 (buf!4672 thiss!1204))))))

(assert (= (and d!62597 res!147586) b!177995))

(assert (= (and b!177995 res!147585) b!177996))

(declare-fun m!278079 () Bool)

(assert (=> d!62597 m!278079))

(assert (=> d!62597 m!277883))

(assert (=> b!177848 d!62597))

(declare-fun d!62599 () Bool)

(assert (=> d!62599 (= (array_inv!3970 (buf!4672 thiss!1204)) (bvsge (size!4229 (buf!4672 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!177843 d!62599))

(assert (=> b!177849 d!62595))

(assert (=> b!177849 d!62597))

(declare-fun b!178006 () Bool)

(declare-fun res!147595 () Bool)

(declare-fun e!123994 () Bool)

(assert (=> b!178006 (=> (not res!147595) (not e!123994))))

(declare-fun lt!273518 () (_ BitVec 64))

(declare-fun lt!273520 () tuple2!15332)

(declare-fun lt!273521 () (_ BitVec 64))

(assert (=> b!178006 (= res!147595 (= (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273520))) (currentByte!8861 (_2!8311 lt!273520)) (currentBit!8856 (_2!8311 lt!273520))) (bvadd lt!273521 lt!273518)))))

(assert (=> b!178006 (or (not (= (bvand lt!273521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273518 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!273521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!273521 lt!273518) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178006 (= lt!273518 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!178006 (= lt!273521 (bitIndex!0 (size!4229 (buf!4672 thiss!1204)) (currentByte!8861 thiss!1204) (currentBit!8856 thiss!1204)))))

(declare-fun d!62601 () Bool)

(assert (=> d!62601 e!123994))

(declare-fun res!147597 () Bool)

(assert (=> d!62601 (=> (not res!147597) (not e!123994))))

(assert (=> d!62601 (= res!147597 (= (size!4229 (buf!4672 thiss!1204)) (size!4229 (buf!4672 (_2!8311 lt!273520)))))))

(declare-fun choose!16 (BitStream!7566 Bool) tuple2!15332)

(assert (=> d!62601 (= lt!273520 (choose!16 thiss!1204 lt!273233))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62601 (validate_offset_bit!0 ((_ sign_extend 32) (size!4229 (buf!4672 thiss!1204))) ((_ sign_extend 32) (currentByte!8861 thiss!1204)) ((_ sign_extend 32) (currentBit!8856 thiss!1204)))))

(assert (=> d!62601 (= (appendBit!0 thiss!1204 lt!273233) lt!273520)))

(declare-fun b!178009 () Bool)

(declare-fun e!123993 () Bool)

(declare-fun lt!273519 () tuple2!15330)

(assert (=> b!178009 (= e!123993 (= (bitIndex!0 (size!4229 (buf!4672 (_1!8310 lt!273519))) (currentByte!8861 (_1!8310 lt!273519)) (currentBit!8856 (_1!8310 lt!273519))) (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273520))) (currentByte!8861 (_2!8311 lt!273520)) (currentBit!8856 (_2!8311 lt!273520)))))))

(declare-fun b!178008 () Bool)

(assert (=> b!178008 (= e!123994 e!123993)))

(declare-fun res!147598 () Bool)

(assert (=> b!178008 (=> (not res!147598) (not e!123993))))

(assert (=> b!178008 (= res!147598 (and (= (_2!8310 lt!273519) lt!273233) (= (_1!8310 lt!273519) (_2!8311 lt!273520))))))

(assert (=> b!178008 (= lt!273519 (readBitPure!0 (readerFrom!0 (_2!8311 lt!273520) (currentBit!8856 thiss!1204) (currentByte!8861 thiss!1204))))))

(declare-fun b!178007 () Bool)

(declare-fun res!147596 () Bool)

(assert (=> b!178007 (=> (not res!147596) (not e!123994))))

(assert (=> b!178007 (= res!147596 (isPrefixOf!0 thiss!1204 (_2!8311 lt!273520)))))

(assert (= (and d!62601 res!147597) b!178006))

(assert (= (and b!178006 res!147595) b!178007))

(assert (= (and b!178007 res!147596) b!178008))

(assert (= (and b!178008 res!147598) b!178009))

(declare-fun m!278081 () Bool)

(assert (=> b!178006 m!278081))

(assert (=> b!178006 m!277877))

(declare-fun m!278083 () Bool)

(assert (=> b!178008 m!278083))

(assert (=> b!178008 m!278083))

(declare-fun m!278085 () Bool)

(assert (=> b!178008 m!278085))

(declare-fun m!278087 () Bool)

(assert (=> b!178007 m!278087))

(declare-fun m!278089 () Bool)

(assert (=> d!62601 m!278089))

(declare-fun m!278091 () Bool)

(assert (=> d!62601 m!278091))

(declare-fun m!278093 () Bool)

(assert (=> b!178009 m!278093))

(assert (=> b!178009 m!278081))

(assert (=> b!177849 d!62601))

(declare-fun d!62603 () Bool)

(declare-datatypes ((tuple2!15342 0))(
  ( (tuple2!15343 (_1!8316 Bool) (_2!8316 BitStream!7566)) )
))
(declare-fun lt!273524 () tuple2!15342)

(declare-fun readBit!0 (BitStream!7566) tuple2!15342)

(assert (=> d!62603 (= lt!273524 (readBit!0 (readerFrom!0 (_2!8311 lt!273232) (currentBit!8856 thiss!1204) (currentByte!8861 thiss!1204))))))

(assert (=> d!62603 (= (readBitPure!0 (readerFrom!0 (_2!8311 lt!273232) (currentBit!8856 thiss!1204) (currentByte!8861 thiss!1204))) (tuple2!15331 (_2!8316 lt!273524) (_1!8316 lt!273524)))))

(declare-fun bs!15601 () Bool)

(assert (= bs!15601 d!62603))

(assert (=> bs!15601 m!277869))

(declare-fun m!278095 () Bool)

(assert (=> bs!15601 m!278095))

(assert (=> b!177844 d!62603))

(declare-fun d!62605 () Bool)

(declare-fun e!123997 () Bool)

(assert (=> d!62605 e!123997))

(declare-fun res!147602 () Bool)

(assert (=> d!62605 (=> (not res!147602) (not e!123997))))

(assert (=> d!62605 (= res!147602 (invariant!0 (currentBit!8856 (_2!8311 lt!273232)) (currentByte!8861 (_2!8311 lt!273232)) (size!4229 (buf!4672 (_2!8311 lt!273232)))))))

(assert (=> d!62605 (= (readerFrom!0 (_2!8311 lt!273232) (currentBit!8856 thiss!1204) (currentByte!8861 thiss!1204)) (BitStream!7567 (buf!4672 (_2!8311 lt!273232)) (currentByte!8861 thiss!1204) (currentBit!8856 thiss!1204)))))

(declare-fun b!178012 () Bool)

(assert (=> b!178012 (= e!123997 (invariant!0 (currentBit!8856 thiss!1204) (currentByte!8861 thiss!1204) (size!4229 (buf!4672 (_2!8311 lt!273232)))))))

(assert (= (and d!62605 res!147602) b!178012))

(assert (=> d!62605 m!277887))

(declare-fun m!278097 () Bool)

(assert (=> b!178012 m!278097))

(assert (=> b!177844 d!62605))

(declare-fun d!62607 () Bool)

(declare-fun res!147603 () Bool)

(declare-fun e!123998 () Bool)

(assert (=> d!62607 (=> (not res!147603) (not e!123998))))

(assert (=> d!62607 (= res!147603 (= (size!4229 (buf!4672 thiss!1204)) (size!4229 (buf!4672 (_2!8311 lt!273232)))))))

(assert (=> d!62607 (= (isPrefixOf!0 thiss!1204 (_2!8311 lt!273232)) e!123998)))

(declare-fun b!178013 () Bool)

(declare-fun res!147605 () Bool)

(assert (=> b!178013 (=> (not res!147605) (not e!123998))))

(assert (=> b!178013 (= res!147605 (bvsle (bitIndex!0 (size!4229 (buf!4672 thiss!1204)) (currentByte!8861 thiss!1204) (currentBit!8856 thiss!1204)) (bitIndex!0 (size!4229 (buf!4672 (_2!8311 lt!273232))) (currentByte!8861 (_2!8311 lt!273232)) (currentBit!8856 (_2!8311 lt!273232)))))))

(declare-fun b!178014 () Bool)

(declare-fun e!123999 () Bool)

(assert (=> b!178014 (= e!123998 e!123999)))

(declare-fun res!147604 () Bool)

(assert (=> b!178014 (=> res!147604 e!123999)))

(assert (=> b!178014 (= res!147604 (= (size!4229 (buf!4672 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!178015 () Bool)

(assert (=> b!178015 (= e!123999 (arrayBitRangesEq!0 (buf!4672 thiss!1204) (buf!4672 (_2!8311 lt!273232)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4229 (buf!4672 thiss!1204)) (currentByte!8861 thiss!1204) (currentBit!8856 thiss!1204))))))

(assert (= (and d!62607 res!147603) b!178013))

(assert (= (and b!178013 res!147605) b!178014))

(assert (= (and b!178014 (not res!147604)) b!178015))

(assert (=> b!178013 m!277877))

(assert (=> b!178013 m!277875))

(assert (=> b!178015 m!277877))

(assert (=> b!178015 m!277877))

(declare-fun m!278099 () Bool)

(assert (=> b!178015 m!278099))

(assert (=> b!177845 d!62607))

(declare-fun d!62609 () Bool)

(assert (=> d!62609 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4229 (buf!4672 thiss!1204))) ((_ sign_extend 32) (currentByte!8861 thiss!1204)) ((_ sign_extend 32) (currentBit!8856 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4229 (buf!4672 thiss!1204))) ((_ sign_extend 32) (currentByte!8861 thiss!1204)) ((_ sign_extend 32) (currentBit!8856 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15602 () Bool)

(assert (= bs!15602 d!62609))

(assert (=> bs!15602 m!278079))

(assert (=> b!177840 d!62609))

(check-sat (not b!177986) (not b!177983) (not b!177971) (not d!62595) (not b!178013) (not b!178006) (not d!62545) (not d!62605) (not b!177888) (not b!178007) (not d!62537) (not b!178012) (not b!177979) (not b!178008) (not b!177974) (not d!62597) (not d!62609) (not d!62547) (not b!177985) (not bm!2918) (not d!62603) (not d!62593) (not b!177980) (not b!177972) (not b!177886) (not d!62601) (not b!178009) (not b!177982) (not b!177978) (not b!178015))
