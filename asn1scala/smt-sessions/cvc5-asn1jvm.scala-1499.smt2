; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41546 () Bool)

(assert start!41546)

(declare-fun b!194862 () Bool)

(declare-fun res!162950 () Bool)

(declare-fun e!134019 () Bool)

(assert (=> b!194862 (=> res!162950 e!134019)))

(declare-datatypes ((array!10004 0))(
  ( (array!10005 (arr!5341 (Array (_ BitVec 32) (_ BitVec 8))) (size!4411 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7930 0))(
  ( (BitStream!7931 (buf!4897 array!10004) (currentByte!9193 (_ BitVec 32)) (currentBit!9188 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7930)

(declare-datatypes ((Unit!13777 0))(
  ( (Unit!13778) )
))
(declare-datatypes ((tuple2!16844 0))(
  ( (tuple2!16845 (_1!9067 Unit!13777) (_2!9067 BitStream!7930)) )
))
(declare-fun lt!303340 () tuple2!16844)

(declare-fun isPrefixOf!0 (BitStream!7930 BitStream!7930) Bool)

(assert (=> b!194862 (= res!162950 (not (isPrefixOf!0 thiss!1204 (_2!9067 lt!303340))))))

(declare-fun b!194863 () Bool)

(declare-fun e!134018 () Bool)

(declare-fun e!134020 () Bool)

(assert (=> b!194863 (= e!134018 e!134020)))

(declare-fun res!162962 () Bool)

(assert (=> b!194863 (=> (not res!162962) (not e!134020))))

(declare-datatypes ((tuple2!16846 0))(
  ( (tuple2!16847 (_1!9068 BitStream!7930) (_2!9068 Bool)) )
))
(declare-fun lt!303348 () tuple2!16846)

(declare-fun lt!303330 () Bool)

(assert (=> b!194863 (= res!162962 (and (= (_2!9068 lt!303348) lt!303330) (= (_1!9068 lt!303348) (_2!9067 lt!303340))))))

(declare-fun readBitPure!0 (BitStream!7930) tuple2!16846)

(declare-fun readerFrom!0 (BitStream!7930 (_ BitVec 32) (_ BitVec 32)) BitStream!7930)

(assert (=> b!194863 (= lt!303348 (readBitPure!0 (readerFrom!0 (_2!9067 lt!303340) (currentBit!9188 thiss!1204) (currentByte!9193 thiss!1204))))))

(declare-fun b!194864 () Bool)

(declare-fun res!162967 () Bool)

(assert (=> b!194864 (=> res!162967 e!134019)))

(declare-fun lt!303353 () tuple2!16844)

(assert (=> b!194864 (= res!162967 (not (isPrefixOf!0 (_2!9067 lt!303340) (_2!9067 lt!303353))))))

(declare-fun b!194865 () Bool)

(declare-fun e!134017 () Bool)

(declare-fun e!134026 () Bool)

(assert (=> b!194865 (= e!134017 e!134026)))

(declare-fun res!162965 () Bool)

(assert (=> b!194865 (=> res!162965 e!134026)))

(declare-datatypes ((tuple2!16848 0))(
  ( (tuple2!16849 (_1!9069 BitStream!7930) (_2!9069 BitStream!7930)) )
))
(declare-fun lt!303336 () tuple2!16848)

(declare-fun lt!303355 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!194865 (= res!162965 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4411 (buf!4897 (_1!9069 lt!303336)))) ((_ sign_extend 32) (currentByte!9193 (_1!9069 lt!303336))) ((_ sign_extend 32) (currentBit!9188 (_1!9069 lt!303336))) lt!303355)))))

(declare-fun e!134023 () Bool)

(assert (=> b!194865 e!134023))

(declare-fun res!162951 () Bool)

(assert (=> b!194865 (=> (not res!162951) (not e!134023))))

(assert (=> b!194865 (= res!162951 (= (size!4411 (buf!4897 thiss!1204)) (size!4411 (buf!4897 (_2!9067 lt!303353)))))))

(declare-fun b!194866 () Bool)

(declare-fun e!134016 () Bool)

(assert (=> b!194866 (= e!134016 e!134019)))

(declare-fun res!162954 () Bool)

(assert (=> b!194866 (=> res!162954 e!134019)))

(declare-fun lt!303329 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!303347 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!194866 (= res!162954 (not (= lt!303347 (bvsub (bvsub (bvadd lt!303329 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!194866 (= lt!303347 (bitIndex!0 (size!4411 (buf!4897 (_2!9067 lt!303353))) (currentByte!9193 (_2!9067 lt!303353)) (currentBit!9188 (_2!9067 lt!303353))))))

(assert (=> b!194866 (isPrefixOf!0 thiss!1204 (_2!9067 lt!303353))))

(declare-fun lt!303343 () Unit!13777)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7930 BitStream!7930 BitStream!7930) Unit!13777)

(assert (=> b!194866 (= lt!303343 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9067 lt!303340) (_2!9067 lt!303353)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7930 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16844)

(assert (=> b!194866 (= lt!303353 (appendBitsLSBFirstLoopTR!0 (_2!9067 lt!303340) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!194867 () Bool)

(declare-fun res!162960 () Bool)

(assert (=> b!194867 (=> res!162960 e!134017)))

(declare-datatypes ((tuple2!16850 0))(
  ( (tuple2!16851 (_1!9070 BitStream!7930) (_2!9070 (_ BitVec 64))) )
))
(declare-fun lt!303352 () tuple2!16850)

(assert (=> b!194867 (= res!162960 (not (= (bitIndex!0 (size!4411 (buf!4897 (_1!9070 lt!303352))) (currentByte!9193 (_1!9070 lt!303352)) (currentBit!9188 (_1!9070 lt!303352))) (bitIndex!0 (size!4411 (buf!4897 (_2!9069 lt!303336))) (currentByte!9193 (_2!9069 lt!303336)) (currentBit!9188 (_2!9069 lt!303336))))))))

(declare-fun b!194868 () Bool)

(declare-fun res!162968 () Bool)

(assert (=> b!194868 (=> (not res!162968) (not e!134023))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!194868 (= res!162968 (= (_2!9070 lt!303352) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!194869 () Bool)

(declare-fun e!134025 () Bool)

(assert (=> b!194869 (= e!134025 e!134018)))

(declare-fun res!162961 () Bool)

(assert (=> b!194869 (=> (not res!162961) (not e!134018))))

(declare-fun lt!303334 () (_ BitVec 64))

(declare-fun lt!303344 () (_ BitVec 64))

(assert (=> b!194869 (= res!162961 (= lt!303334 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!303344)))))

(assert (=> b!194869 (= lt!303334 (bitIndex!0 (size!4411 (buf!4897 (_2!9067 lt!303340))) (currentByte!9193 (_2!9067 lt!303340)) (currentBit!9188 (_2!9067 lt!303340))))))

(assert (=> b!194869 (= lt!303344 (bitIndex!0 (size!4411 (buf!4897 thiss!1204)) (currentByte!9193 thiss!1204) (currentBit!9188 thiss!1204)))))

(declare-fun b!194870 () Bool)

(declare-fun res!162959 () Bool)

(declare-fun e!134027 () Bool)

(assert (=> b!194870 (=> (not res!162959) (not e!134027))))

(declare-fun lt!303338 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7930 (_ BitVec 64)) BitStream!7930)

(assert (=> b!194870 (= res!162959 (= (_1!9069 lt!303336) (withMovedBitIndex!0 (_2!9069 lt!303336) (bvsub lt!303338 lt!303347))))))

(declare-fun b!194871 () Bool)

(declare-fun res!162975 () Bool)

(assert (=> b!194871 (=> res!162975 e!134019)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!194871 (= res!162975 (not (invariant!0 (currentBit!9188 (_2!9067 lt!303353)) (currentByte!9193 (_2!9067 lt!303353)) (size!4411 (buf!4897 (_2!9067 lt!303353))))))))

(declare-fun b!194872 () Bool)

(declare-fun e!134029 () Bool)

(declare-fun e!134021 () Bool)

(assert (=> b!194872 (= e!134029 e!134021)))

(declare-fun res!162952 () Bool)

(assert (=> b!194872 (=> (not res!162952) (not e!134021))))

(assert (=> b!194872 (= res!162952 (validate_offset_bits!1 ((_ sign_extend 32) (size!4411 (buf!4897 thiss!1204))) ((_ sign_extend 32) (currentByte!9193 thiss!1204)) ((_ sign_extend 32) (currentBit!9188 thiss!1204)) lt!303355))))

(assert (=> b!194872 (= lt!303355 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun res!162970 () Bool)

(assert (=> start!41546 (=> (not res!162970) (not e!134029))))

(assert (=> start!41546 (= res!162970 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41546 e!134029))

(assert (=> start!41546 true))

(declare-fun e!134022 () Bool)

(declare-fun inv!12 (BitStream!7930) Bool)

(assert (=> start!41546 (and (inv!12 thiss!1204) e!134022)))

(declare-fun b!194873 () Bool)

(assert (=> b!194873 (= e!134020 (= (bitIndex!0 (size!4411 (buf!4897 (_1!9068 lt!303348))) (currentByte!9193 (_1!9068 lt!303348)) (currentBit!9188 (_1!9068 lt!303348))) lt!303334))))

(declare-fun b!194874 () Bool)

(declare-fun e!134024 () Bool)

(declare-fun lt!303333 () tuple2!16846)

(declare-fun lt!303345 () tuple2!16846)

(assert (=> b!194874 (= e!134024 (= (_2!9068 lt!303333) (_2!9068 lt!303345)))))

(declare-fun b!194875 () Bool)

(declare-fun res!162955 () Bool)

(assert (=> b!194875 (=> (not res!162955) (not e!134018))))

(assert (=> b!194875 (= res!162955 (isPrefixOf!0 thiss!1204 (_2!9067 lt!303340)))))

(declare-fun b!194876 () Bool)

(declare-fun e!134015 () Bool)

(assert (=> b!194876 (= e!134015 e!134017)))

(declare-fun res!162969 () Bool)

(assert (=> b!194876 (=> res!162969 e!134017)))

(declare-fun lt!303341 () tuple2!16848)

(declare-fun lt!303327 () BitStream!7930)

(assert (=> b!194876 (= res!162969 (not (= (_1!9069 lt!303341) lt!303327)))))

(assert (=> b!194876 e!134027))

(declare-fun res!162958 () Bool)

(assert (=> b!194876 (=> (not res!162958) (not e!134027))))

(declare-fun lt!303349 () tuple2!16850)

(assert (=> b!194876 (= res!162958 (and (= (_2!9070 lt!303352) (_2!9070 lt!303349)) (= (_1!9070 lt!303352) (_1!9070 lt!303349))))))

(declare-fun lt!303354 () Unit!13777)

(declare-fun lt!303350 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7930 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13777)

(assert (=> b!194876 (= lt!303354 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9069 lt!303336) nBits!348 i!590 lt!303350))))

(declare-fun lt!303337 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7930 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16850)

(assert (=> b!194876 (= lt!303349 (readNBitsLSBFirstsLoopPure!0 lt!303327 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!303337))))

(assert (=> b!194876 (= lt!303327 (withMovedBitIndex!0 (_1!9069 lt!303336) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!194877 () Bool)

(declare-fun res!162957 () Bool)

(assert (=> b!194877 (=> (not res!162957) (not e!134021))))

(assert (=> b!194877 (= res!162957 (invariant!0 (currentBit!9188 thiss!1204) (currentByte!9193 thiss!1204) (size!4411 (buf!4897 thiss!1204))))))

(declare-fun b!194878 () Bool)

(assert (=> b!194878 (= e!134023 (= (_1!9070 lt!303352) (_2!9069 lt!303336)))))

(declare-fun b!194879 () Bool)

(declare-fun res!162966 () Bool)

(assert (=> b!194879 (=> res!162966 e!134019)))

(assert (=> b!194879 (= res!162966 (or (not (= (size!4411 (buf!4897 (_2!9067 lt!303353))) (size!4411 (buf!4897 thiss!1204)))) (not (= lt!303347 (bvsub (bvadd lt!303338 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!194880 () Bool)

(assert (=> b!194880 (= e!134021 (not e!134016))))

(declare-fun res!162963 () Bool)

(assert (=> b!194880 (=> res!162963 e!134016)))

(assert (=> b!194880 (= res!162963 (not (= lt!303329 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!303338))))))

(assert (=> b!194880 (= lt!303329 (bitIndex!0 (size!4411 (buf!4897 (_2!9067 lt!303340))) (currentByte!9193 (_2!9067 lt!303340)) (currentBit!9188 (_2!9067 lt!303340))))))

(assert (=> b!194880 (= lt!303338 (bitIndex!0 (size!4411 (buf!4897 thiss!1204)) (currentByte!9193 thiss!1204) (currentBit!9188 thiss!1204)))))

(assert (=> b!194880 e!134025))

(declare-fun res!162971 () Bool)

(assert (=> b!194880 (=> (not res!162971) (not e!134025))))

(assert (=> b!194880 (= res!162971 (= (size!4411 (buf!4897 thiss!1204)) (size!4411 (buf!4897 (_2!9067 lt!303340)))))))

(declare-fun appendBit!0 (BitStream!7930 Bool) tuple2!16844)

(assert (=> b!194880 (= lt!303340 (appendBit!0 thiss!1204 lt!303330))))

(declare-fun lt!303342 () (_ BitVec 64))

(assert (=> b!194880 (= lt!303330 (not (= (bvand v!189 lt!303342) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194880 (= lt!303342 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!194881 () Bool)

(declare-fun res!162973 () Bool)

(assert (=> b!194881 (=> (not res!162973) (not e!134027))))

(assert (=> b!194881 (= res!162973 (= (_1!9069 lt!303341) (withMovedBitIndex!0 (_2!9069 lt!303341) (bvsub lt!303329 lt!303347))))))

(declare-fun b!194882 () Bool)

(assert (=> b!194882 (= e!134019 e!134015)))

(declare-fun res!162964 () Bool)

(assert (=> b!194882 (=> res!162964 e!134015)))

(declare-fun lt!303346 () tuple2!16850)

(assert (=> b!194882 (= res!162964 (not (= (_1!9070 lt!303346) (_2!9069 lt!303341))))))

(assert (=> b!194882 (= lt!303346 (readNBitsLSBFirstsLoopPure!0 (_1!9069 lt!303341) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!303337))))

(declare-fun lt!303339 () (_ BitVec 64))

(assert (=> b!194882 (validate_offset_bits!1 ((_ sign_extend 32) (size!4411 (buf!4897 (_2!9067 lt!303353)))) ((_ sign_extend 32) (currentByte!9193 (_2!9067 lt!303340))) ((_ sign_extend 32) (currentBit!9188 (_2!9067 lt!303340))) lt!303339)))

(declare-fun lt!303332 () Unit!13777)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7930 array!10004 (_ BitVec 64)) Unit!13777)

(assert (=> b!194882 (= lt!303332 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9067 lt!303340) (buf!4897 (_2!9067 lt!303353)) lt!303339))))

(assert (=> b!194882 (= lt!303339 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!303351 () tuple2!16846)

(assert (=> b!194882 (= lt!303337 (bvor lt!303350 (ite (_2!9068 lt!303351) lt!303342 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194882 (= lt!303352 (readNBitsLSBFirstsLoopPure!0 (_1!9069 lt!303336) nBits!348 i!590 lt!303350))))

(assert (=> b!194882 (validate_offset_bits!1 ((_ sign_extend 32) (size!4411 (buf!4897 (_2!9067 lt!303353)))) ((_ sign_extend 32) (currentByte!9193 thiss!1204)) ((_ sign_extend 32) (currentBit!9188 thiss!1204)) lt!303355)))

(declare-fun lt!303335 () Unit!13777)

(assert (=> b!194882 (= lt!303335 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4897 (_2!9067 lt!303353)) lt!303355))))

(assert (=> b!194882 (= lt!303350 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!194882 (= (_2!9068 lt!303351) lt!303330)))

(assert (=> b!194882 (= lt!303351 (readBitPure!0 (_1!9069 lt!303336)))))

(declare-fun reader!0 (BitStream!7930 BitStream!7930) tuple2!16848)

(assert (=> b!194882 (= lt!303341 (reader!0 (_2!9067 lt!303340) (_2!9067 lt!303353)))))

(assert (=> b!194882 (= lt!303336 (reader!0 thiss!1204 (_2!9067 lt!303353)))))

(assert (=> b!194882 e!134024))

(declare-fun res!162974 () Bool)

(assert (=> b!194882 (=> (not res!162974) (not e!134024))))

(assert (=> b!194882 (= res!162974 (= (bitIndex!0 (size!4411 (buf!4897 (_1!9068 lt!303333))) (currentByte!9193 (_1!9068 lt!303333)) (currentBit!9188 (_1!9068 lt!303333))) (bitIndex!0 (size!4411 (buf!4897 (_1!9068 lt!303345))) (currentByte!9193 (_1!9068 lt!303345)) (currentBit!9188 (_1!9068 lt!303345)))))))

(declare-fun lt!303331 () Unit!13777)

(declare-fun lt!303328 () BitStream!7930)

(declare-fun readBitPrefixLemma!0 (BitStream!7930 BitStream!7930) Unit!13777)

(assert (=> b!194882 (= lt!303331 (readBitPrefixLemma!0 lt!303328 (_2!9067 lt!303353)))))

(assert (=> b!194882 (= lt!303345 (readBitPure!0 (BitStream!7931 (buf!4897 (_2!9067 lt!303353)) (currentByte!9193 thiss!1204) (currentBit!9188 thiss!1204))))))

(assert (=> b!194882 (= lt!303333 (readBitPure!0 lt!303328))))

(declare-fun e!134028 () Bool)

(assert (=> b!194882 e!134028))

(declare-fun res!162972 () Bool)

(assert (=> b!194882 (=> (not res!162972) (not e!134028))))

(assert (=> b!194882 (= res!162972 (invariant!0 (currentBit!9188 thiss!1204) (currentByte!9193 thiss!1204) (size!4411 (buf!4897 (_2!9067 lt!303340)))))))

(assert (=> b!194882 (= lt!303328 (BitStream!7931 (buf!4897 (_2!9067 lt!303340)) (currentByte!9193 thiss!1204) (currentBit!9188 thiss!1204)))))

(declare-fun b!194883 () Bool)

(assert (=> b!194883 (= e!134028 (invariant!0 (currentBit!9188 thiss!1204) (currentByte!9193 thiss!1204) (size!4411 (buf!4897 (_2!9067 lt!303353)))))))

(declare-fun b!194884 () Bool)

(declare-fun array_inv!4152 (array!10004) Bool)

(assert (=> b!194884 (= e!134022 (array_inv!4152 (buf!4897 thiss!1204)))))

(declare-fun b!194885 () Bool)

(assert (=> b!194885 (= e!134027 (and (= lt!303338 (bvsub lt!303329 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9069 lt!303341) lt!303327)) (= (_2!9070 lt!303352) (_2!9070 lt!303346)))))))

(declare-fun b!194886 () Bool)

(assert (=> b!194886 (= e!134026 (= (bvand lt!303350 #b1111111111111111111111111111111111111111111111111111111111111111) lt!303350))))

(declare-fun b!194887 () Bool)

(declare-fun res!162953 () Bool)

(assert (=> b!194887 (=> res!162953 e!134026)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!194887 (= res!162953 (not (= (bvand lt!303350 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194888 () Bool)

(declare-fun res!162956 () Bool)

(assert (=> b!194888 (=> (not res!162956) (not e!134021))))

(assert (=> b!194888 (= res!162956 (not (= i!590 nBits!348)))))

(assert (= (and start!41546 res!162970) b!194872))

(assert (= (and b!194872 res!162952) b!194877))

(assert (= (and b!194877 res!162957) b!194888))

(assert (= (and b!194888 res!162956) b!194880))

(assert (= (and b!194880 res!162971) b!194869))

(assert (= (and b!194869 res!162961) b!194875))

(assert (= (and b!194875 res!162955) b!194863))

(assert (= (and b!194863 res!162962) b!194873))

(assert (= (and b!194880 (not res!162963)) b!194866))

(assert (= (and b!194866 (not res!162954)) b!194871))

(assert (= (and b!194871 (not res!162975)) b!194879))

(assert (= (and b!194879 (not res!162966)) b!194864))

(assert (= (and b!194864 (not res!162967)) b!194862))

(assert (= (and b!194862 (not res!162950)) b!194882))

(assert (= (and b!194882 res!162972) b!194883))

(assert (= (and b!194882 res!162974) b!194874))

(assert (= (and b!194882 (not res!162964)) b!194876))

(assert (= (and b!194876 res!162958) b!194870))

(assert (= (and b!194870 res!162959) b!194881))

(assert (= (and b!194881 res!162973) b!194885))

(assert (= (and b!194876 (not res!162969)) b!194867))

(assert (= (and b!194867 (not res!162960)) b!194865))

(assert (= (and b!194865 res!162951) b!194868))

(assert (= (and b!194868 res!162968) b!194878))

(assert (= (and b!194865 (not res!162965)) b!194887))

(assert (= (and b!194887 (not res!162953)) b!194886))

(assert (= start!41546 b!194884))

(declare-fun m!302009 () Bool)

(assert (=> b!194862 m!302009))

(declare-fun m!302011 () Bool)

(assert (=> b!194865 m!302011))

(declare-fun m!302013 () Bool)

(assert (=> b!194880 m!302013))

(declare-fun m!302015 () Bool)

(assert (=> b!194880 m!302015))

(declare-fun m!302017 () Bool)

(assert (=> b!194880 m!302017))

(declare-fun m!302019 () Bool)

(assert (=> b!194868 m!302019))

(declare-fun m!302021 () Bool)

(assert (=> b!194882 m!302021))

(declare-fun m!302023 () Bool)

(assert (=> b!194882 m!302023))

(declare-fun m!302025 () Bool)

(assert (=> b!194882 m!302025))

(declare-fun m!302027 () Bool)

(assert (=> b!194882 m!302027))

(declare-fun m!302029 () Bool)

(assert (=> b!194882 m!302029))

(declare-fun m!302031 () Bool)

(assert (=> b!194882 m!302031))

(declare-fun m!302033 () Bool)

(assert (=> b!194882 m!302033))

(declare-fun m!302035 () Bool)

(assert (=> b!194882 m!302035))

(declare-fun m!302037 () Bool)

(assert (=> b!194882 m!302037))

(declare-fun m!302039 () Bool)

(assert (=> b!194882 m!302039))

(declare-fun m!302041 () Bool)

(assert (=> b!194882 m!302041))

(declare-fun m!302043 () Bool)

(assert (=> b!194882 m!302043))

(declare-fun m!302045 () Bool)

(assert (=> b!194882 m!302045))

(declare-fun m!302047 () Bool)

(assert (=> b!194882 m!302047))

(declare-fun m!302049 () Bool)

(assert (=> b!194882 m!302049))

(declare-fun m!302051 () Bool)

(assert (=> b!194882 m!302051))

(declare-fun m!302053 () Bool)

(assert (=> b!194876 m!302053))

(declare-fun m!302055 () Bool)

(assert (=> b!194876 m!302055))

(declare-fun m!302057 () Bool)

(assert (=> b!194876 m!302057))

(declare-fun m!302059 () Bool)

(assert (=> b!194881 m!302059))

(declare-fun m!302061 () Bool)

(assert (=> b!194877 m!302061))

(declare-fun m!302063 () Bool)

(assert (=> b!194872 m!302063))

(assert (=> b!194869 m!302013))

(assert (=> b!194869 m!302015))

(declare-fun m!302065 () Bool)

(assert (=> b!194870 m!302065))

(declare-fun m!302067 () Bool)

(assert (=> b!194887 m!302067))

(assert (=> b!194875 m!302009))

(declare-fun m!302069 () Bool)

(assert (=> b!194873 m!302069))

(declare-fun m!302071 () Bool)

(assert (=> start!41546 m!302071))

(declare-fun m!302073 () Bool)

(assert (=> b!194864 m!302073))

(declare-fun m!302075 () Bool)

(assert (=> b!194863 m!302075))

(assert (=> b!194863 m!302075))

(declare-fun m!302077 () Bool)

(assert (=> b!194863 m!302077))

(declare-fun m!302079 () Bool)

(assert (=> b!194871 m!302079))

(declare-fun m!302081 () Bool)

(assert (=> b!194883 m!302081))

(declare-fun m!302083 () Bool)

(assert (=> b!194866 m!302083))

(declare-fun m!302085 () Bool)

(assert (=> b!194866 m!302085))

(declare-fun m!302087 () Bool)

(assert (=> b!194866 m!302087))

(declare-fun m!302089 () Bool)

(assert (=> b!194866 m!302089))

(declare-fun m!302091 () Bool)

(assert (=> b!194867 m!302091))

(declare-fun m!302093 () Bool)

(assert (=> b!194867 m!302093))

(declare-fun m!302095 () Bool)

(assert (=> b!194884 m!302095))

(push 1)

(assert (not b!194875))

(assert (not b!194872))

(assert (not start!41546))

(assert (not b!194881))

(assert (not b!194882))

(assert (not b!194866))

(assert (not b!194880))

(assert (not b!194876))

(assert (not b!194873))

(assert (not b!194867))

(assert (not b!194868))

(assert (not b!194869))

(assert (not b!194877))

(assert (not b!194862))

(assert (not b!194870))

(assert (not b!194884))

(assert (not b!194865))

(assert (not b!194871))

(assert (not b!194864))

(assert (not b!194887))

(assert (not b!194863))

(assert (not b!194883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

