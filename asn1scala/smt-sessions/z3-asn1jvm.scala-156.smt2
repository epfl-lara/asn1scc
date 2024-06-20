; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3660 () Bool)

(assert start!3660)

(declare-fun b!15939 () Bool)

(declare-fun e!9951 () Bool)

(declare-datatypes ((array!965 0))(
  ( (array!966 (arr!839 (Array (_ BitVec 32) (_ BitVec 8))) (size!410 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!780 0))(
  ( (BitStream!781 (buf!773 array!965) (currentByte!1942 (_ BitVec 32)) (currentBit!1937 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1944 0))(
  ( (tuple2!1945 (_1!1033 BitStream!780) (_2!1033 Bool)) )
))
(declare-fun lt!24350 () tuple2!1944)

(declare-datatypes ((tuple2!1946 0))(
  ( (tuple2!1947 (_1!1034 BitStream!780) (_2!1034 BitStream!780)) )
))
(declare-fun lt!24348 () tuple2!1946)

(assert (=> b!15939 (= e!9951 (not (or (not (_2!1033 lt!24350)) (not (= (_1!1033 lt!24350) (_2!1034 lt!24348))))))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!780 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1944)

(assert (=> b!15939 (= lt!24350 (checkBitsLoopPure!0 (_1!1034 lt!24348) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!1313 0))(
  ( (Unit!1314) )
))
(declare-datatypes ((tuple2!1948 0))(
  ( (tuple2!1949 (_1!1035 Unit!1313) (_2!1035 BitStream!780)) )
))
(declare-fun lt!24352 () tuple2!1948)

(declare-fun thiss!1073 () BitStream!780)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15939 (validate_offset_bits!1 ((_ sign_extend 32) (size!410 (buf!773 (_2!1035 lt!24352)))) ((_ sign_extend 32) (currentByte!1942 thiss!1073)) ((_ sign_extend 32) (currentBit!1937 thiss!1073)) nBits!313)))

(declare-fun lt!24345 () Unit!1313)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!780 array!965 (_ BitVec 64)) Unit!1313)

(assert (=> b!15939 (= lt!24345 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!773 (_2!1035 lt!24352)) nBits!313))))

(declare-fun reader!0 (BitStream!780 BitStream!780) tuple2!1946)

(assert (=> b!15939 (= lt!24348 (reader!0 thiss!1073 (_2!1035 lt!24352)))))

(declare-fun b!15940 () Bool)

(declare-fun e!9952 () Bool)

(declare-fun lt!24343 () tuple2!1944)

(declare-fun lt!24349 () tuple2!1946)

(assert (=> b!15940 (= e!9952 (not (and (_2!1033 lt!24343) (= (_1!1033 lt!24343) (_2!1034 lt!24349)))))))

(assert (=> b!15940 (= lt!24343 (checkBitsLoopPure!0 (_1!1034 lt!24349) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15940 (validate_offset_bits!1 ((_ sign_extend 32) (size!410 (buf!773 (_2!1035 lt!24352)))) ((_ sign_extend 32) (currentByte!1942 thiss!1073)) ((_ sign_extend 32) (currentBit!1937 thiss!1073)) nBits!313)))

(declare-fun lt!24347 () Unit!1313)

(assert (=> b!15940 (= lt!24347 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!773 (_2!1035 lt!24352)) nBits!313))))

(assert (=> b!15940 (= lt!24349 (reader!0 thiss!1073 (_2!1035 lt!24352)))))

(declare-fun lt!24351 () Bool)

(declare-fun isPrefixOf!0 (BitStream!780 BitStream!780) Bool)

(assert (=> b!15940 (= lt!24351 (isPrefixOf!0 thiss!1073 (_2!1035 lt!24352)))))

(declare-fun lt!24346 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15940 (= lt!24346 (bitIndex!0 (size!410 (buf!773 (_2!1035 lt!24352))) (currentByte!1942 (_2!1035 lt!24352)) (currentBit!1937 (_2!1035 lt!24352))))))

(declare-fun lt!24344 () (_ BitVec 64))

(assert (=> b!15940 (= lt!24344 (bitIndex!0 (size!410 (buf!773 thiss!1073)) (currentByte!1942 thiss!1073) (currentBit!1937 thiss!1073)))))

