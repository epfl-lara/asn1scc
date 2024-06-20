; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39838 () Bool)

(assert start!39838)

(declare-fun b!180979 () Bool)

(declare-fun res!150305 () Bool)

(declare-fun e!125718 () Bool)

(assert (=> b!180979 (=> (not res!150305) (not e!125718))))

(declare-datatypes ((array!9691 0))(
  ( (array!9692 (arr!5204 (Array (_ BitVec 32) (_ BitVec 8))) (size!4274 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7656 0))(
  ( (BitStream!7657 (buf!4720 array!9691) (currentByte!8936 (_ BitVec 32)) (currentBit!8931 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7656)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!180979 (= res!150305 (invariant!0 (currentBit!8931 thiss!1204) (currentByte!8936 thiss!1204) (size!4274 (buf!4720 thiss!1204))))))

(declare-fun b!180980 () Bool)

(declare-fun e!125723 () Bool)

(declare-fun e!125725 () Bool)

(assert (=> b!180980 (= e!125723 e!125725)))

(declare-fun res!150301 () Bool)

(assert (=> b!180980 (=> (not res!150301) (not e!125725))))

(declare-fun lt!277752 () Bool)

(declare-datatypes ((Unit!13006 0))(
  ( (Unit!13007) )
))
(declare-datatypes ((tuple2!15602 0))(
  ( (tuple2!15603 (_1!8446 Unit!13006) (_2!8446 BitStream!7656)) )
))
(declare-fun lt!277757 () tuple2!15602)

(declare-datatypes ((tuple2!15604 0))(
  ( (tuple2!15605 (_1!8447 BitStream!7656) (_2!8447 Bool)) )
))
(declare-fun lt!277763 () tuple2!15604)

(assert (=> b!180980 (= res!150301 (and (= (_2!8447 lt!277763) lt!277752) (= (_1!8447 lt!277763) (_2!8446 lt!277757))))))

(declare-fun readBitPure!0 (BitStream!7656) tuple2!15604)

(declare-fun readerFrom!0 (BitStream!7656 (_ BitVec 32) (_ BitVec 32)) BitStream!7656)

(assert (=> b!180980 (= lt!277763 (readBitPure!0 (readerFrom!0 (_2!8446 lt!277757) (currentBit!8931 thiss!1204) (currentByte!8936 thiss!1204))))))

(declare-fun b!180981 () Bool)

(declare-fun lt!277748 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180981 (= e!125725 (= (bitIndex!0 (size!4274 (buf!4720 (_1!8447 lt!277763))) (currentByte!8936 (_1!8447 lt!277763)) (currentBit!8931 (_1!8447 lt!277763))) lt!277748))))

(declare-fun b!180982 () Bool)

(declare-fun e!125716 () Bool)

(assert (=> b!180982 (= e!125716 e!125723)))

(declare-fun res!150293 () Bool)

(assert (=> b!180982 (=> (not res!150293) (not e!125723))))

(declare-fun lt!277750 () (_ BitVec 64))

(assert (=> b!180982 (= res!150293 (= lt!277748 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!277750)))))

(assert (=> b!180982 (= lt!277748 (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277757))) (currentByte!8936 (_2!8446 lt!277757)) (currentBit!8931 (_2!8446 lt!277757))))))

(assert (=> b!180982 (= lt!277750 (bitIndex!0 (size!4274 (buf!4720 thiss!1204)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204)))))

(declare-fun b!180983 () Bool)

(declare-fun e!125717 () Bool)

(declare-fun lt!277754 () tuple2!15602)

(assert (=> b!180983 (= e!125717 (invariant!0 (currentBit!8931 thiss!1204) (currentByte!8936 thiss!1204) (size!4274 (buf!4720 (_2!8446 lt!277754)))))))

(declare-fun res!150309 () Bool)

(declare-fun e!125720 () Bool)

(assert (=> start!39838 (=> (not res!150309) (not e!125720))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39838 (= res!150309 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39838 e!125720))

(assert (=> start!39838 true))

(declare-fun e!125722 () Bool)

(declare-fun inv!12 (BitStream!7656) Bool)

(assert (=> start!39838 (and (inv!12 thiss!1204) e!125722)))

(declare-fun b!180984 () Bool)

(declare-fun e!125715 () Bool)

(assert (=> b!180984 (= e!125718 (not e!125715))))

(declare-fun res!150308 () Bool)

(assert (=> b!180984 (=> res!150308 e!125715)))

(declare-fun lt!277759 () (_ BitVec 64))

(declare-fun lt!277756 () (_ BitVec 64))

(assert (=> b!180984 (= res!150308 (not (= lt!277759 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!277756))))))

(assert (=> b!180984 (= lt!277759 (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277757))) (currentByte!8936 (_2!8446 lt!277757)) (currentBit!8931 (_2!8446 lt!277757))))))

(assert (=> b!180984 (= lt!277756 (bitIndex!0 (size!4274 (buf!4720 thiss!1204)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204)))))

(assert (=> b!180984 e!125716))

(declare-fun res!150303 () Bool)

(assert (=> b!180984 (=> (not res!150303) (not e!125716))))

(assert (=> b!180984 (= res!150303 (= (size!4274 (buf!4720 thiss!1204)) (size!4274 (buf!4720 (_2!8446 lt!277757)))))))

(declare-fun appendBit!0 (BitStream!7656 Bool) tuple2!15602)

