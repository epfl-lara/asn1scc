; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41314 () Bool)

(assert start!41314)

(declare-fun b!193712 () Bool)

(declare-fun res!161954 () Bool)

(declare-fun e!133355 () Bool)

(assert (=> b!193712 (=> (not res!161954) (not e!133355))))

(declare-datatypes ((array!9988 0))(
  ( (array!9989 (arr!5336 (Array (_ BitVec 32) (_ BitVec 8))) (size!4406 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7920 0))(
  ( (BitStream!7921 (buf!4886 array!9988) (currentByte!9170 (_ BitVec 32)) (currentBit!9165 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7920)

(declare-datatypes ((Unit!13689 0))(
  ( (Unit!13690) )
))
(declare-datatypes ((tuple2!16780 0))(
  ( (tuple2!16781 (_1!9035 Unit!13689) (_2!9035 BitStream!7920)) )
))
(declare-fun lt!300647 () tuple2!16780)

(declare-fun isPrefixOf!0 (BitStream!7920 BitStream!7920) Bool)

(assert (=> b!193712 (= res!161954 (isPrefixOf!0 thiss!1204 (_2!9035 lt!300647)))))

(declare-fun b!193713 () Bool)

(declare-fun res!161946 () Bool)

(declare-fun e!133349 () Bool)

(assert (=> b!193713 (=> (not res!161946) (not e!133349))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!193713 (= res!161946 (not (= i!590 nBits!348)))))

(declare-fun b!193714 () Bool)

(declare-fun e!133354 () Bool)

(assert (=> b!193714 (= e!133355 e!133354)))

(declare-fun res!161956 () Bool)

(assert (=> b!193714 (=> (not res!161956) (not e!133354))))

(declare-fun lt!300638 () Bool)

(declare-datatypes ((tuple2!16782 0))(
  ( (tuple2!16783 (_1!9036 BitStream!7920) (_2!9036 Bool)) )
))
(declare-fun lt!300646 () tuple2!16782)

(assert (=> b!193714 (= res!161956 (and (= (_2!9036 lt!300646) lt!300638) (= (_1!9036 lt!300646) (_2!9035 lt!300647))))))

(declare-fun readBitPure!0 (BitStream!7920) tuple2!16782)

(declare-fun readerFrom!0 (BitStream!7920 (_ BitVec 32) (_ BitVec 32)) BitStream!7920)

(assert (=> b!193714 (= lt!300646 (readBitPure!0 (readerFrom!0 (_2!9035 lt!300647) (currentBit!9165 thiss!1204) (currentByte!9170 thiss!1204))))))

(declare-fun b!193715 () Bool)

(declare-fun res!161947 () Bool)

(declare-fun e!133359 () Bool)

(assert (=> b!193715 (=> res!161947 e!133359)))

(declare-fun lt!300634 () tuple2!16780)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193715 (= res!161947 (not (invariant!0 (currentBit!9165 (_2!9035 lt!300634)) (currentByte!9170 (_2!9035 lt!300634)) (size!4406 (buf!4886 (_2!9035 lt!300634))))))))

(declare-fun b!193716 () Bool)

(declare-fun e!133357 () Bool)

(assert (=> b!193716 (= e!133357 e!133359)))

(declare-fun res!161949 () Bool)

(assert (=> b!193716 (=> res!161949 e!133359)))

(declare-fun lt!300641 () (_ BitVec 64))

(declare-fun lt!300652 () (_ BitVec 64))

(assert (=> b!193716 (= res!161949 (not (= lt!300641 (bvsub (bvsub (bvadd lt!300652 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!193716 (= lt!300641 (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300634))) (currentByte!9170 (_2!9035 lt!300634)) (currentBit!9165 (_2!9035 lt!300634))))))

(assert (=> b!193716 (isPrefixOf!0 thiss!1204 (_2!9035 lt!300634))))

(declare-fun lt!300645 () Unit!13689)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7920 BitStream!7920 BitStream!7920) Unit!13689)

(assert (=> b!193716 (= lt!300645 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9035 lt!300647) (_2!9035 lt!300634)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7920 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16780)

(assert (=> b!193716 (= lt!300634 (appendBitsLSBFirstLoopTR!0 (_2!9035 lt!300647) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!193717 () Bool)

(declare-fun e!133360 () Bool)

(declare-fun array_inv!4147 (array!9988) Bool)

(assert (=> b!193717 (= e!133360 (array_inv!4147 (buf!4886 thiss!1204)))))

(declare-fun b!193718 () Bool)

(assert (=> b!193718 (= e!133349 (not e!133357))))

(declare-fun res!161950 () Bool)

(assert (=> b!193718 (=> res!161950 e!133357)))

(declare-fun lt!300632 () (_ BitVec 64))

(assert (=> b!193718 (= res!161950 (not (= lt!300652 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!300632))))))

(assert (=> b!193718 (= lt!300652 (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300647))) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647))))))

(assert (=> b!193718 (= lt!300632 (bitIndex!0 (size!4406 (buf!4886 thiss!1204)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204)))))

(declare-fun e!133356 () Bool)

(assert (=> b!193718 e!133356))

(declare-fun res!161953 () Bool)

(assert (=> b!193718 (=> (not res!161953) (not e!133356))))

(assert (=> b!193718 (= res!161953 (= (size!4406 (buf!4886 thiss!1204)) (size!4406 (buf!4886 (_2!9035 lt!300647)))))))

(declare-fun appendBit!0 (BitStream!7920 Bool) tuple2!16780)

(assert (=> b!193718 (= lt!300647 (appendBit!0 thiss!1204 lt!300638))))

(declare-fun lt!300624 () (_ BitVec 64))

(assert (=> b!193718 (= lt!300638 (not (= (bvand v!189 lt!300624) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!193718 (= lt!300624 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun res!161948 () Bool)

(declare-fun e!133353 () Bool)

(assert (=> start!41314 (=> (not res!161948) (not e!133353))))

(assert (=> start!41314 (= res!161948 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41314 e!133353))

(assert (=> start!41314 true))

(declare-fun inv!12 (BitStream!7920) Bool)

(assert (=> start!41314 (and (inv!12 thiss!1204) e!133360)))

(declare-fun b!193719 () Bool)

(declare-fun res!161936 () Bool)

(assert (=> b!193719 (=> res!161936 e!133359)))

(assert (=> b!193719 (= res!161936 (not (isPrefixOf!0 (_2!9035 lt!300647) (_2!9035 lt!300634))))))

(declare-fun b!193720 () Bool)

(declare-fun e!133361 () Bool)

(declare-datatypes ((tuple2!16784 0))(
  ( (tuple2!16785 (_1!9037 BitStream!7920) (_2!9037 BitStream!7920)) )
))
(declare-fun lt!300631 () tuple2!16784)

(declare-fun lt!300639 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!193720 (= e!133361 (validate_offset_bits!1 ((_ sign_extend 32) (size!4406 (buf!4886 (_1!9037 lt!300631)))) ((_ sign_extend 32) (currentByte!9170 (_1!9037 lt!300631))) ((_ sign_extend 32) (currentBit!9165 (_1!9037 lt!300631))) lt!300639))))

(declare-fun e!133348 () Bool)

(assert (=> b!193720 e!133348))

(declare-fun res!161951 () Bool)

(assert (=> b!193720 (=> (not res!161951) (not e!133348))))

(assert (=> b!193720 (= res!161951 (= (size!4406 (buf!4886 thiss!1204)) (size!4406 (buf!4886 (_2!9035 lt!300634)))))))

(declare-fun b!193721 () Bool)

(declare-fun e!133350 () Bool)

(assert (=> b!193721 (= e!133350 e!133361)))

(declare-fun res!161939 () Bool)

(assert (=> b!193721 (=> res!161939 e!133361)))

(declare-fun lt!300636 () tuple2!16784)

(declare-fun lt!300629 () BitStream!7920)

(assert (=> b!193721 (= res!161939 (not (= (_1!9037 lt!300636) lt!300629)))))

(declare-fun e!133358 () Bool)

(assert (=> b!193721 e!133358))

(declare-fun res!161958 () Bool)

(assert (=> b!193721 (=> (not res!161958) (not e!133358))))

(declare-datatypes ((tuple2!16786 0))(
  ( (tuple2!16787 (_1!9038 BitStream!7920) (_2!9038 (_ BitVec 64))) )
))
(declare-fun lt!300626 () tuple2!16786)

(declare-fun lt!300625 () tuple2!16786)

(assert (=> b!193721 (= res!161958 (and (= (_2!9038 lt!300626) (_2!9038 lt!300625)) (= (_1!9038 lt!300626) (_1!9038 lt!300625))))))

(declare-fun lt!300640 () Unit!13689)

(declare-fun lt!300635 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13689)

(assert (=> b!193721 (= lt!300640 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9037 lt!300631) nBits!348 i!590 lt!300635))))

(declare-fun lt!300649 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16786)

(assert (=> b!193721 (= lt!300625 (readNBitsLSBFirstsLoopPure!0 lt!300629 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300649))))

(declare-fun withMovedBitIndex!0 (BitStream!7920 (_ BitVec 64)) BitStream!7920)

(assert (=> b!193721 (= lt!300629 (withMovedBitIndex!0 (_1!9037 lt!300631) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!193722 () Bool)

(declare-fun res!161952 () Bool)

(assert (=> b!193722 (=> (not res!161952) (not e!133348))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!193722 (= res!161952 (= (_2!9038 lt!300626) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!193723 () Bool)

(declare-fun e!133347 () Bool)

(assert (=> b!193723 (= e!133347 (invariant!0 (currentBit!9165 thiss!1204) (currentByte!9170 thiss!1204) (size!4406 (buf!4886 (_2!9035 lt!300634)))))))

(declare-fun b!193724 () Bool)

(declare-fun res!161942 () Bool)

(assert (=> b!193724 (=> res!161942 e!133361)))

(assert (=> b!193724 (= res!161942 (not (= (bitIndex!0 (size!4406 (buf!4886 (_1!9038 lt!300626))) (currentByte!9170 (_1!9038 lt!300626)) (currentBit!9165 (_1!9038 lt!300626))) (bitIndex!0 (size!4406 (buf!4886 (_2!9037 lt!300631))) (currentByte!9170 (_2!9037 lt!300631)) (currentBit!9165 (_2!9037 lt!300631))))))))

(declare-fun b!193725 () Bool)

(declare-fun res!161940 () Bool)

(assert (=> b!193725 (=> res!161940 e!133359)))

(assert (=> b!193725 (= res!161940 (or (not (= (size!4406 (buf!4886 (_2!9035 lt!300634))) (size!4406 (buf!4886 thiss!1204)))) (not (= lt!300641 (bvsub (bvadd lt!300632 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!193726 () Bool)

(declare-fun e!133351 () Bool)

(declare-fun lt!300644 () tuple2!16782)

(declare-fun lt!300628 () tuple2!16782)

(assert (=> b!193726 (= e!133351 (= (_2!9036 lt!300644) (_2!9036 lt!300628)))))

(declare-fun lt!300651 () tuple2!16786)

(declare-fun b!193727 () Bool)

(assert (=> b!193727 (= e!133358 (and (= lt!300632 (bvsub lt!300652 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9037 lt!300636) lt!300629)) (= (_2!9038 lt!300626) (_2!9038 lt!300651)))))))

(declare-fun b!193728 () Bool)

(declare-fun lt!300630 () (_ BitVec 64))

(assert (=> b!193728 (= e!133354 (= (bitIndex!0 (size!4406 (buf!4886 (_1!9036 lt!300646))) (currentByte!9170 (_1!9036 lt!300646)) (currentBit!9165 (_1!9036 lt!300646))) lt!300630))))

(declare-fun b!193729 () Bool)

(declare-fun res!161937 () Bool)

(assert (=> b!193729 (=> (not res!161937) (not e!133358))))

(assert (=> b!193729 (= res!161937 (= (_1!9037 lt!300631) (withMovedBitIndex!0 (_2!9037 lt!300631) (bvsub lt!300632 lt!300641))))))

(declare-fun b!193730 () Bool)

(declare-fun res!161957 () Bool)

(assert (=> b!193730 (=> (not res!161957) (not e!133349))))

(assert (=> b!193730 (= res!161957 (invariant!0 (currentBit!9165 thiss!1204) (currentByte!9170 thiss!1204) (size!4406 (buf!4886 thiss!1204))))))

(declare-fun b!193731 () Bool)

(assert (=> b!193731 (= e!133356 e!133355)))

(declare-fun res!161935 () Bool)

(assert (=> b!193731 (=> (not res!161935) (not e!133355))))

(declare-fun lt!300648 () (_ BitVec 64))

(assert (=> b!193731 (= res!161935 (= lt!300630 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!300648)))))

(assert (=> b!193731 (= lt!300630 (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300647))) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647))))))

(assert (=> b!193731 (= lt!300648 (bitIndex!0 (size!4406 (buf!4886 thiss!1204)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204)))))

(declare-fun b!193732 () Bool)

(declare-fun res!161945 () Bool)

(assert (=> b!193732 (=> (not res!161945) (not e!133358))))

(assert (=> b!193732 (= res!161945 (= (_1!9037 lt!300636) (withMovedBitIndex!0 (_2!9037 lt!300636) (bvsub lt!300652 lt!300641))))))

(declare-fun b!193733 () Bool)

(assert (=> b!193733 (= e!133348 (= (_1!9038 lt!300626) (_2!9037 lt!300631)))))

(declare-fun b!193734 () Bool)

(assert (=> b!193734 (= e!133359 e!133350)))

(declare-fun res!161941 () Bool)

(assert (=> b!193734 (=> res!161941 e!133350)))

(assert (=> b!193734 (= res!161941 (not (= (_1!9038 lt!300651) (_2!9037 lt!300636))))))

(assert (=> b!193734 (= lt!300651 (readNBitsLSBFirstsLoopPure!0 (_1!9037 lt!300636) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300649))))

(declare-fun lt!300627 () (_ BitVec 64))

(assert (=> b!193734 (validate_offset_bits!1 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!300634)))) ((_ sign_extend 32) (currentByte!9170 (_2!9035 lt!300647))) ((_ sign_extend 32) (currentBit!9165 (_2!9035 lt!300647))) lt!300627)))

(declare-fun lt!300650 () Unit!13689)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7920 array!9988 (_ BitVec 64)) Unit!13689)

(assert (=> b!193734 (= lt!300650 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9035 lt!300647) (buf!4886 (_2!9035 lt!300634)) lt!300627))))

(assert (=> b!193734 (= lt!300627 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!300642 () tuple2!16782)

(assert (=> b!193734 (= lt!300649 (bvor lt!300635 (ite (_2!9036 lt!300642) lt!300624 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!193734 (= lt!300626 (readNBitsLSBFirstsLoopPure!0 (_1!9037 lt!300631) nBits!348 i!590 lt!300635))))

(assert (=> b!193734 (validate_offset_bits!1 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!300634)))) ((_ sign_extend 32) (currentByte!9170 thiss!1204)) ((_ sign_extend 32) (currentBit!9165 thiss!1204)) lt!300639)))

(declare-fun lt!300637 () Unit!13689)

(assert (=> b!193734 (= lt!300637 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4886 (_2!9035 lt!300634)) lt!300639))))

(assert (=> b!193734 (= lt!300635 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!193734 (= (_2!9036 lt!300642) lt!300638)))

(assert (=> b!193734 (= lt!300642 (readBitPure!0 (_1!9037 lt!300631)))))

(declare-fun reader!0 (BitStream!7920 BitStream!7920) tuple2!16784)

(assert (=> b!193734 (= lt!300636 (reader!0 (_2!9035 lt!300647) (_2!9035 lt!300634)))))

(assert (=> b!193734 (= lt!300631 (reader!0 thiss!1204 (_2!9035 lt!300634)))))

(assert (=> b!193734 e!133351))

(declare-fun res!161955 () Bool)

(assert (=> b!193734 (=> (not res!161955) (not e!133351))))

(assert (=> b!193734 (= res!161955 (= (bitIndex!0 (size!4406 (buf!4886 (_1!9036 lt!300644))) (currentByte!9170 (_1!9036 lt!300644)) (currentBit!9165 (_1!9036 lt!300644))) (bitIndex!0 (size!4406 (buf!4886 (_1!9036 lt!300628))) (currentByte!9170 (_1!9036 lt!300628)) (currentBit!9165 (_1!9036 lt!300628)))))))

(declare-fun lt!300643 () Unit!13689)

(declare-fun lt!300633 () BitStream!7920)

(declare-fun readBitPrefixLemma!0 (BitStream!7920 BitStream!7920) Unit!13689)

(assert (=> b!193734 (= lt!300643 (readBitPrefixLemma!0 lt!300633 (_2!9035 lt!300634)))))

(assert (=> b!193734 (= lt!300628 (readBitPure!0 (BitStream!7921 (buf!4886 (_2!9035 lt!300634)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204))))))

(assert (=> b!193734 (= lt!300644 (readBitPure!0 lt!300633))))

(assert (=> b!193734 e!133347))

(declare-fun res!161938 () Bool)

(assert (=> b!193734 (=> (not res!161938) (not e!133347))))

(assert (=> b!193734 (= res!161938 (invariant!0 (currentBit!9165 thiss!1204) (currentByte!9170 thiss!1204) (size!4406 (buf!4886 (_2!9035 lt!300647)))))))

(assert (=> b!193734 (= lt!300633 (BitStream!7921 (buf!4886 (_2!9035 lt!300647)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204)))))

(declare-fun b!193735 () Bool)

(assert (=> b!193735 (= e!133353 e!133349)))

(declare-fun res!161944 () Bool)

(assert (=> b!193735 (=> (not res!161944) (not e!133349))))

(assert (=> b!193735 (= res!161944 (validate_offset_bits!1 ((_ sign_extend 32) (size!4406 (buf!4886 thiss!1204))) ((_ sign_extend 32) (currentByte!9170 thiss!1204)) ((_ sign_extend 32) (currentBit!9165 thiss!1204)) lt!300639))))

(assert (=> b!193735 (= lt!300639 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!193736 () Bool)

(declare-fun res!161943 () Bool)

(assert (=> b!193736 (=> res!161943 e!133359)))

(assert (=> b!193736 (= res!161943 (not (isPrefixOf!0 thiss!1204 (_2!9035 lt!300647))))))

(assert (= (and start!41314 res!161948) b!193735))

(assert (= (and b!193735 res!161944) b!193730))

(assert (= (and b!193730 res!161957) b!193713))

(assert (= (and b!193713 res!161946) b!193718))

(assert (= (and b!193718 res!161953) b!193731))

(assert (= (and b!193731 res!161935) b!193712))

(assert (= (and b!193712 res!161954) b!193714))

(assert (= (and b!193714 res!161956) b!193728))

(assert (= (and b!193718 (not res!161950)) b!193716))

(assert (= (and b!193716 (not res!161949)) b!193715))

(assert (= (and b!193715 (not res!161947)) b!193725))

(assert (= (and b!193725 (not res!161940)) b!193719))

(assert (= (and b!193719 (not res!161936)) b!193736))

(assert (= (and b!193736 (not res!161943)) b!193734))

(assert (= (and b!193734 res!161938) b!193723))

(assert (= (and b!193734 res!161955) b!193726))

(assert (= (and b!193734 (not res!161941)) b!193721))

(assert (= (and b!193721 res!161958) b!193729))

(assert (= (and b!193729 res!161937) b!193732))

(assert (= (and b!193732 res!161945) b!193727))

(assert (= (and b!193721 (not res!161939)) b!193724))

(assert (= (and b!193724 (not res!161942)) b!193720))

(assert (= (and b!193720 res!161951) b!193722))

(assert (= (and b!193722 res!161952) b!193733))

(assert (= start!41314 b!193717))

(declare-fun m!300037 () Bool)

(assert (=> b!193724 m!300037))

(declare-fun m!300039 () Bool)

(assert (=> b!193724 m!300039))

(declare-fun m!300041 () Bool)

(assert (=> b!193736 m!300041))

(declare-fun m!300043 () Bool)

(assert (=> b!193732 m!300043))

(assert (=> b!193712 m!300041))

(declare-fun m!300045 () Bool)

(assert (=> b!193720 m!300045))

(declare-fun m!300047 () Bool)

(assert (=> b!193734 m!300047))

(declare-fun m!300049 () Bool)

(assert (=> b!193734 m!300049))

(declare-fun m!300051 () Bool)

(assert (=> b!193734 m!300051))

(declare-fun m!300053 () Bool)

(assert (=> b!193734 m!300053))

(declare-fun m!300055 () Bool)

(assert (=> b!193734 m!300055))

(declare-fun m!300057 () Bool)

(assert (=> b!193734 m!300057))

(declare-fun m!300059 () Bool)

(assert (=> b!193734 m!300059))

(declare-fun m!300061 () Bool)

(assert (=> b!193734 m!300061))

(declare-fun m!300063 () Bool)

(assert (=> b!193734 m!300063))

(declare-fun m!300065 () Bool)

(assert (=> b!193734 m!300065))

(declare-fun m!300067 () Bool)

(assert (=> b!193734 m!300067))

(declare-fun m!300069 () Bool)

(assert (=> b!193734 m!300069))

(declare-fun m!300071 () Bool)

(assert (=> b!193734 m!300071))

(declare-fun m!300073 () Bool)

(assert (=> b!193734 m!300073))

(declare-fun m!300075 () Bool)

(assert (=> b!193734 m!300075))

(declare-fun m!300077 () Bool)

(assert (=> b!193734 m!300077))

(declare-fun m!300079 () Bool)

(assert (=> b!193719 m!300079))

(declare-fun m!300081 () Bool)

(assert (=> b!193731 m!300081))

(declare-fun m!300083 () Bool)

(assert (=> b!193731 m!300083))

(declare-fun m!300085 () Bool)

(assert (=> b!193721 m!300085))

(declare-fun m!300087 () Bool)

(assert (=> b!193721 m!300087))

(declare-fun m!300089 () Bool)

(assert (=> b!193721 m!300089))

(declare-fun m!300091 () Bool)

(assert (=> start!41314 m!300091))

(declare-fun m!300093 () Bool)

(assert (=> b!193717 m!300093))

(declare-fun m!300095 () Bool)

(assert (=> b!193735 m!300095))

(declare-fun m!300097 () Bool)

(assert (=> b!193730 m!300097))

(declare-fun m!300099 () Bool)

(assert (=> b!193729 m!300099))

(declare-fun m!300101 () Bool)

(assert (=> b!193715 m!300101))

(declare-fun m!300103 () Bool)

(assert (=> b!193728 m!300103))

(assert (=> b!193718 m!300081))

(assert (=> b!193718 m!300083))

(declare-fun m!300105 () Bool)

(assert (=> b!193718 m!300105))

(declare-fun m!300107 () Bool)

(assert (=> b!193714 m!300107))

(assert (=> b!193714 m!300107))

(declare-fun m!300109 () Bool)

(assert (=> b!193714 m!300109))

(declare-fun m!300111 () Bool)

(assert (=> b!193723 m!300111))

(declare-fun m!300113 () Bool)

(assert (=> b!193722 m!300113))

(declare-fun m!300115 () Bool)

(assert (=> b!193716 m!300115))

(declare-fun m!300117 () Bool)

(assert (=> b!193716 m!300117))

(declare-fun m!300119 () Bool)

(assert (=> b!193716 m!300119))

(declare-fun m!300121 () Bool)

(assert (=> b!193716 m!300121))

(check-sat (not b!193722) (not b!193723) (not b!193728) (not b!193720) (not b!193719) (not b!193731) (not b!193729) (not b!193724) (not b!193717) (not b!193715) (not b!193736) (not b!193735) (not b!193730) (not b!193716) (not b!193712) (not b!193714) (not b!193734) (not b!193732) (not b!193721) (not b!193718) (not start!41314))
(check-sat)
(get-model)

(declare-fun d!65689 () Bool)

(declare-datatypes ((tuple2!16796 0))(
  ( (tuple2!16797 (_1!9043 Bool) (_2!9043 BitStream!7920)) )
))
(declare-fun lt!300742 () tuple2!16796)

(declare-fun readBit!0 (BitStream!7920) tuple2!16796)

(assert (=> d!65689 (= lt!300742 (readBit!0 (readerFrom!0 (_2!9035 lt!300647) (currentBit!9165 thiss!1204) (currentByte!9170 thiss!1204))))))

(assert (=> d!65689 (= (readBitPure!0 (readerFrom!0 (_2!9035 lt!300647) (currentBit!9165 thiss!1204) (currentByte!9170 thiss!1204))) (tuple2!16783 (_2!9043 lt!300742) (_1!9043 lt!300742)))))

(declare-fun bs!16344 () Bool)

(assert (= bs!16344 d!65689))

(assert (=> bs!16344 m!300107))

(declare-fun m!300209 () Bool)

(assert (=> bs!16344 m!300209))

(assert (=> b!193714 d!65689))

(declare-fun d!65691 () Bool)

(declare-fun e!133409 () Bool)

(assert (=> d!65691 e!133409))

(declare-fun res!162034 () Bool)

(assert (=> d!65691 (=> (not res!162034) (not e!133409))))

(assert (=> d!65691 (= res!162034 (invariant!0 (currentBit!9165 (_2!9035 lt!300647)) (currentByte!9170 (_2!9035 lt!300647)) (size!4406 (buf!4886 (_2!9035 lt!300647)))))))

(assert (=> d!65691 (= (readerFrom!0 (_2!9035 lt!300647) (currentBit!9165 thiss!1204) (currentByte!9170 thiss!1204)) (BitStream!7921 (buf!4886 (_2!9035 lt!300647)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204)))))

(declare-fun b!193814 () Bool)

(assert (=> b!193814 (= e!133409 (invariant!0 (currentBit!9165 thiss!1204) (currentByte!9170 thiss!1204) (size!4406 (buf!4886 (_2!9035 lt!300647)))))))

(assert (= (and d!65691 res!162034) b!193814))

(declare-fun m!300211 () Bool)

(assert (=> d!65691 m!300211))

(assert (=> b!193814 m!300073))

(assert (=> b!193714 d!65691))

(declare-fun d!65693 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!65693 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4406 (buf!4886 thiss!1204))) ((_ sign_extend 32) (currentByte!9170 thiss!1204)) ((_ sign_extend 32) (currentBit!9165 thiss!1204)) lt!300639) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4406 (buf!4886 thiss!1204))) ((_ sign_extend 32) (currentByte!9170 thiss!1204)) ((_ sign_extend 32) (currentBit!9165 thiss!1204))) lt!300639))))