(assert (=> b!15940 e!9951))

(declare-fun res!14792 () Bool)

(assert (=> b!15940 (=> (not res!14792) (not e!9951))))

(assert (=> b!15940 (= res!14792 (= (size!410 (buf!773 thiss!1073)) (size!410 (buf!773 (_2!1035 lt!24352)))))))

(declare-fun appendNBits!0 (BitStream!780 (_ BitVec 64) Bool) tuple2!1948)

(assert (=> b!15940 (= lt!24352 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15941 () Bool)

(declare-fun res!14791 () Bool)

(assert (=> b!15941 (=> (not res!14791) (not e!9952))))

(assert (=> b!15941 (= res!14791 (validate_offset_bits!1 ((_ sign_extend 32) (size!410 (buf!773 thiss!1073))) ((_ sign_extend 32) (currentByte!1942 thiss!1073)) ((_ sign_extend 32) (currentBit!1937 thiss!1073)) nBits!313))))

(declare-fun b!15942 () Bool)

(declare-fun e!9954 () Bool)

(declare-fun array_inv!399 (array!965) Bool)

(assert (=> b!15942 (= e!9954 (array_inv!399 (buf!773 thiss!1073)))))

(declare-fun res!14795 () Bool)

(assert (=> start!3660 (=> (not res!14795) (not e!9952))))

(assert (=> start!3660 (= res!14795 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3660 e!9952))

(assert (=> start!3660 true))

(declare-fun inv!12 (BitStream!780) Bool)

(assert (=> start!3660 (and (inv!12 thiss!1073) e!9954)))

(declare-fun b!15943 () Bool)

(declare-fun res!14794 () Bool)

(assert (=> b!15943 (=> (not res!14794) (not e!9951))))

(assert (=> b!15943 (= res!14794 (= (bitIndex!0 (size!410 (buf!773 (_2!1035 lt!24352))) (currentByte!1942 (_2!1035 lt!24352)) (currentBit!1937 (_2!1035 lt!24352))) (bvadd (bitIndex!0 (size!410 (buf!773 thiss!1073)) (currentByte!1942 thiss!1073) (currentBit!1937 thiss!1073)) nBits!313)))))

(declare-fun b!15944 () Bool)

(declare-fun res!14793 () Bool)

(assert (=> b!15944 (=> (not res!14793) (not e!9951))))

(assert (=> b!15944 (= res!14793 (isPrefixOf!0 thiss!1073 (_2!1035 lt!24352)))))

(assert (= (and start!3660 res!14795) b!15941))

(assert (= (and b!15941 res!14791) b!15940))

(assert (= (and b!15940 res!14792) b!15943))

(assert (= (and b!15943 res!14794) b!15944))

(assert (= (and b!15944 res!14793) b!15939))

(assert (= start!3660 b!15942))

(declare-fun m!22713 () Bool)

(assert (=> b!15944 m!22713))

(declare-fun m!22715 () Bool)

(assert (=> b!15939 m!22715))

(declare-fun m!22717 () Bool)

(assert (=> b!15939 m!22717))

(declare-fun m!22719 () Bool)

(assert (=> b!15939 m!22719))

(declare-fun m!22721 () Bool)

(assert (=> b!15939 m!22721))

(declare-fun m!22723 () Bool)

(assert (=> b!15943 m!22723))

(declare-fun m!22725 () Bool)

(assert (=> b!15943 m!22725))

(declare-fun m!22727 () Bool)

(assert (=> start!3660 m!22727))

(assert (=> b!15940 m!22725))

(declare-fun m!22729 () Bool)

(assert (=> b!15940 m!22729))

(assert (=> b!15940 m!22723))

(assert (=> b!15940 m!22717))

(assert (=> b!15940 m!22721))

(assert (=> b!15940 m!22719))

(declare-fun m!22731 () Bool)

(assert (=> b!15940 m!22731))

(assert (=> b!15940 m!22713))

(declare-fun m!22733 () Bool)

(assert (=> b!15941 m!22733))

(declare-fun m!22735 () Bool)

(assert (=> b!15942 m!22735))

(check-sat (not start!3660) (not b!15944) (not b!15941) (not b!15940) (not b!15939) (not b!15943) (not b!15942))
