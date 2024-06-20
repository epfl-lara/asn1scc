; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44826 () Bool)

(assert start!44826)

(declare-fun b!215183 () Bool)

(declare-fun e!146433 () Bool)

(declare-datatypes ((array!10589 0))(
  ( (array!10590 (arr!5581 (Array (_ BitVec 32) (_ BitVec 8))) (size!4651 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8410 0))(
  ( (BitStream!8411 (buf!5186 array!10589) (currentByte!9764 (_ BitVec 32)) (currentBit!9759 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18434 0))(
  ( (tuple2!18435 (_1!9872 BitStream!8410) (_2!9872 Bool)) )
))
(declare-fun lt!339877 () tuple2!18434)

(declare-fun lt!339867 () tuple2!18434)

(assert (=> b!215183 (= e!146433 (= (_2!9872 lt!339877) (_2!9872 lt!339867)))))

(declare-fun b!215184 () Bool)

(declare-fun e!146429 () Bool)

(assert (=> b!215184 (= e!146429 true)))

(declare-fun thiss!1204 () BitStream!8410)

(declare-datatypes ((Unit!15286 0))(
  ( (Unit!15287) )
))
(declare-datatypes ((tuple2!18436 0))(
  ( (tuple2!18437 (_1!9873 Unit!15286) (_2!9873 BitStream!8410)) )
))
(declare-fun lt!339872 () tuple2!18436)

(assert (=> b!215184 (= (size!4651 (buf!5186 thiss!1204)) (size!4651 (buf!5186 (_2!9873 lt!339872))))))

(declare-fun b!215185 () Bool)

(declare-fun res!180996 () Bool)

(declare-fun e!146430 () Bool)

(assert (=> b!215185 (=> (not res!180996) (not e!146430))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!215185 (= res!180996 (invariant!0 (currentBit!9759 thiss!1204) (currentByte!9764 thiss!1204) (size!4651 (buf!5186 thiss!1204))))))

(declare-fun b!215186 () Bool)

(declare-fun e!146432 () Bool)

(declare-fun array_inv!4392 (array!10589) Bool)

(assert (=> b!215186 (= e!146432 (array_inv!4392 (buf!5186 thiss!1204)))))

(declare-fun b!215187 () Bool)

(declare-fun res!180992 () Bool)

(declare-fun e!146431 () Bool)

(assert (=> b!215187 (=> res!180992 e!146431)))

(declare-fun lt!339889 () tuple2!18436)

(declare-fun isPrefixOf!0 (BitStream!8410 BitStream!8410) Bool)

(assert (=> b!215187 (= res!180992 (not (isPrefixOf!0 (_2!9873 lt!339889) (_2!9873 lt!339872))))))

(declare-fun b!215188 () Bool)

(declare-fun e!146435 () Bool)

(assert (=> b!215188 (= e!146435 (invariant!0 (currentBit!9759 thiss!1204) (currentByte!9764 thiss!1204) (size!4651 (buf!5186 (_2!9873 lt!339872)))))))

(declare-fun b!215189 () Bool)

(declare-fun e!146437 () Bool)

(declare-fun lt!339878 () tuple2!18434)

(declare-fun lt!339876 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!215189 (= e!146437 (= (bitIndex!0 (size!4651 (buf!5186 (_1!9872 lt!339878))) (currentByte!9764 (_1!9872 lt!339878)) (currentBit!9759 (_1!9872 lt!339878))) lt!339876))))

(declare-fun b!215190 () Bool)

(declare-fun res!181000 () Bool)

(assert (=> b!215190 (=> res!181000 e!146431)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!339890 () (_ BitVec 64))

(declare-fun lt!339893 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!215190 (= res!181000 (or (not (= (size!4651 (buf!5186 (_2!9873 lt!339872))) (size!4651 (buf!5186 thiss!1204)))) (not (= lt!339893 (bvsub (bvadd lt!339890 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!215192 () Bool)

(declare-fun res!181002 () Bool)

(assert (=> b!215192 (=> res!181002 e!146431)))

(assert (=> b!215192 (= res!181002 (not (invariant!0 (currentBit!9759 (_2!9873 lt!339872)) (currentByte!9764 (_2!9873 lt!339872)) (size!4651 (buf!5186 (_2!9873 lt!339872))))))))

(declare-fun b!215193 () Bool)

(declare-fun res!181006 () Bool)

(declare-fun e!146428 () Bool)

(assert (=> b!215193 (=> (not res!181006) (not e!146428))))

(declare-fun lt!339885 () (_ BitVec 64))

(declare-datatypes ((tuple2!18438 0))(
  ( (tuple2!18439 (_1!9874 BitStream!8410) (_2!9874 BitStream!8410)) )
))
(declare-fun lt!339874 () tuple2!18438)

(declare-fun withMovedBitIndex!0 (BitStream!8410 (_ BitVec 64)) BitStream!8410)

(assert (=> b!215193 (= res!181006 (= (_1!9874 lt!339874) (withMovedBitIndex!0 (_2!9874 lt!339874) (bvsub lt!339885 lt!339893))))))

(declare-fun b!215194 () Bool)

(declare-fun res!181007 () Bool)

(assert (=> b!215194 (=> (not res!181007) (not e!146428))))

(declare-fun lt!339883 () tuple2!18438)

(assert (=> b!215194 (= res!181007 (= (_1!9874 lt!339883) (withMovedBitIndex!0 (_2!9874 lt!339883) (bvsub lt!339890 lt!339893))))))

(declare-fun b!215195 () Bool)

(declare-fun e!146439 () Bool)

(assert (=> b!215195 (= e!146439 e!146430)))

(declare-fun res!180994 () Bool)

(assert (=> b!215195 (=> (not res!180994) (not e!146430))))

(declare-fun lt!339871 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!215195 (= res!180994 (validate_offset_bits!1 ((_ sign_extend 32) (size!4651 (buf!5186 thiss!1204))) ((_ sign_extend 32) (currentByte!9764 thiss!1204)) ((_ sign_extend 32) (currentBit!9759 thiss!1204)) lt!339871))))

(assert (=> b!215195 (= lt!339871 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!215196 () Bool)

(declare-datatypes ((tuple2!18440 0))(
  ( (tuple2!18441 (_1!9875 BitStream!8410) (_2!9875 (_ BitVec 64))) )
))
(declare-fun lt!339882 () tuple2!18440)

(declare-fun lt!339881 () BitStream!8410)

(declare-fun lt!339891 () tuple2!18440)

(assert (=> b!215196 (= e!146428 (and (= lt!339890 (bvsub lt!339885 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9874 lt!339874) lt!339881)) (= (_2!9875 lt!339882) (_2!9875 lt!339891)))))))

(declare-fun b!215197 () Bool)

(declare-fun res!181004 () Bool)

(declare-fun e!146438 () Bool)

(assert (=> b!215197 (=> (not res!181004) (not e!146438))))

(assert (=> b!215197 (= res!181004 (isPrefixOf!0 thiss!1204 (_2!9873 lt!339889)))))

(declare-fun b!215198 () Bool)

(declare-fun res!180998 () Bool)

(assert (=> b!215198 (=> res!180998 e!146431)))

(assert (=> b!215198 (= res!180998 (not (isPrefixOf!0 thiss!1204 (_2!9873 lt!339889))))))

(declare-fun b!215191 () Bool)

(assert (=> b!215191 (= e!146438 e!146437)))

(declare-fun res!181003 () Bool)

(assert (=> b!215191 (=> (not res!181003) (not e!146437))))

(declare-fun lt!339892 () Bool)

(assert (=> b!215191 (= res!181003 (and (= (_2!9872 lt!339878) lt!339892) (= (_1!9872 lt!339878) (_2!9873 lt!339889))))))

(declare-fun readBitPure!0 (BitStream!8410) tuple2!18434)

(declare-fun readerFrom!0 (BitStream!8410 (_ BitVec 32) (_ BitVec 32)) BitStream!8410)

(assert (=> b!215191 (= lt!339878 (readBitPure!0 (readerFrom!0 (_2!9873 lt!339889) (currentBit!9759 thiss!1204) (currentByte!9764 thiss!1204))))))

(declare-fun res!180987 () Bool)

(assert (=> start!44826 (=> (not res!180987) (not e!146439))))

(assert (=> start!44826 (= res!180987 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44826 e!146439))

(assert (=> start!44826 true))

(declare-fun inv!12 (BitStream!8410) Bool)

(assert (=> start!44826 (and (inv!12 thiss!1204) e!146432)))

(declare-fun b!215199 () Bool)

(declare-fun res!180995 () Bool)

(assert (=> b!215199 (=> res!180995 e!146429)))

(assert (=> b!215199 (= res!180995 (not (= (bitIndex!0 (size!4651 (buf!5186 (_1!9875 lt!339882))) (currentByte!9764 (_1!9875 lt!339882)) (currentBit!9759 (_1!9875 lt!339882))) (bitIndex!0 (size!4651 (buf!5186 (_2!9874 lt!339883))) (currentByte!9764 (_2!9874 lt!339883)) (currentBit!9759 (_2!9874 lt!339883))))))))

(declare-fun b!215200 () Bool)

(declare-fun e!146426 () Bool)

(assert (=> b!215200 (= e!146430 (not e!146426))))

(declare-fun res!180997 () Bool)

(assert (=> b!215200 (=> res!180997 e!146426)))

(assert (=> b!215200 (= res!180997 (not (= lt!339885 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!339890))))))

(assert (=> b!215200 (= lt!339885 (bitIndex!0 (size!4651 (buf!5186 (_2!9873 lt!339889))) (currentByte!9764 (_2!9873 lt!339889)) (currentBit!9759 (_2!9873 lt!339889))))))

(assert (=> b!215200 (= lt!339890 (bitIndex!0 (size!4651 (buf!5186 thiss!1204)) (currentByte!9764 thiss!1204) (currentBit!9759 thiss!1204)))))

(declare-fun e!146427 () Bool)

(assert (=> b!215200 e!146427))

(declare-fun res!180986 () Bool)

(assert (=> b!215200 (=> (not res!180986) (not e!146427))))

(assert (=> b!215200 (= res!180986 (= (size!4651 (buf!5186 thiss!1204)) (size!4651 (buf!5186 (_2!9873 lt!339889)))))))

(declare-fun appendBit!0 (BitStream!8410 Bool) tuple2!18436)

(assert (=> b!215200 (= lt!339889 (appendBit!0 thiss!1204 lt!339892))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!339869 () (_ BitVec 64))

(assert (=> b!215200 (= lt!339892 (not (= (bvand v!189 lt!339869) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215200 (= lt!339869 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!215201 () Bool)

(assert (=> b!215201 (= e!146427 e!146438)))

(declare-fun res!180999 () Bool)

(assert (=> b!215201 (=> (not res!180999) (not e!146438))))

(declare-fun lt!339888 () (_ BitVec 64))

(assert (=> b!215201 (= res!180999 (= lt!339876 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!339888)))))

(assert (=> b!215201 (= lt!339876 (bitIndex!0 (size!4651 (buf!5186 (_2!9873 lt!339889))) (currentByte!9764 (_2!9873 lt!339889)) (currentBit!9759 (_2!9873 lt!339889))))))

(assert (=> b!215201 (= lt!339888 (bitIndex!0 (size!4651 (buf!5186 thiss!1204)) (currentByte!9764 thiss!1204) (currentBit!9759 thiss!1204)))))

(declare-fun b!215202 () Bool)

(assert (=> b!215202 (= e!146426 e!146431)))

(declare-fun res!180991 () Bool)

(assert (=> b!215202 (=> res!180991 e!146431)))

(assert (=> b!215202 (= res!180991 (not (= lt!339893 (bvsub (bvsub (bvadd lt!339885 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!215202 (= lt!339893 (bitIndex!0 (size!4651 (buf!5186 (_2!9873 lt!339872))) (currentByte!9764 (_2!9873 lt!339872)) (currentBit!9759 (_2!9873 lt!339872))))))

(assert (=> b!215202 (isPrefixOf!0 thiss!1204 (_2!9873 lt!339872))))

(declare-fun lt!339879 () Unit!15286)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8410 BitStream!8410 BitStream!8410) Unit!15286)

(assert (=> b!215202 (= lt!339879 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9873 lt!339889) (_2!9873 lt!339872)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8410 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18436)

(assert (=> b!215202 (= lt!339872 (appendBitsLSBFirstLoopTR!0 (_2!9873 lt!339889) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!215203 () Bool)

(declare-fun e!146436 () Bool)

(assert (=> b!215203 (= e!146436 e!146429)))

(declare-fun res!180988 () Bool)

(assert (=> b!215203 (=> res!180988 e!146429)))

(assert (=> b!215203 (= res!180988 (not (= (_1!9874 lt!339874) lt!339881)))))

(assert (=> b!215203 e!146428))

(declare-fun res!181005 () Bool)

(assert (=> b!215203 (=> (not res!181005) (not e!146428))))

(declare-fun lt!339880 () tuple2!18440)

(assert (=> b!215203 (= res!181005 (and (= (_2!9875 lt!339882) (_2!9875 lt!339880)) (= (_1!9875 lt!339882) (_1!9875 lt!339880))))))

(declare-fun lt!339875 () (_ BitVec 64))

(declare-fun lt!339873 () Unit!15286)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8410 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15286)

(assert (=> b!215203 (= lt!339873 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9874 lt!339883) nBits!348 i!590 lt!339875))))

(declare-fun lt!339887 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8410 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18440)

(assert (=> b!215203 (= lt!339880 (readNBitsLSBFirstsLoopPure!0 lt!339881 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!339887))))

(assert (=> b!215203 (= lt!339881 (withMovedBitIndex!0 (_1!9874 lt!339883) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!215204 () Bool)

(assert (=> b!215204 (= e!146431 e!146436)))

(declare-fun res!180990 () Bool)

(assert (=> b!215204 (=> res!180990 e!146436)))

(assert (=> b!215204 (= res!180990 (not (= (_1!9875 lt!339891) (_2!9874 lt!339874))))))

(assert (=> b!215204 (= lt!339891 (readNBitsLSBFirstsLoopPure!0 (_1!9874 lt!339874) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!339887))))

(declare-fun lt!339866 () (_ BitVec 64))

(assert (=> b!215204 (validate_offset_bits!1 ((_ sign_extend 32) (size!4651 (buf!5186 (_2!9873 lt!339872)))) ((_ sign_extend 32) (currentByte!9764 (_2!9873 lt!339889))) ((_ sign_extend 32) (currentBit!9759 (_2!9873 lt!339889))) lt!339866)))

(declare-fun lt!339870 () Unit!15286)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8410 array!10589 (_ BitVec 64)) Unit!15286)

(assert (=> b!215204 (= lt!339870 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9873 lt!339889) (buf!5186 (_2!9873 lt!339872)) lt!339866))))

(assert (=> b!215204 (= lt!339866 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!339865 () tuple2!18434)

(assert (=> b!215204 (= lt!339887 (bvor lt!339875 (ite (_2!9872 lt!339865) lt!339869 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215204 (= lt!339882 (readNBitsLSBFirstsLoopPure!0 (_1!9874 lt!339883) nBits!348 i!590 lt!339875))))

(assert (=> b!215204 (validate_offset_bits!1 ((_ sign_extend 32) (size!4651 (buf!5186 (_2!9873 lt!339872)))) ((_ sign_extend 32) (currentByte!9764 thiss!1204)) ((_ sign_extend 32) (currentBit!9759 thiss!1204)) lt!339871)))

(declare-fun lt!339868 () Unit!15286)

(assert (=> b!215204 (= lt!339868 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5186 (_2!9873 lt!339872)) lt!339871))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!215204 (= lt!339875 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!215204 (= (_2!9872 lt!339865) lt!339892)))

(assert (=> b!215204 (= lt!339865 (readBitPure!0 (_1!9874 lt!339883)))))

(declare-fun reader!0 (BitStream!8410 BitStream!8410) tuple2!18438)

(assert (=> b!215204 (= lt!339874 (reader!0 (_2!9873 lt!339889) (_2!9873 lt!339872)))))

(assert (=> b!215204 (= lt!339883 (reader!0 thiss!1204 (_2!9873 lt!339872)))))

(assert (=> b!215204 e!146433))

(declare-fun res!180993 () Bool)

(assert (=> b!215204 (=> (not res!180993) (not e!146433))))

(assert (=> b!215204 (= res!180993 (= (bitIndex!0 (size!4651 (buf!5186 (_1!9872 lt!339877))) (currentByte!9764 (_1!9872 lt!339877)) (currentBit!9759 (_1!9872 lt!339877))) (bitIndex!0 (size!4651 (buf!5186 (_1!9872 lt!339867))) (currentByte!9764 (_1!9872 lt!339867)) (currentBit!9759 (_1!9872 lt!339867)))))))

(declare-fun lt!339884 () Unit!15286)

(declare-fun lt!339886 () BitStream!8410)

(declare-fun readBitPrefixLemma!0 (BitStream!8410 BitStream!8410) Unit!15286)

(assert (=> b!215204 (= lt!339884 (readBitPrefixLemma!0 lt!339886 (_2!9873 lt!339872)))))

(assert (=> b!215204 (= lt!339867 (readBitPure!0 (BitStream!8411 (buf!5186 (_2!9873 lt!339872)) (currentByte!9764 thiss!1204) (currentBit!9759 thiss!1204))))))

(assert (=> b!215204 (= lt!339877 (readBitPure!0 lt!339886))))

(assert (=> b!215204 e!146435))

(declare-fun res!180989 () Bool)

(assert (=> b!215204 (=> (not res!180989) (not e!146435))))

(assert (=> b!215204 (= res!180989 (invariant!0 (currentBit!9759 thiss!1204) (currentByte!9764 thiss!1204) (size!4651 (buf!5186 (_2!9873 lt!339889)))))))

(assert (=> b!215204 (= lt!339886 (BitStream!8411 (buf!5186 (_2!9873 lt!339889)) (currentByte!9764 thiss!1204) (currentBit!9759 thiss!1204)))))

(declare-fun b!215205 () Bool)

(declare-fun res!181001 () Bool)

(assert (=> b!215205 (=> (not res!181001) (not e!146430))))

(assert (=> b!215205 (= res!181001 (not (= i!590 nBits!348)))))

(assert (= (and start!44826 res!180987) b!215195))

(assert (= (and b!215195 res!180994) b!215185))

(assert (= (and b!215185 res!180996) b!215205))

(assert (= (and b!215205 res!181001) b!215200))

(assert (= (and b!215200 res!180986) b!215201))

(assert (= (and b!215201 res!180999) b!215197))

(assert (= (and b!215197 res!181004) b!215191))

(assert (= (and b!215191 res!181003) b!215189))

(assert (= (and b!215200 (not res!180997)) b!215202))

(assert (= (and b!215202 (not res!180991)) b!215192))

(assert (= (and b!215192 (not res!181002)) b!215190))

(assert (= (and b!215190 (not res!181000)) b!215187))

(assert (= (and b!215187 (not res!180992)) b!215198))

(assert (= (and b!215198 (not res!180998)) b!215204))

(assert (= (and b!215204 res!180989) b!215188))

(assert (= (and b!215204 res!180993) b!215183))

(assert (= (and b!215204 (not res!180990)) b!215203))

(assert (= (and b!215203 res!181005) b!215194))

(assert (= (and b!215194 res!181007) b!215193))

(assert (= (and b!215193 res!181006) b!215196))

(assert (= (and b!215203 (not res!180988)) b!215199))

(assert (= (and b!215199 (not res!180995)) b!215184))

(assert (= start!44826 b!215186))

(declare-fun m!331377 () Bool)

(assert (=> b!215192 m!331377))

(declare-fun m!331379 () Bool)

(assert (=> b!215199 m!331379))

(declare-fun m!331381 () Bool)

(assert (=> b!215199 m!331381))

(declare-fun m!331383 () Bool)

(assert (=> b!215197 m!331383))

(declare-fun m!331385 () Bool)

(assert (=> b!215194 m!331385))

(declare-fun m!331387 () Bool)

(assert (=> b!215204 m!331387))

(declare-fun m!331389 () Bool)

(assert (=> b!215204 m!331389))

(declare-fun m!331391 () Bool)

(assert (=> b!215204 m!331391))

(declare-fun m!331393 () Bool)

(assert (=> b!215204 m!331393))

(declare-fun m!331395 () Bool)

(assert (=> b!215204 m!331395))

(declare-fun m!331397 () Bool)

(assert (=> b!215204 m!331397))

(declare-fun m!331399 () Bool)

(assert (=> b!215204 m!331399))

(declare-fun m!331401 () Bool)

(assert (=> b!215204 m!331401))

(declare-fun m!331403 () Bool)

(assert (=> b!215204 m!331403))

(declare-fun m!331405 () Bool)

(assert (=> b!215204 m!331405))

(declare-fun m!331407 () Bool)

(assert (=> b!215204 m!331407))

(declare-fun m!331409 () Bool)

(assert (=> b!215204 m!331409))

(declare-fun m!331411 () Bool)

(assert (=> b!215204 m!331411))

(declare-fun m!331413 () Bool)

(assert (=> b!215204 m!331413))

(declare-fun m!331415 () Bool)

(assert (=> b!215204 m!331415))

(declare-fun m!331417 () Bool)

(assert (=> b!215204 m!331417))

(declare-fun m!331419 () Bool)

(assert (=> b!215185 m!331419))

(declare-fun m!331421 () Bool)

(assert (=> b!215201 m!331421))

(declare-fun m!331423 () Bool)

(assert (=> b!215201 m!331423))

(declare-fun m!331425 () Bool)

(assert (=> b!215188 m!331425))

(assert (=> b!215200 m!331421))

(assert (=> b!215200 m!331423))

(declare-fun m!331427 () Bool)

(assert (=> b!215200 m!331427))

(declare-fun m!331429 () Bool)

(assert (=> b!215187 m!331429))

(declare-fun m!331431 () Bool)

(assert (=> b!215191 m!331431))

(assert (=> b!215191 m!331431))

(declare-fun m!331433 () Bool)

(assert (=> b!215191 m!331433))

(declare-fun m!331435 () Bool)

(assert (=> b!215189 m!331435))

(assert (=> b!215198 m!331383))

(declare-fun m!331437 () Bool)

(assert (=> b!215193 m!331437))

(declare-fun m!331439 () Bool)

(assert (=> start!44826 m!331439))

(declare-fun m!331441 () Bool)

(assert (=> b!215203 m!331441))

(declare-fun m!331443 () Bool)

(assert (=> b!215203 m!331443))

(declare-fun m!331445 () Bool)

(assert (=> b!215203 m!331445))

(declare-fun m!331447 () Bool)

(assert (=> b!215202 m!331447))

(declare-fun m!331449 () Bool)

(assert (=> b!215202 m!331449))

(declare-fun m!331451 () Bool)

(assert (=> b!215202 m!331451))

(declare-fun m!331453 () Bool)

(assert (=> b!215202 m!331453))

(declare-fun m!331455 () Bool)

(assert (=> b!215195 m!331455))

(declare-fun m!331457 () Bool)

(assert (=> b!215186 m!331457))

(push 1)

(assert (not b!215195))

(assert (not b!215189))

(assert (not b!215191))

(assert (not b!215186))

(assert (not b!215202))

(assert (not b!215200))

(assert (not b!215185))

(assert (not b!215203))

(assert (not b!215187))

(assert (not b!215192))

(assert (not b!215198))

(assert (not b!215193))

(assert (not b!215199))

(assert (not b!215188))

(assert (not start!44826))

(assert (not b!215201))

(assert (not b!215204))

(assert (not b!215197))

(assert (not b!215194))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

