; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52484 () Bool)

(assert start!52484)

(declare-fun b!242179 () Bool)

(declare-fun res!202228 () Bool)

(declare-fun e!167897 () Bool)

(assert (=> b!242179 (=> (not res!202228) (not e!167897))))

(declare-datatypes ((array!13295 0))(
  ( (array!13296 (arr!6814 (Array (_ BitVec 32) (_ BitVec 8))) (size!5827 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10576 0))(
  ( (BitStream!10577 (buf!6293 array!13295) (currentByte!11656 (_ BitVec 32)) (currentBit!11651 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10576)

(declare-datatypes ((Unit!17737 0))(
  ( (Unit!17738) )
))
(declare-datatypes ((tuple2!20712 0))(
  ( (tuple2!20713 (_1!11278 Unit!17737) (_2!11278 BitStream!10576)) )
))
(declare-fun lt!377599 () tuple2!20712)

(declare-fun isPrefixOf!0 (BitStream!10576 BitStream!10576) Bool)

(assert (=> b!242179 (= res!202228 (isPrefixOf!0 thiss!1005 (_2!11278 lt!377599)))))

(declare-fun b!242180 () Bool)

(declare-fun e!167898 () Bool)

(declare-fun e!167894 () Bool)

(assert (=> b!242180 (= e!167898 (not e!167894))))

(declare-fun res!202225 () Bool)

(assert (=> b!242180 (=> res!202225 e!167894)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242180 (= res!202225 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5827 (buf!6293 (_2!11278 lt!377599)))) ((_ sign_extend 32) (currentByte!11656 thiss!1005)) ((_ sign_extend 32) (currentBit!11651 thiss!1005)))))))

(declare-fun e!167899 () Bool)

(assert (=> b!242180 e!167899))

(declare-fun res!202226 () Bool)

(assert (=> b!242180 (=> (not res!202226) (not e!167899))))

(declare-fun lt!377593 () tuple2!20712)

(assert (=> b!242180 (= res!202226 (isPrefixOf!0 thiss!1005 (_2!11278 lt!377593)))))

(declare-fun lt!377595 () Unit!17737)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10576 BitStream!10576 BitStream!10576) Unit!17737)

(assert (=> b!242180 (= lt!377595 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11278 lt!377599) (_2!11278 lt!377593)))))

(declare-fun e!167900 () Bool)

(assert (=> b!242180 e!167900))

(declare-fun res!202227 () Bool)

(assert (=> b!242180 (=> (not res!202227) (not e!167900))))