(declare-fun bs!16345 () Bool)

(assert (= bs!16345 d!65693))

(declare-fun m!300213 () Bool)

(assert (=> bs!16345 m!300213))

(assert (=> b!193735 d!65693))

(declare-fun d!65695 () Bool)

(declare-fun e!133412 () Bool)

(assert (=> d!65695 e!133412))

(declare-fun res!162039 () Bool)

(assert (=> d!65695 (=> (not res!162039) (not e!133412))))

(declare-fun lt!300757 () (_ BitVec 64))

(declare-fun lt!300760 () (_ BitVec 64))

(declare-fun lt!300759 () (_ BitVec 64))

(assert (=> d!65695 (= res!162039 (= lt!300759 (bvsub lt!300760 lt!300757)))))

(assert (=> d!65695 (or (= (bvand lt!300760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!300757 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!300760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300760 lt!300757) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65695 (= lt!300757 (remainingBits!0 ((_ sign_extend 32) (size!4406 (buf!4886 (_1!9038 lt!300626)))) ((_ sign_extend 32) (currentByte!9170 (_1!9038 lt!300626))) ((_ sign_extend 32) (currentBit!9165 (_1!9038 lt!300626)))))))

(declare-fun lt!300755 () (_ BitVec 64))

(declare-fun lt!300756 () (_ BitVec 64))

(assert (=> d!65695 (= lt!300760 (bvmul lt!300755 lt!300756))))

(assert (=> d!65695 (or (= lt!300755 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!300756 (bvsdiv (bvmul lt!300755 lt!300756) lt!300755)))))

(assert (=> d!65695 (= lt!300756 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65695 (= lt!300755 ((_ sign_extend 32) (size!4406 (buf!4886 (_1!9038 lt!300626)))))))

(assert (=> d!65695 (= lt!300759 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9170 (_1!9038 lt!300626))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9165 (_1!9038 lt!300626)))))))

(assert (=> d!65695 (invariant!0 (currentBit!9165 (_1!9038 lt!300626)) (currentByte!9170 (_1!9038 lt!300626)) (size!4406 (buf!4886 (_1!9038 lt!300626))))))

(assert (=> d!65695 (= (bitIndex!0 (size!4406 (buf!4886 (_1!9038 lt!300626))) (currentByte!9170 (_1!9038 lt!300626)) (currentBit!9165 (_1!9038 lt!300626))) lt!300759)))

(declare-fun b!193819 () Bool)

(declare-fun res!162040 () Bool)

(assert (=> b!193819 (=> (not res!162040) (not e!133412))))

(assert (=> b!193819 (= res!162040 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!300759))))

(declare-fun b!193820 () Bool)

(declare-fun lt!300758 () (_ BitVec 64))

(assert (=> b!193820 (= e!133412 (bvsle lt!300759 (bvmul lt!300758 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193820 (or (= lt!300758 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!300758 #b0000000000000000000000000000000000000000000000000000000000001000) lt!300758)))))

(assert (=> b!193820 (= lt!300758 ((_ sign_extend 32) (size!4406 (buf!4886 (_1!9038 lt!300626)))))))

(assert (= (and d!65695 res!162039) b!193819))

(assert (= (and b!193819 res!162040) b!193820))

(declare-fun m!300215 () Bool)

(assert (=> d!65695 m!300215))

(declare-fun m!300217 () Bool)

(assert (=> d!65695 m!300217))

(assert (=> b!193724 d!65695))

(declare-fun d!65697 () Bool)

(declare-fun e!133413 () Bool)

(assert (=> d!65697 e!133413))

(declare-fun res!162041 () Bool)

(assert (=> d!65697 (=> (not res!162041) (not e!133413))))

(declare-fun lt!300766 () (_ BitVec 64))

(declare-fun lt!300765 () (_ BitVec 64))

(declare-fun lt!300763 () (_ BitVec 64))

(assert (=> d!65697 (= res!162041 (= lt!300765 (bvsub lt!300766 lt!300763)))))

(assert (=> d!65697 (or (= (bvand lt!300766 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!300763 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!300766 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300766 lt!300763) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65697 (= lt!300763 (remainingBits!0 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9037 lt!300631)))) ((_ sign_extend 32) (currentByte!9170 (_2!9037 lt!300631))) ((_ sign_extend 32) (currentBit!9165 (_2!9037 lt!300631)))))))

(declare-fun lt!300761 () (_ BitVec 64))

(declare-fun lt!300762 () (_ BitVec 64))

(assert (=> d!65697 (= lt!300766 (bvmul lt!300761 lt!300762))))

(assert (=> d!65697 (or (= lt!300761 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!300762 (bvsdiv (bvmul lt!300761 lt!300762) lt!300761)))))

(assert (=> d!65697 (= lt!300762 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65697 (= lt!300761 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9037 lt!300631)))))))

(assert (=> d!65697 (= lt!300765 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9170 (_2!9037 lt!300631))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9165 (_2!9037 lt!300631)))))))

