; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20210 () Bool)

(assert start!20210)

(declare-fun b!101061 () Bool)

(declare-fun e!66075 () Bool)

(declare-datatypes ((array!4741 0))(
  ( (array!4742 (arr!2756 (Array (_ BitVec 32) (_ BitVec 8))) (size!2163 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3800 0))(
  ( (BitStream!3801 (buf!2520 array!4741) (currentByte!4987 (_ BitVec 32)) (currentBit!4982 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3800)

(declare-fun array_inv!1965 (array!4741) Bool)

(assert (=> b!101061 (= e!66075 (array_inv!1965 (buf!2520 thiss!1305)))))

(declare-fun b!101062 () Bool)

(declare-fun res!83012 () Bool)

(declare-fun e!66071 () Bool)

(assert (=> b!101062 (=> (not res!83012) (not e!66071))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101062 (= res!83012 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101063 () Bool)

(declare-fun res!83006 () Bool)

(declare-fun e!66072 () Bool)

(assert (=> b!101063 (=> (not res!83006) (not e!66072))))

(declare-datatypes ((Unit!6198 0))(
  ( (Unit!6199) )
))
(declare-datatypes ((tuple2!8158 0))(
  ( (tuple2!8159 (_1!4334 Unit!6198) (_2!4334 BitStream!3800)) )
))
(declare-fun lt!146795 () tuple2!8158)

(declare-fun isPrefixOf!0 (BitStream!3800 BitStream!3800) Bool)

(assert (=> b!101063 (= res!83006 (isPrefixOf!0 thiss!1305 (_2!4334 lt!146795)))))

(declare-fun b!101064 () Bool)

(declare-fun res!83005 () Bool)

(assert (=> b!101064 (=> (not res!83005) (not e!66071))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101064 (= res!83005 (validate_offset_bits!1 ((_ sign_extend 32) (size!2163 (buf!2520 thiss!1305))) ((_ sign_extend 32) (currentByte!4987 thiss!1305)) ((_ sign_extend 32) (currentBit!4982 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!101065 () Bool)

(declare-fun res!83002 () Bool)

(assert (=> b!101065 (=> (not res!83002) (not e!66071))))

(assert (=> b!101065 (= res!83002 (bvslt i!615 nBits!396))))

(declare-fun b!101066 () Bool)

(declare-fun e!66074 () Bool)

(assert (=> b!101066 (= e!66072 e!66074)))

(declare-fun res!83009 () Bool)

(assert (=> b!101066 (=> (not res!83009) (not e!66074))))

(declare-fun lt!146804 () Bool)

(declare-datatypes ((tuple2!8160 0))(
  ( (tuple2!8161 (_1!4335 BitStream!3800) (_2!4335 Bool)) )
))
(declare-fun lt!146798 () tuple2!8160)

(assert (=> b!101066 (= res!83009 (and (= (_2!4335 lt!146798) lt!146804) (= (_1!4335 lt!146798) (_2!4334 lt!146795))))))

(declare-fun readBitPure!0 (BitStream!3800) tuple2!8160)

(declare-fun readerFrom!0 (BitStream!3800 (_ BitVec 32) (_ BitVec 32)) BitStream!3800)

(assert (=> b!101066 (= lt!146798 (readBitPure!0 (readerFrom!0 (_2!4334 lt!146795) (currentBit!4982 thiss!1305) (currentByte!4987 thiss!1305))))))

(declare-fun b!101067 () Bool)

(declare-fun lt!146802 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101067 (= e!66074 (= (bitIndex!0 (size!2163 (buf!2520 (_1!4335 lt!146798))) (currentByte!4987 (_1!4335 lt!146798)) (currentBit!4982 (_1!4335 lt!146798))) lt!146802))))

(declare-fun b!101068 () Bool)

(assert (=> b!101068 (= e!66071 (not (bvsle (bvsub nBits!396 i!615) #b00000000000000000000000001000000)))))

(declare-datatypes ((tuple2!8162 0))(
  ( (tuple2!8163 (_1!4336 BitStream!3800) (_2!4336 BitStream!3800)) )
))
(declare-fun lt!146805 () tuple2!8162)

(assert (=> b!101068 (= (_2!4335 (readBitPure!0 (_1!4336 lt!146805))) lt!146804)))

(declare-fun lt!146801 () tuple2!8162)

(declare-fun lt!146794 () tuple2!8158)

(declare-fun reader!0 (BitStream!3800 BitStream!3800) tuple2!8162)

(assert (=> b!101068 (= lt!146801 (reader!0 (_2!4334 lt!146795) (_2!4334 lt!146794)))))

(assert (=> b!101068 (= lt!146805 (reader!0 thiss!1305 (_2!4334 lt!146794)))))

(declare-fun e!66076 () Bool)

(assert (=> b!101068 e!66076))

(declare-fun res!83010 () Bool)

(assert (=> b!101068 (=> (not res!83010) (not e!66076))))

(declare-fun lt!146796 () tuple2!8160)

(declare-fun lt!146797 () tuple2!8160)

(assert (=> b!101068 (= res!83010 (= (bitIndex!0 (size!2163 (buf!2520 (_1!4335 lt!146796))) (currentByte!4987 (_1!4335 lt!146796)) (currentBit!4982 (_1!4335 lt!146796))) (bitIndex!0 (size!2163 (buf!2520 (_1!4335 lt!146797))) (currentByte!4987 (_1!4335 lt!146797)) (currentBit!4982 (_1!4335 lt!146797)))))))

(declare-fun lt!146799 () Unit!6198)

(declare-fun lt!146803 () BitStream!3800)

(declare-fun readBitPrefixLemma!0 (BitStream!3800 BitStream!3800) Unit!6198)

(assert (=> b!101068 (= lt!146799 (readBitPrefixLemma!0 lt!146803 (_2!4334 lt!146794)))))

(assert (=> b!101068 (= lt!146797 (readBitPure!0 (BitStream!3801 (buf!2520 (_2!4334 lt!146794)) (currentByte!4987 thiss!1305) (currentBit!4982 thiss!1305))))))

(assert (=> b!101068 (= lt!146796 (readBitPure!0 lt!146803))))

(assert (=> b!101068 (= lt!146803 (BitStream!3801 (buf!2520 (_2!4334 lt!146795)) (currentByte!4987 thiss!1305) (currentBit!4982 thiss!1305)))))

(declare-fun e!66077 () Bool)

(assert (=> b!101068 e!66077))

(declare-fun res!83008 () Bool)

(assert (=> b!101068 (=> (not res!83008) (not e!66077))))

(assert (=> b!101068 (= res!83008 (isPrefixOf!0 thiss!1305 (_2!4334 lt!146794)))))

(declare-fun lt!146806 () Unit!6198)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3800 BitStream!3800 BitStream!3800) Unit!6198)

(assert (=> b!101068 (= lt!146806 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4334 lt!146795) (_2!4334 lt!146794)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3800 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8158)

(assert (=> b!101068 (= lt!146794 (appendNLeastSignificantBitsLoop!0 (_2!4334 lt!146795) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!66078 () Bool)

(assert (=> b!101068 e!66078))

(declare-fun res!83007 () Bool)

(assert (=> b!101068 (=> (not res!83007) (not e!66078))))

(assert (=> b!101068 (= res!83007 (= (size!2163 (buf!2520 thiss!1305)) (size!2163 (buf!2520 (_2!4334 lt!146795)))))))

(declare-fun appendBit!0 (BitStream!3800 Bool) tuple2!8158)

(assert (=> b!101068 (= lt!146795 (appendBit!0 thiss!1305 lt!146804))))

(assert (=> b!101068 (= lt!146804 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101069 () Bool)

(assert (=> b!101069 (= e!66078 e!66072)))

(declare-fun res!83011 () Bool)

(assert (=> b!101069 (=> (not res!83011) (not e!66072))))

(declare-fun lt!146800 () (_ BitVec 64))

(assert (=> b!101069 (= res!83011 (= lt!146802 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!146800)))))

(assert (=> b!101069 (= lt!146802 (bitIndex!0 (size!2163 (buf!2520 (_2!4334 lt!146795))) (currentByte!4987 (_2!4334 lt!146795)) (currentBit!4982 (_2!4334 lt!146795))))))

(assert (=> b!101069 (= lt!146800 (bitIndex!0 (size!2163 (buf!2520 thiss!1305)) (currentByte!4987 thiss!1305) (currentBit!4982 thiss!1305)))))

(declare-fun res!83004 () Bool)

(assert (=> start!20210 (=> (not res!83004) (not e!66071))))

(assert (=> start!20210 (= res!83004 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20210 e!66071))

(assert (=> start!20210 true))

(declare-fun inv!12 (BitStream!3800) Bool)

(assert (=> start!20210 (and (inv!12 thiss!1305) e!66075)))

(declare-fun b!101070 () Bool)

(declare-fun res!83003 () Bool)

(assert (=> b!101070 (=> (not res!83003) (not e!66077))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101070 (= res!83003 (invariant!0 (currentBit!4982 thiss!1305) (currentByte!4987 thiss!1305) (size!2163 (buf!2520 (_2!4334 lt!146795)))))))

(declare-fun b!101071 () Bool)

(assert (=> b!101071 (= e!66077 (invariant!0 (currentBit!4982 thiss!1305) (currentByte!4987 thiss!1305) (size!2163 (buf!2520 (_2!4334 lt!146794)))))))

(declare-fun b!101072 () Bool)

(assert (=> b!101072 (= e!66076 (= (_2!4335 lt!146796) (_2!4335 lt!146797)))))

(assert (= (and start!20210 res!83004) b!101064))

(assert (= (and b!101064 res!83005) b!101062))

(assert (= (and b!101062 res!83012) b!101065))

(assert (= (and b!101065 res!83002) b!101068))

(assert (= (and b!101068 res!83007) b!101069))

(assert (= (and b!101069 res!83011) b!101063))

(assert (= (and b!101063 res!83006) b!101066))

(assert (= (and b!101066 res!83009) b!101067))

(assert (= (and b!101068 res!83008) b!101070))

(assert (= (and b!101070 res!83003) b!101071))

(assert (= (and b!101068 res!83010) b!101072))

(assert (= start!20210 b!101061))

(declare-fun m!147019 () Bool)

(assert (=> b!101061 m!147019))

(declare-fun m!147021 () Bool)

(assert (=> b!101071 m!147021))

(declare-fun m!147023 () Bool)

(assert (=> b!101068 m!147023))

(declare-fun m!147025 () Bool)

(assert (=> b!101068 m!147025))

(declare-fun m!147027 () Bool)

(assert (=> b!101068 m!147027))

(declare-fun m!147029 () Bool)

(assert (=> b!101068 m!147029))

(declare-fun m!147031 () Bool)

(assert (=> b!101068 m!147031))

(declare-fun m!147033 () Bool)

(assert (=> b!101068 m!147033))

(declare-fun m!147035 () Bool)

(assert (=> b!101068 m!147035))

(declare-fun m!147037 () Bool)

(assert (=> b!101068 m!147037))

(declare-fun m!147039 () Bool)

(assert (=> b!101068 m!147039))

(declare-fun m!147041 () Bool)

(assert (=> b!101068 m!147041))

(declare-fun m!147043 () Bool)

(assert (=> b!101068 m!147043))

(declare-fun m!147045 () Bool)

(assert (=> b!101068 m!147045))

(declare-fun m!147047 () Bool)

(assert (=> b!101064 m!147047))

(declare-fun m!147049 () Bool)

(assert (=> b!101062 m!147049))

(declare-fun m!147051 () Bool)

(assert (=> b!101070 m!147051))

(declare-fun m!147053 () Bool)

(assert (=> b!101067 m!147053))

(declare-fun m!147055 () Bool)

(assert (=> b!101069 m!147055))

(declare-fun m!147057 () Bool)

(assert (=> b!101069 m!147057))

(declare-fun m!147059 () Bool)

(assert (=> start!20210 m!147059))

(declare-fun m!147061 () Bool)

(assert (=> b!101066 m!147061))

(assert (=> b!101066 m!147061))

(declare-fun m!147063 () Bool)

(assert (=> b!101066 m!147063))

(declare-fun m!147065 () Bool)

(assert (=> b!101063 m!147065))

(push 1)

(assert (not b!101062))

(assert (not b!101067))

(assert (not b!101061))

(assert (not start!20210))

(assert (not b!101070))

(assert (not b!101069))

(assert (not b!101063))

(assert (not b!101071))

(assert (not b!101064))

(assert (not b!101068))

(assert (not b!101066))

(check-sat)

(pop 1)

(push 1)

(check-sat)

