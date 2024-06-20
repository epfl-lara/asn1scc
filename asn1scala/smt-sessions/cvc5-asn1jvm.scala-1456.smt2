; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39950 () Bool)

(assert start!39950)

(declare-fun b!181763 () Bool)

(declare-fun e!126194 () Bool)

(declare-fun e!126188 () Bool)

(assert (=> b!181763 (= e!126194 e!126188)))

(declare-fun res!151002 () Bool)

(assert (=> b!181763 (=> (not res!151002) (not e!126188))))

(declare-fun lt!279205 () (_ BitVec 64))

(declare-fun lt!279209 () (_ BitVec 64))

(assert (=> b!181763 (= res!151002 (= lt!279205 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279209)))))

(declare-datatypes ((array!9710 0))(
  ( (array!9711 (arr!5212 (Array (_ BitVec 32) (_ BitVec 8))) (size!4282 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7672 0))(
  ( (BitStream!7673 (buf!4731 array!9710) (currentByte!8953 (_ BitVec 32)) (currentBit!8948 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13061 0))(
  ( (Unit!13062) )
))
(declare-datatypes ((tuple2!15668 0))(
  ( (tuple2!15669 (_1!8479 Unit!13061) (_2!8479 BitStream!7672)) )
))
(declare-fun lt!279206 () tuple2!15668)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181763 (= lt!279205 (bitIndex!0 (size!4282 (buf!4731 (_2!8479 lt!279206))) (currentByte!8953 (_2!8479 lt!279206)) (currentBit!8948 (_2!8479 lt!279206))))))

(declare-fun thiss!1204 () BitStream!7672)

(assert (=> b!181763 (= lt!279209 (bitIndex!0 (size!4282 (buf!4731 thiss!1204)) (currentByte!8953 thiss!1204) (currentBit!8948 thiss!1204)))))

(declare-fun b!181764 () Bool)

(declare-fun res!150996 () Bool)

(assert (=> b!181764 (=> (not res!150996) (not e!126188))))

(declare-fun isPrefixOf!0 (BitStream!7672 BitStream!7672) Bool)

(assert (=> b!181764 (= res!150996 (isPrefixOf!0 thiss!1204 (_2!8479 lt!279206)))))

(declare-fun b!181765 () Bool)

(declare-fun e!126193 () Bool)

(declare-fun lt!279194 () tuple2!15668)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!181765 (= e!126193 (invariant!0 (currentBit!8948 thiss!1204) (currentByte!8953 thiss!1204) (size!4282 (buf!4731 (_2!8479 lt!279194)))))))

(declare-fun b!181766 () Bool)

(declare-fun e!126191 () Bool)

(assert (=> b!181766 (= e!126188 e!126191)))

(declare-fun res!151006 () Bool)

(assert (=> b!181766 (=> (not res!151006) (not e!126191))))

(declare-fun lt!279201 () Bool)

(declare-datatypes ((tuple2!15670 0))(
  ( (tuple2!15671 (_1!8480 BitStream!7672) (_2!8480 Bool)) )
))
(declare-fun lt!279198 () tuple2!15670)

(assert (=> b!181766 (= res!151006 (and (= (_2!8480 lt!279198) lt!279201) (= (_1!8480 lt!279198) (_2!8479 lt!279206))))))

(declare-fun readBitPure!0 (BitStream!7672) tuple2!15670)

(declare-fun readerFrom!0 (BitStream!7672 (_ BitVec 32) (_ BitVec 32)) BitStream!7672)

(assert (=> b!181766 (= lt!279198 (readBitPure!0 (readerFrom!0 (_2!8479 lt!279206) (currentBit!8948 thiss!1204) (currentByte!8953 thiss!1204))))))

(declare-fun b!181767 () Bool)

(declare-fun res!150995 () Bool)

(declare-fun e!126195 () Bool)

(assert (=> b!181767 (=> res!150995 e!126195)))