(assert (=> d!65697 (invariant!0 (currentBit!9165 (_2!9037 lt!300631)) (currentByte!9170 (_2!9037 lt!300631)) (size!4406 (buf!4886 (_2!9037 lt!300631))))))

(assert (=> d!65697 (= (bitIndex!0 (size!4406 (buf!4886 (_2!9037 lt!300631))) (currentByte!9170 (_2!9037 lt!300631)) (currentBit!9165 (_2!9037 lt!300631))) lt!300765)))

(declare-fun b!193821 () Bool)

(declare-fun res!162042 () Bool)

(assert (=> b!193821 (=> (not res!162042) (not e!133413))))

(assert (=> b!193821 (= res!162042 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!300765))))

(declare-fun b!193822 () Bool)

(declare-fun lt!300764 () (_ BitVec 64))

(assert (=> b!193822 (= e!133413 (bvsle lt!300765 (bvmul lt!300764 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193822 (or (= lt!300764 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!300764 #b0000000000000000000000000000000000000000000000000000000000001000) lt!300764)))))

(assert (=> b!193822 (= lt!300764 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9037 lt!300631)))))))

(assert (= (and d!65697 res!162041) b!193821))

(assert (= (and b!193821 res!162042) b!193822))

(declare-fun m!300219 () Bool)

(assert (=> d!65697 m!300219))

(declare-fun m!300221 () Bool)

(assert (=> d!65697 m!300221))

(assert (=> b!193724 d!65697))

(declare-fun d!65699 () Bool)

(assert (=> d!65699 (validate_offset_bits!1 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!300634)))) ((_ sign_extend 32) (currentByte!9170 thiss!1204)) ((_ sign_extend 32) (currentBit!9165 thiss!1204)) lt!300639)))

(declare-fun lt!300769 () Unit!13689)

(declare-fun choose!9 (BitStream!7920 array!9988 (_ BitVec 64) BitStream!7920) Unit!13689)

(assert (=> d!65699 (= lt!300769 (choose!9 thiss!1204 (buf!4886 (_2!9035 lt!300634)) lt!300639 (BitStream!7921 (buf!4886 (_2!9035 lt!300634)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204))))))

(assert (=> d!65699 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4886 (_2!9035 lt!300634)) lt!300639) lt!300769)))

(declare-fun bs!16346 () Bool)

(assert (= bs!16346 d!65699))

(assert (=> bs!16346 m!300059))

(declare-fun m!300223 () Bool)

(assert (=> bs!16346 m!300223))

(assert (=> b!193734 d!65699))

(declare-fun d!65701 () Bool)

(assert (=> d!65701 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!193734 d!65701))

(declare-fun d!65703 () Bool)

(declare-fun e!133414 () Bool)

(assert (=> d!65703 e!133414))

(declare-fun res!162043 () Bool)

(assert (=> d!65703 (=> (not res!162043) (not e!133414))))

(declare-fun lt!300775 () (_ BitVec 64))

(declare-fun lt!300774 () (_ BitVec 64))

(declare-fun lt!300772 () (_ BitVec 64))

(assert (=> d!65703 (= res!162043 (= lt!300774 (bvsub lt!300775 lt!300772)))))

(assert (=> d!65703 (or (= (bvand lt!300775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!300772 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!300775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300775 lt!300772) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65703 (= lt!300772 (remainingBits!0 ((_ sign_extend 32) (size!4406 (buf!4886 (_1!9036 lt!300628)))) ((_ sign_extend 32) (currentByte!9170 (_1!9036 lt!300628))) ((_ sign_extend 32) (currentBit!9165 (_1!9036 lt!300628)))))))

(declare-fun lt!300770 () (_ BitVec 64))

(declare-fun lt!300771 () (_ BitVec 64))

(assert (=> d!65703 (= lt!300775 (bvmul lt!300770 lt!300771))))

(assert (=> d!65703 (or (= lt!300770 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!300771 (bvsdiv (bvmul lt!300770 lt!300771) lt!300770)))))

(assert (=> d!65703 (= lt!300771 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65703 (= lt!300770 ((_ sign_extend 32) (size!4406 (buf!4886 (_1!9036 lt!300628)))))))

(assert (=> d!65703 (= lt!300774 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9170 (_1!9036 lt!300628))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9165 (_1!9036 lt!300628)))))))

(assert (=> d!65703 (invariant!0 (currentBit!9165 (_1!9036 lt!300628)) (currentByte!9170 (_1!9036 lt!300628)) (size!4406 (buf!4886 (_1!9036 lt!300628))))))

(assert (=> d!65703 (= (bitIndex!0 (size!4406 (buf!4886 (_1!9036 lt!300628))) (currentByte!9170 (_1!9036 lt!300628)) (currentBit!9165 (_1!9036 lt!300628))) lt!300774)))

(declare-fun b!193823 () Bool)

(declare-fun res!162044 () Bool)

(assert (=> b!193823 (=> (not res!162044) (not e!133414))))

(assert (=> b!193823 (= res!162044 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!300774))))

(declare-fun b!193824 () Bool)

(declare-fun lt!300773 () (_ BitVec 64))

(assert (=> b!193824 (= e!133414 (bvsle lt!300774 (bvmul lt!300773 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193824 (or (= lt!300773 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!300773 #b0000000000000000000000000000000000000000000000000000000000001000) lt!300773)))))

(assert (=> b!193824 (= lt!300773 ((_ sign_extend 32) (size!4406 (buf!4886 (_1!9036 lt!300628)))))))

(assert (= (and d!65703 res!162043) b!193823))

(assert (= (and b!193823 res!162044) b!193824))

(declare-fun m!300225 () Bool)

(assert (=> d!65703 m!300225))

(declare-fun m!300227 () Bool)

(assert (=> d!65703 m!300227))

(assert (=> b!193734 d!65703))

(declare-fun d!65705 () Bool)

(declare-fun e!133417 () Bool)

(assert (=> d!65705 e!133417))

(declare-fun res!162047 () Bool)

(assert (=> d!65705 (=> (not res!162047) (not e!133417))))

(declare-fun lt!300787 () tuple2!16782)

(declare-fun lt!300785 () tuple2!16782)

(assert (=> d!65705 (= res!162047 (= (bitIndex!0 (size!4406 (buf!4886 (_1!9036 lt!300787))) (currentByte!9170 (_1!9036 lt!300787)) (currentBit!9165 (_1!9036 lt!300787))) (bitIndex!0 (size!4406 (buf!4886 (_1!9036 lt!300785))) (currentByte!9170 (_1!9036 lt!300785)) (currentBit!9165 (_1!9036 lt!300785)))))))

(declare-fun lt!300784 () BitStream!7920)

(declare-fun lt!300786 () Unit!13689)

(declare-fun choose!50 (BitStream!7920 BitStream!7920 BitStream!7920 tuple2!16782 tuple2!16782 BitStream!7920 Bool tuple2!16782 tuple2!16782 BitStream!7920 Bool) Unit!13689)

(assert (=> d!65705 (= lt!300786 (choose!50 lt!300633 (_2!9035 lt!300634) lt!300784 lt!300787 (tuple2!16783 (_1!9036 lt!300787) (_2!9036 lt!300787)) (_1!9036 lt!300787) (_2!9036 lt!300787) lt!300785 (tuple2!16783 (_1!9036 lt!300785) (_2!9036 lt!300785)) (_1!9036 lt!300785) (_2!9036 lt!300785)))))

(assert (=> d!65705 (= lt!300785 (readBitPure!0 lt!300784))))

(assert (=> d!65705 (= lt!300787 (readBitPure!0 lt!300633))))

(assert (=> d!65705 (= lt!300784 (BitStream!7921 (buf!4886 (_2!9035 lt!300634)) (currentByte!9170 lt!300633) (currentBit!9165 lt!300633)))))

(assert (=> d!65705 (invariant!0 (currentBit!9165 lt!300633) (currentByte!9170 lt!300633) (size!4406 (buf!4886 (_2!9035 lt!300634))))))

(assert (=> d!65705 (= (readBitPrefixLemma!0 lt!300633 (_2!9035 lt!300634)) lt!300786)))

(declare-fun b!193827 () Bool)

(assert (=> b!193827 (= e!133417 (= (_2!9036 lt!300787) (_2!9036 lt!300785)))))

(assert (= (and d!65705 res!162047) b!193827))

(declare-fun m!300229 () Bool)

(assert (=> d!65705 m!300229))

(declare-fun m!300231 () Bool)

(assert (=> d!65705 m!300231))

(declare-fun m!300233 () Bool)

(assert (=> d!65705 m!300233))

(assert (=> d!65705 m!300071))

(declare-fun m!300235 () Bool)

(assert (=> d!65705 m!300235))

(declare-fun m!300237 () Bool)

(assert (=> d!65705 m!300237))

(assert (=> b!193734 d!65705))

(declare-fun d!65707 () Bool)

(assert (=> d!65707 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!300634)))) ((_ sign_extend 32) (currentByte!9170 thiss!1204)) ((_ sign_extend 32) (currentBit!9165 thiss!1204)) lt!300639) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!300634)))) ((_ sign_extend 32) (currentByte!9170 thiss!1204)) ((_ sign_extend 32) (currentBit!9165 thiss!1204))) lt!300639))))

(declare-fun bs!16347 () Bool)

(assert (= bs!16347 d!65707))

(declare-fun m!300239 () Bool)

(assert (=> bs!16347 m!300239))

(assert (=> b!193734 d!65707))

(declare-fun d!65709 () Bool)

(assert (=> d!65709 (= (invariant!0 (currentBit!9165 thiss!1204) (currentByte!9170 thiss!1204) (size!4406 (buf!4886 (_2!9035 lt!300647)))) (and (bvsge (currentBit!9165 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9165 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9170 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9170 thiss!1204) (size!4406 (buf!4886 (_2!9035 lt!300647)))) (and (= (currentBit!9165 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9170 thiss!1204) (size!4406 (buf!4886 (_2!9035 lt!300647))))))))))

(assert (=> b!193734 d!65709))

(declare-fun b!193838 () Bool)

(declare-fun res!162055 () Bool)

(declare-fun e!133422 () Bool)

(assert (=> b!193838 (=> (not res!162055) (not e!133422))))

(declare-fun lt!300841 () tuple2!16784)

(assert (=> b!193838 (= res!162055 (isPrefixOf!0 (_1!9037 lt!300841) (_2!9035 lt!300647)))))

(declare-fun b!193839 () Bool)

(declare-fun e!133423 () Unit!13689)

(declare-fun Unit!13693 () Unit!13689)

(assert (=> b!193839 (= e!133423 Unit!13693)))

(declare-fun b!193840 () Bool)

(declare-fun res!162054 () Bool)

(assert (=> b!193840 (=> (not res!162054) (not e!133422))))

(assert (=> b!193840 (= res!162054 (isPrefixOf!0 (_2!9037 lt!300841) (_2!9035 lt!300634)))))

(declare-fun lt!300838 () (_ BitVec 64))

(declare-fun lt!300830 () (_ BitVec 64))

(declare-fun b!193841 () Bool)

(assert (=> b!193841 (= e!133422 (= (_1!9037 lt!300841) (withMovedBitIndex!0 (_2!9037 lt!300841) (bvsub lt!300830 lt!300838))))))

(assert (=> b!193841 (or (= (bvand lt!300830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!300838 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!300830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300830 lt!300838) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!193841 (= lt!300838 (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300634))) (currentByte!9170 (_2!9035 lt!300634)) (currentBit!9165 (_2!9035 lt!300634))))))

(assert (=> b!193841 (= lt!300830 (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300647))) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647))))))

(declare-fun d!65711 () Bool)

(assert (=> d!65711 e!133422))

(declare-fun res!162056 () Bool)

(assert (=> d!65711 (=> (not res!162056) (not e!133422))))

(assert (=> d!65711 (= res!162056 (isPrefixOf!0 (_1!9037 lt!300841) (_2!9037 lt!300841)))))

(declare-fun lt!300839 () BitStream!7920)

(assert (=> d!65711 (= lt!300841 (tuple2!16785 lt!300839 (_2!9035 lt!300634)))))

(declare-fun lt!300842 () Unit!13689)

(declare-fun lt!300828 () Unit!13689)

(assert (=> d!65711 (= lt!300842 lt!300828)))

(assert (=> d!65711 (isPrefixOf!0 lt!300839 (_2!9035 lt!300634))))

(assert (=> d!65711 (= lt!300828 (lemmaIsPrefixTransitive!0 lt!300839 (_2!9035 lt!300634) (_2!9035 lt!300634)))))

(declare-fun lt!300832 () Unit!13689)

(declare-fun lt!300835 () Unit!13689)

(assert (=> d!65711 (= lt!300832 lt!300835)))

(assert (=> d!65711 (isPrefixOf!0 lt!300839 (_2!9035 lt!300634))))

(assert (=> d!65711 (= lt!300835 (lemmaIsPrefixTransitive!0 lt!300839 (_2!9035 lt!300647) (_2!9035 lt!300634)))))

(declare-fun lt!300829 () Unit!13689)

(assert (=> d!65711 (= lt!300829 e!133423)))

(declare-fun c!9682 () Bool)

