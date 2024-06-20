; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20208 () Bool)

(assert start!20208)

(declare-fun b!101025 () Bool)

(declare-fun res!82974 () Bool)

(declare-fun e!66054 () Bool)

(assert (=> b!101025 (=> (not res!82974) (not e!66054))))

(declare-datatypes ((array!4739 0))(
  ( (array!4740 (arr!2755 (Array (_ BitVec 32) (_ BitVec 8))) (size!2162 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3798 0))(
  ( (BitStream!3799 (buf!2519 array!4739) (currentByte!4986 (_ BitVec 32)) (currentBit!4981 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3798)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101025 (= res!82974 (validate_offset_bits!1 ((_ sign_extend 32) (size!2162 (buf!2519 thiss!1305))) ((_ sign_extend 32) (currentByte!4986 thiss!1305)) ((_ sign_extend 32) (currentBit!4981 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!101026 () Bool)

(declare-fun res!82975 () Bool)

(assert (=> b!101026 (=> (not res!82975) (not e!66054))))

(assert (=> b!101026 (= res!82975 (bvslt i!615 nBits!396))))

(declare-fun b!101028 () Bool)

(declare-fun e!66049 () Bool)

(declare-fun e!66053 () Bool)

(assert (=> b!101028 (= e!66049 e!66053)))

(declare-fun res!82969 () Bool)

(assert (=> b!101028 (=> (not res!82969) (not e!66053))))

(declare-datatypes ((Unit!6196 0))(
  ( (Unit!6197) )
))
(declare-datatypes ((tuple2!8152 0))(
  ( (tuple2!8153 (_1!4331 Unit!6196) (_2!4331 BitStream!3798)) )
))
(declare-fun lt!146767 () tuple2!8152)

(declare-fun lt!146759 () Bool)

(declare-datatypes ((tuple2!8154 0))(
  ( (tuple2!8155 (_1!4332 BitStream!3798) (_2!4332 Bool)) )
))
(declare-fun lt!146760 () tuple2!8154)

(assert (=> b!101028 (= res!82969 (and (= (_2!4332 lt!146760) lt!146759) (= (_1!4332 lt!146760) (_2!4331 lt!146767))))))

(declare-fun readBitPure!0 (BitStream!3798) tuple2!8154)

(declare-fun readerFrom!0 (BitStream!3798 (_ BitVec 32) (_ BitVec 32)) BitStream!3798)

(assert (=> b!101028 (= lt!146760 (readBitPure!0 (readerFrom!0 (_2!4331 lt!146767) (currentBit!4981 thiss!1305) (currentByte!4986 thiss!1305))))))

(declare-fun b!101029 () Bool)

(declare-fun e!66048 () Bool)

(declare-fun lt!146765 () tuple2!8152)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101029 (= e!66048 (invariant!0 (currentBit!4981 thiss!1305) (currentByte!4986 thiss!1305) (size!2162 (buf!2519 (_2!4331 lt!146765)))))))

(declare-fun b!101030 () Bool)

(declare-fun res!82973 () Bool)

(assert (=> b!101030 (=> (not res!82973) (not e!66048))))

(assert (=> b!101030 (= res!82973 (invariant!0 (currentBit!4981 thiss!1305) (currentByte!4986 thiss!1305) (size!2162 (buf!2519 (_2!4331 lt!146767)))))))

(declare-fun b!101031 () Bool)

(assert (=> b!101031 (= e!66054 (not (bvsle (bvsub nBits!396 i!615) #b00000000000000000000000001000000)))))

(declare-datatypes ((tuple2!8156 0))(
  ( (tuple2!8157 (_1!4333 BitStream!3798) (_2!4333 BitStream!3798)) )
))
(declare-fun lt!146758 () tuple2!8156)

(assert (=> b!101031 (= (_2!4332 (readBitPure!0 (_1!4333 lt!146758))) lt!146759)))

(declare-fun lt!146761 () tuple2!8156)

(declare-fun reader!0 (BitStream!3798 BitStream!3798) tuple2!8156)

(assert (=> b!101031 (= lt!146761 (reader!0 (_2!4331 lt!146767) (_2!4331 lt!146765)))))

(assert (=> b!101031 (= lt!146758 (reader!0 thiss!1305 (_2!4331 lt!146765)))))

(declare-fun e!66050 () Bool)

(assert (=> b!101031 e!66050))

(declare-fun res!82977 () Bool)

(assert (=> b!101031 (=> (not res!82977) (not e!66050))))

(declare-fun lt!146755 () tuple2!8154)

(declare-fun lt!146766 () tuple2!8154)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101031 (= res!82977 (= (bitIndex!0 (size!2162 (buf!2519 (_1!4332 lt!146755))) (currentByte!4986 (_1!4332 lt!146755)) (currentBit!4981 (_1!4332 lt!146755))) (bitIndex!0 (size!2162 (buf!2519 (_1!4332 lt!146766))) (currentByte!4986 (_1!4332 lt!146766)) (currentBit!4981 (_1!4332 lt!146766)))))))

(declare-fun lt!146764 () Unit!6196)

(declare-fun lt!146762 () BitStream!3798)

(declare-fun readBitPrefixLemma!0 (BitStream!3798 BitStream!3798) Unit!6196)

(assert (=> b!101031 (= lt!146764 (readBitPrefixLemma!0 lt!146762 (_2!4331 lt!146765)))))

(assert (=> b!101031 (= lt!146766 (readBitPure!0 (BitStream!3799 (buf!2519 (_2!4331 lt!146765)) (currentByte!4986 thiss!1305) (currentBit!4981 thiss!1305))))))

(assert (=> b!101031 (= lt!146755 (readBitPure!0 lt!146762))))

(assert (=> b!101031 (= lt!146762 (BitStream!3799 (buf!2519 (_2!4331 lt!146767)) (currentByte!4986 thiss!1305) (currentBit!4981 thiss!1305)))))

(assert (=> b!101031 e!66048))

(declare-fun res!82979 () Bool)

(assert (=> b!101031 (=> (not res!82979) (not e!66048))))

(declare-fun isPrefixOf!0 (BitStream!3798 BitStream!3798) Bool)

(assert (=> b!101031 (= res!82979 (isPrefixOf!0 thiss!1305 (_2!4331 lt!146765)))))

(declare-fun lt!146757 () Unit!6196)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3798 BitStream!3798 BitStream!3798) Unit!6196)

(assert (=> b!101031 (= lt!146757 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4331 lt!146767) (_2!4331 lt!146765)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3798 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8152)

(assert (=> b!101031 (= lt!146765 (appendNLeastSignificantBitsLoop!0 (_2!4331 lt!146767) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!66047 () Bool)

(assert (=> b!101031 e!66047))

(declare-fun res!82970 () Bool)

(assert (=> b!101031 (=> (not res!82970) (not e!66047))))

(assert (=> b!101031 (= res!82970 (= (size!2162 (buf!2519 thiss!1305)) (size!2162 (buf!2519 (_2!4331 lt!146767)))))))

(declare-fun appendBit!0 (BitStream!3798 Bool) tuple2!8152)

(assert (=> b!101031 (= lt!146767 (appendBit!0 thiss!1305 lt!146759))))

(assert (=> b!101031 (= lt!146759 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101032 () Bool)

(assert (=> b!101032 (= e!66050 (= (_2!4332 lt!146755) (_2!4332 lt!146766)))))

(declare-fun b!101033 () Bool)

(declare-fun e!66051 () Bool)

(declare-fun array_inv!1964 (array!4739) Bool)

(assert (=> b!101033 (= e!66051 (array_inv!1964 (buf!2519 thiss!1305)))))

(declare-fun b!101034 () Bool)

(declare-fun res!82976 () Bool)

(assert (=> b!101034 (=> (not res!82976) (not e!66049))))

(assert (=> b!101034 (= res!82976 (isPrefixOf!0 thiss!1305 (_2!4331 lt!146767)))))

(declare-fun b!101027 () Bool)

(declare-fun res!82978 () Bool)

(assert (=> b!101027 (=> (not res!82978) (not e!66054))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101027 (= res!82978 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!82971 () Bool)

(assert (=> start!20208 (=> (not res!82971) (not e!66054))))

(assert (=> start!20208 (= res!82971 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20208 e!66054))

(assert (=> start!20208 true))

(declare-fun inv!12 (BitStream!3798) Bool)

(assert (=> start!20208 (and (inv!12 thiss!1305) e!66051)))

(declare-fun b!101035 () Bool)

(declare-fun lt!146763 () (_ BitVec 64))

(assert (=> b!101035 (= e!66053 (= (bitIndex!0 (size!2162 (buf!2519 (_1!4332 lt!146760))) (currentByte!4986 (_1!4332 lt!146760)) (currentBit!4981 (_1!4332 lt!146760))) lt!146763))))

(declare-fun b!101036 () Bool)

(assert (=> b!101036 (= e!66047 e!66049)))

(declare-fun res!82972 () Bool)

(assert (=> b!101036 (=> (not res!82972) (not e!66049))))

(declare-fun lt!146756 () (_ BitVec 64))

(assert (=> b!101036 (= res!82972 (= lt!146763 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!146756)))))

(assert (=> b!101036 (= lt!146763 (bitIndex!0 (size!2162 (buf!2519 (_2!4331 lt!146767))) (currentByte!4986 (_2!4331 lt!146767)) (currentBit!4981 (_2!4331 lt!146767))))))

(assert (=> b!101036 (= lt!146756 (bitIndex!0 (size!2162 (buf!2519 thiss!1305)) (currentByte!4986 thiss!1305) (currentBit!4981 thiss!1305)))))

(assert (= (and start!20208 res!82971) b!101025))

(assert (= (and b!101025 res!82974) b!101027))

(assert (= (and b!101027 res!82978) b!101026))

(assert (= (and b!101026 res!82975) b!101031))

(assert (= (and b!101031 res!82970) b!101036))

(assert (= (and b!101036 res!82972) b!101034))

(assert (= (and b!101034 res!82976) b!101028))

(assert (= (and b!101028 res!82969) b!101035))

(assert (= (and b!101031 res!82979) b!101030))

(assert (= (and b!101030 res!82973) b!101029))

(assert (= (and b!101031 res!82977) b!101032))

(assert (= start!20208 b!101033))

(declare-fun m!146971 () Bool)

(assert (=> b!101030 m!146971))

(declare-fun m!146973 () Bool)

(assert (=> b!101036 m!146973))

(declare-fun m!146975 () Bool)

(assert (=> b!101036 m!146975))

(declare-fun m!146977 () Bool)

(assert (=> b!101025 m!146977))

(declare-fun m!146979 () Bool)

(assert (=> b!101033 m!146979))

(declare-fun m!146981 () Bool)

(assert (=> b!101031 m!146981))

(declare-fun m!146983 () Bool)

(assert (=> b!101031 m!146983))

(declare-fun m!146985 () Bool)

(assert (=> b!101031 m!146985))

(declare-fun m!146987 () Bool)

(assert (=> b!101031 m!146987))

(declare-fun m!146989 () Bool)

(assert (=> b!101031 m!146989))

(declare-fun m!146991 () Bool)

(assert (=> b!101031 m!146991))

(declare-fun m!146993 () Bool)

(assert (=> b!101031 m!146993))

(declare-fun m!146995 () Bool)

(assert (=> b!101031 m!146995))

(declare-fun m!146997 () Bool)

(assert (=> b!101031 m!146997))

(declare-fun m!146999 () Bool)

(assert (=> b!101031 m!146999))

(declare-fun m!147001 () Bool)

(assert (=> b!101031 m!147001))

(declare-fun m!147003 () Bool)

(assert (=> b!101031 m!147003))

(declare-fun m!147005 () Bool)

(assert (=> b!101029 m!147005))

(declare-fun m!147007 () Bool)

(assert (=> b!101034 m!147007))

(declare-fun m!147009 () Bool)

(assert (=> start!20208 m!147009))

(declare-fun m!147011 () Bool)

(assert (=> b!101028 m!147011))

(assert (=> b!101028 m!147011))

(declare-fun m!147013 () Bool)

(assert (=> b!101028 m!147013))

(declare-fun m!147015 () Bool)

(assert (=> b!101027 m!147015))

(declare-fun m!147017 () Bool)

(assert (=> b!101035 m!147017))

(check-sat (not b!101027) (not b!101028) (not b!101025) (not start!20208) (not b!101030) (not b!101035) (not b!101031) (not b!101029) (not b!101033) (not b!101036) (not b!101034))
(check-sat)