(declare-fun lt!279199 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!279200 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!181767 (= res!150995 (or (not (= (size!4282 (buf!4731 (_2!8479 lt!279194))) (size!4282 (buf!4731 thiss!1204)))) (not (= lt!279200 (bvsub (bvadd lt!279199 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!181768 () Bool)

(declare-fun e!126196 () Bool)

(declare-fun lt!279204 () tuple2!15670)

(declare-fun lt!279207 () tuple2!15670)

(assert (=> b!181768 (= e!126196 (= (_2!8480 lt!279204) (_2!8480 lt!279207)))))

(declare-fun b!181769 () Bool)

(declare-fun e!126186 () Bool)

(assert (=> b!181769 (= e!126186 e!126195)))

(declare-fun res!150999 () Bool)

(assert (=> b!181769 (=> res!150999 e!126195)))

(declare-fun lt!279195 () (_ BitVec 64))

(assert (=> b!181769 (= res!150999 (not (= lt!279200 (bvsub (bvsub (bvadd lt!279195 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!181769 (= lt!279200 (bitIndex!0 (size!4282 (buf!4731 (_2!8479 lt!279194))) (currentByte!8953 (_2!8479 lt!279194)) (currentBit!8948 (_2!8479 lt!279194))))))

(assert (=> b!181769 (isPrefixOf!0 thiss!1204 (_2!8479 lt!279194))))

(declare-fun lt!279212 () Unit!13061)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7672 BitStream!7672 BitStream!7672) Unit!13061)

(assert (=> b!181769 (= lt!279212 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8479 lt!279206) (_2!8479 lt!279194)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7672 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15668)

(assert (=> b!181769 (= lt!279194 (appendBitsLSBFirstLoopTR!0 (_2!8479 lt!279206) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!181770 () Bool)

(assert (=> b!181770 (= e!126191 (= (bitIndex!0 (size!4282 (buf!4731 (_1!8480 lt!279198))) (currentByte!8953 (_1!8480 lt!279198)) (currentBit!8948 (_1!8480 lt!279198))) lt!279205))))

(declare-fun b!181771 () Bool)

(declare-fun res!151001 () Bool)

(assert (=> b!181771 (=> res!151001 e!126195)))

(assert (=> b!181771 (= res!151001 (not (isPrefixOf!0 (_2!8479 lt!279206) (_2!8479 lt!279194))))))

(declare-fun b!181772 () Bool)

(declare-fun res!150997 () Bool)

(declare-fun e!126187 () Bool)

(assert (=> b!181772 (=> (not res!150997) (not e!126187))))

(assert (=> b!181772 (= res!150997 (not (= i!590 nBits!348)))))

(declare-fun b!181773 () Bool)

(assert (=> b!181773 (= e!126187 (not e!126186))))

(declare-fun res!150993 () Bool)

(assert (=> b!181773 (=> res!150993 e!126186)))

(assert (=> b!181773 (= res!150993 (not (= lt!279195 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279199))))))

(assert (=> b!181773 (= lt!279195 (bitIndex!0 (size!4282 (buf!4731 (_2!8479 lt!279206))) (currentByte!8953 (_2!8479 lt!279206)) (currentBit!8948 (_2!8479 lt!279206))))))

(assert (=> b!181773 (= lt!279199 (bitIndex!0 (size!4282 (buf!4731 thiss!1204)) (currentByte!8953 thiss!1204) (currentBit!8948 thiss!1204)))))

(assert (=> b!181773 e!126194))

(declare-fun res!151005 () Bool)

(assert (=> b!181773 (=> (not res!151005) (not e!126194))))

(assert (=> b!181773 (= res!151005 (= (size!4282 (buf!4731 thiss!1204)) (size!4282 (buf!4731 (_2!8479 lt!279206)))))))

(declare-fun appendBit!0 (BitStream!7672 Bool) tuple2!15668)

(assert (=> b!181773 (= lt!279206 (appendBit!0 thiss!1204 lt!279201))))

(assert (=> b!181773 (= lt!279201 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181774 () Bool)

(declare-fun res!151007 () Bool)

(assert (=> b!181774 (=> (not res!151007) (not e!126187))))

(assert (=> b!181774 (= res!151007 (invariant!0 (currentBit!8948 thiss!1204) (currentByte!8953 thiss!1204) (size!4282 (buf!4731 thiss!1204))))))

(declare-fun b!181775 () Bool)

(declare-fun res!151003 () Bool)

(assert (=> b!181775 (=> res!151003 e!126195)))

(assert (=> b!181775 (= res!151003 (not (isPrefixOf!0 thiss!1204 (_2!8479 lt!279206))))))

(declare-fun b!181776 () Bool)

(declare-fun res!151004 () Bool)

(assert (=> b!181776 (=> res!151004 e!126195)))

(assert (=> b!181776 (= res!151004 (not (invariant!0 (currentBit!8948 (_2!8479 lt!279194)) (currentByte!8953 (_2!8479 lt!279194)) (size!4282 (buf!4731 (_2!8479 lt!279194))))))))

(declare-fun b!181778 () Bool)

(declare-fun e!126192 () Bool)

(declare-fun array_inv!4023 (array!9710) Bool)

(assert (=> b!181778 (= e!126192 (array_inv!4023 (buf!4731 thiss!1204)))))

(declare-fun b!181779 () Bool)

(assert (=> b!181779 (= e!126195 true)))

(declare-datatypes ((tuple2!15672 0))(
  ( (tuple2!15673 (_1!8481 BitStream!7672) (_2!8481 (_ BitVec 64))) )
))
(declare-fun lt!279196 () tuple2!15672)

(declare-datatypes ((tuple2!15674 0))(
  ( (tuple2!15675 (_1!8482 BitStream!7672) (_2!8482 BitStream!7672)) )
))
(declare-fun lt!279202 () tuple2!15674)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7672 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15672)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181779 (= lt!279196 (readNBitsLSBFirstsLoopPure!0 (_1!8482 lt!279202) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!279211 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!181779 (validate_offset_bits!1 ((_ sign_extend 32) (size!4282 (buf!4731 (_2!8479 lt!279194)))) ((_ sign_extend 32) (currentByte!8953 thiss!1204)) ((_ sign_extend 32) (currentBit!8948 thiss!1204)) lt!279211)))

(declare-fun lt!279208 () Unit!13061)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7672 array!9710 (_ BitVec 64)) Unit!13061)

(assert (=> b!181779 (= lt!279208 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4731 (_2!8479 lt!279194)) lt!279211))))

(assert (=> b!181779 (= (_2!8480 (readBitPure!0 (_1!8482 lt!279202))) lt!279201)))

(declare-fun lt!279197 () tuple2!15674)

(declare-fun reader!0 (BitStream!7672 BitStream!7672) tuple2!15674)

(assert (=> b!181779 (= lt!279197 (reader!0 (_2!8479 lt!279206) (_2!8479 lt!279194)))))

(assert (=> b!181779 (= lt!279202 (reader!0 thiss!1204 (_2!8479 lt!279194)))))

(assert (=> b!181779 e!126196))

(declare-fun res!151000 () Bool)

(assert (=> b!181779 (=> (not res!151000) (not e!126196))))

(assert (=> b!181779 (= res!151000 (= (bitIndex!0 (size!4282 (buf!4731 (_1!8480 lt!279204))) (currentByte!8953 (_1!8480 lt!279204)) (currentBit!8948 (_1!8480 lt!279204))) (bitIndex!0 (size!4282 (buf!4731 (_1!8480 lt!279207))) (currentByte!8953 (_1!8480 lt!279207)) (currentBit!8948 (_1!8480 lt!279207)))))))

(declare-fun lt!279203 () Unit!13061)

(declare-fun lt!279210 () BitStream!7672)

(declare-fun readBitPrefixLemma!0 (BitStream!7672 BitStream!7672) Unit!13061)

(assert (=> b!181779 (= lt!279203 (readBitPrefixLemma!0 lt!279210 (_2!8479 lt!279194)))))

(assert (=> b!181779 (= lt!279207 (readBitPure!0 (BitStream!7673 (buf!4731 (_2!8479 lt!279194)) (currentByte!8953 thiss!1204) (currentBit!8948 thiss!1204))))))

(assert (=> b!181779 (= lt!279204 (readBitPure!0 lt!279210))))

(assert (=> b!181779 e!126193))

(declare-fun res!150994 () Bool)

(assert (=> b!181779 (=> (not res!150994) (not e!126193))))

(assert (=> b!181779 (= res!150994 (invariant!0 (currentBit!8948 thiss!1204) (currentByte!8953 thiss!1204) (size!4282 (buf!4731 (_2!8479 lt!279206)))))))

(assert (=> b!181779 (= lt!279210 (BitStream!7673 (buf!4731 (_2!8479 lt!279206)) (currentByte!8953 thiss!1204) (currentBit!8948 thiss!1204)))))

(declare-fun res!150998 () Bool)

(declare-fun e!126190 () Bool)

(assert (=> start!39950 (=> (not res!150998) (not e!126190))))

(assert (=> start!39950 (= res!150998 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39950 e!126190))

(assert (=> start!39950 true))

(declare-fun inv!12 (BitStream!7672) Bool)

(assert (=> start!39950 (and (inv!12 thiss!1204) e!126192)))

(declare-fun b!181777 () Bool)

(assert (=> b!181777 (= e!126190 e!126187)))

(declare-fun res!151008 () Bool)

(assert (=> b!181777 (=> (not res!151008) (not e!126187))))

(assert (=> b!181777 (= res!151008 (validate_offset_bits!1 ((_ sign_extend 32) (size!4282 (buf!4731 thiss!1204))) ((_ sign_extend 32) (currentByte!8953 thiss!1204)) ((_ sign_extend 32) (currentBit!8948 thiss!1204)) lt!279211))))

(assert (=> b!181777 (= lt!279211 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!39950 res!150998) b!181777))

(assert (= (and b!181777 res!151008) b!181774))

(assert (= (and b!181774 res!151007) b!181772))

(assert (= (and b!181772 res!150997) b!181773))

(assert (= (and b!181773 res!151005) b!181763))

(assert (= (and b!181763 res!151002) b!181764))

(assert (= (and b!181764 res!150996) b!181766))

(assert (= (and b!181766 res!151006) b!181770))

(assert (= (and b!181773 (not res!150993)) b!181769))

(assert (= (and b!181769 (not res!150999)) b!181776))

(assert (= (and b!181776 (not res!151004)) b!181767))

(assert (= (and b!181767 (not res!150995)) b!181771))

(assert (= (and b!181771 (not res!151001)) b!181775))

(assert (= (and b!181775 (not res!151003)) b!181779))

(assert (= (and b!181779 res!150994) b!181765))

(assert (= (and b!181779 res!151000) b!181768))

(assert (= start!39950 b!181778))

(declare-fun m!282859 () Bool)

(assert (=> b!181770 m!282859))

(declare-fun m!282861 () Bool)

(assert (=> b!181769 m!282861))

(declare-fun m!282863 () Bool)

(assert (=> b!181769 m!282863))

(declare-fun m!282865 () Bool)

(assert (=> b!181769 m!282865))

(declare-fun m!282867 () Bool)

(assert (=> b!181769 m!282867))

(declare-fun m!282869 () Bool)

(assert (=> b!181778 m!282869))

(declare-fun m!282871 () Bool)

(assert (=> b!181776 m!282871))

(declare-fun m!282873 () Bool)

(assert (=> b!181766 m!282873))

(assert (=> b!181766 m!282873))

(declare-fun m!282875 () Bool)

(assert (=> b!181766 m!282875))

(declare-fun m!282877 () Bool)

(assert (=> b!181771 m!282877))

(declare-fun m!282879 () Bool)

(assert (=> start!39950 m!282879))

(declare-fun m!282881 () Bool)

(assert (=> b!181777 m!282881))

(declare-fun m!282883 () Bool)

(assert (=> b!181774 m!282883))

(declare-fun m!282885 () Bool)

(assert (=> b!181779 m!282885))

(declare-fun m!282887 () Bool)

(assert (=> b!181779 m!282887))

(declare-fun m!282889 () Bool)

(assert (=> b!181779 m!282889))

(declare-fun m!282891 () Bool)

(assert (=> b!181779 m!282891))

(declare-fun m!282893 () Bool)

(assert (=> b!181779 m!282893))

(declare-fun m!282895 () Bool)

(assert (=> b!181779 m!282895))

(declare-fun m!282897 () Bool)

(assert (=> b!181779 m!282897))

(declare-fun m!282899 () Bool)

(assert (=> b!181779 m!282899))

(declare-fun m!282901 () Bool)

(assert (=> b!181779 m!282901))

(declare-fun m!282903 () Bool)

(assert (=> b!181779 m!282903))

(declare-fun m!282905 () Bool)

(assert (=> b!181779 m!282905))

(declare-fun m!282907 () Bool)

(assert (=> b!181779 m!282907))

(declare-fun m!282909 () Bool)

(assert (=> b!181779 m!282909))

(declare-fun m!282911 () Bool)

(assert (=> b!181765 m!282911))

(declare-fun m!282913 () Bool)

(assert (=> b!181775 m!282913))

(declare-fun m!282915 () Bool)

(assert (=> b!181773 m!282915))

(declare-fun m!282917 () Bool)

(assert (=> b!181773 m!282917))

(declare-fun m!282919 () Bool)

(assert (=> b!181773 m!282919))

(assert (=> b!181763 m!282915))

(assert (=> b!181763 m!282917))

(assert (=> b!181764 m!282913))

(push 1)

(assert (not b!181771))

(assert (not b!181765))

(assert (not b!181778))

(assert (not b!181775))

(assert (not b!181764))

(assert (not b!181766))

(assert (not b!181777))

(assert (not b!181763))

(assert (not start!39950))

(assert (not b!181773))

(assert (not b!181779))

(assert (not b!181769))

(assert (not b!181770))

(assert (not b!181776))

(assert (not b!181774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