(assert (=> d!65711 (= c!9682 (not (= (size!4406 (buf!4886 (_2!9035 lt!300647))) #b00000000000000000000000000000000)))))

(declare-fun lt!300840 () Unit!13689)

(declare-fun lt!300831 () Unit!13689)

(assert (=> d!65711 (= lt!300840 lt!300831)))

(assert (=> d!65711 (isPrefixOf!0 (_2!9035 lt!300634) (_2!9035 lt!300634))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7920) Unit!13689)

(assert (=> d!65711 (= lt!300831 (lemmaIsPrefixRefl!0 (_2!9035 lt!300634)))))

(declare-fun lt!300836 () Unit!13689)

(declare-fun lt!300843 () Unit!13689)

(assert (=> d!65711 (= lt!300836 lt!300843)))

(assert (=> d!65711 (= lt!300843 (lemmaIsPrefixRefl!0 (_2!9035 lt!300634)))))

(declare-fun lt!300834 () Unit!13689)

(declare-fun lt!300847 () Unit!13689)

(assert (=> d!65711 (= lt!300834 lt!300847)))

(assert (=> d!65711 (isPrefixOf!0 lt!300839 lt!300839)))

(assert (=> d!65711 (= lt!300847 (lemmaIsPrefixRefl!0 lt!300839))))

(declare-fun lt!300833 () Unit!13689)

(declare-fun lt!300845 () Unit!13689)

(assert (=> d!65711 (= lt!300833 lt!300845)))

(assert (=> d!65711 (isPrefixOf!0 (_2!9035 lt!300647) (_2!9035 lt!300647))))

(assert (=> d!65711 (= lt!300845 (lemmaIsPrefixRefl!0 (_2!9035 lt!300647)))))

(assert (=> d!65711 (= lt!300839 (BitStream!7921 (buf!4886 (_2!9035 lt!300634)) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647))))))

(assert (=> d!65711 (isPrefixOf!0 (_2!9035 lt!300647) (_2!9035 lt!300634))))

(assert (=> d!65711 (= (reader!0 (_2!9035 lt!300647) (_2!9035 lt!300634)) lt!300841)))

(declare-fun b!193842 () Bool)

(declare-fun lt!300844 () Unit!13689)

(assert (=> b!193842 (= e!133423 lt!300844)))

(declare-fun lt!300837 () (_ BitVec 64))

(assert (=> b!193842 (= lt!300837 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!300846 () (_ BitVec 64))

(assert (=> b!193842 (= lt!300846 (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300647))) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9988 array!9988 (_ BitVec 64) (_ BitVec 64)) Unit!13689)

(assert (=> b!193842 (= lt!300844 (arrayBitRangesEqSymmetric!0 (buf!4886 (_2!9035 lt!300647)) (buf!4886 (_2!9035 lt!300634)) lt!300837 lt!300846))))

(declare-fun arrayBitRangesEq!0 (array!9988 array!9988 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!193842 (arrayBitRangesEq!0 (buf!4886 (_2!9035 lt!300634)) (buf!4886 (_2!9035 lt!300647)) lt!300837 lt!300846)))

(assert (= (and d!65711 c!9682) b!193842))

(assert (= (and d!65711 (not c!9682)) b!193839))

(assert (= (and d!65711 res!162056) b!193838))

(assert (= (and b!193838 res!162055) b!193840))

(assert (= (and b!193840 res!162054) b!193841))

(declare-fun m!300241 () Bool)

(assert (=> d!65711 m!300241))

(declare-fun m!300243 () Bool)

(assert (=> d!65711 m!300243))

(declare-fun m!300245 () Bool)

(assert (=> d!65711 m!300245))

(declare-fun m!300247 () Bool)

(assert (=> d!65711 m!300247))

(declare-fun m!300249 () Bool)

(assert (=> d!65711 m!300249))

(declare-fun m!300251 () Bool)

(assert (=> d!65711 m!300251))

(declare-fun m!300253 () Bool)

(assert (=> d!65711 m!300253))

(declare-fun m!300255 () Bool)

(assert (=> d!65711 m!300255))

(declare-fun m!300257 () Bool)

(assert (=> d!65711 m!300257))

(declare-fun m!300259 () Bool)

(assert (=> d!65711 m!300259))

(assert (=> d!65711 m!300079))

(declare-fun m!300261 () Bool)

(assert (=> b!193841 m!300261))

(assert (=> b!193841 m!300115))

(assert (=> b!193841 m!300081))

(declare-fun m!300263 () Bool)

(assert (=> b!193838 m!300263))

(assert (=> b!193842 m!300081))

(declare-fun m!300265 () Bool)

(assert (=> b!193842 m!300265))

(declare-fun m!300267 () Bool)

(assert (=> b!193842 m!300267))

(declare-fun m!300269 () Bool)

(assert (=> b!193840 m!300269))

(assert (=> b!193734 d!65711))

(declare-datatypes ((tuple2!16798 0))(
  ( (tuple2!16799 (_1!9044 (_ BitVec 64)) (_2!9044 BitStream!7920)) )
))
(declare-fun lt!300850 () tuple2!16798)

(declare-fun d!65713 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16798)

(assert (=> d!65713 (= lt!300850 (readNBitsLSBFirstsLoop!0 (_1!9037 lt!300636) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300649))))

(assert (=> d!65713 (= (readNBitsLSBFirstsLoopPure!0 (_1!9037 lt!300636) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300649) (tuple2!16787 (_2!9044 lt!300850) (_1!9044 lt!300850)))))

(declare-fun bs!16348 () Bool)

(assert (= bs!16348 d!65713))

(declare-fun m!300271 () Bool)

(assert (=> bs!16348 m!300271))

(assert (=> b!193734 d!65713))

(declare-fun d!65715 () Bool)

(declare-fun lt!300851 () tuple2!16796)

(assert (=> d!65715 (= lt!300851 (readBit!0 lt!300633))))

(assert (=> d!65715 (= (readBitPure!0 lt!300633) (tuple2!16783 (_2!9043 lt!300851) (_1!9043 lt!300851)))))

(declare-fun bs!16349 () Bool)

(assert (= bs!16349 d!65715))

(declare-fun m!300273 () Bool)

(assert (=> bs!16349 m!300273))

(assert (=> b!193734 d!65715))

(declare-fun lt!300852 () tuple2!16798)

(declare-fun d!65717 () Bool)

(assert (=> d!65717 (= lt!300852 (readNBitsLSBFirstsLoop!0 (_1!9037 lt!300631) nBits!348 i!590 lt!300635))))

(assert (=> d!65717 (= (readNBitsLSBFirstsLoopPure!0 (_1!9037 lt!300631) nBits!348 i!590 lt!300635) (tuple2!16787 (_2!9044 lt!300852) (_1!9044 lt!300852)))))

(declare-fun bs!16350 () Bool)

(assert (= bs!16350 d!65717))

(declare-fun m!300275 () Bool)

(assert (=> bs!16350 m!300275))

(assert (=> b!193734 d!65717))

(declare-fun d!65719 () Bool)

(declare-fun lt!300853 () tuple2!16796)

(assert (=> d!65719 (= lt!300853 (readBit!0 (_1!9037 lt!300631)))))

(assert (=> d!65719 (= (readBitPure!0 (_1!9037 lt!300631)) (tuple2!16783 (_2!9043 lt!300853) (_1!9043 lt!300853)))))

(declare-fun bs!16351 () Bool)

(assert (= bs!16351 d!65719))

(declare-fun m!300277 () Bool)

(assert (=> bs!16351 m!300277))

(assert (=> b!193734 d!65719))

(declare-fun d!65721 () Bool)

(declare-fun lt!300854 () tuple2!16796)

(assert (=> d!65721 (= lt!300854 (readBit!0 (BitStream!7921 (buf!4886 (_2!9035 lt!300634)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204))))))

(assert (=> d!65721 (= (readBitPure!0 (BitStream!7921 (buf!4886 (_2!9035 lt!300634)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204))) (tuple2!16783 (_2!9043 lt!300854) (_1!9043 lt!300854)))))

(declare-fun bs!16352 () Bool)

(assert (= bs!16352 d!65721))

(declare-fun m!300279 () Bool)

(assert (=> bs!16352 m!300279))

(assert (=> b!193734 d!65721))

(declare-fun d!65723 () Bool)

(declare-fun e!133424 () Bool)

(assert (=> d!65723 e!133424))

(declare-fun res!162057 () Bool)

(assert (=> d!65723 (=> (not res!162057) (not e!133424))))

(declare-fun lt!300860 () (_ BitVec 64))

(declare-fun lt!300857 () (_ BitVec 64))

(declare-fun lt!300859 () (_ BitVec 64))

(assert (=> d!65723 (= res!162057 (= lt!300859 (bvsub lt!300860 lt!300857)))))

(assert (=> d!65723 (or (= (bvand lt!300860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!300857 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!300860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300860 lt!300857) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65723 (= lt!300857 (remainingBits!0 ((_ sign_extend 32) (size!4406 (buf!4886 (_1!9036 lt!300644)))) ((_ sign_extend 32) (currentByte!9170 (_1!9036 lt!300644))) ((_ sign_extend 32) (currentBit!9165 (_1!9036 lt!300644)))))))

(declare-fun lt!300855 () (_ BitVec 64))

(declare-fun lt!300856 () (_ BitVec 64))

(assert (=> d!65723 (= lt!300860 (bvmul lt!300855 lt!300856))))

(assert (=> d!65723 (or (= lt!300855 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!300856 (bvsdiv (bvmul lt!300855 lt!300856) lt!300855)))))

(assert (=> d!65723 (= lt!300856 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65723 (= lt!300855 ((_ sign_extend 32) (size!4406 (buf!4886 (_1!9036 lt!300644)))))))

(assert (=> d!65723 (= lt!300859 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9170 (_1!9036 lt!300644))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9165 (_1!9036 lt!300644)))))))

(assert (=> d!65723 (invariant!0 (currentBit!9165 (_1!9036 lt!300644)) (currentByte!9170 (_1!9036 lt!300644)) (size!4406 (buf!4886 (_1!9036 lt!300644))))))

(assert (=> d!65723 (= (bitIndex!0 (size!4406 (buf!4886 (_1!9036 lt!300644))) (currentByte!9170 (_1!9036 lt!300644)) (currentBit!9165 (_1!9036 lt!300644))) lt!300859)))

(declare-fun b!193843 () Bool)

(declare-fun res!162058 () Bool)

(assert (=> b!193843 (=> (not res!162058) (not e!133424))))

(assert (=> b!193843 (= res!162058 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!300859))))

(declare-fun b!193844 () Bool)

(declare-fun lt!300858 () (_ BitVec 64))

(assert (=> b!193844 (= e!133424 (bvsle lt!300859 (bvmul lt!300858 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193844 (or (= lt!300858 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!300858 #b0000000000000000000000000000000000000000000000000000000000001000) lt!300858)))))

(assert (=> b!193844 (= lt!300858 ((_ sign_extend 32) (size!4406 (buf!4886 (_1!9036 lt!300644)))))))

(assert (= (and d!65723 res!162057) b!193843))

(assert (= (and b!193843 res!162058) b!193844))

(declare-fun m!300281 () Bool)

(assert (=> d!65723 m!300281))

(declare-fun m!300283 () Bool)

(assert (=> d!65723 m!300283))

(assert (=> b!193734 d!65723))

(declare-fun d!65725 () Bool)

(assert (=> d!65725 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!300634)))) ((_ sign_extend 32) (currentByte!9170 (_2!9035 lt!300647))) ((_ sign_extend 32) (currentBit!9165 (_2!9035 lt!300647))) lt!300627) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!300634)))) ((_ sign_extend 32) (currentByte!9170 (_2!9035 lt!300647))) ((_ sign_extend 32) (currentBit!9165 (_2!9035 lt!300647)))) lt!300627))))

(declare-fun bs!16353 () Bool)

(assert (= bs!16353 d!65725))

(declare-fun m!300285 () Bool)

(assert (=> bs!16353 m!300285))

(assert (=> b!193734 d!65725))

(declare-fun d!65727 () Bool)

(assert (=> d!65727 (validate_offset_bits!1 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!300634)))) ((_ sign_extend 32) (currentByte!9170 (_2!9035 lt!300647))) ((_ sign_extend 32) (currentBit!9165 (_2!9035 lt!300647))) lt!300627)))

(declare-fun lt!300861 () Unit!13689)

(assert (=> d!65727 (= lt!300861 (choose!9 (_2!9035 lt!300647) (buf!4886 (_2!9035 lt!300634)) lt!300627 (BitStream!7921 (buf!4886 (_2!9035 lt!300634)) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647)))))))

(assert (=> d!65727 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9035 lt!300647) (buf!4886 (_2!9035 lt!300634)) lt!300627) lt!300861)))

(declare-fun bs!16354 () Bool)

(assert (= bs!16354 d!65727))

(assert (=> bs!16354 m!300063))

(declare-fun m!300287 () Bool)

(assert (=> bs!16354 m!300287))

(assert (=> b!193734 d!65727))

(declare-fun b!193845 () Bool)

(declare-fun res!162060 () Bool)

(declare-fun e!133425 () Bool)

(assert (=> b!193845 (=> (not res!162060) (not e!133425))))

(declare-fun lt!300875 () tuple2!16784)

(assert (=> b!193845 (= res!162060 (isPrefixOf!0 (_1!9037 lt!300875) thiss!1204))))

(declare-fun b!193846 () Bool)

(declare-fun e!133426 () Unit!13689)

(declare-fun Unit!13694 () Unit!13689)

(assert (=> b!193846 (= e!133426 Unit!13694)))

(declare-fun b!193847 () Bool)

(declare-fun res!162059 () Bool)

(assert (=> b!193847 (=> (not res!162059) (not e!133425))))

(assert (=> b!193847 (= res!162059 (isPrefixOf!0 (_2!9037 lt!300875) (_2!9035 lt!300634)))))

(declare-fun lt!300864 () (_ BitVec 64))

(declare-fun b!193848 () Bool)

(declare-fun lt!300872 () (_ BitVec 64))

(assert (=> b!193848 (= e!133425 (= (_1!9037 lt!300875) (withMovedBitIndex!0 (_2!9037 lt!300875) (bvsub lt!300864 lt!300872))))))

(assert (=> b!193848 (or (= (bvand lt!300864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!300872 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!300864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300864 lt!300872) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!193848 (= lt!300872 (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300634))) (currentByte!9170 (_2!9035 lt!300634)) (currentBit!9165 (_2!9035 lt!300634))))))

(assert (=> b!193848 (= lt!300864 (bitIndex!0 (size!4406 (buf!4886 thiss!1204)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204)))))

(declare-fun d!65729 () Bool)

(assert (=> d!65729 e!133425))

(declare-fun res!162061 () Bool)

(assert (=> d!65729 (=> (not res!162061) (not e!133425))))

(assert (=> d!65729 (= res!162061 (isPrefixOf!0 (_1!9037 lt!300875) (_2!9037 lt!300875)))))

(declare-fun lt!300873 () BitStream!7920)

(assert (=> d!65729 (= lt!300875 (tuple2!16785 lt!300873 (_2!9035 lt!300634)))))

(declare-fun lt!300876 () Unit!13689)

(declare-fun lt!300862 () Unit!13689)

(assert (=> d!65729 (= lt!300876 lt!300862)))

(assert (=> d!65729 (isPrefixOf!0 lt!300873 (_2!9035 lt!300634))))

(assert (=> d!65729 (= lt!300862 (lemmaIsPrefixTransitive!0 lt!300873 (_2!9035 lt!300634) (_2!9035 lt!300634)))))

(declare-fun lt!300866 () Unit!13689)

(declare-fun lt!300869 () Unit!13689)

(assert (=> d!65729 (= lt!300866 lt!300869)))

(assert (=> d!65729 (isPrefixOf!0 lt!300873 (_2!9035 lt!300634))))

(assert (=> d!65729 (= lt!300869 (lemmaIsPrefixTransitive!0 lt!300873 thiss!1204 (_2!9035 lt!300634)))))

(declare-fun lt!300863 () Unit!13689)

(assert (=> d!65729 (= lt!300863 e!133426)))

(declare-fun c!9683 () Bool)