(assert (=> b!242180 (= res!202227 (= (size!5827 (buf!6293 (_2!11278 lt!377599))) (size!5827 (buf!6293 (_2!11278 lt!377593)))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun appendNBitsLoop!0 (BitStream!10576 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20712)

(assert (=> b!242180 (= lt!377593 (appendNBitsLoop!0 (_2!11278 lt!377599) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242180 (validate_offset_bits!1 ((_ sign_extend 32) (size!5827 (buf!6293 (_2!11278 lt!377599)))) ((_ sign_extend 32) (currentByte!11656 (_2!11278 lt!377599))) ((_ sign_extend 32) (currentBit!11651 (_2!11278 lt!377599))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377594 () Unit!17737)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10576 BitStream!10576 (_ BitVec 64) (_ BitVec 64)) Unit!17737)

(assert (=> b!242180 (= lt!377594 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11278 lt!377599) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!167893 () Bool)

(assert (=> b!242180 e!167893))

(declare-fun res!202229 () Bool)

(assert (=> b!242180 (=> (not res!202229) (not e!167893))))

(assert (=> b!242180 (= res!202229 (= (size!5827 (buf!6293 thiss!1005)) (size!5827 (buf!6293 (_2!11278 lt!377599)))))))

(declare-fun appendBit!0 (BitStream!10576 Bool) tuple2!20712)

(assert (=> b!242180 (= lt!377599 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!202222 () Bool)

(assert (=> start!52484 (=> (not res!202222) (not e!167898))))

(assert (=> start!52484 (= res!202222 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52484 e!167898))

(assert (=> start!52484 true))

(declare-fun e!167892 () Bool)

(declare-fun inv!12 (BitStream!10576) Bool)

(assert (=> start!52484 (and (inv!12 thiss!1005) e!167892)))

(declare-fun b!242181 () Bool)

(declare-fun array_inv!5568 (array!13295) Bool)

(assert (=> b!242181 (= e!167892 (array_inv!5568 (buf!6293 thiss!1005)))))

(declare-fun b!242182 () Bool)

(declare-fun e!167895 () Bool)

(declare-datatypes ((tuple2!20714 0))(
  ( (tuple2!20715 (_1!11279 BitStream!10576) (_2!11279 Bool)) )
))
(declare-fun lt!377603 () tuple2!20714)

(declare-fun lt!377592 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242182 (= e!167895 (= (bitIndex!0 (size!5827 (buf!6293 (_1!11279 lt!377603))) (currentByte!11656 (_1!11279 lt!377603)) (currentBit!11651 (_1!11279 lt!377603))) lt!377592))))

(declare-fun b!242183 () Bool)

(declare-fun res!202223 () Bool)

(assert (=> b!242183 (=> (not res!202223) (not e!167898))))

(assert (=> b!242183 (= res!202223 (bvslt from!289 nBits!297))))

(declare-fun b!242184 () Bool)

(assert (=> b!242184 (= e!167893 e!167897)))

(declare-fun res!202220 () Bool)

(assert (=> b!242184 (=> (not res!202220) (not e!167897))))

(declare-fun lt!377596 () (_ BitVec 64))

(assert (=> b!242184 (= res!202220 (= lt!377592 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377596)))))

(assert (=> b!242184 (= lt!377592 (bitIndex!0 (size!5827 (buf!6293 (_2!11278 lt!377599))) (currentByte!11656 (_2!11278 lt!377599)) (currentBit!11651 (_2!11278 lt!377599))))))

(assert (=> b!242184 (= lt!377596 (bitIndex!0 (size!5827 (buf!6293 thiss!1005)) (currentByte!11656 thiss!1005) (currentBit!11651 thiss!1005)))))

(declare-fun b!242185 () Bool)

(declare-fun res!202221 () Bool)

(declare-fun e!167896 () Bool)

(assert (=> b!242185 (=> (not res!202221) (not e!167896))))

(assert (=> b!242185 (= res!202221 (isPrefixOf!0 (_2!11278 lt!377599) (_2!11278 lt!377593)))))

(declare-fun b!242186 () Bool)

(assert (=> b!242186 (= e!167900 e!167896)))

(declare-fun res!202218 () Bool)

(assert (=> b!242186 (=> (not res!202218) (not e!167896))))

(declare-fun lt!377600 () (_ BitVec 64))

(assert (=> b!242186 (= res!202218 (= (bitIndex!0 (size!5827 (buf!6293 (_2!11278 lt!377593))) (currentByte!11656 (_2!11278 lt!377593)) (currentBit!11651 (_2!11278 lt!377593))) (bvadd (bitIndex!0 (size!5827 (buf!6293 (_2!11278 lt!377599))) (currentByte!11656 (_2!11278 lt!377599)) (currentBit!11651 (_2!11278 lt!377599))) lt!377600)))))

(assert (=> b!242186 (= lt!377600 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242187 () Bool)

(assert (=> b!242187 (= e!167894 true)))

(declare-fun lt!377598 () tuple2!20714)

(declare-fun readBitPure!0 (BitStream!10576) tuple2!20714)

(assert (=> b!242187 (= lt!377598 (readBitPure!0 (BitStream!10577 (buf!6293 (_2!11278 lt!377593)) (currentByte!11656 thiss!1005) (currentBit!11651 thiss!1005))))))

(declare-fun lt!377602 () tuple2!20714)

(assert (=> b!242187 (= lt!377602 (readBitPure!0 (BitStream!10577 (buf!6293 (_2!11278 lt!377599)) (currentByte!11656 thiss!1005) (currentBit!11651 thiss!1005))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242187 (invariant!0 (currentBit!11651 thiss!1005) (currentByte!11656 thiss!1005) (size!5827 (buf!6293 (_2!11278 lt!377593))))))

(declare-fun b!242188 () Bool)

(declare-fun res!202230 () Bool)

(assert (=> b!242188 (=> res!202230 e!167894)))

(declare-fun arrayBitRangesEq!0 (array!13295 array!13295 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242188 (= res!202230 (not (arrayBitRangesEq!0 (buf!6293 (_2!11278 lt!377599)) (buf!6293 (_2!11278 lt!377593)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5827 (buf!6293 (_2!11278 lt!377599))) (currentByte!11656 thiss!1005) (currentBit!11651 thiss!1005))))))))

(declare-fun b!242189 () Bool)

(assert (=> b!242189 (= e!167899 (invariant!0 (currentBit!11651 thiss!1005) (currentByte!11656 thiss!1005) (size!5827 (buf!6293 (_2!11278 lt!377599)))))))

(declare-fun b!242190 () Bool)

(declare-fun res!202219 () Bool)

(assert (=> b!242190 (=> (not res!202219) (not e!167898))))

(assert (=> b!242190 (= res!202219 (validate_offset_bits!1 ((_ sign_extend 32) (size!5827 (buf!6293 thiss!1005))) ((_ sign_extend 32) (currentByte!11656 thiss!1005)) ((_ sign_extend 32) (currentBit!11651 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242191 () Bool)

(declare-fun lt!377604 () tuple2!20714)

(declare-datatypes ((tuple2!20716 0))(
  ( (tuple2!20717 (_1!11280 BitStream!10576) (_2!11280 BitStream!10576)) )
))
(declare-fun lt!377597 () tuple2!20716)

(assert (=> b!242191 (= e!167896 (not (or (not (_2!11279 lt!377604)) (not (= (_1!11279 lt!377604) (_2!11280 lt!377597))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10576 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20714)

(assert (=> b!242191 (= lt!377604 (checkBitsLoopPure!0 (_1!11280 lt!377597) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242191 (validate_offset_bits!1 ((_ sign_extend 32) (size!5827 (buf!6293 (_2!11278 lt!377593)))) ((_ sign_extend 32) (currentByte!11656 (_2!11278 lt!377599))) ((_ sign_extend 32) (currentBit!11651 (_2!11278 lt!377599))) lt!377600)))

(declare-fun lt!377601 () Unit!17737)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10576 array!13295 (_ BitVec 64)) Unit!17737)

(assert (=> b!242191 (= lt!377601 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11278 lt!377599) (buf!6293 (_2!11278 lt!377593)) lt!377600))))

(declare-fun reader!0 (BitStream!10576 BitStream!10576) tuple2!20716)

(assert (=> b!242191 (= lt!377597 (reader!0 (_2!11278 lt!377599) (_2!11278 lt!377593)))))

(declare-fun b!242192 () Bool)

(assert (=> b!242192 (= e!167897 e!167895)))

(declare-fun res!202224 () Bool)

(assert (=> b!242192 (=> (not res!202224) (not e!167895))))

(assert (=> b!242192 (= res!202224 (and (= (_2!11279 lt!377603) bit!26) (= (_1!11279 lt!377603) (_2!11278 lt!377599))))))

(declare-fun readerFrom!0 (BitStream!10576 (_ BitVec 32) (_ BitVec 32)) BitStream!10576)

(assert (=> b!242192 (= lt!377603 (readBitPure!0 (readerFrom!0 (_2!11278 lt!377599) (currentBit!11651 thiss!1005) (currentByte!11656 thiss!1005))))))

(assert (= (and start!52484 res!202222) b!242190))

(assert (= (and b!242190 res!202219) b!242183))

(assert (= (and b!242183 res!202223) b!242180))

(assert (= (and b!242180 res!202229) b!242184))

(assert (= (and b!242184 res!202220) b!242179))

(assert (= (and b!242179 res!202228) b!242192))

(assert (= (and b!242192 res!202224) b!242182))

(assert (= (and b!242180 res!202227) b!242186))

(assert (= (and b!242186 res!202218) b!242185))

(assert (= (and b!242185 res!202221) b!242191))

(assert (= (and b!242180 res!202226) b!242189))

(assert (= (and b!242180 (not res!202225)) b!242188))

(assert (= (and b!242188 (not res!202230)) b!242187))

(assert (= start!52484 b!242181))

(declare-fun m!364931 () Bool)

(assert (=> b!242192 m!364931))

(assert (=> b!242192 m!364931))

(declare-fun m!364933 () Bool)

(assert (=> b!242192 m!364933))

(declare-fun m!364935 () Bool)

(assert (=> start!52484 m!364935))

(declare-fun m!364937 () Bool)

(assert (=> b!242184 m!364937))

(declare-fun m!364939 () Bool)

(assert (=> b!242184 m!364939))

(declare-fun m!364941 () Bool)

(assert (=> b!242191 m!364941))

(declare-fun m!364943 () Bool)

(assert (=> b!242191 m!364943))

(declare-fun m!364945 () Bool)

(assert (=> b!242191 m!364945))

(declare-fun m!364947 () Bool)

(assert (=> b!242191 m!364947))

(declare-fun m!364949 () Bool)

(assert (=> b!242181 m!364949))

(declare-fun m!364951 () Bool)

(assert (=> b!242189 m!364951))

(declare-fun m!364953 () Bool)

(assert (=> b!242180 m!364953))

(declare-fun m!364955 () Bool)

(assert (=> b!242180 m!364955))

(declare-fun m!364957 () Bool)

(assert (=> b!242180 m!364957))

(declare-fun m!364959 () Bool)

(assert (=> b!242180 m!364959))

(declare-fun m!364961 () Bool)

(assert (=> b!242180 m!364961))

(declare-fun m!364963 () Bool)

(assert (=> b!242180 m!364963))

(declare-fun m!364965 () Bool)

(assert (=> b!242180 m!364965))

(declare-fun m!364967 () Bool)

(assert (=> b!242190 m!364967))

(declare-fun m!364969 () Bool)

(assert (=> b!242185 m!364969))

(declare-fun m!364971 () Bool)

(assert (=> b!242179 m!364971))

(declare-fun m!364973 () Bool)

(assert (=> b!242182 m!364973))

(declare-fun m!364975 () Bool)

(assert (=> b!242187 m!364975))

(declare-fun m!364977 () Bool)

(assert (=> b!242187 m!364977))

(declare-fun m!364979 () Bool)

(assert (=> b!242187 m!364979))

(declare-fun m!364981 () Bool)

(assert (=> b!242186 m!364981))

(assert (=> b!242186 m!364937))

(declare-fun m!364983 () Bool)

(assert (=> b!242188 m!364983))

(declare-fun m!364985 () Bool)

(assert (=> b!242188 m!364985))

(push 1)

(assert (not b!242188))

(assert (not b!242186))

(assert (not b!242189))

(assert (not b!242185))

(assert (not b!242179))

(assert (not start!52484))

(assert (not b!242191))

(assert (not b!242192))

(assert (not b!242182))

(assert (not b!242187))

(assert (not b!242190))

(assert (not b!242181))

(assert (not b!242180))

(assert (not b!242184))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

