; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3662 () Bool)

(assert start!3662)

(declare-fun b!15957 () Bool)

(declare-fun res!14808 () Bool)

(declare-fun e!9963 () Bool)

(assert (=> b!15957 (=> (not res!14808) (not e!9963))))

(declare-datatypes ((array!967 0))(
  ( (array!968 (arr!840 (Array (_ BitVec 32) (_ BitVec 8))) (size!411 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!782 0))(
  ( (BitStream!783 (buf!774 array!967) (currentByte!1943 (_ BitVec 32)) (currentBit!1938 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!782)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15957 (= res!14808 (validate_offset_bits!1 ((_ sign_extend 32) (size!411 (buf!774 thiss!1073))) ((_ sign_extend 32) (currentByte!1943 thiss!1073)) ((_ sign_extend 32) (currentBit!1938 thiss!1073)) nBits!313))))

(declare-fun res!14809 () Bool)

(assert (=> start!3662 (=> (not res!14809) (not e!9963))))

(assert (=> start!3662 (= res!14809 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3662 e!9963))

(assert (=> start!3662 true))

(declare-fun e!9966 () Bool)

(declare-fun inv!12 (BitStream!782) Bool)

(assert (=> start!3662 (and (inv!12 thiss!1073) e!9966)))

(declare-fun b!15958 () Bool)

(declare-datatypes ((tuple2!1950 0))(
  ( (tuple2!1951 (_1!1036 BitStream!782) (_2!1036 Bool)) )
))
(declare-fun lt!24379 () tuple2!1950)

(declare-datatypes ((tuple2!1952 0))(
  ( (tuple2!1953 (_1!1037 BitStream!782) (_2!1037 BitStream!782)) )
))
(declare-fun lt!24375 () tuple2!1952)

(assert (=> b!15958 (= e!9963 (not (and (_2!1036 lt!24379) (= (_1!1036 lt!24379) (_2!1037 lt!24375)))))))

(declare-fun checkBitsLoopPure!0 (BitStream!782 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1950)

(assert (=> b!15958 (= lt!24379 (checkBitsLoopPure!0 (_1!1037 lt!24375) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!1315 0))(
  ( (Unit!1316) )
))
(declare-datatypes ((tuple2!1954 0))(
  ( (tuple2!1955 (_1!1038 Unit!1315) (_2!1038 BitStream!782)) )
))
(declare-fun lt!24378 () tuple2!1954)

(assert (=> b!15958 (validate_offset_bits!1 ((_ sign_extend 32) (size!411 (buf!774 (_2!1038 lt!24378)))) ((_ sign_extend 32) (currentByte!1943 thiss!1073)) ((_ sign_extend 32) (currentBit!1938 thiss!1073)) nBits!313)))

(declare-fun lt!24377 () Unit!1315)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!782 array!967 (_ BitVec 64)) Unit!1315)

(assert (=> b!15958 (= lt!24377 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!774 (_2!1038 lt!24378)) nBits!313))))

(declare-fun reader!0 (BitStream!782 BitStream!782) tuple2!1952)

(assert (=> b!15958 (= lt!24375 (reader!0 thiss!1073 (_2!1038 lt!24378)))))

(declare-fun lt!24376 () Bool)

(declare-fun isPrefixOf!0 (BitStream!782 BitStream!782) Bool)

(assert (=> b!15958 (= lt!24376 (isPrefixOf!0 thiss!1073 (_2!1038 lt!24378)))))

(declare-fun lt!24374 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15958 (= lt!24374 (bitIndex!0 (size!411 (buf!774 (_2!1038 lt!24378))) (currentByte!1943 (_2!1038 lt!24378)) (currentBit!1938 (_2!1038 lt!24378))))))

(declare-fun lt!24380 () (_ BitVec 64))

(assert (=> b!15958 (= lt!24380 (bitIndex!0 (size!411 (buf!774 thiss!1073)) (currentByte!1943 thiss!1073) (currentBit!1938 thiss!1073)))))

(declare-fun e!9964 () Bool)

(assert (=> b!15958 e!9964))

(declare-fun res!14810 () Bool)

(assert (=> b!15958 (=> (not res!14810) (not e!9964))))

(assert (=> b!15958 (= res!14810 (= (size!411 (buf!774 thiss!1073)) (size!411 (buf!774 (_2!1038 lt!24378)))))))

(declare-fun appendNBits!0 (BitStream!782 (_ BitVec 64) Bool) tuple2!1954)

(assert (=> b!15958 (= lt!24378 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15959 () Bool)

(declare-fun res!14807 () Bool)

(assert (=> b!15959 (=> (not res!14807) (not e!9964))))

(assert (=> b!15959 (= res!14807 (= (bitIndex!0 (size!411 (buf!774 (_2!1038 lt!24378))) (currentByte!1943 (_2!1038 lt!24378)) (currentBit!1938 (_2!1038 lt!24378))) (bvadd (bitIndex!0 (size!411 (buf!774 thiss!1073)) (currentByte!1943 thiss!1073) (currentBit!1938 thiss!1073)) nBits!313)))))

(declare-fun b!15960 () Bool)

(declare-fun res!14806 () Bool)

(assert (=> b!15960 (=> (not res!14806) (not e!9964))))

(assert (=> b!15960 (= res!14806 (isPrefixOf!0 thiss!1073 (_2!1038 lt!24378)))))

(declare-fun b!15961 () Bool)

(declare-fun lt!24373 () tuple2!1950)

(declare-fun lt!24382 () tuple2!1952)

(assert (=> b!15961 (= e!9964 (not (or (not (_2!1036 lt!24373)) (not (= (_1!1036 lt!24373) (_2!1037 lt!24382))))))))

(assert (=> b!15961 (= lt!24373 (checkBitsLoopPure!0 (_1!1037 lt!24382) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15961 (validate_offset_bits!1 ((_ sign_extend 32) (size!411 (buf!774 (_2!1038 lt!24378)))) ((_ sign_extend 32) (currentByte!1943 thiss!1073)) ((_ sign_extend 32) (currentBit!1938 thiss!1073)) nBits!313)))

(declare-fun lt!24381 () Unit!1315)

(assert (=> b!15961 (= lt!24381 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!774 (_2!1038 lt!24378)) nBits!313))))

(assert (=> b!15961 (= lt!24382 (reader!0 thiss!1073 (_2!1038 lt!24378)))))

(declare-fun b!15962 () Bool)

(declare-fun array_inv!400 (array!967) Bool)

(assert (=> b!15962 (= e!9966 (array_inv!400 (buf!774 thiss!1073)))))

(assert (= (and start!3662 res!14809) b!15957))

(assert (= (and b!15957 res!14808) b!15958))

(assert (= (and b!15958 res!14810) b!15959))

(assert (= (and b!15959 res!14807) b!15960))

(assert (= (and b!15960 res!14806) b!15961))

(assert (= start!3662 b!15962))

(declare-fun m!22737 () Bool)

(assert (=> b!15961 m!22737))

(declare-fun m!22739 () Bool)

(assert (=> b!15961 m!22739))

(declare-fun m!22741 () Bool)

(assert (=> b!15961 m!22741))

(declare-fun m!22743 () Bool)

(assert (=> b!15961 m!22743))

(declare-fun m!22745 () Bool)

(assert (=> b!15962 m!22745))

(declare-fun m!22747 () Bool)

(assert (=> b!15957 m!22747))

(declare-fun m!22749 () Bool)

(assert (=> b!15959 m!22749))

(declare-fun m!22751 () Bool)

(assert (=> b!15959 m!22751))

(declare-fun m!22753 () Bool)

(assert (=> start!3662 m!22753))

(declare-fun m!22755 () Bool)

(assert (=> b!15960 m!22755))

(assert (=> b!15958 m!22751))

(assert (=> b!15958 m!22741))

(assert (=> b!15958 m!22749))

(assert (=> b!15958 m!22743))

(declare-fun m!22757 () Bool)

(assert (=> b!15958 m!22757))

(assert (=> b!15958 m!22755))

(assert (=> b!15958 m!22739))

(declare-fun m!22759 () Bool)

(assert (=> b!15958 m!22759))

(push 1)

(assert (not b!15958))

(assert (not b!15959))

(assert (not start!3662))

(assert (not b!15957))

(assert (not b!15961))

(assert (not b!15960))

(assert (not b!15962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