(assert (=> d!65729 (= c!9683 (not (= (size!4406 (buf!4886 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!300874 () Unit!13689)

(declare-fun lt!300865 () Unit!13689)

(assert (=> d!65729 (= lt!300874 lt!300865)))

(assert (=> d!65729 (isPrefixOf!0 (_2!9035 lt!300634) (_2!9035 lt!300634))))

(assert (=> d!65729 (= lt!300865 (lemmaIsPrefixRefl!0 (_2!9035 lt!300634)))))

(declare-fun lt!300870 () Unit!13689)

(declare-fun lt!300877 () Unit!13689)

(assert (=> d!65729 (= lt!300870 lt!300877)))

(assert (=> d!65729 (= lt!300877 (lemmaIsPrefixRefl!0 (_2!9035 lt!300634)))))

(declare-fun lt!300868 () Unit!13689)

(declare-fun lt!300881 () Unit!13689)

(assert (=> d!65729 (= lt!300868 lt!300881)))

(assert (=> d!65729 (isPrefixOf!0 lt!300873 lt!300873)))

(assert (=> d!65729 (= lt!300881 (lemmaIsPrefixRefl!0 lt!300873))))

(declare-fun lt!300867 () Unit!13689)

(declare-fun lt!300879 () Unit!13689)

(assert (=> d!65729 (= lt!300867 lt!300879)))

(assert (=> d!65729 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!65729 (= lt!300879 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!65729 (= lt!300873 (BitStream!7921 (buf!4886 (_2!9035 lt!300634)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204)))))

(assert (=> d!65729 (isPrefixOf!0 thiss!1204 (_2!9035 lt!300634))))

(assert (=> d!65729 (= (reader!0 thiss!1204 (_2!9035 lt!300634)) lt!300875)))

(declare-fun b!193849 () Bool)

(declare-fun lt!300878 () Unit!13689)

(assert (=> b!193849 (= e!133426 lt!300878)))

(declare-fun lt!300871 () (_ BitVec 64))

(assert (=> b!193849 (= lt!300871 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!300880 () (_ BitVec 64))

(assert (=> b!193849 (= lt!300880 (bitIndex!0 (size!4406 (buf!4886 thiss!1204)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204)))))

(assert (=> b!193849 (= lt!300878 (arrayBitRangesEqSymmetric!0 (buf!4886 thiss!1204) (buf!4886 (_2!9035 lt!300634)) lt!300871 lt!300880))))

(assert (=> b!193849 (arrayBitRangesEq!0 (buf!4886 (_2!9035 lt!300634)) (buf!4886 thiss!1204) lt!300871 lt!300880)))

(assert (= (and d!65729 c!9683) b!193849))

(assert (= (and d!65729 (not c!9683)) b!193846))

(assert (= (and d!65729 res!162061) b!193845))

(assert (= (and b!193845 res!162060) b!193847))

(assert (= (and b!193847 res!162059) b!193848))

(declare-fun m!300289 () Bool)

(assert (=> d!65729 m!300289))

(declare-fun m!300291 () Bool)

(assert (=> d!65729 m!300291))

(declare-fun m!300293 () Bool)

(assert (=> d!65729 m!300293))

(declare-fun m!300295 () Bool)

(assert (=> d!65729 m!300295))

(declare-fun m!300297 () Bool)

(assert (=> d!65729 m!300297))

(declare-fun m!300299 () Bool)

(assert (=> d!65729 m!300299))

(assert (=> d!65729 m!300253))

(assert (=> d!65729 m!300255))

(declare-fun m!300301 () Bool)

(assert (=> d!65729 m!300301))

(declare-fun m!300303 () Bool)

(assert (=> d!65729 m!300303))

(assert (=> d!65729 m!300117))

(declare-fun m!300305 () Bool)

(assert (=> b!193848 m!300305))

(assert (=> b!193848 m!300115))

(assert (=> b!193848 m!300083))

(declare-fun m!300307 () Bool)

(assert (=> b!193845 m!300307))

(assert (=> b!193849 m!300083))

(declare-fun m!300309 () Bool)

(assert (=> b!193849 m!300309))

(declare-fun m!300311 () Bool)

(assert (=> b!193849 m!300311))

(declare-fun m!300313 () Bool)

(assert (=> b!193847 m!300313))

(assert (=> b!193734 d!65729))

(declare-fun d!65731 () Bool)

(assert (=> d!65731 (= (invariant!0 (currentBit!9165 thiss!1204) (currentByte!9170 thiss!1204) (size!4406 (buf!4886 (_2!9035 lt!300634)))) (and (bvsge (currentBit!9165 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9165 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9170 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9170 thiss!1204) (size!4406 (buf!4886 (_2!9035 lt!300634)))) (and (= (currentBit!9165 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9170 thiss!1204) (size!4406 (buf!4886 (_2!9035 lt!300634))))))))))

(assert (=> b!193723 d!65731))

(declare-fun d!65733 () Bool)

(declare-fun res!162070 () Bool)

(declare-fun e!133431 () Bool)

(assert (=> d!65733 (=> (not res!162070) (not e!133431))))

(assert (=> d!65733 (= res!162070 (= (size!4406 (buf!4886 thiss!1204)) (size!4406 (buf!4886 (_2!9035 lt!300647)))))))

(assert (=> d!65733 (= (isPrefixOf!0 thiss!1204 (_2!9035 lt!300647)) e!133431)))

(declare-fun b!193856 () Bool)

(declare-fun res!162069 () Bool)

(assert (=> b!193856 (=> (not res!162069) (not e!133431))))

(assert (=> b!193856 (= res!162069 (bvsle (bitIndex!0 (size!4406 (buf!4886 thiss!1204)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204)) (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300647))) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647)))))))

(declare-fun b!193857 () Bool)

(declare-fun e!133432 () Bool)

(assert (=> b!193857 (= e!133431 e!133432)))

(declare-fun res!162068 () Bool)

(assert (=> b!193857 (=> res!162068 e!133432)))

(assert (=> b!193857 (= res!162068 (= (size!4406 (buf!4886 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!193858 () Bool)

(assert (=> b!193858 (= e!133432 (arrayBitRangesEq!0 (buf!4886 thiss!1204) (buf!4886 (_2!9035 lt!300647)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4406 (buf!4886 thiss!1204)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204))))))

(assert (= (and d!65733 res!162070) b!193856))

(assert (= (and b!193856 res!162069) b!193857))

(assert (= (and b!193857 (not res!162068)) b!193858))

(assert (=> b!193856 m!300083))

(assert (=> b!193856 m!300081))

(assert (=> b!193858 m!300083))

(assert (=> b!193858 m!300083))

(declare-fun m!300315 () Bool)

(assert (=> b!193858 m!300315))

(assert (=> b!193712 d!65733))

(declare-fun d!65735 () Bool)

(assert (=> d!65735 (= (array_inv!4147 (buf!4886 thiss!1204)) (bvsge (size!4406 (buf!4886 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!193717 d!65735))

(declare-fun d!65737 () Bool)

(assert (=> d!65737 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9165 thiss!1204) (currentByte!9170 thiss!1204) (size!4406 (buf!4886 thiss!1204))))))

(declare-fun bs!16355 () Bool)

(assert (= bs!16355 d!65737))

(assert (=> bs!16355 m!300097))

(assert (=> start!41314 d!65737))

(declare-fun d!65739 () Bool)

(declare-fun e!133433 () Bool)

(assert (=> d!65739 e!133433))

(declare-fun res!162071 () Bool)

(assert (=> d!65739 (=> (not res!162071) (not e!133433))))

(declare-fun lt!300887 () (_ BitVec 64))

(declare-fun lt!300886 () (_ BitVec 64))

(declare-fun lt!300884 () (_ BitVec 64))

(assert (=> d!65739 (= res!162071 (= lt!300886 (bvsub lt!300887 lt!300884)))))

(assert (=> d!65739 (or (= (bvand lt!300887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!300884 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!300887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300887 lt!300884) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65739 (= lt!300884 (remainingBits!0 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!300634)))) ((_ sign_extend 32) (currentByte!9170 (_2!9035 lt!300634))) ((_ sign_extend 32) (currentBit!9165 (_2!9035 lt!300634)))))))

(declare-fun lt!300882 () (_ BitVec 64))

(declare-fun lt!300883 () (_ BitVec 64))

(assert (=> d!65739 (= lt!300887 (bvmul lt!300882 lt!300883))))

(assert (=> d!65739 (or (= lt!300882 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!300883 (bvsdiv (bvmul lt!300882 lt!300883) lt!300882)))))

(assert (=> d!65739 (= lt!300883 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65739 (= lt!300882 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!300634)))))))

(assert (=> d!65739 (= lt!300886 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9170 (_2!9035 lt!300634))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9165 (_2!9035 lt!300634)))))))

(assert (=> d!65739 (invariant!0 (currentBit!9165 (_2!9035 lt!300634)) (currentByte!9170 (_2!9035 lt!300634)) (size!4406 (buf!4886 (_2!9035 lt!300634))))))

(assert (=> d!65739 (= (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300634))) (currentByte!9170 (_2!9035 lt!300634)) (currentBit!9165 (_2!9035 lt!300634))) lt!300886)))

(declare-fun b!193859 () Bool)

(declare-fun res!162072 () Bool)

(assert (=> b!193859 (=> (not res!162072) (not e!133433))))

(assert (=> b!193859 (= res!162072 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!300886))))

(declare-fun b!193860 () Bool)

(declare-fun lt!300885 () (_ BitVec 64))

(assert (=> b!193860 (= e!133433 (bvsle lt!300886 (bvmul lt!300885 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193860 (or (= lt!300885 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!300885 #b0000000000000000000000000000000000000000000000000000000000001000) lt!300885)))))

(assert (=> b!193860 (= lt!300885 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!300634)))))))

(assert (= (and d!65739 res!162071) b!193859))

(assert (= (and b!193859 res!162072) b!193860))

(declare-fun m!300317 () Bool)

(assert (=> d!65739 m!300317))

(assert (=> d!65739 m!300101))

(assert (=> b!193716 d!65739))

(declare-fun d!65741 () Bool)

(declare-fun res!162075 () Bool)

(declare-fun e!133434 () Bool)

(assert (=> d!65741 (=> (not res!162075) (not e!133434))))

(assert (=> d!65741 (= res!162075 (= (size!4406 (buf!4886 thiss!1204)) (size!4406 (buf!4886 (_2!9035 lt!300634)))))))

(assert (=> d!65741 (= (isPrefixOf!0 thiss!1204 (_2!9035 lt!300634)) e!133434)))

(declare-fun b!193861 () Bool)

(declare-fun res!162074 () Bool)

(assert (=> b!193861 (=> (not res!162074) (not e!133434))))

(assert (=> b!193861 (= res!162074 (bvsle (bitIndex!0 (size!4406 (buf!4886 thiss!1204)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204)) (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300634))) (currentByte!9170 (_2!9035 lt!300634)) (currentBit!9165 (_2!9035 lt!300634)))))))

(declare-fun b!193862 () Bool)

(declare-fun e!133435 () Bool)

(assert (=> b!193862 (= e!133434 e!133435)))

(declare-fun res!162073 () Bool)

(assert (=> b!193862 (=> res!162073 e!133435)))

(assert (=> b!193862 (= res!162073 (= (size!4406 (buf!4886 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!193863 () Bool)

(assert (=> b!193863 (= e!133435 (arrayBitRangesEq!0 (buf!4886 thiss!1204) (buf!4886 (_2!9035 lt!300634)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4406 (buf!4886 thiss!1204)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204))))))

(assert (= (and d!65741 res!162075) b!193861))

(assert (= (and b!193861 res!162074) b!193862))

(assert (= (and b!193862 (not res!162073)) b!193863))

(assert (=> b!193861 m!300083))

(assert (=> b!193861 m!300115))

(assert (=> b!193863 m!300083))

(assert (=> b!193863 m!300083))

(declare-fun m!300319 () Bool)

(assert (=> b!193863 m!300319))

(assert (=> b!193716 d!65741))

(declare-fun d!65743 () Bool)

(assert (=> d!65743 (isPrefixOf!0 thiss!1204 (_2!9035 lt!300634))))

(declare-fun lt!300890 () Unit!13689)

(declare-fun choose!30 (BitStream!7920 BitStream!7920 BitStream!7920) Unit!13689)

(assert (=> d!65743 (= lt!300890 (choose!30 thiss!1204 (_2!9035 lt!300647) (_2!9035 lt!300634)))))

(assert (=> d!65743 (isPrefixOf!0 thiss!1204 (_2!9035 lt!300647))))

(assert (=> d!65743 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9035 lt!300647) (_2!9035 lt!300634)) lt!300890)))

(declare-fun bs!16356 () Bool)

(assert (= bs!16356 d!65743))

(assert (=> bs!16356 m!300117))

(declare-fun m!300321 () Bool)

(assert (=> bs!16356 m!300321))

(assert (=> bs!16356 m!300041))

(assert (=> b!193716 d!65743))

(declare-fun b!194046 () Bool)

(declare-fun res!162233 () Bool)

(declare-fun e!133542 () Bool)

(assert (=> b!194046 (=> (not res!162233) (not e!133542))))

(declare-fun lt!301442 () tuple2!16780)

(assert (=> b!194046 (= res!162233 (= (size!4406 (buf!4886 (_2!9035 lt!300647))) (size!4406 (buf!4886 (_2!9035 lt!301442)))))))

(declare-fun b!194047 () Bool)

(declare-fun lt!301416 () tuple2!16782)

(declare-fun lt!301433 () tuple2!16780)

(assert (=> b!194047 (= lt!301416 (readBitPure!0 (readerFrom!0 (_2!9035 lt!301433) (currentBit!9165 (_2!9035 lt!300647)) (currentByte!9170 (_2!9035 lt!300647)))))))

(declare-fun res!162236 () Bool)

(declare-fun lt!301409 () Bool)

(assert (=> b!194047 (= res!162236 (and (= (_2!9036 lt!301416) lt!301409) (= (_1!9036 lt!301416) (_2!9035 lt!301433))))))

(declare-fun e!133541 () Bool)

(assert (=> b!194047 (=> (not res!162236) (not e!133541))))

(declare-fun e!133544 () Bool)

(assert (=> b!194047 (= e!133544 e!133541)))

(declare-fun b!194048 () Bool)

(declare-fun e!133538 () Bool)

(assert (=> b!194048 (= e!133542 e!133538)))

(declare-fun res!162239 () Bool)

(assert (=> b!194048 (=> (not res!162239) (not e!133538))))

(declare-fun lt!301406 () tuple2!16786)

(assert (=> b!194048 (= res!162239 (= (_2!9038 lt!301406) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!301443 () tuple2!16784)

(assert (=> b!194048 (= lt!301406 (readNBitsLSBFirstsLoopPure!0 (_1!9037 lt!301443) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!301403 () Unit!13689)

(declare-fun lt!301454 () Unit!13689)

(assert (=> b!194048 (= lt!301403 lt!301454)))

(declare-fun lt!301407 () (_ BitVec 64))

(assert (=> b!194048 (validate_offset_bits!1 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!301442)))) ((_ sign_extend 32) (currentByte!9170 (_2!9035 lt!300647))) ((_ sign_extend 32) (currentBit!9165 (_2!9035 lt!300647))) lt!301407)))

(assert (=> b!194048 (= lt!301454 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9035 lt!300647) (buf!4886 (_2!9035 lt!301442)) lt!301407))))

(declare-fun e!133539 () Bool)

(assert (=> b!194048 e!133539))

(declare-fun res!162237 () Bool)

(assert (=> b!194048 (=> (not res!162237) (not e!133539))))

(assert (=> b!194048 (= res!162237 (and (= (size!4406 (buf!4886 (_2!9035 lt!300647))) (size!4406 (buf!4886 (_2!9035 lt!301442)))) (bvsge lt!301407 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194048 (= lt!301407 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!194048 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!194048 (= lt!301443 (reader!0 (_2!9035 lt!300647) (_2!9035 lt!301442)))))

(declare-fun b!194049 () Bool)

(declare-fun res!162235 () Bool)

(assert (=> b!194049 (= res!162235 (= (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!301433))) (currentByte!9170 (_2!9035 lt!301433)) (currentBit!9165 (_2!9035 lt!301433))) (bvadd (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300647))) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!194049 (=> (not res!162235) (not e!133544))))

(declare-fun b!194050 () Bool)

(assert (=> b!194050 (= e!133539 (validate_offset_bits!1 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!300647)))) ((_ sign_extend 32) (currentByte!9170 (_2!9035 lt!300647))) ((_ sign_extend 32) (currentBit!9165 (_2!9035 lt!300647))) lt!301407))))

(declare-fun c!9697 () Bool)

(declare-fun bm!3047 () Bool)

(declare-fun call!3050 () Bool)

(assert (=> bm!3047 (= call!3050 (isPrefixOf!0 (_2!9035 lt!300647) (ite c!9697 (_2!9035 lt!300647) (_2!9035 lt!301433))))))

(declare-fun b!194051 () Bool)

(declare-fun e!133545 () tuple2!16780)

(declare-fun Unit!13695 () Unit!13689)

(assert (=> b!194051 (= e!133545 (tuple2!16781 Unit!13695 (_2!9035 lt!300647)))))

(declare-fun lt!301452 () Unit!13689)

(assert (=> b!194051 (= lt!301452 (lemmaIsPrefixRefl!0 (_2!9035 lt!300647)))))

(assert (=> b!194051 call!3050))

(declare-fun lt!301434 () Unit!13689)

(assert (=> b!194051 (= lt!301434 lt!301452)))

(declare-fun b!194052 () Bool)

(declare-fun e!133540 () (_ BitVec 64))