(assert (=> b!180984 (= lt!277757 (appendBit!0 thiss!1204 lt!277752))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!180984 (= lt!277752 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180985 () Bool)

(declare-fun e!125719 () Bool)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180985 (= e!125719 (= (bvand (bvand v!189 (onesLSBLong!0 i!590)) (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180986 () Bool)

(declare-fun res!150297 () Bool)

(declare-fun e!125724 () Bool)

(assert (=> b!180986 (=> res!150297 e!125724)))

(declare-fun isPrefixOf!0 (BitStream!7656 BitStream!7656) Bool)

(assert (=> b!180986 (= res!150297 (not (isPrefixOf!0 thiss!1204 (_2!8446 lt!277757))))))

(declare-fun b!180987 () Bool)

(declare-fun res!150294 () Bool)

(assert (=> b!180987 (=> res!150294 e!125724)))

(assert (=> b!180987 (= res!150294 (not (isPrefixOf!0 (_2!8446 lt!277757) (_2!8446 lt!277754))))))

(declare-fun b!180988 () Bool)

(assert (=> b!180988 (= e!125715 e!125724)))

(declare-fun res!150304 () Bool)

(assert (=> b!180988 (=> res!150304 e!125724)))

(declare-fun lt!277751 () (_ BitVec 64))

(assert (=> b!180988 (= res!150304 (not (= lt!277751 (bvsub (bvsub (bvadd lt!277759 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!180988 (= lt!277751 (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277754))) (currentByte!8936 (_2!8446 lt!277754)) (currentBit!8931 (_2!8446 lt!277754))))))

(assert (=> b!180988 (isPrefixOf!0 thiss!1204 (_2!8446 lt!277754))))

(declare-fun lt!277758 () Unit!13006)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7656 BitStream!7656 BitStream!7656) Unit!13006)

(assert (=> b!180988 (= lt!277758 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8446 lt!277757) (_2!8446 lt!277754)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7656 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15602)

(assert (=> b!180988 (= lt!277754 (appendBitsLSBFirstLoopTR!0 (_2!8446 lt!277757) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!180989 () Bool)

(assert (=> b!180989 (= e!125724 e!125719)))

(declare-fun res!150300 () Bool)

(assert (=> b!180989 (=> res!150300 e!125719)))

(declare-datatypes ((tuple2!15606 0))(
  ( (tuple2!15607 (_1!8448 BitStream!7656) (_2!8448 BitStream!7656)) )
))
(declare-fun lt!277746 () tuple2!15606)

(declare-fun lt!277762 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180989 (= res!150300 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4274 (buf!4720 (_1!8448 lt!277746)))) ((_ sign_extend 32) (currentByte!8936 (_1!8448 lt!277746))) ((_ sign_extend 32) (currentBit!8931 (_1!8448 lt!277746))) lt!277762)))))

(assert (=> b!180989 (validate_offset_bits!1 ((_ sign_extend 32) (size!4274 (buf!4720 (_2!8446 lt!277754)))) ((_ sign_extend 32) (currentByte!8936 thiss!1204)) ((_ sign_extend 32) (currentBit!8931 thiss!1204)) lt!277762)))

(declare-fun lt!277749 () Unit!13006)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7656 array!9691 (_ BitVec 64)) Unit!13006)

(assert (=> b!180989 (= lt!277749 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4720 (_2!8446 lt!277754)) lt!277762))))

(assert (=> b!180989 (= (_2!8447 (readBitPure!0 (_1!8448 lt!277746))) lt!277752)))

(declare-fun lt!277755 () tuple2!15606)

(declare-fun reader!0 (BitStream!7656 BitStream!7656) tuple2!15606)

(assert (=> b!180989 (= lt!277755 (reader!0 (_2!8446 lt!277757) (_2!8446 lt!277754)))))

(assert (=> b!180989 (= lt!277746 (reader!0 thiss!1204 (_2!8446 lt!277754)))))

(declare-fun e!125714 () Bool)

(assert (=> b!180989 e!125714))

(declare-fun res!150302 () Bool)

(assert (=> b!180989 (=> (not res!150302) (not e!125714))))

(declare-fun lt!277760 () tuple2!15604)

(declare-fun lt!277747 () tuple2!15604)

(assert (=> b!180989 (= res!150302 (= (bitIndex!0 (size!4274 (buf!4720 (_1!8447 lt!277760))) (currentByte!8936 (_1!8447 lt!277760)) (currentBit!8931 (_1!8447 lt!277760))) (bitIndex!0 (size!4274 (buf!4720 (_1!8447 lt!277747))) (currentByte!8936 (_1!8447 lt!277747)) (currentBit!8931 (_1!8447 lt!277747)))))))

(declare-fun lt!277753 () Unit!13006)

(declare-fun lt!277761 () BitStream!7656)

(declare-fun readBitPrefixLemma!0 (BitStream!7656 BitStream!7656) Unit!13006)

(assert (=> b!180989 (= lt!277753 (readBitPrefixLemma!0 lt!277761 (_2!8446 lt!277754)))))

(assert (=> b!180989 (= lt!277747 (readBitPure!0 (BitStream!7657 (buf!4720 (_2!8446 lt!277754)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204))))))

(assert (=> b!180989 (= lt!277760 (readBitPure!0 lt!277761))))

(assert (=> b!180989 e!125717))

(declare-fun res!150306 () Bool)

(assert (=> b!180989 (=> (not res!150306) (not e!125717))))

(assert (=> b!180989 (= res!150306 (invariant!0 (currentBit!8931 thiss!1204) (currentByte!8936 thiss!1204) (size!4274 (buf!4720 (_2!8446 lt!277757)))))))

(assert (=> b!180989 (= lt!277761 (BitStream!7657 (buf!4720 (_2!8446 lt!277757)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204)))))

(declare-fun b!180990 () Bool)

(declare-fun res!150295 () Bool)

(assert (=> b!180990 (=> res!150295 e!125724)))

(assert (=> b!180990 (= res!150295 (not (invariant!0 (currentBit!8931 (_2!8446 lt!277754)) (currentByte!8936 (_2!8446 lt!277754)) (size!4274 (buf!4720 (_2!8446 lt!277754))))))))

(declare-fun b!180991 () Bool)

(assert (=> b!180991 (= e!125714 (= (_2!8447 lt!277760) (_2!8447 lt!277747)))))

(declare-fun b!180992 () Bool)

(declare-fun res!150299 () Bool)

(assert (=> b!180992 (=> (not res!150299) (not e!125718))))

(assert (=> b!180992 (= res!150299 (not (= i!590 nBits!348)))))

(declare-fun b!180993 () Bool)

(declare-fun array_inv!4015 (array!9691) Bool)

(assert (=> b!180993 (= e!125722 (array_inv!4015 (buf!4720 thiss!1204)))))

(declare-fun b!180994 () Bool)

(declare-fun res!150298 () Bool)

(assert (=> b!180994 (=> res!150298 e!125724)))

(assert (=> b!180994 (= res!150298 (or (not (= (size!4274 (buf!4720 (_2!8446 lt!277754))) (size!4274 (buf!4720 thiss!1204)))) (not (= lt!277751 (bvsub (bvadd lt!277756 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!180995 () Bool)

(declare-fun res!150307 () Bool)

(assert (=> b!180995 (=> (not res!150307) (not e!125723))))

(assert (=> b!180995 (= res!150307 (isPrefixOf!0 thiss!1204 (_2!8446 lt!277757)))))

(declare-fun b!180996 () Bool)

(assert (=> b!180996 (= e!125720 e!125718)))

(declare-fun res!150296 () Bool)

(assert (=> b!180996 (=> (not res!150296) (not e!125718))))

(assert (=> b!180996 (= res!150296 (validate_offset_bits!1 ((_ sign_extend 32) (size!4274 (buf!4720 thiss!1204))) ((_ sign_extend 32) (currentByte!8936 thiss!1204)) ((_ sign_extend 32) (currentBit!8931 thiss!1204)) lt!277762))))

(assert (=> b!180996 (= lt!277762 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!39838 res!150309) b!180996))

(assert (= (and b!180996 res!150296) b!180979))

(assert (= (and b!180979 res!150305) b!180992))

(assert (= (and b!180992 res!150299) b!180984))

(assert (= (and b!180984 res!150303) b!180982))

(assert (= (and b!180982 res!150293) b!180995))

(assert (= (and b!180995 res!150307) b!180980))

(assert (= (and b!180980 res!150301) b!180981))

(assert (= (and b!180984 (not res!150308)) b!180988))

(assert (= (and b!180988 (not res!150304)) b!180990))

(assert (= (and b!180990 (not res!150295)) b!180994))

(assert (= (and b!180994 (not res!150298)) b!180987))

(assert (= (and b!180987 (not res!150294)) b!180986))

(assert (= (and b!180986 (not res!150297)) b!180989))

(assert (= (and b!180989 res!150306) b!180983))

(assert (= (and b!180989 res!150302) b!180991))

(assert (= (and b!180989 (not res!150300)) b!180985))

(assert (= start!39838 b!180993))

(declare-fun m!281711 () Bool)

(assert (=> b!180984 m!281711))

(declare-fun m!281713 () Bool)

(assert (=> b!180984 m!281713))

(declare-fun m!281715 () Bool)

(assert (=> b!180984 m!281715))

(declare-fun m!281717 () Bool)

(assert (=> b!180986 m!281717))

(declare-fun m!281719 () Bool)

(assert (=> start!39838 m!281719))

(declare-fun m!281721 () Bool)

(assert (=> b!180979 m!281721))

(declare-fun m!281723 () Bool)

(assert (=> b!180985 m!281723))

(declare-fun m!281725 () Bool)

(assert (=> b!180985 m!281725))

(assert (=> b!180995 m!281717))

(declare-fun m!281727 () Bool)

(assert (=> b!180983 m!281727))

(declare-fun m!281729 () Bool)

(assert (=> b!180981 m!281729))

(declare-fun m!281731 () Bool)

(assert (=> b!180989 m!281731))

(declare-fun m!281733 () Bool)

(assert (=> b!180989 m!281733))

(declare-fun m!281735 () Bool)

(assert (=> b!180989 m!281735))

(declare-fun m!281737 () Bool)

(assert (=> b!180989 m!281737))

(declare-fun m!281739 () Bool)

(assert (=> b!180989 m!281739))

(declare-fun m!281741 () Bool)

(assert (=> b!180989 m!281741))

(declare-fun m!281743 () Bool)

(assert (=> b!180989 m!281743))

(declare-fun m!281745 () Bool)

(assert (=> b!180989 m!281745))

(declare-fun m!281747 () Bool)

(assert (=> b!180989 m!281747))

(declare-fun m!281749 () Bool)

(assert (=> b!180989 m!281749))

(declare-fun m!281751 () Bool)

(assert (=> b!180989 m!281751))

(declare-fun m!281753 () Bool)

(assert (=> b!180989 m!281753))

(assert (=> b!180982 m!281711))

(assert (=> b!180982 m!281713))

(declare-fun m!281755 () Bool)

(assert (=> b!180996 m!281755))

(declare-fun m!281757 () Bool)

(assert (=> b!180987 m!281757))

(declare-fun m!281759 () Bool)

(assert (=> b!180980 m!281759))

(assert (=> b!180980 m!281759))

(declare-fun m!281761 () Bool)

(assert (=> b!180980 m!281761))

(declare-fun m!281763 () Bool)

(assert (=> b!180988 m!281763))

(declare-fun m!281765 () Bool)

(assert (=> b!180988 m!281765))

(declare-fun m!281767 () Bool)

(assert (=> b!180988 m!281767))

(declare-fun m!281769 () Bool)

(assert (=> b!180988 m!281769))

(declare-fun m!281771 () Bool)

(assert (=> b!180990 m!281771))

(declare-fun m!281773 () Bool)

(assert (=> b!180993 m!281773))

(check-sat (not b!180989) (not b!180983) (not b!180995) (not b!180979) (not start!39838) (not b!180987) (not b!180990) (not b!180984) (not b!180980) (not b!180981) (not b!180993) (not b!180986) (not b!180985) (not b!180982) (not b!180988) (not b!180996))
(check-sat)
(get-model)

(declare-fun d!62999 () Bool)

(assert (=> d!62999 (= (array_inv!4015 (buf!4720 thiss!1204)) (bvsge (size!4274 (buf!4720 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!180993 d!62999))

(declare-fun d!63001 () Bool)

(assert (=> d!63001 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8931 thiss!1204) (currentByte!8936 thiss!1204) (size!4274 (buf!4720 thiss!1204))))))

(declare-fun bs!15700 () Bool)

(assert (= bs!15700 d!63001))

(assert (=> bs!15700 m!281721))

(assert (=> start!39838 d!63001))

(declare-fun d!63003 () Bool)

(declare-fun e!125764 () Bool)

(assert (=> d!63003 e!125764))

(declare-fun res!150365 () Bool)

(assert (=> d!63003 (=> (not res!150365) (not e!125764))))

(declare-fun lt!277835 () (_ BitVec 64))

(declare-fun lt!277834 () (_ BitVec 64))

(declare-fun lt!277833 () (_ BitVec 64))

(assert (=> d!63003 (= res!150365 (= lt!277835 (bvsub lt!277833 lt!277834)))))

(assert (=> d!63003 (or (= (bvand lt!277833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277834 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277833 lt!277834) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!63003 (= lt!277834 (remainingBits!0 ((_ sign_extend 32) (size!4274 (buf!4720 (_2!8446 lt!277757)))) ((_ sign_extend 32) (currentByte!8936 (_2!8446 lt!277757))) ((_ sign_extend 32) (currentBit!8931 (_2!8446 lt!277757)))))))

(declare-fun lt!277831 () (_ BitVec 64))

(declare-fun lt!277830 () (_ BitVec 64))

(assert (=> d!63003 (= lt!277833 (bvmul lt!277831 lt!277830))))

(assert (=> d!63003 (or (= lt!277831 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!277830 (bvsdiv (bvmul lt!277831 lt!277830) lt!277831)))))

(assert (=> d!63003 (= lt!277830 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63003 (= lt!277831 ((_ sign_extend 32) (size!4274 (buf!4720 (_2!8446 lt!277757)))))))

(assert (=> d!63003 (= lt!277835 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8936 (_2!8446 lt!277757))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8931 (_2!8446 lt!277757)))))))

(assert (=> d!63003 (invariant!0 (currentBit!8931 (_2!8446 lt!277757)) (currentByte!8936 (_2!8446 lt!277757)) (size!4274 (buf!4720 (_2!8446 lt!277757))))))

(assert (=> d!63003 (= (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277757))) (currentByte!8936 (_2!8446 lt!277757)) (currentBit!8931 (_2!8446 lt!277757))) lt!277835)))

(declare-fun b!181055 () Bool)

(declare-fun res!150366 () Bool)

(assert (=> b!181055 (=> (not res!150366) (not e!125764))))

(assert (=> b!181055 (= res!150366 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!277835))))

(declare-fun b!181056 () Bool)

(declare-fun lt!277832 () (_ BitVec 64))

(assert (=> b!181056 (= e!125764 (bvsle lt!277835 (bvmul lt!277832 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181056 (or (= lt!277832 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!277832 #b0000000000000000000000000000000000000000000000000000000000001000) lt!277832)))))

(assert (=> b!181056 (= lt!277832 ((_ sign_extend 32) (size!4274 (buf!4720 (_2!8446 lt!277757)))))))

(assert (= (and d!63003 res!150365) b!181055))

(assert (= (and b!181055 res!150366) b!181056))

(declare-fun m!281839 () Bool)

(assert (=> d!63003 m!281839))

(declare-fun m!281841 () Bool)

(assert (=> d!63003 m!281841))

(assert (=> b!180982 d!63003))

(declare-fun d!63005 () Bool)

(declare-fun e!125765 () Bool)

(assert (=> d!63005 e!125765))

(declare-fun res!150367 () Bool)

(assert (=> d!63005 (=> (not res!150367) (not e!125765))))

(declare-fun lt!277839 () (_ BitVec 64))

(declare-fun lt!277840 () (_ BitVec 64))

(declare-fun lt!277841 () (_ BitVec 64))

(assert (=> d!63005 (= res!150367 (= lt!277841 (bvsub lt!277839 lt!277840)))))

(assert (=> d!63005 (or (= (bvand lt!277839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277840 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277839 lt!277840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63005 (= lt!277840 (remainingBits!0 ((_ sign_extend 32) (size!4274 (buf!4720 thiss!1204))) ((_ sign_extend 32) (currentByte!8936 thiss!1204)) ((_ sign_extend 32) (currentBit!8931 thiss!1204))))))

(declare-fun lt!277837 () (_ BitVec 64))

(declare-fun lt!277836 () (_ BitVec 64))

(assert (=> d!63005 (= lt!277839 (bvmul lt!277837 lt!277836))))

(assert (=> d!63005 (or (= lt!277837 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!277836 (bvsdiv (bvmul lt!277837 lt!277836) lt!277837)))))

(assert (=> d!63005 (= lt!277836 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63005 (= lt!277837 ((_ sign_extend 32) (size!4274 (buf!4720 thiss!1204))))))

(assert (=> d!63005 (= lt!277841 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8936 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8931 thiss!1204))))))

(assert (=> d!63005 (invariant!0 (currentBit!8931 thiss!1204) (currentByte!8936 thiss!1204) (size!4274 (buf!4720 thiss!1204)))))

(assert (=> d!63005 (= (bitIndex!0 (size!4274 (buf!4720 thiss!1204)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204)) lt!277841)))

(declare-fun b!181057 () Bool)

(declare-fun res!150368 () Bool)

(assert (=> b!181057 (=> (not res!150368) (not e!125765))))

(assert (=> b!181057 (= res!150368 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!277841))))

(declare-fun b!181058 () Bool)

(declare-fun lt!277838 () (_ BitVec 64))

(assert (=> b!181058 (= e!125765 (bvsle lt!277841 (bvmul lt!277838 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181058 (or (= lt!277838 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!277838 #b0000000000000000000000000000000000000000000000000000000000001000) lt!277838)))))

(assert (=> b!181058 (= lt!277838 ((_ sign_extend 32) (size!4274 (buf!4720 thiss!1204))))))

(assert (= (and d!63005 res!150367) b!181057))

(assert (= (and b!181057 res!150368) b!181058))

(declare-fun m!281843 () Bool)

(assert (=> d!63005 m!281843))

(assert (=> d!63005 m!281721))

(assert (=> b!180982 d!63005))

(declare-fun d!63007 () Bool)

(assert (=> d!63007 (= (invariant!0 (currentBit!8931 thiss!1204) (currentByte!8936 thiss!1204) (size!4274 (buf!4720 (_2!8446 lt!277754)))) (and (bvsge (currentBit!8931 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8931 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8936 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8936 thiss!1204) (size!4274 (buf!4720 (_2!8446 lt!277754)))) (and (= (currentBit!8931 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8936 thiss!1204) (size!4274 (buf!4720 (_2!8446 lt!277754))))))))))

(assert (=> b!180983 d!63007))

(declare-fun d!63009 () Bool)

(declare-fun e!125766 () Bool)

(assert (=> d!63009 e!125766))

(declare-fun res!150369 () Bool)

(assert (=> d!63009 (=> (not res!150369) (not e!125766))))

(declare-fun lt!277846 () (_ BitVec 64))

(declare-fun lt!277845 () (_ BitVec 64))

(declare-fun lt!277847 () (_ BitVec 64))

(assert (=> d!63009 (= res!150369 (= lt!277847 (bvsub lt!277845 lt!277846)))))

(assert (=> d!63009 (or (= (bvand lt!277845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277846 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277845 lt!277846) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63009 (= lt!277846 (remainingBits!0 ((_ sign_extend 32) (size!4274 (buf!4720 (_1!8447 lt!277763)))) ((_ sign_extend 32) (currentByte!8936 (_1!8447 lt!277763))) ((_ sign_extend 32) (currentBit!8931 (_1!8447 lt!277763)))))))

(declare-fun lt!277843 () (_ BitVec 64))

(declare-fun lt!277842 () (_ BitVec 64))

(assert (=> d!63009 (= lt!277845 (bvmul lt!277843 lt!277842))))

(assert (=> d!63009 (or (= lt!277843 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!277842 (bvsdiv (bvmul lt!277843 lt!277842) lt!277843)))))

(assert (=> d!63009 (= lt!277842 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63009 (= lt!277843 ((_ sign_extend 32) (size!4274 (buf!4720 (_1!8447 lt!277763)))))))

(assert (=> d!63009 (= lt!277847 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8936 (_1!8447 lt!277763))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8931 (_1!8447 lt!277763)))))))

(assert (=> d!63009 (invariant!0 (currentBit!8931 (_1!8447 lt!277763)) (currentByte!8936 (_1!8447 lt!277763)) (size!4274 (buf!4720 (_1!8447 lt!277763))))))

(assert (=> d!63009 (= (bitIndex!0 (size!4274 (buf!4720 (_1!8447 lt!277763))) (currentByte!8936 (_1!8447 lt!277763)) (currentBit!8931 (_1!8447 lt!277763))) lt!277847)))

(declare-fun b!181059 () Bool)

(declare-fun res!150370 () Bool)

(assert (=> b!181059 (=> (not res!150370) (not e!125766))))

(assert (=> b!181059 (= res!150370 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!277847))))

(declare-fun b!181060 () Bool)

(declare-fun lt!277844 () (_ BitVec 64))

(assert (=> b!181060 (= e!125766 (bvsle lt!277847 (bvmul lt!277844 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181060 (or (= lt!277844 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!277844 #b0000000000000000000000000000000000000000000000000000000000001000) lt!277844)))))

(assert (=> b!181060 (= lt!277844 ((_ sign_extend 32) (size!4274 (buf!4720 (_1!8447 lt!277763)))))))

(assert (= (and d!63009 res!150369) b!181059))

(assert (= (and b!181059 res!150370) b!181060))

(declare-fun m!281845 () Bool)

(assert (=> d!63009 m!281845))

(declare-fun m!281847 () Bool)

(assert (=> d!63009 m!281847))

(assert (=> b!180981 d!63009))

(declare-fun d!63011 () Bool)

(assert (=> d!63011 (= (invariant!0 (currentBit!8931 (_2!8446 lt!277754)) (currentByte!8936 (_2!8446 lt!277754)) (size!4274 (buf!4720 (_2!8446 lt!277754)))) (and (bvsge (currentBit!8931 (_2!8446 lt!277754)) #b00000000000000000000000000000000) (bvslt (currentBit!8931 (_2!8446 lt!277754)) #b00000000000000000000000000001000) (bvsge (currentByte!8936 (_2!8446 lt!277754)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8936 (_2!8446 lt!277754)) (size!4274 (buf!4720 (_2!8446 lt!277754)))) (and (= (currentBit!8931 (_2!8446 lt!277754)) #b00000000000000000000000000000000) (= (currentByte!8936 (_2!8446 lt!277754)) (size!4274 (buf!4720 (_2!8446 lt!277754))))))))))

(assert (=> b!180990 d!63011))

(declare-fun d!63013 () Bool)

(declare-datatypes ((tuple2!15614 0))(
  ( (tuple2!15615 (_1!8452 Bool) (_2!8452 BitStream!7656)) )
))
(declare-fun lt!277850 () tuple2!15614)

(declare-fun readBit!0 (BitStream!7656) tuple2!15614)

(assert (=> d!63013 (= lt!277850 (readBit!0 (readerFrom!0 (_2!8446 lt!277757) (currentBit!8931 thiss!1204) (currentByte!8936 thiss!1204))))))

(assert (=> d!63013 (= (readBitPure!0 (readerFrom!0 (_2!8446 lt!277757) (currentBit!8931 thiss!1204) (currentByte!8936 thiss!1204))) (tuple2!15605 (_2!8452 lt!277850) (_1!8452 lt!277850)))))

(declare-fun bs!15701 () Bool)

(assert (= bs!15701 d!63013))

(assert (=> bs!15701 m!281759))

(declare-fun m!281849 () Bool)

(assert (=> bs!15701 m!281849))

(assert (=> b!180980 d!63013))

(declare-fun d!63015 () Bool)

(declare-fun e!125769 () Bool)

(assert (=> d!63015 e!125769))

(declare-fun res!150374 () Bool)

(assert (=> d!63015 (=> (not res!150374) (not e!125769))))

(assert (=> d!63015 (= res!150374 (invariant!0 (currentBit!8931 (_2!8446 lt!277757)) (currentByte!8936 (_2!8446 lt!277757)) (size!4274 (buf!4720 (_2!8446 lt!277757)))))))

(assert (=> d!63015 (= (readerFrom!0 (_2!8446 lt!277757) (currentBit!8931 thiss!1204) (currentByte!8936 thiss!1204)) (BitStream!7657 (buf!4720 (_2!8446 lt!277757)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204)))))

(declare-fun b!181063 () Bool)

(assert (=> b!181063 (= e!125769 (invariant!0 (currentBit!8931 thiss!1204) (currentByte!8936 thiss!1204) (size!4274 (buf!4720 (_2!8446 lt!277757)))))))

(assert (= (and d!63015 res!150374) b!181063))

(assert (=> d!63015 m!281841))

(assert (=> b!181063 m!281751))

(assert (=> b!180980 d!63015))

(declare-fun d!63017 () Bool)

(declare-fun lt!277851 () tuple2!15614)

(assert (=> d!63017 (= lt!277851 (readBit!0 lt!277761))))

(assert (=> d!63017 (= (readBitPure!0 lt!277761) (tuple2!15605 (_2!8452 lt!277851) (_1!8452 lt!277851)))))

(declare-fun bs!15702 () Bool)

(assert (= bs!15702 d!63017))

(declare-fun m!281851 () Bool)

(assert (=> bs!15702 m!281851))

(assert (=> b!180989 d!63017))

(declare-fun d!63019 () Bool)

(assert (=> d!63019 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4274 (buf!4720 (_1!8448 lt!277746)))) ((_ sign_extend 32) (currentByte!8936 (_1!8448 lt!277746))) ((_ sign_extend 32) (currentBit!8931 (_1!8448 lt!277746))) lt!277762) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4274 (buf!4720 (_1!8448 lt!277746)))) ((_ sign_extend 32) (currentByte!8936 (_1!8448 lt!277746))) ((_ sign_extend 32) (currentBit!8931 (_1!8448 lt!277746)))) lt!277762))))

(declare-fun bs!15703 () Bool)

(assert (= bs!15703 d!63019))

(declare-fun m!281853 () Bool)

(assert (=> bs!15703 m!281853))

(assert (=> b!180989 d!63019))

(declare-fun b!181074 () Bool)

(declare-fun e!125774 () Unit!13006)

(declare-fun lt!277893 () Unit!13006)

(assert (=> b!181074 (= e!125774 lt!277893)))

(declare-fun lt!277911 () (_ BitVec 64))

(assert (=> b!181074 (= lt!277911 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!277908 () (_ BitVec 64))

(assert (=> b!181074 (= lt!277908 (bitIndex!0 (size!4274 (buf!4720 thiss!1204)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9691 array!9691 (_ BitVec 64) (_ BitVec 64)) Unit!13006)

(assert (=> b!181074 (= lt!277893 (arrayBitRangesEqSymmetric!0 (buf!4720 thiss!1204) (buf!4720 (_2!8446 lt!277754)) lt!277911 lt!277908))))

(declare-fun arrayBitRangesEq!0 (array!9691 array!9691 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!181074 (arrayBitRangesEq!0 (buf!4720 (_2!8446 lt!277754)) (buf!4720 thiss!1204) lt!277911 lt!277908)))

(declare-fun d!63021 () Bool)

(declare-fun e!125775 () Bool)

(assert (=> d!63021 e!125775))

(declare-fun res!150381 () Bool)

(assert (=> d!63021 (=> (not res!150381) (not e!125775))))

(declare-fun lt!277897 () tuple2!15606)

(assert (=> d!63021 (= res!150381 (isPrefixOf!0 (_1!8448 lt!277897) (_2!8448 lt!277897)))))

(declare-fun lt!277901 () BitStream!7656)

(assert (=> d!63021 (= lt!277897 (tuple2!15607 lt!277901 (_2!8446 lt!277754)))))

(declare-fun lt!277902 () Unit!13006)

(declare-fun lt!277900 () Unit!13006)

(assert (=> d!63021 (= lt!277902 lt!277900)))

(assert (=> d!63021 (isPrefixOf!0 lt!277901 (_2!8446 lt!277754))))

(assert (=> d!63021 (= lt!277900 (lemmaIsPrefixTransitive!0 lt!277901 (_2!8446 lt!277754) (_2!8446 lt!277754)))))

(declare-fun lt!277898 () Unit!13006)

(declare-fun lt!277903 () Unit!13006)

(assert (=> d!63021 (= lt!277898 lt!277903)))

(assert (=> d!63021 (isPrefixOf!0 lt!277901 (_2!8446 lt!277754))))

(assert (=> d!63021 (= lt!277903 (lemmaIsPrefixTransitive!0 lt!277901 thiss!1204 (_2!8446 lt!277754)))))

(declare-fun lt!277896 () Unit!13006)

(assert (=> d!63021 (= lt!277896 e!125774)))

(declare-fun c!9339 () Bool)

(assert (=> d!63021 (= c!9339 (not (= (size!4274 (buf!4720 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!277910 () Unit!13006)

(declare-fun lt!277906 () Unit!13006)

(assert (=> d!63021 (= lt!277910 lt!277906)))

(assert (=> d!63021 (isPrefixOf!0 (_2!8446 lt!277754) (_2!8446 lt!277754))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7656) Unit!13006)

(assert (=> d!63021 (= lt!277906 (lemmaIsPrefixRefl!0 (_2!8446 lt!277754)))))

(declare-fun lt!277894 () Unit!13006)

(declare-fun lt!277905 () Unit!13006)

(assert (=> d!63021 (= lt!277894 lt!277905)))

(assert (=> d!63021 (= lt!277905 (lemmaIsPrefixRefl!0 (_2!8446 lt!277754)))))

(declare-fun lt!277892 () Unit!13006)

(declare-fun lt!277895 () Unit!13006)

(assert (=> d!63021 (= lt!277892 lt!277895)))

(assert (=> d!63021 (isPrefixOf!0 lt!277901 lt!277901)))

(assert (=> d!63021 (= lt!277895 (lemmaIsPrefixRefl!0 lt!277901))))

(declare-fun lt!277899 () Unit!13006)

(declare-fun lt!277904 () Unit!13006)

(assert (=> d!63021 (= lt!277899 lt!277904)))

(assert (=> d!63021 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!63021 (= lt!277904 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!63021 (= lt!277901 (BitStream!7657 (buf!4720 (_2!8446 lt!277754)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204)))))

(assert (=> d!63021 (isPrefixOf!0 thiss!1204 (_2!8446 lt!277754))))

(assert (=> d!63021 (= (reader!0 thiss!1204 (_2!8446 lt!277754)) lt!277897)))

(declare-fun lt!277909 () (_ BitVec 64))

(declare-fun lt!277907 () (_ BitVec 64))

(declare-fun b!181075 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!7656 (_ BitVec 64)) BitStream!7656)

(assert (=> b!181075 (= e!125775 (= (_1!8448 lt!277897) (withMovedBitIndex!0 (_2!8448 lt!277897) (bvsub lt!277907 lt!277909))))))

(assert (=> b!181075 (or (= (bvand lt!277907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277909 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277907 lt!277909) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181075 (= lt!277909 (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277754))) (currentByte!8936 (_2!8446 lt!277754)) (currentBit!8931 (_2!8446 lt!277754))))))

(assert (=> b!181075 (= lt!277907 (bitIndex!0 (size!4274 (buf!4720 thiss!1204)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204)))))

(declare-fun b!181076 () Bool)

(declare-fun Unit!13010 () Unit!13006)

(assert (=> b!181076 (= e!125774 Unit!13010)))

(declare-fun b!181077 () Bool)

(declare-fun res!150383 () Bool)

(assert (=> b!181077 (=> (not res!150383) (not e!125775))))

(assert (=> b!181077 (= res!150383 (isPrefixOf!0 (_1!8448 lt!277897) thiss!1204))))

(declare-fun b!181078 () Bool)

(declare-fun res!150382 () Bool)

(assert (=> b!181078 (=> (not res!150382) (not e!125775))))

(assert (=> b!181078 (= res!150382 (isPrefixOf!0 (_2!8448 lt!277897) (_2!8446 lt!277754)))))

(assert (= (and d!63021 c!9339) b!181074))

(assert (= (and d!63021 (not c!9339)) b!181076))

(assert (= (and d!63021 res!150381) b!181077))

(assert (= (and b!181077 res!150383) b!181078))

(assert (= (and b!181078 res!150382) b!181075))

(declare-fun m!281855 () Bool)

(assert (=> b!181078 m!281855))

(declare-fun m!281857 () Bool)

(assert (=> d!63021 m!281857))

(declare-fun m!281859 () Bool)

(assert (=> d!63021 m!281859))

(declare-fun m!281861 () Bool)

(assert (=> d!63021 m!281861))

(declare-fun m!281863 () Bool)

(assert (=> d!63021 m!281863))

(declare-fun m!281865 () Bool)

(assert (=> d!63021 m!281865))

(declare-fun m!281867 () Bool)

(assert (=> d!63021 m!281867))

(declare-fun m!281869 () Bool)

(assert (=> d!63021 m!281869))

(declare-fun m!281871 () Bool)

(assert (=> d!63021 m!281871))

(declare-fun m!281873 () Bool)

(assert (=> d!63021 m!281873))

(declare-fun m!281875 () Bool)

(assert (=> d!63021 m!281875))

(assert (=> d!63021 m!281765))

(declare-fun m!281877 () Bool)

(assert (=> b!181075 m!281877))

(assert (=> b!181075 m!281763))

(assert (=> b!181075 m!281713))

(declare-fun m!281879 () Bool)

(assert (=> b!181077 m!281879))

(assert (=> b!181074 m!281713))

(declare-fun m!281881 () Bool)

(assert (=> b!181074 m!281881))

(declare-fun m!281883 () Bool)

(assert (=> b!181074 m!281883))

(assert (=> b!180989 d!63021))

(declare-fun b!181079 () Bool)

(declare-fun e!125776 () Unit!13006)

(declare-fun lt!277913 () Unit!13006)

(assert (=> b!181079 (= e!125776 lt!277913)))

(declare-fun lt!277931 () (_ BitVec 64))

(assert (=> b!181079 (= lt!277931 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!277928 () (_ BitVec 64))

(assert (=> b!181079 (= lt!277928 (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277757))) (currentByte!8936 (_2!8446 lt!277757)) (currentBit!8931 (_2!8446 lt!277757))))))

(assert (=> b!181079 (= lt!277913 (arrayBitRangesEqSymmetric!0 (buf!4720 (_2!8446 lt!277757)) (buf!4720 (_2!8446 lt!277754)) lt!277931 lt!277928))))

(assert (=> b!181079 (arrayBitRangesEq!0 (buf!4720 (_2!8446 lt!277754)) (buf!4720 (_2!8446 lt!277757)) lt!277931 lt!277928)))

(declare-fun d!63023 () Bool)

(declare-fun e!125777 () Bool)

(assert (=> d!63023 e!125777))

(declare-fun res!150384 () Bool)

(assert (=> d!63023 (=> (not res!150384) (not e!125777))))

(declare-fun lt!277917 () tuple2!15606)

(assert (=> d!63023 (= res!150384 (isPrefixOf!0 (_1!8448 lt!277917) (_2!8448 lt!277917)))))

(declare-fun lt!277921 () BitStream!7656)

(assert (=> d!63023 (= lt!277917 (tuple2!15607 lt!277921 (_2!8446 lt!277754)))))

(declare-fun lt!277922 () Unit!13006)

(declare-fun lt!277920 () Unit!13006)

(assert (=> d!63023 (= lt!277922 lt!277920)))

(assert (=> d!63023 (isPrefixOf!0 lt!277921 (_2!8446 lt!277754))))

(assert (=> d!63023 (= lt!277920 (lemmaIsPrefixTransitive!0 lt!277921 (_2!8446 lt!277754) (_2!8446 lt!277754)))))

(declare-fun lt!277918 () Unit!13006)

(declare-fun lt!277923 () Unit!13006)

(assert (=> d!63023 (= lt!277918 lt!277923)))

(assert (=> d!63023 (isPrefixOf!0 lt!277921 (_2!8446 lt!277754))))

(assert (=> d!63023 (= lt!277923 (lemmaIsPrefixTransitive!0 lt!277921 (_2!8446 lt!277757) (_2!8446 lt!277754)))))

(declare-fun lt!277916 () Unit!13006)

(assert (=> d!63023 (= lt!277916 e!125776)))

(declare-fun c!9340 () Bool)

(assert (=> d!63023 (= c!9340 (not (= (size!4274 (buf!4720 (_2!8446 lt!277757))) #b00000000000000000000000000000000)))))

(declare-fun lt!277930 () Unit!13006)

(declare-fun lt!277926 () Unit!13006)

(assert (=> d!63023 (= lt!277930 lt!277926)))

(assert (=> d!63023 (isPrefixOf!0 (_2!8446 lt!277754) (_2!8446 lt!277754))))

(assert (=> d!63023 (= lt!277926 (lemmaIsPrefixRefl!0 (_2!8446 lt!277754)))))

(declare-fun lt!277914 () Unit!13006)

(declare-fun lt!277925 () Unit!13006)

(assert (=> d!63023 (= lt!277914 lt!277925)))

(assert (=> d!63023 (= lt!277925 (lemmaIsPrefixRefl!0 (_2!8446 lt!277754)))))

(declare-fun lt!277912 () Unit!13006)

(declare-fun lt!277915 () Unit!13006)

(assert (=> d!63023 (= lt!277912 lt!277915)))

(assert (=> d!63023 (isPrefixOf!0 lt!277921 lt!277921)))

(assert (=> d!63023 (= lt!277915 (lemmaIsPrefixRefl!0 lt!277921))))

(declare-fun lt!277919 () Unit!13006)

(declare-fun lt!277924 () Unit!13006)

(assert (=> d!63023 (= lt!277919 lt!277924)))

(assert (=> d!63023 (isPrefixOf!0 (_2!8446 lt!277757) (_2!8446 lt!277757))))

(assert (=> d!63023 (= lt!277924 (lemmaIsPrefixRefl!0 (_2!8446 lt!277757)))))

(assert (=> d!63023 (= lt!277921 (BitStream!7657 (buf!4720 (_2!8446 lt!277754)) (currentByte!8936 (_2!8446 lt!277757)) (currentBit!8931 (_2!8446 lt!277757))))))

(assert (=> d!63023 (isPrefixOf!0 (_2!8446 lt!277757) (_2!8446 lt!277754))))

(assert (=> d!63023 (= (reader!0 (_2!8446 lt!277757) (_2!8446 lt!277754)) lt!277917)))

(declare-fun lt!277929 () (_ BitVec 64))

(declare-fun b!181080 () Bool)

(declare-fun lt!277927 () (_ BitVec 64))

(assert (=> b!181080 (= e!125777 (= (_1!8448 lt!277917) (withMovedBitIndex!0 (_2!8448 lt!277917) (bvsub lt!277927 lt!277929))))))

(assert (=> b!181080 (or (= (bvand lt!277927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277929 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277927 lt!277929) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181080 (= lt!277929 (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277754))) (currentByte!8936 (_2!8446 lt!277754)) (currentBit!8931 (_2!8446 lt!277754))))))

(assert (=> b!181080 (= lt!277927 (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277757))) (currentByte!8936 (_2!8446 lt!277757)) (currentBit!8931 (_2!8446 lt!277757))))))

(declare-fun b!181081 () Bool)

(declare-fun Unit!13011 () Unit!13006)

(assert (=> b!181081 (= e!125776 Unit!13011)))

(declare-fun b!181082 () Bool)

(declare-fun res!150386 () Bool)

(assert (=> b!181082 (=> (not res!150386) (not e!125777))))

(assert (=> b!181082 (= res!150386 (isPrefixOf!0 (_1!8448 lt!277917) (_2!8446 lt!277757)))))

(declare-fun b!181083 () Bool)

(declare-fun res!150385 () Bool)

(assert (=> b!181083 (=> (not res!150385) (not e!125777))))

(assert (=> b!181083 (= res!150385 (isPrefixOf!0 (_2!8448 lt!277917) (_2!8446 lt!277754)))))

(assert (= (and d!63023 c!9340) b!181079))

(assert (= (and d!63023 (not c!9340)) b!181081))

(assert (= (and d!63023 res!150384) b!181082))

(assert (= (and b!181082 res!150386) b!181083))

(assert (= (and b!181083 res!150385) b!181080))

(declare-fun m!281885 () Bool)

(assert (=> b!181083 m!281885))

(declare-fun m!281887 () Bool)

(assert (=> d!63023 m!281887))

(declare-fun m!281889 () Bool)

(assert (=> d!63023 m!281889))

(declare-fun m!281891 () Bool)

(assert (=> d!63023 m!281891))

(declare-fun m!281893 () Bool)

(assert (=> d!63023 m!281893))

(assert (=> d!63023 m!281865))

(declare-fun m!281895 () Bool)

(assert (=> d!63023 m!281895))

(declare-fun m!281897 () Bool)

(assert (=> d!63023 m!281897))

(assert (=> d!63023 m!281871))

(declare-fun m!281899 () Bool)

(assert (=> d!63023 m!281899))

(declare-fun m!281901 () Bool)

(assert (=> d!63023 m!281901))

(assert (=> d!63023 m!281757))

(declare-fun m!281903 () Bool)

(assert (=> b!181080 m!281903))

(assert (=> b!181080 m!281763))

(assert (=> b!181080 m!281711))

(declare-fun m!281905 () Bool)

(assert (=> b!181082 m!281905))

(assert (=> b!181079 m!281711))

(declare-fun m!281907 () Bool)

(assert (=> b!181079 m!281907))

(declare-fun m!281909 () Bool)

(assert (=> b!181079 m!281909))

(assert (=> b!180989 d!63023))

(declare-fun d!63025 () Bool)

(assert (=> d!63025 (validate_offset_bits!1 ((_ sign_extend 32) (size!4274 (buf!4720 (_2!8446 lt!277754)))) ((_ sign_extend 32) (currentByte!8936 thiss!1204)) ((_ sign_extend 32) (currentBit!8931 thiss!1204)) lt!277762)))

(declare-fun lt!277934 () Unit!13006)

(declare-fun choose!9 (BitStream!7656 array!9691 (_ BitVec 64) BitStream!7656) Unit!13006)

(assert (=> d!63025 (= lt!277934 (choose!9 thiss!1204 (buf!4720 (_2!8446 lt!277754)) lt!277762 (BitStream!7657 (buf!4720 (_2!8446 lt!277754)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204))))))

(assert (=> d!63025 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4720 (_2!8446 lt!277754)) lt!277762) lt!277934)))

(declare-fun bs!15704 () Bool)

(assert (= bs!15704 d!63025))

(assert (=> bs!15704 m!281741))

(declare-fun m!281911 () Bool)

(assert (=> bs!15704 m!281911))

(assert (=> b!180989 d!63025))

(declare-fun d!63027 () Bool)

(declare-fun e!125778 () Bool)

(assert (=> d!63027 e!125778))

(declare-fun res!150387 () Bool)

(assert (=> d!63027 (=> (not res!150387) (not e!125778))))

(declare-fun lt!277940 () (_ BitVec 64))

(declare-fun lt!277939 () (_ BitVec 64))

(declare-fun lt!277938 () (_ BitVec 64))

(assert (=> d!63027 (= res!150387 (= lt!277940 (bvsub lt!277938 lt!277939)))))

(assert (=> d!63027 (or (= (bvand lt!277938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277939 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277938 lt!277939) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63027 (= lt!277939 (remainingBits!0 ((_ sign_extend 32) (size!4274 (buf!4720 (_1!8447 lt!277760)))) ((_ sign_extend 32) (currentByte!8936 (_1!8447 lt!277760))) ((_ sign_extend 32) (currentBit!8931 (_1!8447 lt!277760)))))))

(declare-fun lt!277936 () (_ BitVec 64))

(declare-fun lt!277935 () (_ BitVec 64))

(assert (=> d!63027 (= lt!277938 (bvmul lt!277936 lt!277935))))

(assert (=> d!63027 (or (= lt!277936 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!277935 (bvsdiv (bvmul lt!277936 lt!277935) lt!277936)))))

(assert (=> d!63027 (= lt!277935 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63027 (= lt!277936 ((_ sign_extend 32) (size!4274 (buf!4720 (_1!8447 lt!277760)))))))

(assert (=> d!63027 (= lt!277940 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8936 (_1!8447 lt!277760))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8931 (_1!8447 lt!277760)))))))

(assert (=> d!63027 (invariant!0 (currentBit!8931 (_1!8447 lt!277760)) (currentByte!8936 (_1!8447 lt!277760)) (size!4274 (buf!4720 (_1!8447 lt!277760))))))

(assert (=> d!63027 (= (bitIndex!0 (size!4274 (buf!4720 (_1!8447 lt!277760))) (currentByte!8936 (_1!8447 lt!277760)) (currentBit!8931 (_1!8447 lt!277760))) lt!277940)))

(declare-fun b!181084 () Bool)

(declare-fun res!150388 () Bool)

(assert (=> b!181084 (=> (not res!150388) (not e!125778))))

(assert (=> b!181084 (= res!150388 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!277940))))

(declare-fun b!181085 () Bool)

(declare-fun lt!277937 () (_ BitVec 64))

(assert (=> b!181085 (= e!125778 (bvsle lt!277940 (bvmul lt!277937 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181085 (or (= lt!277937 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!277937 #b0000000000000000000000000000000000000000000000000000000000001000) lt!277937)))))

(assert (=> b!181085 (= lt!277937 ((_ sign_extend 32) (size!4274 (buf!4720 (_1!8447 lt!277760)))))))

(assert (= (and d!63027 res!150387) b!181084))

(assert (= (and b!181084 res!150388) b!181085))

(declare-fun m!281913 () Bool)

(assert (=> d!63027 m!281913))

(declare-fun m!281915 () Bool)

(assert (=> d!63027 m!281915))

(assert (=> b!180989 d!63027))

(declare-fun d!63029 () Bool)

(declare-fun e!125779 () Bool)

(assert (=> d!63029 e!125779))

(declare-fun res!150389 () Bool)

(assert (=> d!63029 (=> (not res!150389) (not e!125779))))

(declare-fun lt!277945 () (_ BitVec 64))

(declare-fun lt!277944 () (_ BitVec 64))

(declare-fun lt!277946 () (_ BitVec 64))

(assert (=> d!63029 (= res!150389 (= lt!277946 (bvsub lt!277944 lt!277945)))))

(assert (=> d!63029 (or (= (bvand lt!277944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277945 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277944 lt!277945) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63029 (= lt!277945 (remainingBits!0 ((_ sign_extend 32) (size!4274 (buf!4720 (_1!8447 lt!277747)))) ((_ sign_extend 32) (currentByte!8936 (_1!8447 lt!277747))) ((_ sign_extend 32) (currentBit!8931 (_1!8447 lt!277747)))))))

(declare-fun lt!277942 () (_ BitVec 64))

(declare-fun lt!277941 () (_ BitVec 64))

(assert (=> d!63029 (= lt!277944 (bvmul lt!277942 lt!277941))))

(assert (=> d!63029 (or (= lt!277942 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!277941 (bvsdiv (bvmul lt!277942 lt!277941) lt!277942)))))

(assert (=> d!63029 (= lt!277941 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63029 (= lt!277942 ((_ sign_extend 32) (size!4274 (buf!4720 (_1!8447 lt!277747)))))))

(assert (=> d!63029 (= lt!277946 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8936 (_1!8447 lt!277747))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8931 (_1!8447 lt!277747)))))))

(assert (=> d!63029 (invariant!0 (currentBit!8931 (_1!8447 lt!277747)) (currentByte!8936 (_1!8447 lt!277747)) (size!4274 (buf!4720 (_1!8447 lt!277747))))))

(assert (=> d!63029 (= (bitIndex!0 (size!4274 (buf!4720 (_1!8447 lt!277747))) (currentByte!8936 (_1!8447 lt!277747)) (currentBit!8931 (_1!8447 lt!277747))) lt!277946)))

(declare-fun b!181086 () Bool)

(declare-fun res!150390 () Bool)

(assert (=> b!181086 (=> (not res!150390) (not e!125779))))

(assert (=> b!181086 (= res!150390 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!277946))))

(declare-fun b!181087 () Bool)

(declare-fun lt!277943 () (_ BitVec 64))

(assert (=> b!181087 (= e!125779 (bvsle lt!277946 (bvmul lt!277943 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181087 (or (= lt!277943 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!277943 #b0000000000000000000000000000000000000000000000000000000000001000) lt!277943)))))

(assert (=> b!181087 (= lt!277943 ((_ sign_extend 32) (size!4274 (buf!4720 (_1!8447 lt!277747)))))))

(assert (= (and d!63029 res!150389) b!181086))

(assert (= (and b!181086 res!150390) b!181087))

(declare-fun m!281917 () Bool)

(assert (=> d!63029 m!281917))

(declare-fun m!281919 () Bool)

(assert (=> d!63029 m!281919))

(assert (=> b!180989 d!63029))

(declare-fun d!63031 () Bool)

(declare-fun e!125782 () Bool)

(assert (=> d!63031 e!125782))

(declare-fun res!150393 () Bool)

(assert (=> d!63031 (=> (not res!150393) (not e!125782))))

(declare-fun lt!277958 () tuple2!15604)

(declare-fun lt!277955 () tuple2!15604)

(assert (=> d!63031 (= res!150393 (= (bitIndex!0 (size!4274 (buf!4720 (_1!8447 lt!277958))) (currentByte!8936 (_1!8447 lt!277958)) (currentBit!8931 (_1!8447 lt!277958))) (bitIndex!0 (size!4274 (buf!4720 (_1!8447 lt!277955))) (currentByte!8936 (_1!8447 lt!277955)) (currentBit!8931 (_1!8447 lt!277955)))))))

(declare-fun lt!277957 () Unit!13006)

(declare-fun lt!277956 () BitStream!7656)

(declare-fun choose!50 (BitStream!7656 BitStream!7656 BitStream!7656 tuple2!15604 tuple2!15604 BitStream!7656 Bool tuple2!15604 tuple2!15604 BitStream!7656 Bool) Unit!13006)

(assert (=> d!63031 (= lt!277957 (choose!50 lt!277761 (_2!8446 lt!277754) lt!277956 lt!277958 (tuple2!15605 (_1!8447 lt!277958) (_2!8447 lt!277958)) (_1!8447 lt!277958) (_2!8447 lt!277958) lt!277955 (tuple2!15605 (_1!8447 lt!277955) (_2!8447 lt!277955)) (_1!8447 lt!277955) (_2!8447 lt!277955)))))

(assert (=> d!63031 (= lt!277955 (readBitPure!0 lt!277956))))

(assert (=> d!63031 (= lt!277958 (readBitPure!0 lt!277761))))

(assert (=> d!63031 (= lt!277956 (BitStream!7657 (buf!4720 (_2!8446 lt!277754)) (currentByte!8936 lt!277761) (currentBit!8931 lt!277761)))))

(assert (=> d!63031 (invariant!0 (currentBit!8931 lt!277761) (currentByte!8936 lt!277761) (size!4274 (buf!4720 (_2!8446 lt!277754))))))

(assert (=> d!63031 (= (readBitPrefixLemma!0 lt!277761 (_2!8446 lt!277754)) lt!277957)))

(declare-fun b!181090 () Bool)

(assert (=> b!181090 (= e!125782 (= (_2!8447 lt!277958) (_2!8447 lt!277955)))))

(assert (= (and d!63031 res!150393) b!181090))

(declare-fun m!281921 () Bool)

(assert (=> d!63031 m!281921))

(declare-fun m!281923 () Bool)

(assert (=> d!63031 m!281923))

(assert (=> d!63031 m!281733))

(declare-fun m!281925 () Bool)

(assert (=> d!63031 m!281925))

(declare-fun m!281927 () Bool)

(assert (=> d!63031 m!281927))

(declare-fun m!281929 () Bool)

(assert (=> d!63031 m!281929))

(assert (=> b!180989 d!63031))

(declare-fun d!63033 () Bool)

(assert (=> d!63033 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4274 (buf!4720 (_2!8446 lt!277754)))) ((_ sign_extend 32) (currentByte!8936 thiss!1204)) ((_ sign_extend 32) (currentBit!8931 thiss!1204)) lt!277762) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4274 (buf!4720 (_2!8446 lt!277754)))) ((_ sign_extend 32) (currentByte!8936 thiss!1204)) ((_ sign_extend 32) (currentBit!8931 thiss!1204))) lt!277762))))

(declare-fun bs!15705 () Bool)

(assert (= bs!15705 d!63033))

(declare-fun m!281931 () Bool)

(assert (=> bs!15705 m!281931))

(assert (=> b!180989 d!63033))

(declare-fun d!63035 () Bool)

(declare-fun lt!277959 () tuple2!15614)

(assert (=> d!63035 (= lt!277959 (readBit!0 (_1!8448 lt!277746)))))

(assert (=> d!63035 (= (readBitPure!0 (_1!8448 lt!277746)) (tuple2!15605 (_2!8452 lt!277959) (_1!8452 lt!277959)))))

(declare-fun bs!15706 () Bool)

(assert (= bs!15706 d!63035))

(declare-fun m!281933 () Bool)

(assert (=> bs!15706 m!281933))

(assert (=> b!180989 d!63035))

(declare-fun d!63037 () Bool)

(assert (=> d!63037 (= (invariant!0 (currentBit!8931 thiss!1204) (currentByte!8936 thiss!1204) (size!4274 (buf!4720 (_2!8446 lt!277757)))) (and (bvsge (currentBit!8931 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8931 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8936 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8936 thiss!1204) (size!4274 (buf!4720 (_2!8446 lt!277757)))) (and (= (currentBit!8931 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8936 thiss!1204) (size!4274 (buf!4720 (_2!8446 lt!277757))))))))))

(assert (=> b!180989 d!63037))

(declare-fun d!63039 () Bool)

(declare-fun lt!277960 () tuple2!15614)

(assert (=> d!63039 (= lt!277960 (readBit!0 (BitStream!7657 (buf!4720 (_2!8446 lt!277754)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204))))))

(assert (=> d!63039 (= (readBitPure!0 (BitStream!7657 (buf!4720 (_2!8446 lt!277754)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204))) (tuple2!15605 (_2!8452 lt!277960) (_1!8452 lt!277960)))))

(declare-fun bs!15707 () Bool)

(assert (= bs!15707 d!63039))

(declare-fun m!281935 () Bool)

(assert (=> bs!15707 m!281935))

(assert (=> b!180989 d!63039))

(declare-fun d!63041 () Bool)

(assert (=> d!63041 (= (invariant!0 (currentBit!8931 thiss!1204) (currentByte!8936 thiss!1204) (size!4274 (buf!4720 thiss!1204))) (and (bvsge (currentBit!8931 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8931 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8936 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8936 thiss!1204) (size!4274 (buf!4720 thiss!1204))) (and (= (currentBit!8931 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8936 thiss!1204) (size!4274 (buf!4720 thiss!1204)))))))))

(assert (=> b!180979 d!63041))

(declare-fun d!63043 () Bool)

(declare-fun e!125783 () Bool)

(assert (=> d!63043 e!125783))

(declare-fun res!150394 () Bool)

(assert (=> d!63043 (=> (not res!150394) (not e!125783))))

(declare-fun lt!277965 () (_ BitVec 64))

(declare-fun lt!277964 () (_ BitVec 64))

(declare-fun lt!277966 () (_ BitVec 64))

(assert (=> d!63043 (= res!150394 (= lt!277966 (bvsub lt!277964 lt!277965)))))

(assert (=> d!63043 (or (= (bvand lt!277964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277965 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277964 lt!277965) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63043 (= lt!277965 (remainingBits!0 ((_ sign_extend 32) (size!4274 (buf!4720 (_2!8446 lt!277754)))) ((_ sign_extend 32) (currentByte!8936 (_2!8446 lt!277754))) ((_ sign_extend 32) (currentBit!8931 (_2!8446 lt!277754)))))))

(declare-fun lt!277962 () (_ BitVec 64))

(declare-fun lt!277961 () (_ BitVec 64))

(assert (=> d!63043 (= lt!277964 (bvmul lt!277962 lt!277961))))

(assert (=> d!63043 (or (= lt!277962 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!277961 (bvsdiv (bvmul lt!277962 lt!277961) lt!277962)))))

(assert (=> d!63043 (= lt!277961 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63043 (= lt!277962 ((_ sign_extend 32) (size!4274 (buf!4720 (_2!8446 lt!277754)))))))

(assert (=> d!63043 (= lt!277966 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8936 (_2!8446 lt!277754))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8931 (_2!8446 lt!277754)))))))

(assert (=> d!63043 (invariant!0 (currentBit!8931 (_2!8446 lt!277754)) (currentByte!8936 (_2!8446 lt!277754)) (size!4274 (buf!4720 (_2!8446 lt!277754))))))

(assert (=> d!63043 (= (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277754))) (currentByte!8936 (_2!8446 lt!277754)) (currentBit!8931 (_2!8446 lt!277754))) lt!277966)))

(declare-fun b!181091 () Bool)

(declare-fun res!150395 () Bool)

(assert (=> b!181091 (=> (not res!150395) (not e!125783))))

(assert (=> b!181091 (= res!150395 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!277966))))

(declare-fun b!181092 () Bool)

(declare-fun lt!277963 () (_ BitVec 64))

(assert (=> b!181092 (= e!125783 (bvsle lt!277966 (bvmul lt!277963 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181092 (or (= lt!277963 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!277963 #b0000000000000000000000000000000000000000000000000000000000001000) lt!277963)))))

(assert (=> b!181092 (= lt!277963 ((_ sign_extend 32) (size!4274 (buf!4720 (_2!8446 lt!277754)))))))

(assert (= (and d!63043 res!150394) b!181091))

(assert (= (and b!181091 res!150395) b!181092))

(declare-fun m!281937 () Bool)

(assert (=> d!63043 m!281937))

(assert (=> d!63043 m!281771))

(assert (=> b!180988 d!63043))

(declare-fun d!63045 () Bool)

(declare-fun res!150403 () Bool)

(declare-fun e!125789 () Bool)

(assert (=> d!63045 (=> (not res!150403) (not e!125789))))

(assert (=> d!63045 (= res!150403 (= (size!4274 (buf!4720 thiss!1204)) (size!4274 (buf!4720 (_2!8446 lt!277754)))))))

(assert (=> d!63045 (= (isPrefixOf!0 thiss!1204 (_2!8446 lt!277754)) e!125789)))

(declare-fun b!181099 () Bool)

(declare-fun res!150402 () Bool)

(assert (=> b!181099 (=> (not res!150402) (not e!125789))))

(assert (=> b!181099 (= res!150402 (bvsle (bitIndex!0 (size!4274 (buf!4720 thiss!1204)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204)) (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277754))) (currentByte!8936 (_2!8446 lt!277754)) (currentBit!8931 (_2!8446 lt!277754)))))))

(declare-fun b!181100 () Bool)

(declare-fun e!125788 () Bool)

(assert (=> b!181100 (= e!125789 e!125788)))

(declare-fun res!150404 () Bool)

(assert (=> b!181100 (=> res!150404 e!125788)))

(assert (=> b!181100 (= res!150404 (= (size!4274 (buf!4720 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!181101 () Bool)

(assert (=> b!181101 (= e!125788 (arrayBitRangesEq!0 (buf!4720 thiss!1204) (buf!4720 (_2!8446 lt!277754)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4274 (buf!4720 thiss!1204)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204))))))

(assert (= (and d!63045 res!150403) b!181099))

(assert (= (and b!181099 res!150402) b!181100))

(assert (= (and b!181100 (not res!150404)) b!181101))

(assert (=> b!181099 m!281713))

(assert (=> b!181099 m!281763))

(assert (=> b!181101 m!281713))

(assert (=> b!181101 m!281713))

(declare-fun m!281939 () Bool)

(assert (=> b!181101 m!281939))

(assert (=> b!180988 d!63045))

(declare-fun d!63047 () Bool)

(assert (=> d!63047 (isPrefixOf!0 thiss!1204 (_2!8446 lt!277754))))

(declare-fun lt!277969 () Unit!13006)

(declare-fun choose!30 (BitStream!7656 BitStream!7656 BitStream!7656) Unit!13006)

(assert (=> d!63047 (= lt!277969 (choose!30 thiss!1204 (_2!8446 lt!277757) (_2!8446 lt!277754)))))

(assert (=> d!63047 (isPrefixOf!0 thiss!1204 (_2!8446 lt!277757))))

(assert (=> d!63047 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8446 lt!277757) (_2!8446 lt!277754)) lt!277969)))

(declare-fun bs!15708 () Bool)

(assert (= bs!15708 d!63047))

(assert (=> bs!15708 m!281765))

(declare-fun m!281941 () Bool)

(assert (=> bs!15708 m!281941))

(assert (=> bs!15708 m!281717))

(assert (=> b!180988 d!63047))

(declare-fun b!181219 () Bool)

(declare-fun res!150509 () Bool)

(declare-fun e!125856 () Bool)

(assert (=> b!181219 (=> (not res!150509) (not e!125856))))

(declare-fun lt!278309 () (_ BitVec 64))

(declare-fun lt!278319 () (_ BitVec 64))

(declare-fun lt!278280 () tuple2!15602)

(assert (=> b!181219 (= res!150509 (= (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!278280))) (currentByte!8936 (_2!8446 lt!278280)) (currentBit!8931 (_2!8446 lt!278280))) (bvsub lt!278319 lt!278309)))))

(assert (=> b!181219 (or (= (bvand lt!278319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278309 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278319 lt!278309) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181219 (= lt!278309 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!278271 () (_ BitVec 64))

(declare-fun lt!278279 () (_ BitVec 64))

(assert (=> b!181219 (= lt!278319 (bvadd lt!278271 lt!278279))))

(assert (=> b!181219 (or (not (= (bvand lt!278271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278279 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!278271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!278271 lt!278279) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181219 (= lt!278279 ((_ sign_extend 32) nBits!348))))

(assert (=> b!181219 (= lt!278271 (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277757))) (currentByte!8936 (_2!8446 lt!277757)) (currentBit!8931 (_2!8446 lt!277757))))))

(declare-fun d!63049 () Bool)

(assert (=> d!63049 e!125856))

(declare-fun res!150513 () Bool)

(assert (=> d!63049 (=> (not res!150513) (not e!125856))))

(assert (=> d!63049 (= res!150513 (invariant!0 (currentBit!8931 (_2!8446 lt!278280)) (currentByte!8936 (_2!8446 lt!278280)) (size!4274 (buf!4720 (_2!8446 lt!278280)))))))

(declare-fun e!125855 () tuple2!15602)

(assert (=> d!63049 (= lt!278280 e!125855)))

(declare-fun c!9350 () Bool)

(assert (=> d!63049 (= c!9350 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!63049 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!63049 (= (appendBitsLSBFirstLoopTR!0 (_2!8446 lt!277757) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!278280)))

(declare-fun b!181220 () Bool)

(declare-fun e!125858 () Bool)

(assert (=> b!181220 (= e!125856 e!125858)))

(declare-fun res!150506 () Bool)

(assert (=> b!181220 (=> (not res!150506) (not e!125858))))

(declare-datatypes ((tuple2!15616 0))(
  ( (tuple2!15617 (_1!8453 BitStream!7656) (_2!8453 (_ BitVec 64))) )
))
(declare-fun lt!278292 () tuple2!15616)

(assert (=> b!181220 (= res!150506 (= (_2!8453 lt!278292) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!278282 () tuple2!15606)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7656 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15616)

(assert (=> b!181220 (= lt!278292 (readNBitsLSBFirstsLoopPure!0 (_1!8448 lt!278282) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!278307 () Unit!13006)

(declare-fun lt!278277 () Unit!13006)

(assert (=> b!181220 (= lt!278307 lt!278277)))

(declare-fun lt!278312 () (_ BitVec 64))

(assert (=> b!181220 (validate_offset_bits!1 ((_ sign_extend 32) (size!4274 (buf!4720 (_2!8446 lt!278280)))) ((_ sign_extend 32) (currentByte!8936 (_2!8446 lt!277757))) ((_ sign_extend 32) (currentBit!8931 (_2!8446 lt!277757))) lt!278312)))

(assert (=> b!181220 (= lt!278277 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8446 lt!277757) (buf!4720 (_2!8446 lt!278280)) lt!278312))))

(declare-fun e!125857 () Bool)

(assert (=> b!181220 e!125857))

(declare-fun res!150514 () Bool)

(assert (=> b!181220 (=> (not res!150514) (not e!125857))))

(assert (=> b!181220 (= res!150514 (and (= (size!4274 (buf!4720 (_2!8446 lt!277757))) (size!4274 (buf!4720 (_2!8446 lt!278280)))) (bvsge lt!278312 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181220 (= lt!278312 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!181220 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!181220 (= lt!278282 (reader!0 (_2!8446 lt!277757) (_2!8446 lt!278280)))))

(declare-fun b!181221 () Bool)

(assert (=> b!181221 (= e!125857 (validate_offset_bits!1 ((_ sign_extend 32) (size!4274 (buf!4720 (_2!8446 lt!277757)))) ((_ sign_extend 32) (currentByte!8936 (_2!8446 lt!277757))) ((_ sign_extend 32) (currentBit!8931 (_2!8446 lt!277757))) lt!278312))))

(declare-fun b!181222 () Bool)

(declare-fun e!125860 () Bool)

(declare-fun lt!278278 () tuple2!15604)

(declare-fun lt!278276 () tuple2!15604)

(assert (=> b!181222 (= e!125860 (= (_2!8447 lt!278278) (_2!8447 lt!278276)))))

(declare-fun b!181223 () Bool)

(declare-fun lt!278293 () tuple2!15604)

(declare-fun lt!278298 () tuple2!15602)

(assert (=> b!181223 (= lt!278293 (readBitPure!0 (readerFrom!0 (_2!8446 lt!278298) (currentBit!8931 (_2!8446 lt!277757)) (currentByte!8936 (_2!8446 lt!277757)))))))

(declare-fun res!150512 () Bool)

(declare-fun lt!278267 () Bool)

(assert (=> b!181223 (= res!150512 (and (= (_2!8447 lt!278293) lt!278267) (= (_1!8447 lt!278293) (_2!8446 lt!278298))))))

(declare-fun e!125859 () Bool)

(assert (=> b!181223 (=> (not res!150512) (not e!125859))))

(declare-fun e!125863 () Bool)

(assert (=> b!181223 (= e!125863 e!125859)))

(declare-fun b!181224 () Bool)

(declare-fun res!150516 () Bool)

(assert (=> b!181224 (= res!150516 (= (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!278298))) (currentByte!8936 (_2!8446 lt!278298)) (currentBit!8931 (_2!8446 lt!278298))) (bvadd (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277757))) (currentByte!8936 (_2!8446 lt!277757)) (currentBit!8931 (_2!8446 lt!277757))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!181224 (=> (not res!150516) (not e!125863))))

(declare-fun bm!2945 () Bool)

(declare-fun call!2948 () Bool)

(assert (=> bm!2945 (= call!2948 (isPrefixOf!0 (_2!8446 lt!277757) (ite c!9350 (_2!8446 lt!277757) (_2!8446 lt!278298))))))

(declare-fun b!181225 () Bool)

(declare-fun lt!278296 () tuple2!15602)

(assert (=> b!181225 (= e!125855 (tuple2!15603 (_1!8446 lt!278296) (_2!8446 lt!278296)))))

(assert (=> b!181225 (= lt!278267 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181225 (= lt!278298 (appendBit!0 (_2!8446 lt!277757) lt!278267))))

(declare-fun res!150508 () Bool)

(assert (=> b!181225 (= res!150508 (= (size!4274 (buf!4720 (_2!8446 lt!277757))) (size!4274 (buf!4720 (_2!8446 lt!278298)))))))

(assert (=> b!181225 (=> (not res!150508) (not e!125863))))

(assert (=> b!181225 e!125863))

(declare-fun lt!278316 () tuple2!15602)

(assert (=> b!181225 (= lt!278316 lt!278298)))

(assert (=> b!181225 (= lt!278296 (appendBitsLSBFirstLoopTR!0 (_2!8446 lt!278316) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!278290 () Unit!13006)

(assert (=> b!181225 (= lt!278290 (lemmaIsPrefixTransitive!0 (_2!8446 lt!277757) (_2!8446 lt!278316) (_2!8446 lt!278296)))))

(assert (=> b!181225 (isPrefixOf!0 (_2!8446 lt!277757) (_2!8446 lt!278296))))

(declare-fun lt!278311 () Unit!13006)

(assert (=> b!181225 (= lt!278311 lt!278290)))

(assert (=> b!181225 (invariant!0 (currentBit!8931 (_2!8446 lt!277757)) (currentByte!8936 (_2!8446 lt!277757)) (size!4274 (buf!4720 (_2!8446 lt!278316))))))

(declare-fun lt!278286 () BitStream!7656)

(assert (=> b!181225 (= lt!278286 (BitStream!7657 (buf!4720 (_2!8446 lt!278316)) (currentByte!8936 (_2!8446 lt!277757)) (currentBit!8931 (_2!8446 lt!277757))))))

(assert (=> b!181225 (invariant!0 (currentBit!8931 lt!278286) (currentByte!8936 lt!278286) (size!4274 (buf!4720 (_2!8446 lt!278296))))))

(declare-fun lt!278288 () BitStream!7656)

(assert (=> b!181225 (= lt!278288 (BitStream!7657 (buf!4720 (_2!8446 lt!278296)) (currentByte!8936 lt!278286) (currentBit!8931 lt!278286)))))

(assert (=> b!181225 (= lt!278278 (readBitPure!0 lt!278286))))

(assert (=> b!181225 (= lt!278276 (readBitPure!0 lt!278288))))

(declare-fun lt!278321 () Unit!13006)

(assert (=> b!181225 (= lt!278321 (readBitPrefixLemma!0 lt!278286 (_2!8446 lt!278296)))))

(declare-fun res!150511 () Bool)

(assert (=> b!181225 (= res!150511 (= (bitIndex!0 (size!4274 (buf!4720 (_1!8447 lt!278278))) (currentByte!8936 (_1!8447 lt!278278)) (currentBit!8931 (_1!8447 lt!278278))) (bitIndex!0 (size!4274 (buf!4720 (_1!8447 lt!278276))) (currentByte!8936 (_1!8447 lt!278276)) (currentBit!8931 (_1!8447 lt!278276)))))))

(assert (=> b!181225 (=> (not res!150511) (not e!125860))))

(assert (=> b!181225 e!125860))

(declare-fun lt!278274 () Unit!13006)

(assert (=> b!181225 (= lt!278274 lt!278321)))

(declare-fun lt!278305 () tuple2!15606)

(assert (=> b!181225 (= lt!278305 (reader!0 (_2!8446 lt!277757) (_2!8446 lt!278296)))))

(declare-fun lt!278268 () tuple2!15606)

(assert (=> b!181225 (= lt!278268 (reader!0 (_2!8446 lt!278316) (_2!8446 lt!278296)))))

(declare-fun lt!278273 () tuple2!15604)

(assert (=> b!181225 (= lt!278273 (readBitPure!0 (_1!8448 lt!278305)))))

(assert (=> b!181225 (= (_2!8447 lt!278273) lt!278267)))

(declare-fun lt!278291 () Unit!13006)

(declare-fun Unit!13012 () Unit!13006)

(assert (=> b!181225 (= lt!278291 Unit!13012)))

(declare-fun lt!278281 () (_ BitVec 64))

(assert (=> b!181225 (= lt!278281 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!278285 () (_ BitVec 64))

(assert (=> b!181225 (= lt!278285 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!278315 () Unit!13006)

(assert (=> b!181225 (= lt!278315 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8446 lt!277757) (buf!4720 (_2!8446 lt!278296)) lt!278285))))

(assert (=> b!181225 (validate_offset_bits!1 ((_ sign_extend 32) (size!4274 (buf!4720 (_2!8446 lt!278296)))) ((_ sign_extend 32) (currentByte!8936 (_2!8446 lt!277757))) ((_ sign_extend 32) (currentBit!8931 (_2!8446 lt!277757))) lt!278285)))

(declare-fun lt!278317 () Unit!13006)

(assert (=> b!181225 (= lt!278317 lt!278315)))

(declare-fun lt!278297 () tuple2!15616)

(assert (=> b!181225 (= lt!278297 (readNBitsLSBFirstsLoopPure!0 (_1!8448 lt!278305) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!278281))))

(declare-fun lt!278299 () (_ BitVec 64))

(assert (=> b!181225 (= lt!278299 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!278304 () Unit!13006)

(assert (=> b!181225 (= lt!278304 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8446 lt!278316) (buf!4720 (_2!8446 lt!278296)) lt!278299))))

(assert (=> b!181225 (validate_offset_bits!1 ((_ sign_extend 32) (size!4274 (buf!4720 (_2!8446 lt!278296)))) ((_ sign_extend 32) (currentByte!8936 (_2!8446 lt!278316))) ((_ sign_extend 32) (currentBit!8931 (_2!8446 lt!278316))) lt!278299)))

(declare-fun lt!278310 () Unit!13006)

(assert (=> b!181225 (= lt!278310 lt!278304)))

(declare-fun lt!278308 () tuple2!15616)

(assert (=> b!181225 (= lt!278308 (readNBitsLSBFirstsLoopPure!0 (_1!8448 lt!278268) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!278281 (ite (_2!8447 lt!278273) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!278289 () tuple2!15616)

(assert (=> b!181225 (= lt!278289 (readNBitsLSBFirstsLoopPure!0 (_1!8448 lt!278305) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!278281))))

(declare-fun c!9349 () Bool)

(assert (=> b!181225 (= c!9349 (_2!8447 (readBitPure!0 (_1!8448 lt!278305))))))

(declare-fun lt!278300 () tuple2!15616)

(declare-fun e!125862 () (_ BitVec 64))

(assert (=> b!181225 (= lt!278300 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8448 lt!278305) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!278281 e!125862)))))

(declare-fun lt!278272 () Unit!13006)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7656 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13006)

(assert (=> b!181225 (= lt!278272 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8448 lt!278305) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!278281))))

(assert (=> b!181225 (and (= (_2!8453 lt!278289) (_2!8453 lt!278300)) (= (_1!8453 lt!278289) (_1!8453 lt!278300)))))

(declare-fun lt!278303 () Unit!13006)

(assert (=> b!181225 (= lt!278303 lt!278272)))

(assert (=> b!181225 (= (_1!8448 lt!278305) (withMovedBitIndex!0 (_2!8448 lt!278305) (bvsub (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277757))) (currentByte!8936 (_2!8446 lt!277757)) (currentBit!8931 (_2!8446 lt!277757))) (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!278296))) (currentByte!8936 (_2!8446 lt!278296)) (currentBit!8931 (_2!8446 lt!278296))))))))

(declare-fun lt!278295 () Unit!13006)

(declare-fun Unit!13013 () Unit!13006)

(assert (=> b!181225 (= lt!278295 Unit!13013)))

(assert (=> b!181225 (= (_1!8448 lt!278268) (withMovedBitIndex!0 (_2!8448 lt!278268) (bvsub (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!278316))) (currentByte!8936 (_2!8446 lt!278316)) (currentBit!8931 (_2!8446 lt!278316))) (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!278296))) (currentByte!8936 (_2!8446 lt!278296)) (currentBit!8931 (_2!8446 lt!278296))))))))

(declare-fun lt!278284 () Unit!13006)

(declare-fun Unit!13014 () Unit!13006)

(assert (=> b!181225 (= lt!278284 Unit!13014)))

(assert (=> b!181225 (= (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277757))) (currentByte!8936 (_2!8446 lt!277757)) (currentBit!8931 (_2!8446 lt!277757))) (bvsub (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!278316))) (currentByte!8936 (_2!8446 lt!278316)) (currentBit!8931 (_2!8446 lt!278316))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!278313 () Unit!13006)

(declare-fun Unit!13015 () Unit!13006)

(assert (=> b!181225 (= lt!278313 Unit!13015)))

(assert (=> b!181225 (= (_2!8453 lt!278297) (_2!8453 lt!278308))))

(declare-fun lt!278269 () Unit!13006)

(declare-fun Unit!13016 () Unit!13006)

(assert (=> b!181225 (= lt!278269 Unit!13016)))

(assert (=> b!181225 (invariant!0 (currentBit!8931 (_2!8446 lt!278296)) (currentByte!8936 (_2!8446 lt!278296)) (size!4274 (buf!4720 (_2!8446 lt!278296))))))

(declare-fun lt!278301 () Unit!13006)

(declare-fun Unit!13017 () Unit!13006)

(assert (=> b!181225 (= lt!278301 Unit!13017)))

(assert (=> b!181225 (= (size!4274 (buf!4720 (_2!8446 lt!277757))) (size!4274 (buf!4720 (_2!8446 lt!278296))))))

(declare-fun lt!278302 () Unit!13006)

(declare-fun Unit!13018 () Unit!13006)

(assert (=> b!181225 (= lt!278302 Unit!13018)))

(assert (=> b!181225 (= (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!278296))) (currentByte!8936 (_2!8446 lt!278296)) (currentBit!8931 (_2!8446 lt!278296))) (bvsub (bvadd (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277757))) (currentByte!8936 (_2!8446 lt!277757)) (currentBit!8931 (_2!8446 lt!277757))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!278322 () Unit!13006)

(declare-fun Unit!13019 () Unit!13006)

(assert (=> b!181225 (= lt!278322 Unit!13019)))

(declare-fun lt!278283 () Unit!13006)

(declare-fun Unit!13020 () Unit!13006)

(assert (=> b!181225 (= lt!278283 Unit!13020)))

(declare-fun lt!278306 () tuple2!15606)

(assert (=> b!181225 (= lt!278306 (reader!0 (_2!8446 lt!277757) (_2!8446 lt!278296)))))

(declare-fun lt!278320 () (_ BitVec 64))

(assert (=> b!181225 (= lt!278320 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!278294 () Unit!13006)

(assert (=> b!181225 (= lt!278294 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8446 lt!277757) (buf!4720 (_2!8446 lt!278296)) lt!278320))))

(assert (=> b!181225 (validate_offset_bits!1 ((_ sign_extend 32) (size!4274 (buf!4720 (_2!8446 lt!278296)))) ((_ sign_extend 32) (currentByte!8936 (_2!8446 lt!277757))) ((_ sign_extend 32) (currentBit!8931 (_2!8446 lt!277757))) lt!278320)))

(declare-fun lt!278287 () Unit!13006)

(assert (=> b!181225 (= lt!278287 lt!278294)))

(declare-fun lt!278270 () tuple2!15616)

(assert (=> b!181225 (= lt!278270 (readNBitsLSBFirstsLoopPure!0 (_1!8448 lt!278306) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!150507 () Bool)

(assert (=> b!181225 (= res!150507 (= (_2!8453 lt!278270) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!125861 () Bool)

(assert (=> b!181225 (=> (not res!150507) (not e!125861))))

(assert (=> b!181225 e!125861))

(declare-fun lt!278318 () Unit!13006)

(declare-fun Unit!13021 () Unit!13006)

(assert (=> b!181225 (= lt!278318 Unit!13021)))

(declare-fun b!181226 () Bool)

(assert (=> b!181226 (= e!125862 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!181227 () Bool)

(assert (=> b!181227 (= e!125858 (= (_1!8453 lt!278292) (_2!8448 lt!278282)))))

(declare-fun b!181228 () Bool)

(declare-fun res!150517 () Bool)

(assert (=> b!181228 (=> (not res!150517) (not e!125856))))

(assert (=> b!181228 (= res!150517 (= (size!4274 (buf!4720 (_2!8446 lt!277757))) (size!4274 (buf!4720 (_2!8446 lt!278280)))))))

(declare-fun b!181229 () Bool)

(assert (=> b!181229 (= e!125862 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!181230 () Bool)

(declare-fun res!150510 () Bool)

(assert (=> b!181230 (= res!150510 call!2948)))

(assert (=> b!181230 (=> (not res!150510) (not e!125863))))

(declare-fun b!181231 () Bool)

(declare-fun res!150515 () Bool)

(assert (=> b!181231 (=> (not res!150515) (not e!125856))))

(assert (=> b!181231 (= res!150515 (isPrefixOf!0 (_2!8446 lt!277757) (_2!8446 lt!278280)))))

(declare-fun b!181232 () Bool)

(declare-fun Unit!13022 () Unit!13006)

(assert (=> b!181232 (= e!125855 (tuple2!15603 Unit!13022 (_2!8446 lt!277757)))))

(declare-fun lt!278314 () Unit!13006)

(assert (=> b!181232 (= lt!278314 (lemmaIsPrefixRefl!0 (_2!8446 lt!277757)))))

(assert (=> b!181232 call!2948))

(declare-fun lt!278275 () Unit!13006)

(assert (=> b!181232 (= lt!278275 lt!278314)))

(declare-fun b!181233 () Bool)

(assert (=> b!181233 (= e!125861 (= (_1!8453 lt!278270) (_2!8448 lt!278306)))))

(declare-fun b!181234 () Bool)

(assert (=> b!181234 (= e!125859 (= (bitIndex!0 (size!4274 (buf!4720 (_1!8447 lt!278293))) (currentByte!8936 (_1!8447 lt!278293)) (currentBit!8931 (_1!8447 lt!278293))) (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!278298))) (currentByte!8936 (_2!8446 lt!278298)) (currentBit!8931 (_2!8446 lt!278298)))))))

(assert (= (and d!63049 c!9350) b!181232))

(assert (= (and d!63049 (not c!9350)) b!181225))

(assert (= (and b!181225 res!150508) b!181224))

(assert (= (and b!181224 res!150516) b!181230))

(assert (= (and b!181230 res!150510) b!181223))

(assert (= (and b!181223 res!150512) b!181234))

(assert (= (and b!181225 res!150511) b!181222))

(assert (= (and b!181225 c!9349) b!181226))

(assert (= (and b!181225 (not c!9349)) b!181229))

(assert (= (and b!181225 res!150507) b!181233))

(assert (= (or b!181232 b!181230) bm!2945))

(assert (= (and d!63049 res!150513) b!181228))

(assert (= (and b!181228 res!150517) b!181219))

(assert (= (and b!181219 res!150509) b!181231))

(assert (= (and b!181231 res!150515) b!181220))

(assert (= (and b!181220 res!150514) b!181221))

(assert (= (and b!181220 res!150506) b!181227))

(declare-fun m!282071 () Bool)

(assert (=> b!181219 m!282071))

(assert (=> b!181219 m!281711))

(declare-fun m!282073 () Bool)

(assert (=> d!63049 m!282073))

(declare-fun m!282075 () Bool)

(assert (=> b!181223 m!282075))

(assert (=> b!181223 m!282075))

(declare-fun m!282077 () Bool)

(assert (=> b!181223 m!282077))

(declare-fun m!282079 () Bool)

(assert (=> bm!2945 m!282079))

(declare-fun m!282081 () Bool)

(assert (=> b!181220 m!282081))

(declare-fun m!282083 () Bool)

(assert (=> b!181220 m!282083))

(declare-fun m!282085 () Bool)

(assert (=> b!181220 m!282085))

(declare-fun m!282087 () Bool)

(assert (=> b!181220 m!282087))

(declare-fun m!282089 () Bool)

(assert (=> b!181220 m!282089))

(declare-fun m!282091 () Bool)

(assert (=> b!181220 m!282091))

(declare-fun m!282093 () Bool)

(assert (=> b!181221 m!282093))

(declare-fun m!282095 () Bool)

(assert (=> b!181224 m!282095))

(assert (=> b!181224 m!281711))

(declare-fun m!282097 () Bool)

(assert (=> b!181231 m!282097))

(assert (=> b!181232 m!281887))

(declare-fun m!282099 () Bool)

(assert (=> b!181225 m!282099))

(declare-fun m!282101 () Bool)

(assert (=> b!181225 m!282101))

(assert (=> b!181225 m!282085))

(declare-fun m!282103 () Bool)

(assert (=> b!181225 m!282103))

(declare-fun m!282105 () Bool)

(assert (=> b!181225 m!282105))

(declare-fun m!282107 () Bool)

(assert (=> b!181225 m!282107))

(declare-fun m!282109 () Bool)

(assert (=> b!181225 m!282109))

(declare-fun m!282111 () Bool)

(assert (=> b!181225 m!282111))

(declare-fun m!282113 () Bool)

(assert (=> b!181225 m!282113))

(declare-fun m!282115 () Bool)

(assert (=> b!181225 m!282115))

(declare-fun m!282117 () Bool)

(assert (=> b!181225 m!282117))

(declare-fun m!282119 () Bool)

(assert (=> b!181225 m!282119))

(declare-fun m!282121 () Bool)

(assert (=> b!181225 m!282121))

(declare-fun m!282123 () Bool)

(assert (=> b!181225 m!282123))

(declare-fun m!282125 () Bool)

(assert (=> b!181225 m!282125))

(declare-fun m!282127 () Bool)

(assert (=> b!181225 m!282127))

(declare-fun m!282129 () Bool)

(assert (=> b!181225 m!282129))

(declare-fun m!282131 () Bool)

(assert (=> b!181225 m!282131))

(declare-fun m!282133 () Bool)

(assert (=> b!181225 m!282133))

(declare-fun m!282135 () Bool)

(assert (=> b!181225 m!282135))

(declare-fun m!282137 () Bool)

(assert (=> b!181225 m!282137))

(declare-fun m!282139 () Bool)

(assert (=> b!181225 m!282139))

(assert (=> b!181225 m!282133))

(declare-fun m!282141 () Bool)

(assert (=> b!181225 m!282141))

(declare-fun m!282143 () Bool)

(assert (=> b!181225 m!282143))

(assert (=> b!181225 m!282087))

(declare-fun m!282145 () Bool)

(assert (=> b!181225 m!282145))

(declare-fun m!282147 () Bool)

(assert (=> b!181225 m!282147))

(declare-fun m!282149 () Bool)

(assert (=> b!181225 m!282149))

(declare-fun m!282151 () Bool)

(assert (=> b!181225 m!282151))

(assert (=> b!181225 m!281711))

(declare-fun m!282153 () Bool)

(assert (=> b!181225 m!282153))

(declare-fun m!282155 () Bool)

(assert (=> b!181225 m!282155))

(declare-fun m!282157 () Bool)

(assert (=> b!181225 m!282157))

(declare-fun m!282159 () Bool)

(assert (=> b!181225 m!282159))

(declare-fun m!282161 () Bool)

(assert (=> b!181234 m!282161))

(assert (=> b!181234 m!282095))

(assert (=> b!180988 d!63049))

(declare-fun d!63127 () Bool)

(declare-fun res!150519 () Bool)

(declare-fun e!125865 () Bool)

(assert (=> d!63127 (=> (not res!150519) (not e!125865))))

(assert (=> d!63127 (= res!150519 (= (size!4274 (buf!4720 thiss!1204)) (size!4274 (buf!4720 (_2!8446 lt!277757)))))))

(assert (=> d!63127 (= (isPrefixOf!0 thiss!1204 (_2!8446 lt!277757)) e!125865)))

(declare-fun b!181235 () Bool)

(declare-fun res!150518 () Bool)

(assert (=> b!181235 (=> (not res!150518) (not e!125865))))

(assert (=> b!181235 (= res!150518 (bvsle (bitIndex!0 (size!4274 (buf!4720 thiss!1204)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204)) (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277757))) (currentByte!8936 (_2!8446 lt!277757)) (currentBit!8931 (_2!8446 lt!277757)))))))

(declare-fun b!181236 () Bool)

(declare-fun e!125864 () Bool)

(assert (=> b!181236 (= e!125865 e!125864)))

(declare-fun res!150520 () Bool)

(assert (=> b!181236 (=> res!150520 e!125864)))

(assert (=> b!181236 (= res!150520 (= (size!4274 (buf!4720 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!181237 () Bool)

(assert (=> b!181237 (= e!125864 (arrayBitRangesEq!0 (buf!4720 thiss!1204) (buf!4720 (_2!8446 lt!277757)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4274 (buf!4720 thiss!1204)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204))))))

(assert (= (and d!63127 res!150519) b!181235))

(assert (= (and b!181235 res!150518) b!181236))

(assert (= (and b!181236 (not res!150520)) b!181237))

(assert (=> b!181235 m!281713))

(assert (=> b!181235 m!281711))

(assert (=> b!181237 m!281713))

(assert (=> b!181237 m!281713))

(declare-fun m!282163 () Bool)

(assert (=> b!181237 m!282163))

(assert (=> b!180986 d!63127))

(declare-fun d!63129 () Bool)

(declare-fun res!150522 () Bool)

(declare-fun e!125867 () Bool)

(assert (=> d!63129 (=> (not res!150522) (not e!125867))))

(assert (=> d!63129 (= res!150522 (= (size!4274 (buf!4720 (_2!8446 lt!277757))) (size!4274 (buf!4720 (_2!8446 lt!277754)))))))

(assert (=> d!63129 (= (isPrefixOf!0 (_2!8446 lt!277757) (_2!8446 lt!277754)) e!125867)))

(declare-fun b!181238 () Bool)

(declare-fun res!150521 () Bool)

(assert (=> b!181238 (=> (not res!150521) (not e!125867))))

(assert (=> b!181238 (= res!150521 (bvsle (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277757))) (currentByte!8936 (_2!8446 lt!277757)) (currentBit!8931 (_2!8446 lt!277757))) (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277754))) (currentByte!8936 (_2!8446 lt!277754)) (currentBit!8931 (_2!8446 lt!277754)))))))

(declare-fun b!181239 () Bool)

(declare-fun e!125866 () Bool)

(assert (=> b!181239 (= e!125867 e!125866)))

(declare-fun res!150523 () Bool)

(assert (=> b!181239 (=> res!150523 e!125866)))

(assert (=> b!181239 (= res!150523 (= (size!4274 (buf!4720 (_2!8446 lt!277757))) #b00000000000000000000000000000000))))

(declare-fun b!181240 () Bool)

(assert (=> b!181240 (= e!125866 (arrayBitRangesEq!0 (buf!4720 (_2!8446 lt!277757)) (buf!4720 (_2!8446 lt!277754)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!277757))) (currentByte!8936 (_2!8446 lt!277757)) (currentBit!8931 (_2!8446 lt!277757)))))))

(assert (= (and d!63129 res!150522) b!181238))

(assert (= (and b!181238 res!150521) b!181239))

(assert (= (and b!181239 (not res!150523)) b!181240))

(assert (=> b!181238 m!281711))

(assert (=> b!181238 m!281763))

(assert (=> b!181240 m!281711))

(assert (=> b!181240 m!281711))

(declare-fun m!282165 () Bool)

(assert (=> b!181240 m!282165))

(assert (=> b!180987 d!63129))

(declare-fun d!63131 () Bool)

(assert (=> d!63131 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!180985 d!63131))

(declare-fun d!63133 () Bool)

(assert (=> d!63133 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590)) (ite (= (bvsub #b00000000000000000000000001000000 i!590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!590))))))))

(assert (=> b!180985 d!63133))

(declare-fun d!63135 () Bool)

(assert (=> d!63135 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4274 (buf!4720 thiss!1204))) ((_ sign_extend 32) (currentByte!8936 thiss!1204)) ((_ sign_extend 32) (currentBit!8931 thiss!1204)) lt!277762) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4274 (buf!4720 thiss!1204))) ((_ sign_extend 32) (currentByte!8936 thiss!1204)) ((_ sign_extend 32) (currentBit!8931 thiss!1204))) lt!277762))))

(declare-fun bs!15720 () Bool)

(assert (= bs!15720 d!63135))

(assert (=> bs!15720 m!281843))

(assert (=> b!180996 d!63135))

(assert (=> b!180995 d!63127))

(assert (=> b!180984 d!63003))

(assert (=> b!180984 d!63005))

(declare-fun b!181250 () Bool)

(declare-fun res!150533 () Bool)

(declare-fun e!125873 () Bool)

(assert (=> b!181250 (=> (not res!150533) (not e!125873))))

(declare-fun lt!278331 () (_ BitVec 64))

(declare-fun lt!278332 () (_ BitVec 64))

(declare-fun lt!278333 () tuple2!15602)

(assert (=> b!181250 (= res!150533 (= (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!278333))) (currentByte!8936 (_2!8446 lt!278333)) (currentBit!8931 (_2!8446 lt!278333))) (bvadd lt!278331 lt!278332)))))

(assert (=> b!181250 (or (not (= (bvand lt!278331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278332 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!278331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!278331 lt!278332) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181250 (= lt!278332 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!181250 (= lt!278331 (bitIndex!0 (size!4274 (buf!4720 thiss!1204)) (currentByte!8936 thiss!1204) (currentBit!8931 thiss!1204)))))

(declare-fun b!181252 () Bool)

(declare-fun e!125872 () Bool)

(assert (=> b!181252 (= e!125873 e!125872)))

(declare-fun res!150534 () Bool)

(assert (=> b!181252 (=> (not res!150534) (not e!125872))))

(declare-fun lt!278334 () tuple2!15604)

(assert (=> b!181252 (= res!150534 (and (= (_2!8447 lt!278334) lt!277752) (= (_1!8447 lt!278334) (_2!8446 lt!278333))))))

(assert (=> b!181252 (= lt!278334 (readBitPure!0 (readerFrom!0 (_2!8446 lt!278333) (currentBit!8931 thiss!1204) (currentByte!8936 thiss!1204))))))

(declare-fun d!63137 () Bool)

(assert (=> d!63137 e!125873))

(declare-fun res!150532 () Bool)

(assert (=> d!63137 (=> (not res!150532) (not e!125873))))

(assert (=> d!63137 (= res!150532 (= (size!4274 (buf!4720 thiss!1204)) (size!4274 (buf!4720 (_2!8446 lt!278333)))))))

(declare-fun choose!16 (BitStream!7656 Bool) tuple2!15602)

(assert (=> d!63137 (= lt!278333 (choose!16 thiss!1204 lt!277752))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!63137 (validate_offset_bit!0 ((_ sign_extend 32) (size!4274 (buf!4720 thiss!1204))) ((_ sign_extend 32) (currentByte!8936 thiss!1204)) ((_ sign_extend 32) (currentBit!8931 thiss!1204)))))

(assert (=> d!63137 (= (appendBit!0 thiss!1204 lt!277752) lt!278333)))

(declare-fun b!181253 () Bool)

(assert (=> b!181253 (= e!125872 (= (bitIndex!0 (size!4274 (buf!4720 (_1!8447 lt!278334))) (currentByte!8936 (_1!8447 lt!278334)) (currentBit!8931 (_1!8447 lt!278334))) (bitIndex!0 (size!4274 (buf!4720 (_2!8446 lt!278333))) (currentByte!8936 (_2!8446 lt!278333)) (currentBit!8931 (_2!8446 lt!278333)))))))

(declare-fun b!181251 () Bool)

(declare-fun res!150535 () Bool)

(assert (=> b!181251 (=> (not res!150535) (not e!125873))))

(assert (=> b!181251 (= res!150535 (isPrefixOf!0 thiss!1204 (_2!8446 lt!278333)))))

(assert (= (and d!63137 res!150532) b!181250))

(assert (= (and b!181250 res!150533) b!181251))

(assert (= (and b!181251 res!150535) b!181252))

(assert (= (and b!181252 res!150534) b!181253))

(declare-fun m!282167 () Bool)

(assert (=> b!181252 m!282167))

(assert (=> b!181252 m!282167))

(declare-fun m!282169 () Bool)

(assert (=> b!181252 m!282169))

(declare-fun m!282171 () Bool)

(assert (=> b!181251 m!282171))

(declare-fun m!282173 () Bool)

(assert (=> d!63137 m!282173))

(declare-fun m!282175 () Bool)

(assert (=> d!63137 m!282175))

(declare-fun m!282177 () Bool)

(assert (=> b!181250 m!282177))

(assert (=> b!181250 m!281713))

(declare-fun m!282179 () Bool)

(assert (=> b!181253 m!282179))

(assert (=> b!181253 m!282177))

(assert (=> b!180984 d!63137))

(check-sat (not b!181082) (not d!63043) (not b!181074) (not d!63049) (not d!63025) (not d!63135) (not bm!2945) (not b!181252) (not d!63019) (not b!181250) (not b!181234) (not d!63015) (not d!63001) (not b!181080) (not d!63137) (not b!181079) (not d!63039) (not d!63035) (not b!181221) (not b!181224) (not b!181235) (not d!63033) (not b!181063) (not b!181253) (not b!181220) (not b!181223) (not b!181237) (not d!63009) (not d!63005) (not b!181231) (not b!181077) (not b!181075) (not b!181251) (not d!63047) (not d!63003) (not b!181101) (not d!63027) (not d!63023) (not b!181240) (not b!181078) (not b!181099) (not b!181238) (not d!63031) (not d!63021) (not b!181083) (not b!181225) (not b!181219) (not d!63013) (not b!181232) (not d!63029) (not d!63017))
(check-sat)