(assert (=> b!194052 (= e!133540 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!194053 () Bool)

(declare-fun e!133537 () Bool)

(declare-fun lt!301422 () tuple2!16782)

(declare-fun lt!301444 () tuple2!16782)

(assert (=> b!194053 (= e!133537 (= (_2!9036 lt!301422) (_2!9036 lt!301444)))))

(declare-fun d!65745 () Bool)

(assert (=> d!65745 e!133542))

(declare-fun res!162234 () Bool)

(assert (=> d!65745 (=> (not res!162234) (not e!133542))))

(assert (=> d!65745 (= res!162234 (invariant!0 (currentBit!9165 (_2!9035 lt!301442)) (currentByte!9170 (_2!9035 lt!301442)) (size!4406 (buf!4886 (_2!9035 lt!301442)))))))

(assert (=> d!65745 (= lt!301442 e!133545)))

(assert (=> d!65745 (= c!9697 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!65745 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!65745 (= (appendBitsLSBFirstLoopTR!0 (_2!9035 lt!300647) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!301442)))

(declare-fun b!194054 () Bool)

(declare-fun res!162238 () Bool)

(assert (=> b!194054 (=> (not res!162238) (not e!133542))))

(assert (=> b!194054 (= res!162238 (isPrefixOf!0 (_2!9035 lt!300647) (_2!9035 lt!301442)))))

(declare-fun b!194055 () Bool)

(assert (=> b!194055 (= e!133540 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!194056 () Bool)

(declare-fun res!162243 () Bool)

(assert (=> b!194056 (=> (not res!162243) (not e!133542))))

(declare-fun lt!301448 () (_ BitVec 64))

(declare-fun lt!301411 () (_ BitVec 64))

(assert (=> b!194056 (= res!162243 (= (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!301442))) (currentByte!9170 (_2!9035 lt!301442)) (currentBit!9165 (_2!9035 lt!301442))) (bvsub lt!301448 lt!301411)))))

(assert (=> b!194056 (or (= (bvand lt!301448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301411 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301448 lt!301411) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194056 (= lt!301411 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!301431 () (_ BitVec 64))

(declare-fun lt!301432 () (_ BitVec 64))

(assert (=> b!194056 (= lt!301448 (bvadd lt!301431 lt!301432))))

(assert (=> b!194056 (or (not (= (bvand lt!301431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301432 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!301431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!301431 lt!301432) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194056 (= lt!301432 ((_ sign_extend 32) nBits!348))))

(assert (=> b!194056 (= lt!301431 (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300647))) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647))))))

(declare-fun b!194057 () Bool)

(declare-fun lt!301445 () tuple2!16780)

(assert (=> b!194057 (= e!133545 (tuple2!16781 (_1!9035 lt!301445) (_2!9035 lt!301445)))))

(assert (=> b!194057 (= lt!301409 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194057 (= lt!301433 (appendBit!0 (_2!9035 lt!300647) lt!301409))))

(declare-fun res!162241 () Bool)

(assert (=> b!194057 (= res!162241 (= (size!4406 (buf!4886 (_2!9035 lt!300647))) (size!4406 (buf!4886 (_2!9035 lt!301433)))))))

(assert (=> b!194057 (=> (not res!162241) (not e!133544))))

(assert (=> b!194057 e!133544))

(declare-fun lt!301438 () tuple2!16780)

(assert (=> b!194057 (= lt!301438 lt!301433)))

(assert (=> b!194057 (= lt!301445 (appendBitsLSBFirstLoopTR!0 (_2!9035 lt!301438) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!301420 () Unit!13689)

(assert (=> b!194057 (= lt!301420 (lemmaIsPrefixTransitive!0 (_2!9035 lt!300647) (_2!9035 lt!301438) (_2!9035 lt!301445)))))

(assert (=> b!194057 (isPrefixOf!0 (_2!9035 lt!300647) (_2!9035 lt!301445))))

(declare-fun lt!301405 () Unit!13689)

(assert (=> b!194057 (= lt!301405 lt!301420)))

(assert (=> b!194057 (invariant!0 (currentBit!9165 (_2!9035 lt!300647)) (currentByte!9170 (_2!9035 lt!300647)) (size!4406 (buf!4886 (_2!9035 lt!301438))))))

(declare-fun lt!301446 () BitStream!7920)

(assert (=> b!194057 (= lt!301446 (BitStream!7921 (buf!4886 (_2!9035 lt!301438)) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647))))))

(assert (=> b!194057 (invariant!0 (currentBit!9165 lt!301446) (currentByte!9170 lt!301446) (size!4406 (buf!4886 (_2!9035 lt!301445))))))

(declare-fun lt!301414 () BitStream!7920)

(assert (=> b!194057 (= lt!301414 (BitStream!7921 (buf!4886 (_2!9035 lt!301445)) (currentByte!9170 lt!301446) (currentBit!9165 lt!301446)))))

(assert (=> b!194057 (= lt!301422 (readBitPure!0 lt!301446))))

(assert (=> b!194057 (= lt!301444 (readBitPure!0 lt!301414))))

(declare-fun lt!301412 () Unit!13689)

(assert (=> b!194057 (= lt!301412 (readBitPrefixLemma!0 lt!301446 (_2!9035 lt!301445)))))

(declare-fun res!162244 () Bool)

(assert (=> b!194057 (= res!162244 (= (bitIndex!0 (size!4406 (buf!4886 (_1!9036 lt!301422))) (currentByte!9170 (_1!9036 lt!301422)) (currentBit!9165 (_1!9036 lt!301422))) (bitIndex!0 (size!4406 (buf!4886 (_1!9036 lt!301444))) (currentByte!9170 (_1!9036 lt!301444)) (currentBit!9165 (_1!9036 lt!301444)))))))

(assert (=> b!194057 (=> (not res!162244) (not e!133537))))

(assert (=> b!194057 e!133537))

(declare-fun lt!301401 () Unit!13689)

(assert (=> b!194057 (= lt!301401 lt!301412)))

(declare-fun lt!301453 () tuple2!16784)

(assert (=> b!194057 (= lt!301453 (reader!0 (_2!9035 lt!300647) (_2!9035 lt!301445)))))

(declare-fun lt!301399 () tuple2!16784)

(assert (=> b!194057 (= lt!301399 (reader!0 (_2!9035 lt!301438) (_2!9035 lt!301445)))))

(declare-fun lt!301418 () tuple2!16782)

(assert (=> b!194057 (= lt!301418 (readBitPure!0 (_1!9037 lt!301453)))))

(assert (=> b!194057 (= (_2!9036 lt!301418) lt!301409)))

(declare-fun lt!301419 () Unit!13689)

(declare-fun Unit!13696 () Unit!13689)

(assert (=> b!194057 (= lt!301419 Unit!13696)))

(declare-fun lt!301424 () (_ BitVec 64))

(assert (=> b!194057 (= lt!301424 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!301400 () (_ BitVec 64))

(assert (=> b!194057 (= lt!301400 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!301408 () Unit!13689)

(assert (=> b!194057 (= lt!301408 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9035 lt!300647) (buf!4886 (_2!9035 lt!301445)) lt!301400))))

(assert (=> b!194057 (validate_offset_bits!1 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!301445)))) ((_ sign_extend 32) (currentByte!9170 (_2!9035 lt!300647))) ((_ sign_extend 32) (currentBit!9165 (_2!9035 lt!300647))) lt!301400)))

(declare-fun lt!301435 () Unit!13689)

(assert (=> b!194057 (= lt!301435 lt!301408)))

(declare-fun lt!301410 () tuple2!16786)

(assert (=> b!194057 (= lt!301410 (readNBitsLSBFirstsLoopPure!0 (_1!9037 lt!301453) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!301424))))

(declare-fun lt!301441 () (_ BitVec 64))

(assert (=> b!194057 (= lt!301441 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!301417 () Unit!13689)

(assert (=> b!194057 (= lt!301417 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9035 lt!301438) (buf!4886 (_2!9035 lt!301445)) lt!301441))))

(assert (=> b!194057 (validate_offset_bits!1 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!301445)))) ((_ sign_extend 32) (currentByte!9170 (_2!9035 lt!301438))) ((_ sign_extend 32) (currentBit!9165 (_2!9035 lt!301438))) lt!301441)))

(declare-fun lt!301425 () Unit!13689)

(assert (=> b!194057 (= lt!301425 lt!301417)))

(declare-fun lt!301437 () tuple2!16786)

(assert (=> b!194057 (= lt!301437 (readNBitsLSBFirstsLoopPure!0 (_1!9037 lt!301399) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!301424 (ite (_2!9036 lt!301418) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!301440 () tuple2!16786)

(assert (=> b!194057 (= lt!301440 (readNBitsLSBFirstsLoopPure!0 (_1!9037 lt!301453) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!301424))))

(declare-fun c!9696 () Bool)

(assert (=> b!194057 (= c!9696 (_2!9036 (readBitPure!0 (_1!9037 lt!301453))))))

(declare-fun lt!301430 () tuple2!16786)

(assert (=> b!194057 (= lt!301430 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9037 lt!301453) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!301424 e!133540)))))

(declare-fun lt!301421 () Unit!13689)

(assert (=> b!194057 (= lt!301421 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9037 lt!301453) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!301424))))

(assert (=> b!194057 (and (= (_2!9038 lt!301440) (_2!9038 lt!301430)) (= (_1!9038 lt!301440) (_1!9038 lt!301430)))))

(declare-fun lt!301429 () Unit!13689)

(assert (=> b!194057 (= lt!301429 lt!301421)))

(assert (=> b!194057 (= (_1!9037 lt!301453) (withMovedBitIndex!0 (_2!9037 lt!301453) (bvsub (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300647))) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647))) (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!301445))) (currentByte!9170 (_2!9035 lt!301445)) (currentBit!9165 (_2!9035 lt!301445))))))))

(declare-fun lt!301415 () Unit!13689)

(declare-fun Unit!13697 () Unit!13689)

(assert (=> b!194057 (= lt!301415 Unit!13697)))

(assert (=> b!194057 (= (_1!9037 lt!301399) (withMovedBitIndex!0 (_2!9037 lt!301399) (bvsub (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!301438))) (currentByte!9170 (_2!9035 lt!301438)) (currentBit!9165 (_2!9035 lt!301438))) (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!301445))) (currentByte!9170 (_2!9035 lt!301445)) (currentBit!9165 (_2!9035 lt!301445))))))))

(declare-fun lt!301436 () Unit!13689)

(declare-fun Unit!13698 () Unit!13689)

(assert (=> b!194057 (= lt!301436 Unit!13698)))

(assert (=> b!194057 (= (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300647))) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647))) (bvsub (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!301438))) (currentByte!9170 (_2!9035 lt!301438)) (currentBit!9165 (_2!9035 lt!301438))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!301413 () Unit!13689)

(declare-fun Unit!13699 () Unit!13689)

(assert (=> b!194057 (= lt!301413 Unit!13699)))

(assert (=> b!194057 (= (_2!9038 lt!301410) (_2!9038 lt!301437))))

(declare-fun lt!301439 () Unit!13689)

(declare-fun Unit!13700 () Unit!13689)

(assert (=> b!194057 (= lt!301439 Unit!13700)))

(assert (=> b!194057 (invariant!0 (currentBit!9165 (_2!9035 lt!301445)) (currentByte!9170 (_2!9035 lt!301445)) (size!4406 (buf!4886 (_2!9035 lt!301445))))))

(declare-fun lt!301451 () Unit!13689)

(declare-fun Unit!13701 () Unit!13689)

(assert (=> b!194057 (= lt!301451 Unit!13701)))

(assert (=> b!194057 (= (size!4406 (buf!4886 (_2!9035 lt!300647))) (size!4406 (buf!4886 (_2!9035 lt!301445))))))

(declare-fun lt!301428 () Unit!13689)

(declare-fun Unit!13702 () Unit!13689)

(assert (=> b!194057 (= lt!301428 Unit!13702)))

(assert (=> b!194057 (= (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!301445))) (currentByte!9170 (_2!9035 lt!301445)) (currentBit!9165 (_2!9035 lt!301445))) (bvsub (bvadd (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300647))) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!301427 () Unit!13689)

(declare-fun Unit!13703 () Unit!13689)

(assert (=> b!194057 (= lt!301427 Unit!13703)))

(declare-fun lt!301402 () Unit!13689)

(declare-fun Unit!13704 () Unit!13689)

(assert (=> b!194057 (= lt!301402 Unit!13704)))

(declare-fun lt!301449 () tuple2!16784)

(assert (=> b!194057 (= lt!301449 (reader!0 (_2!9035 lt!300647) (_2!9035 lt!301445)))))

(declare-fun lt!301450 () (_ BitVec 64))

(assert (=> b!194057 (= lt!301450 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!301404 () Unit!13689)

(assert (=> b!194057 (= lt!301404 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9035 lt!300647) (buf!4886 (_2!9035 lt!301445)) lt!301450))))

(assert (=> b!194057 (validate_offset_bits!1 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!301445)))) ((_ sign_extend 32) (currentByte!9170 (_2!9035 lt!300647))) ((_ sign_extend 32) (currentBit!9165 (_2!9035 lt!300647))) lt!301450)))

(declare-fun lt!301426 () Unit!13689)

(assert (=> b!194057 (= lt!301426 lt!301404)))

(declare-fun lt!301423 () tuple2!16786)

(assert (=> b!194057 (= lt!301423 (readNBitsLSBFirstsLoopPure!0 (_1!9037 lt!301449) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!162240 () Bool)

(assert (=> b!194057 (= res!162240 (= (_2!9038 lt!301423) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!133543 () Bool)

(assert (=> b!194057 (=> (not res!162240) (not e!133543))))

(assert (=> b!194057 e!133543))

(declare-fun lt!301447 () Unit!13689)

(declare-fun Unit!13705 () Unit!13689)

(assert (=> b!194057 (= lt!301447 Unit!13705)))

(declare-fun b!194058 () Bool)

(assert (=> b!194058 (= e!133543 (= (_1!9038 lt!301423) (_2!9037 lt!301449)))))

(declare-fun b!194059 () Bool)

(declare-fun res!162242 () Bool)

(assert (=> b!194059 (= res!162242 call!3050)))

(assert (=> b!194059 (=> (not res!162242) (not e!133544))))

(declare-fun b!194060 () Bool)

(assert (=> b!194060 (= e!133541 (= (bitIndex!0 (size!4406 (buf!4886 (_1!9036 lt!301416))) (currentByte!9170 (_1!9036 lt!301416)) (currentBit!9165 (_1!9036 lt!301416))) (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!301433))) (currentByte!9170 (_2!9035 lt!301433)) (currentBit!9165 (_2!9035 lt!301433)))))))

(declare-fun b!194061 () Bool)

(assert (=> b!194061 (= e!133538 (= (_1!9038 lt!301406) (_2!9037 lt!301443)))))

(assert (= (and d!65745 c!9697) b!194051))

(assert (= (and d!65745 (not c!9697)) b!194057))

(assert (= (and b!194057 res!162241) b!194049))

(assert (= (and b!194049 res!162235) b!194059))

(assert (= (and b!194059 res!162242) b!194047))

(assert (= (and b!194047 res!162236) b!194060))

(assert (= (and b!194057 res!162244) b!194053))

(assert (= (and b!194057 c!9696) b!194052))

(assert (= (and b!194057 (not c!9696)) b!194055))

(assert (= (and b!194057 res!162240) b!194058))

(assert (= (or b!194051 b!194059) bm!3047))

(assert (= (and d!65745 res!162234) b!194046))

(assert (= (and b!194046 res!162233) b!194056))

(assert (= (and b!194056 res!162243) b!194054))

(assert (= (and b!194054 res!162238) b!194048))

(assert (= (and b!194048 res!162237) b!194050))

(assert (= (and b!194048 res!162239) b!194061))

(declare-fun m!300629 () Bool)

(assert (=> b!194054 m!300629))

(declare-fun m!300631 () Bool)

(assert (=> b!194057 m!300631))

(declare-fun m!300633 () Bool)

(assert (=> b!194057 m!300633))

(declare-fun m!300635 () Bool)

(assert (=> b!194057 m!300635))

(declare-fun m!300637 () Bool)

(assert (=> b!194057 m!300637))

(declare-fun m!300639 () Bool)

(assert (=> b!194057 m!300639))

(declare-fun m!300641 () Bool)

(assert (=> b!194057 m!300641))

(declare-fun m!300643 () Bool)

(assert (=> b!194057 m!300643))

(declare-fun m!300645 () Bool)

(assert (=> b!194057 m!300645))

(declare-fun m!300647 () Bool)

(assert (=> b!194057 m!300647))

(declare-fun m!300649 () Bool)

(assert (=> b!194057 m!300649))

(declare-fun m!300651 () Bool)

(assert (=> b!194057 m!300651))

(declare-fun m!300653 () Bool)

(assert (=> b!194057 m!300653))

(declare-fun m!300655 () Bool)

(assert (=> b!194057 m!300655))

(declare-fun m!300657 () Bool)

(assert (=> b!194057 m!300657))

(assert (=> b!194057 m!300081))

(assert (=> b!194057 m!300113))

(declare-fun m!300659 () Bool)

(assert (=> b!194057 m!300659))

(declare-fun m!300661 () Bool)

(assert (=> b!194057 m!300661))

(declare-fun m!300663 () Bool)

(assert (=> b!194057 m!300663))

(declare-fun m!300665 () Bool)

(assert (=> b!194057 m!300665))

(declare-fun m!300667 () Bool)

(assert (=> b!194057 m!300667))

(declare-fun m!300669 () Bool)

(assert (=> b!194057 m!300669))

(declare-fun m!300671 () Bool)

(assert (=> b!194057 m!300671))

(assert (=> b!194057 m!300631))

(declare-fun m!300673 () Bool)

(assert (=> b!194057 m!300673))

(declare-fun m!300675 () Bool)

(assert (=> b!194057 m!300675))

(declare-fun m!300677 () Bool)

(assert (=> b!194057 m!300677))

(declare-fun m!300679 () Bool)

(assert (=> b!194057 m!300679))

(declare-fun m!300681 () Bool)

(assert (=> b!194057 m!300681))

(declare-fun m!300683 () Bool)

(assert (=> b!194057 m!300683))

(declare-fun m!300685 () Bool)

(assert (=> b!194057 m!300685))

(declare-fun m!300687 () Bool)

(assert (=> b!194057 m!300687))

(declare-fun m!300689 () Bool)

(assert (=> b!194057 m!300689))

(declare-fun m!300691 () Bool)

(assert (=> b!194057 m!300691))

(declare-fun m!300693 () Bool)

(assert (=> b!194057 m!300693))

(declare-fun m!300695 () Bool)

(assert (=> bm!3047 m!300695))

(declare-fun m!300697 () Bool)

(assert (=> b!194049 m!300697))

(assert (=> b!194049 m!300081))

(assert (=> b!194048 m!300113))

(declare-fun m!300699 () Bool)

(assert (=> b!194048 m!300699))

(declare-fun m!300701 () Bool)

(assert (=> b!194048 m!300701))

(declare-fun m!300703 () Bool)

(assert (=> b!194048 m!300703))

(declare-fun m!300705 () Bool)

(assert (=> b!194048 m!300705))

(assert (=> b!194048 m!300689))

(declare-fun m!300707 () Bool)

(assert (=> b!194056 m!300707))

(assert (=> b!194056 m!300081))

(assert (=> b!194051 m!300251))

(declare-fun m!300709 () Bool)

(assert (=> b!194047 m!300709))

(assert (=> b!194047 m!300709))

(declare-fun m!300711 () Bool)

(assert (=> b!194047 m!300711))

(declare-fun m!300713 () Bool)

(assert (=> b!194060 m!300713))

(assert (=> b!194060 m!300697))

(declare-fun m!300715 () Bool)

(assert (=> d!65745 m!300715))

(declare-fun m!300717 () Bool)

(assert (=> b!194050 m!300717))

(assert (=> b!193716 d!65745))

(declare-fun d!65901 () Bool)

(assert (=> d!65901 (= (invariant!0 (currentBit!9165 (_2!9035 lt!300634)) (currentByte!9170 (_2!9035 lt!300634)) (size!4406 (buf!4886 (_2!9035 lt!300634)))) (and (bvsge (currentBit!9165 (_2!9035 lt!300634)) #b00000000000000000000000000000000) (bvslt (currentBit!9165 (_2!9035 lt!300634)) #b00000000000000000000000000001000) (bvsge (currentByte!9170 (_2!9035 lt!300634)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9170 (_2!9035 lt!300634)) (size!4406 (buf!4886 (_2!9035 lt!300634)))) (and (= (currentBit!9165 (_2!9035 lt!300634)) #b00000000000000000000000000000000) (= (currentByte!9170 (_2!9035 lt!300634)) (size!4406 (buf!4886 (_2!9035 lt!300634))))))))))

(assert (=> b!193715 d!65901))

(assert (=> b!193736 d!65733))

(declare-fun d!65903 () Bool)

(assert (=> d!65903 (= (invariant!0 (currentBit!9165 thiss!1204) (currentByte!9170 thiss!1204) (size!4406 (buf!4886 thiss!1204))) (and (bvsge (currentBit!9165 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9165 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9170 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9170 thiss!1204) (size!4406 (buf!4886 thiss!1204))) (and (= (currentBit!9165 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9170 thiss!1204) (size!4406 (buf!4886 thiss!1204)))))))))

(assert (=> b!193730 d!65903))

(declare-fun d!65905 () Bool)

(declare-fun res!162247 () Bool)

(declare-fun e!133546 () Bool)

(assert (=> d!65905 (=> (not res!162247) (not e!133546))))

(assert (=> d!65905 (= res!162247 (= (size!4406 (buf!4886 (_2!9035 lt!300647))) (size!4406 (buf!4886 (_2!9035 lt!300634)))))))

(assert (=> d!65905 (= (isPrefixOf!0 (_2!9035 lt!300647) (_2!9035 lt!300634)) e!133546)))

(declare-fun b!194062 () Bool)

(declare-fun res!162246 () Bool)

(assert (=> b!194062 (=> (not res!162246) (not e!133546))))

(assert (=> b!194062 (= res!162246 (bvsle (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300647))) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647))) (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300634))) (currentByte!9170 (_2!9035 lt!300634)) (currentBit!9165 (_2!9035 lt!300634)))))))

(declare-fun b!194063 () Bool)

(declare-fun e!133547 () Bool)

(assert (=> b!194063 (= e!133546 e!133547)))

(declare-fun res!162245 () Bool)

(assert (=> b!194063 (=> res!162245 e!133547)))

(assert (=> b!194063 (= res!162245 (= (size!4406 (buf!4886 (_2!9035 lt!300647))) #b00000000000000000000000000000000))))

(declare-fun b!194064 () Bool)

(assert (=> b!194064 (= e!133547 (arrayBitRangesEq!0 (buf!4886 (_2!9035 lt!300647)) (buf!4886 (_2!9035 lt!300634)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300647))) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647)))))))

(assert (= (and d!65905 res!162247) b!194062))

(assert (= (and b!194062 res!162246) b!194063))

(assert (= (and b!194063 (not res!162245)) b!194064))

(assert (=> b!194062 m!300081))

(assert (=> b!194062 m!300115))

(assert (=> b!194064 m!300081))

(assert (=> b!194064 m!300081))

(declare-fun m!300719 () Bool)

(assert (=> b!194064 m!300719))

(assert (=> b!193719 d!65905))

(declare-fun d!65907 () Bool)

(declare-fun e!133550 () Bool)

(assert (=> d!65907 e!133550))

(declare-fun res!162250 () Bool)

(assert (=> d!65907 (=> (not res!162250) (not e!133550))))

(declare-fun lt!301459 () BitStream!7920)

(declare-fun lt!301460 () (_ BitVec 64))

(assert (=> d!65907 (= res!162250 (= (bvadd lt!301460 (bvsub lt!300632 lt!300641)) (bitIndex!0 (size!4406 (buf!4886 lt!301459)) (currentByte!9170 lt!301459) (currentBit!9165 lt!301459))))))

(assert (=> d!65907 (or (not (= (bvand lt!301460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300632 lt!300641) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!301460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!301460 (bvsub lt!300632 lt!300641)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65907 (= lt!301460 (bitIndex!0 (size!4406 (buf!4886 (_2!9037 lt!300631))) (currentByte!9170 (_2!9037 lt!300631)) (currentBit!9165 (_2!9037 lt!300631))))))

(declare-fun moveBitIndex!0 (BitStream!7920 (_ BitVec 64)) tuple2!16780)

(assert (=> d!65907 (= lt!301459 (_2!9035 (moveBitIndex!0 (_2!9037 lt!300631) (bvsub lt!300632 lt!300641))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7920 (_ BitVec 64)) Bool)

(assert (=> d!65907 (moveBitIndexPrecond!0 (_2!9037 lt!300631) (bvsub lt!300632 lt!300641))))

(assert (=> d!65907 (= (withMovedBitIndex!0 (_2!9037 lt!300631) (bvsub lt!300632 lt!300641)) lt!301459)))

(declare-fun b!194067 () Bool)

(assert (=> b!194067 (= e!133550 (= (size!4406 (buf!4886 (_2!9037 lt!300631))) (size!4406 (buf!4886 lt!301459))))))

(assert (= (and d!65907 res!162250) b!194067))

(declare-fun m!300721 () Bool)

(assert (=> d!65907 m!300721))

(assert (=> d!65907 m!300039))

(declare-fun m!300723 () Bool)

(assert (=> d!65907 m!300723))

(declare-fun m!300725 () Bool)

(assert (=> d!65907 m!300725))

(assert (=> b!193729 d!65907))

(declare-fun d!65909 () Bool)

(declare-fun e!133551 () Bool)

(assert (=> d!65909 e!133551))

(declare-fun res!162251 () Bool)

(assert (=> d!65909 (=> (not res!162251) (not e!133551))))

(declare-fun lt!301463 () (_ BitVec 64))

(declare-fun lt!301465 () (_ BitVec 64))

(declare-fun lt!301466 () (_ BitVec 64))

(assert (=> d!65909 (= res!162251 (= lt!301465 (bvsub lt!301466 lt!301463)))))

(assert (=> d!65909 (or (= (bvand lt!301466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301463 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301466 lt!301463) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65909 (= lt!301463 (remainingBits!0 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!300647)))) ((_ sign_extend 32) (currentByte!9170 (_2!9035 lt!300647))) ((_ sign_extend 32) (currentBit!9165 (_2!9035 lt!300647)))))))

(declare-fun lt!301461 () (_ BitVec 64))

(declare-fun lt!301462 () (_ BitVec 64))

(assert (=> d!65909 (= lt!301466 (bvmul lt!301461 lt!301462))))

(assert (=> d!65909 (or (= lt!301461 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301462 (bvsdiv (bvmul lt!301461 lt!301462) lt!301461)))))

(assert (=> d!65909 (= lt!301462 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65909 (= lt!301461 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!300647)))))))

(assert (=> d!65909 (= lt!301465 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9170 (_2!9035 lt!300647))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9165 (_2!9035 lt!300647)))))))

(assert (=> d!65909 (invariant!0 (currentBit!9165 (_2!9035 lt!300647)) (currentByte!9170 (_2!9035 lt!300647)) (size!4406 (buf!4886 (_2!9035 lt!300647))))))

(assert (=> d!65909 (= (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!300647))) (currentByte!9170 (_2!9035 lt!300647)) (currentBit!9165 (_2!9035 lt!300647))) lt!301465)))

(declare-fun b!194068 () Bool)

(declare-fun res!162252 () Bool)

(assert (=> b!194068 (=> (not res!162252) (not e!133551))))

(assert (=> b!194068 (= res!162252 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301465))))

(declare-fun b!194069 () Bool)

(declare-fun lt!301464 () (_ BitVec 64))

(assert (=> b!194069 (= e!133551 (bvsle lt!301465 (bvmul lt!301464 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194069 (or (= lt!301464 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301464 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301464)))))

(assert (=> b!194069 (= lt!301464 ((_ sign_extend 32) (size!4406 (buf!4886 (_2!9035 lt!300647)))))))

(assert (= (and d!65909 res!162251) b!194068))

(assert (= (and b!194068 res!162252) b!194069))

(declare-fun m!300727 () Bool)

(assert (=> d!65909 m!300727))

(assert (=> d!65909 m!300211))

(assert (=> b!193718 d!65909))

(declare-fun d!65911 () Bool)

(declare-fun e!133552 () Bool)

(assert (=> d!65911 e!133552))

(declare-fun res!162253 () Bool)

(assert (=> d!65911 (=> (not res!162253) (not e!133552))))

(declare-fun lt!301472 () (_ BitVec 64))

(declare-fun lt!301469 () (_ BitVec 64))

(declare-fun lt!301471 () (_ BitVec 64))

(assert (=> d!65911 (= res!162253 (= lt!301471 (bvsub lt!301472 lt!301469)))))

(assert (=> d!65911 (or (= (bvand lt!301472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301469 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301472 lt!301469) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65911 (= lt!301469 (remainingBits!0 ((_ sign_extend 32) (size!4406 (buf!4886 thiss!1204))) ((_ sign_extend 32) (currentByte!9170 thiss!1204)) ((_ sign_extend 32) (currentBit!9165 thiss!1204))))))

(declare-fun lt!301467 () (_ BitVec 64))

(declare-fun lt!301468 () (_ BitVec 64))

(assert (=> d!65911 (= lt!301472 (bvmul lt!301467 lt!301468))))

(assert (=> d!65911 (or (= lt!301467 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301468 (bvsdiv (bvmul lt!301467 lt!301468) lt!301467)))))

(assert (=> d!65911 (= lt!301468 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65911 (= lt!301467 ((_ sign_extend 32) (size!4406 (buf!4886 thiss!1204))))))

(assert (=> d!65911 (= lt!301471 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9170 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9165 thiss!1204))))))

(assert (=> d!65911 (invariant!0 (currentBit!9165 thiss!1204) (currentByte!9170 thiss!1204) (size!4406 (buf!4886 thiss!1204)))))

(assert (=> d!65911 (= (bitIndex!0 (size!4406 (buf!4886 thiss!1204)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204)) lt!301471)))

(declare-fun b!194070 () Bool)

(declare-fun res!162254 () Bool)

(assert (=> b!194070 (=> (not res!162254) (not e!133552))))

(assert (=> b!194070 (= res!162254 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301471))))

(declare-fun b!194071 () Bool)

(declare-fun lt!301470 () (_ BitVec 64))

(assert (=> b!194071 (= e!133552 (bvsle lt!301471 (bvmul lt!301470 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194071 (or (= lt!301470 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301470 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301470)))))

(assert (=> b!194071 (= lt!301470 ((_ sign_extend 32) (size!4406 (buf!4886 thiss!1204))))))

(assert (= (and d!65911 res!162253) b!194070))

(assert (= (and b!194070 res!162254) b!194071))

(assert (=> d!65911 m!300213))

(assert (=> d!65911 m!300097))

(assert (=> b!193718 d!65911))

(declare-fun d!65913 () Bool)

(declare-fun e!133557 () Bool)

(assert (=> d!65913 e!133557))

(declare-fun res!162263 () Bool)

(assert (=> d!65913 (=> (not res!162263) (not e!133557))))

(declare-fun lt!301482 () tuple2!16780)

(assert (=> d!65913 (= res!162263 (= (size!4406 (buf!4886 thiss!1204)) (size!4406 (buf!4886 (_2!9035 lt!301482)))))))

(declare-fun choose!16 (BitStream!7920 Bool) tuple2!16780)

(assert (=> d!65913 (= lt!301482 (choose!16 thiss!1204 lt!300638))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!65913 (validate_offset_bit!0 ((_ sign_extend 32) (size!4406 (buf!4886 thiss!1204))) ((_ sign_extend 32) (currentByte!9170 thiss!1204)) ((_ sign_extend 32) (currentBit!9165 thiss!1204)))))

(assert (=> d!65913 (= (appendBit!0 thiss!1204 lt!300638) lt!301482)))

(declare-fun b!194084 () Bool)

(declare-fun e!133558 () Bool)

(declare-fun lt!301483 () tuple2!16782)

(assert (=> b!194084 (= e!133558 (= (bitIndex!0 (size!4406 (buf!4886 (_1!9036 lt!301483))) (currentByte!9170 (_1!9036 lt!301483)) (currentBit!9165 (_1!9036 lt!301483))) (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!301482))) (currentByte!9170 (_2!9035 lt!301482)) (currentBit!9165 (_2!9035 lt!301482)))))))

(declare-fun b!194081 () Bool)

(declare-fun res!162264 () Bool)

(assert (=> b!194081 (=> (not res!162264) (not e!133557))))

(declare-fun lt!301481 () (_ BitVec 64))

(declare-fun lt!301484 () (_ BitVec 64))

(assert (=> b!194081 (= res!162264 (= (bitIndex!0 (size!4406 (buf!4886 (_2!9035 lt!301482))) (currentByte!9170 (_2!9035 lt!301482)) (currentBit!9165 (_2!9035 lt!301482))) (bvadd lt!301484 lt!301481)))))

(assert (=> b!194081 (or (not (= (bvand lt!301484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301481 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!301484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!301484 lt!301481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194081 (= lt!301481 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!194081 (= lt!301484 (bitIndex!0 (size!4406 (buf!4886 thiss!1204)) (currentByte!9170 thiss!1204) (currentBit!9165 thiss!1204)))))

(declare-fun b!194083 () Bool)

(assert (=> b!194083 (= e!133557 e!133558)))

(declare-fun res!162266 () Bool)

(assert (=> b!194083 (=> (not res!162266) (not e!133558))))

(assert (=> b!194083 (= res!162266 (and (= (_2!9036 lt!301483) lt!300638) (= (_1!9036 lt!301483) (_2!9035 lt!301482))))))

(assert (=> b!194083 (= lt!301483 (readBitPure!0 (readerFrom!0 (_2!9035 lt!301482) (currentBit!9165 thiss!1204) (currentByte!9170 thiss!1204))))))

(declare-fun b!194082 () Bool)

(declare-fun res!162265 () Bool)

(assert (=> b!194082 (=> (not res!162265) (not e!133557))))

(assert (=> b!194082 (= res!162265 (isPrefixOf!0 thiss!1204 (_2!9035 lt!301482)))))

(assert (= (and d!65913 res!162263) b!194081))

(assert (= (and b!194081 res!162264) b!194082))

(assert (= (and b!194082 res!162265) b!194083))

(assert (= (and b!194083 res!162266) b!194084))

(declare-fun m!300729 () Bool)

(assert (=> b!194082 m!300729))

(declare-fun m!300731 () Bool)

(assert (=> b!194083 m!300731))

(assert (=> b!194083 m!300731))

(declare-fun m!300733 () Bool)

(assert (=> b!194083 m!300733))

(declare-fun m!300735 () Bool)

(assert (=> b!194084 m!300735))

(declare-fun m!300737 () Bool)

(assert (=> b!194084 m!300737))

(declare-fun m!300739 () Bool)

(assert (=> d!65913 m!300739))

(declare-fun m!300741 () Bool)

(assert (=> d!65913 m!300741))

(assert (=> b!194081 m!300737))

(assert (=> b!194081 m!300083))

(assert (=> b!193718 d!65913))

(declare-fun d!65915 () Bool)

(declare-fun e!133559 () Bool)

(assert (=> d!65915 e!133559))

(declare-fun res!162267 () Bool)

(assert (=> d!65915 (=> (not res!162267) (not e!133559))))

(declare-fun lt!301490 () (_ BitVec 64))

(declare-fun lt!301489 () (_ BitVec 64))

(declare-fun lt!301487 () (_ BitVec 64))

(assert (=> d!65915 (= res!162267 (= lt!301489 (bvsub lt!301490 lt!301487)))))

(assert (=> d!65915 (or (= (bvand lt!301490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301487 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301490 lt!301487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65915 (= lt!301487 (remainingBits!0 ((_ sign_extend 32) (size!4406 (buf!4886 (_1!9036 lt!300646)))) ((_ sign_extend 32) (currentByte!9170 (_1!9036 lt!300646))) ((_ sign_extend 32) (currentBit!9165 (_1!9036 lt!300646)))))))

(declare-fun lt!301485 () (_ BitVec 64))

(declare-fun lt!301486 () (_ BitVec 64))

(assert (=> d!65915 (= lt!301490 (bvmul lt!301485 lt!301486))))

(assert (=> d!65915 (or (= lt!301485 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301486 (bvsdiv (bvmul lt!301485 lt!301486) lt!301485)))))

(assert (=> d!65915 (= lt!301486 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65915 (= lt!301485 ((_ sign_extend 32) (size!4406 (buf!4886 (_1!9036 lt!300646)))))))

(assert (=> d!65915 (= lt!301489 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9170 (_1!9036 lt!300646))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9165 (_1!9036 lt!300646)))))))

(assert (=> d!65915 (invariant!0 (currentBit!9165 (_1!9036 lt!300646)) (currentByte!9170 (_1!9036 lt!300646)) (size!4406 (buf!4886 (_1!9036 lt!300646))))))

(assert (=> d!65915 (= (bitIndex!0 (size!4406 (buf!4886 (_1!9036 lt!300646))) (currentByte!9170 (_1!9036 lt!300646)) (currentBit!9165 (_1!9036 lt!300646))) lt!301489)))

(declare-fun b!194085 () Bool)

(declare-fun res!162268 () Bool)

(assert (=> b!194085 (=> (not res!162268) (not e!133559))))

(assert (=> b!194085 (= res!162268 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301489))))

(declare-fun b!194086 () Bool)

(declare-fun lt!301488 () (_ BitVec 64))

(assert (=> b!194086 (= e!133559 (bvsle lt!301489 (bvmul lt!301488 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!194086 (or (= lt!301488 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301488 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301488)))))

(assert (=> b!194086 (= lt!301488 ((_ sign_extend 32) (size!4406 (buf!4886 (_1!9036 lt!300646)))))))

(assert (= (and d!65915 res!162267) b!194085))

(assert (= (and b!194085 res!162268) b!194086))

(declare-fun m!300743 () Bool)

(assert (=> d!65915 m!300743))

(declare-fun m!300745 () Bool)

(assert (=> d!65915 m!300745))

(assert (=> b!193728 d!65915))

(declare-fun d!65917 () Bool)

(assert (=> d!65917 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!193722 d!65917))

(declare-fun d!65919 () Bool)

(declare-fun e!133560 () Bool)

(assert (=> d!65919 e!133560))

(declare-fun res!162269 () Bool)

(assert (=> d!65919 (=> (not res!162269) (not e!133560))))

(declare-fun lt!301491 () BitStream!7920)

(declare-fun lt!301492 () (_ BitVec 64))

(assert (=> d!65919 (= res!162269 (= (bvadd lt!301492 (bvsub lt!300652 lt!300641)) (bitIndex!0 (size!4406 (buf!4886 lt!301491)) (currentByte!9170 lt!301491) (currentBit!9165 lt!301491))))))

(assert (=> d!65919 (or (not (= (bvand lt!301492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300652 lt!300641) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!301492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!301492 (bvsub lt!300652 lt!300641)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65919 (= lt!301492 (bitIndex!0 (size!4406 (buf!4886 (_2!9037 lt!300636))) (currentByte!9170 (_2!9037 lt!300636)) (currentBit!9165 (_2!9037 lt!300636))))))

(assert (=> d!65919 (= lt!301491 (_2!9035 (moveBitIndex!0 (_2!9037 lt!300636) (bvsub lt!300652 lt!300641))))))

(assert (=> d!65919 (moveBitIndexPrecond!0 (_2!9037 lt!300636) (bvsub lt!300652 lt!300641))))

(assert (=> d!65919 (= (withMovedBitIndex!0 (_2!9037 lt!300636) (bvsub lt!300652 lt!300641)) lt!301491)))

(declare-fun b!194087 () Bool)

(assert (=> b!194087 (= e!133560 (= (size!4406 (buf!4886 (_2!9037 lt!300636))) (size!4406 (buf!4886 lt!301491))))))

(assert (= (and d!65919 res!162269) b!194087))

(declare-fun m!300747 () Bool)

(assert (=> d!65919 m!300747))

(declare-fun m!300749 () Bool)

(assert (=> d!65919 m!300749))

(declare-fun m!300751 () Bool)

(assert (=> d!65919 m!300751))

(declare-fun m!300753 () Bool)

(assert (=> d!65919 m!300753))

(assert (=> b!193732 d!65919))

(declare-fun d!65921 () Bool)

(declare-fun lt!301510 () tuple2!16786)

(declare-fun lt!301509 () tuple2!16786)

(assert (=> d!65921 (and (= (_2!9038 lt!301510) (_2!9038 lt!301509)) (= (_1!9038 lt!301510) (_1!9038 lt!301509)))))

(declare-fun lt!301508 () BitStream!7920)

(declare-fun lt!301505 () Bool)

(declare-fun lt!301507 () Unit!13689)

(declare-fun lt!301506 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!7920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16786 tuple2!16786 BitStream!7920 (_ BitVec 64) Bool BitStream!7920 (_ BitVec 64) tuple2!16786 tuple2!16786 BitStream!7920 (_ BitVec 64)) Unit!13689)

(assert (=> d!65921 (= lt!301507 (choose!56 (_1!9037 lt!300631) nBits!348 i!590 lt!300635 lt!301510 (tuple2!16787 (_1!9038 lt!301510) (_2!9038 lt!301510)) (_1!9038 lt!301510) (_2!9038 lt!301510) lt!301505 lt!301508 lt!301506 lt!301509 (tuple2!16787 (_1!9038 lt!301509) (_2!9038 lt!301509)) (_1!9038 lt!301509) (_2!9038 lt!301509)))))

(assert (=> d!65921 (= lt!301509 (readNBitsLSBFirstsLoopPure!0 lt!301508 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!301506))))

(assert (=> d!65921 (= lt!301506 (bvor lt!300635 (ite lt!301505 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65921 (= lt!301508 (withMovedBitIndex!0 (_1!9037 lt!300631) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!65921 (= lt!301505 (_2!9036 (readBitPure!0 (_1!9037 lt!300631))))))

(assert (=> d!65921 (= lt!301510 (readNBitsLSBFirstsLoopPure!0 (_1!9037 lt!300631) nBits!348 i!590 lt!300635))))

(assert (=> d!65921 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9037 lt!300631) nBits!348 i!590 lt!300635) lt!301507)))

(declare-fun bs!16387 () Bool)

(assert (= bs!16387 d!65921))

(assert (=> bs!16387 m!300089))

(declare-fun m!300755 () Bool)

(assert (=> bs!16387 m!300755))

(declare-fun m!300757 () Bool)

(assert (=> bs!16387 m!300757))

(assert (=> bs!16387 m!300051))

(assert (=> bs!16387 m!300075))

(assert (=> b!193721 d!65921))

(declare-fun lt!301511 () tuple2!16798)

(declare-fun d!65923 () Bool)

(assert (=> d!65923 (= lt!301511 (readNBitsLSBFirstsLoop!0 lt!300629 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300649))))

(assert (=> d!65923 (= (readNBitsLSBFirstsLoopPure!0 lt!300629 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300649) (tuple2!16787 (_2!9044 lt!301511) (_1!9044 lt!301511)))))

(declare-fun bs!16388 () Bool)

(assert (= bs!16388 d!65923))

(declare-fun m!300759 () Bool)

(assert (=> bs!16388 m!300759))

(assert (=> b!193721 d!65923))

(declare-fun d!65925 () Bool)

(declare-fun e!133561 () Bool)

(assert (=> d!65925 e!133561))

(declare-fun res!162270 () Bool)

(assert (=> d!65925 (=> (not res!162270) (not e!133561))))

(declare-fun lt!301513 () (_ BitVec 64))

(declare-fun lt!301512 () BitStream!7920)

(assert (=> d!65925 (= res!162270 (= (bvadd lt!301513 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4406 (buf!4886 lt!301512)) (currentByte!9170 lt!301512) (currentBit!9165 lt!301512))))))

(assert (=> d!65925 (or (not (= (bvand lt!301513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!301513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!301513 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65925 (= lt!301513 (bitIndex!0 (size!4406 (buf!4886 (_1!9037 lt!300631))) (currentByte!9170 (_1!9037 lt!300631)) (currentBit!9165 (_1!9037 lt!300631))))))

(assert (=> d!65925 (= lt!301512 (_2!9035 (moveBitIndex!0 (_1!9037 lt!300631) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!65925 (moveBitIndexPrecond!0 (_1!9037 lt!300631) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!65925 (= (withMovedBitIndex!0 (_1!9037 lt!300631) #b0000000000000000000000000000000000000000000000000000000000000001) lt!301512)))

(declare-fun b!194088 () Bool)

(assert (=> b!194088 (= e!133561 (= (size!4406 (buf!4886 (_1!9037 lt!300631))) (size!4406 (buf!4886 lt!301512))))))

(assert (= (and d!65925 res!162270) b!194088))

(declare-fun m!300761 () Bool)

(assert (=> d!65925 m!300761))

(declare-fun m!300763 () Bool)

(assert (=> d!65925 m!300763))

(declare-fun m!300765 () Bool)

(assert (=> d!65925 m!300765))

(declare-fun m!300767 () Bool)

(assert (=> d!65925 m!300767))

(assert (=> b!193721 d!65925))

(assert (=> b!193731 d!65909))

(assert (=> b!193731 d!65911))

(declare-fun d!65927 () Bool)

(assert (=> d!65927 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4406 (buf!4886 (_1!9037 lt!300631)))) ((_ sign_extend 32) (currentByte!9170 (_1!9037 lt!300631))) ((_ sign_extend 32) (currentBit!9165 (_1!9037 lt!300631))) lt!300639) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4406 (buf!4886 (_1!9037 lt!300631)))) ((_ sign_extend 32) (currentByte!9170 (_1!9037 lt!300631))) ((_ sign_extend 32) (currentBit!9165 (_1!9037 lt!300631)))) lt!300639))))

(declare-fun bs!16389 () Bool)

(assert (= bs!16389 d!65927))

(declare-fun m!300769 () Bool)

(assert (=> bs!16389 m!300769))

(assert (=> b!193720 d!65927))

(check-sat (not d!65927) (not b!193856) (not b!193845) (not b!193838) (not d!65729) (not d!65691) (not b!194081) (not b!193847) (not b!194050) (not d!65693) (not b!193861) (not b!194047) (not d!65713) (not d!65911) (not d!65697) (not d!65925) (not b!194060) (not b!194048) (not b!194083) (not b!194056) (not b!194057) (not d!65907) (not d!65921) (not b!193848) (not d!65919) (not d!65699) (not d!65703) (not d!65715) (not d!65739) (not d!65745) (not d!65909) (not b!193863) (not d!65705) (not b!194062) (not b!194054) (not d!65737) (not d!65743) (not d!65711) (not b!194049) (not b!193842) (not bm!3047) (not b!193841) (not b!193858) (not d!65915) (not d!65689) (not b!194051) (not b!194082) (not d!65725) (not d!65721) (not d!65727) (not b!194064) (not d!65717) (not d!65695) (not d!65913) (not b!194084) (not d!65923) (not b!193814) (not d!65723) (not d!65719) (not b!193849) (not d!65707) (not b!193840))
(check-sat)
