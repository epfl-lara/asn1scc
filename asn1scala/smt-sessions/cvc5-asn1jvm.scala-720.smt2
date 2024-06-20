; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20206 () Bool)

(assert start!20206)

(declare-fun b!100989 () Bool)

(declare-fun e!66025 () Bool)

(declare-datatypes ((array!4737 0))(
  ( (array!4738 (arr!2754 (Array (_ BitVec 32) (_ BitVec 8))) (size!2161 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3796 0))(
  ( (BitStream!3797 (buf!2518 array!4737) (currentByte!4985 (_ BitVec 32)) (currentBit!4980 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3796)

(declare-datatypes ((Unit!6194 0))(
  ( (Unit!6195) )
))
(declare-datatypes ((tuple2!8146 0))(
  ( (tuple2!8147 (_1!4328 Unit!6194) (_2!4328 BitStream!3796)) )
))
(declare-fun lt!146717 () tuple2!8146)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!100989 (= e!66025 (invariant!0 (currentBit!4980 thiss!1305) (currentByte!4985 thiss!1305) (size!2161 (buf!2518 (_2!4328 lt!146717)))))))

(declare-fun b!100990 () Bool)

(declare-fun res!82942 () Bool)

(declare-fun e!66027 () Bool)

(assert (=> b!100990 (=> (not res!82942) (not e!66027))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100990 (= res!82942 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!100991 () Bool)

(declare-fun e!66024 () Bool)

(declare-datatypes ((tuple2!8148 0))(
  ( (tuple2!8149 (_1!4329 BitStream!3796) (_2!4329 Bool)) )
))
(declare-fun lt!146726 () tuple2!8148)

(declare-fun lt!146723 () tuple2!8148)

(assert (=> b!100991 (= e!66024 (= (_2!4329 lt!146726) (_2!4329 lt!146723)))))

(declare-fun res!82946 () Bool)

(assert (=> start!20206 (=> (not res!82946) (not e!66027))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!20206 (= res!82946 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20206 e!66027))

(assert (=> start!20206 true))

(declare-fun e!66028 () Bool)

(declare-fun inv!12 (BitStream!3796) Bool)

(assert (=> start!20206 (and (inv!12 thiss!1305) e!66028)))

(declare-fun b!100992 () Bool)

(declare-fun res!82943 () Bool)

(declare-fun e!66030 () Bool)

(assert (=> b!100992 (=> (not res!82943) (not e!66030))))

(declare-fun lt!146724 () tuple2!8146)

(declare-fun isPrefixOf!0 (BitStream!3796 BitStream!3796) Bool)

(assert (=> b!100992 (= res!82943 (isPrefixOf!0 thiss!1305 (_2!4328 lt!146724)))))

(declare-fun b!100993 () Bool)

(declare-fun res!82938 () Bool)

(assert (=> b!100993 (=> (not res!82938) (not e!66025))))

(assert (=> b!100993 (= res!82938 (invariant!0 (currentBit!4980 thiss!1305) (currentByte!4985 thiss!1305) (size!2161 (buf!2518 (_2!4328 lt!146724)))))))

(declare-fun b!100994 () Bool)

(declare-fun e!66026 () Bool)

(declare-fun lt!146728 () tuple2!8148)

(declare-fun lt!146721 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100994 (= e!66026 (= (bitIndex!0 (size!2161 (buf!2518 (_1!4329 lt!146728))) (currentByte!4985 (_1!4329 lt!146728)) (currentBit!4980 (_1!4329 lt!146728))) lt!146721))))

(declare-fun b!100995 () Bool)

(assert (=> b!100995 (= e!66027 (not (bvsle (bvsub nBits!396 i!615) #b00000000000000000000000001000000)))))

(declare-datatypes ((tuple2!8150 0))(
  ( (tuple2!8151 (_1!4330 BitStream!3796) (_2!4330 BitStream!3796)) )
))
(declare-fun lt!146727 () tuple2!8150)

(declare-fun lt!146719 () Bool)

(declare-fun readBitPure!0 (BitStream!3796) tuple2!8148)

(assert (=> b!100995 (= (_2!4329 (readBitPure!0 (_1!4330 lt!146727))) lt!146719)))

(declare-fun lt!146720 () tuple2!8150)

(declare-fun reader!0 (BitStream!3796 BitStream!3796) tuple2!8150)

(assert (=> b!100995 (= lt!146720 (reader!0 (_2!4328 lt!146724) (_2!4328 lt!146717)))))

(assert (=> b!100995 (= lt!146727 (reader!0 thiss!1305 (_2!4328 lt!146717)))))

(assert (=> b!100995 e!66024))

(declare-fun res!82944 () Bool)

(assert (=> b!100995 (=> (not res!82944) (not e!66024))))

(assert (=> b!100995 (= res!82944 (= (bitIndex!0 (size!2161 (buf!2518 (_1!4329 lt!146726))) (currentByte!4985 (_1!4329 lt!146726)) (currentBit!4980 (_1!4329 lt!146726))) (bitIndex!0 (size!2161 (buf!2518 (_1!4329 lt!146723))) (currentByte!4985 (_1!4329 lt!146723)) (currentBit!4980 (_1!4329 lt!146723)))))))

(declare-fun lt!146716 () Unit!6194)

(declare-fun lt!146718 () BitStream!3796)

(declare-fun readBitPrefixLemma!0 (BitStream!3796 BitStream!3796) Unit!6194)

(assert (=> b!100995 (= lt!146716 (readBitPrefixLemma!0 lt!146718 (_2!4328 lt!146717)))))

(assert (=> b!100995 (= lt!146723 (readBitPure!0 (BitStream!3797 (buf!2518 (_2!4328 lt!146717)) (currentByte!4985 thiss!1305) (currentBit!4980 thiss!1305))))))

(assert (=> b!100995 (= lt!146726 (readBitPure!0 lt!146718))))

(assert (=> b!100995 (= lt!146718 (BitStream!3797 (buf!2518 (_2!4328 lt!146724)) (currentByte!4985 thiss!1305) (currentBit!4980 thiss!1305)))))

(assert (=> b!100995 e!66025))

(declare-fun res!82939 () Bool)

(assert (=> b!100995 (=> (not res!82939) (not e!66025))))

(assert (=> b!100995 (= res!82939 (isPrefixOf!0 thiss!1305 (_2!4328 lt!146717)))))

(declare-fun lt!146725 () Unit!6194)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3796 BitStream!3796 BitStream!3796) Unit!6194)

(assert (=> b!100995 (= lt!146725 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4328 lt!146724) (_2!4328 lt!146717)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3796 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8146)

(assert (=> b!100995 (= lt!146717 (appendNLeastSignificantBitsLoop!0 (_2!4328 lt!146724) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!66023 () Bool)

(assert (=> b!100995 e!66023))

(declare-fun res!82936 () Bool)

(assert (=> b!100995 (=> (not res!82936) (not e!66023))))

(assert (=> b!100995 (= res!82936 (= (size!2161 (buf!2518 thiss!1305)) (size!2161 (buf!2518 (_2!4328 lt!146724)))))))

(declare-fun appendBit!0 (BitStream!3796 Bool) tuple2!8146)

(assert (=> b!100995 (= lt!146724 (appendBit!0 thiss!1305 lt!146719))))

(assert (=> b!100995 (= lt!146719 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!100996 () Bool)

(assert (=> b!100996 (= e!66023 e!66030)))

(declare-fun res!82941 () Bool)

(assert (=> b!100996 (=> (not res!82941) (not e!66030))))

(declare-fun lt!146722 () (_ BitVec 64))

(assert (=> b!100996 (= res!82941 (= lt!146721 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!146722)))))

(assert (=> b!100996 (= lt!146721 (bitIndex!0 (size!2161 (buf!2518 (_2!4328 lt!146724))) (currentByte!4985 (_2!4328 lt!146724)) (currentBit!4980 (_2!4328 lt!146724))))))

(assert (=> b!100996 (= lt!146722 (bitIndex!0 (size!2161 (buf!2518 thiss!1305)) (currentByte!4985 thiss!1305) (currentBit!4980 thiss!1305)))))

(declare-fun b!100997 () Bool)

(assert (=> b!100997 (= e!66030 e!66026)))

(declare-fun res!82937 () Bool)

(assert (=> b!100997 (=> (not res!82937) (not e!66026))))

(assert (=> b!100997 (= res!82937 (and (= (_2!4329 lt!146728) lt!146719) (= (_1!4329 lt!146728) (_2!4328 lt!146724))))))

(declare-fun readerFrom!0 (BitStream!3796 (_ BitVec 32) (_ BitVec 32)) BitStream!3796)

(assert (=> b!100997 (= lt!146728 (readBitPure!0 (readerFrom!0 (_2!4328 lt!146724) (currentBit!4980 thiss!1305) (currentByte!4985 thiss!1305))))))

(declare-fun b!100998 () Bool)

(declare-fun array_inv!1963 (array!4737) Bool)

(assert (=> b!100998 (= e!66028 (array_inv!1963 (buf!2518 thiss!1305)))))

(declare-fun b!100999 () Bool)

(declare-fun res!82945 () Bool)

(assert (=> b!100999 (=> (not res!82945) (not e!66027))))

(assert (=> b!100999 (= res!82945 (bvslt i!615 nBits!396))))

(declare-fun b!101000 () Bool)

(declare-fun res!82940 () Bool)

(assert (=> b!101000 (=> (not res!82940) (not e!66027))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101000 (= res!82940 (validate_offset_bits!1 ((_ sign_extend 32) (size!2161 (buf!2518 thiss!1305))) ((_ sign_extend 32) (currentByte!4985 thiss!1305)) ((_ sign_extend 32) (currentBit!4980 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(assert (= (and start!20206 res!82946) b!101000))

(assert (= (and b!101000 res!82940) b!100990))

(assert (= (and b!100990 res!82942) b!100999))

(assert (= (and b!100999 res!82945) b!100995))

(assert (= (and b!100995 res!82936) b!100996))

(assert (= (and b!100996 res!82941) b!100992))

(assert (= (and b!100992 res!82943) b!100997))

(assert (= (and b!100997 res!82937) b!100994))

(assert (= (and b!100995 res!82939) b!100993))

(assert (= (and b!100993 res!82938) b!100989))

(assert (= (and b!100995 res!82944) b!100991))

(assert (= start!20206 b!100998))

(declare-fun m!146923 () Bool)

(assert (=> b!100995 m!146923))

(declare-fun m!146925 () Bool)

(assert (=> b!100995 m!146925))

(declare-fun m!146927 () Bool)

(assert (=> b!100995 m!146927))

(declare-fun m!146929 () Bool)

(assert (=> b!100995 m!146929))

(declare-fun m!146931 () Bool)

(assert (=> b!100995 m!146931))

(declare-fun m!146933 () Bool)

(assert (=> b!100995 m!146933))

(declare-fun m!146935 () Bool)

(assert (=> b!100995 m!146935))

(declare-fun m!146937 () Bool)

(assert (=> b!100995 m!146937))

(declare-fun m!146939 () Bool)

(assert (=> b!100995 m!146939))

(declare-fun m!146941 () Bool)

(assert (=> b!100995 m!146941))

(declare-fun m!146943 () Bool)

(assert (=> b!100995 m!146943))

(declare-fun m!146945 () Bool)

(assert (=> b!100995 m!146945))

(declare-fun m!146947 () Bool)

(assert (=> b!100993 m!146947))

(declare-fun m!146949 () Bool)

(assert (=> b!101000 m!146949))

(declare-fun m!146951 () Bool)

(assert (=> b!100992 m!146951))

(declare-fun m!146953 () Bool)

(assert (=> b!100994 m!146953))

(declare-fun m!146955 () Bool)

(assert (=> b!100990 m!146955))

(declare-fun m!146957 () Bool)

(assert (=> b!100997 m!146957))

(assert (=> b!100997 m!146957))

(declare-fun m!146959 () Bool)

(assert (=> b!100997 m!146959))

(declare-fun m!146961 () Bool)

(assert (=> b!100996 m!146961))

(declare-fun m!146963 () Bool)

(assert (=> b!100996 m!146963))

(declare-fun m!146965 () Bool)

(assert (=> start!20206 m!146965))

(declare-fun m!146967 () Bool)

(assert (=> b!100989 m!146967))

(declare-fun m!146969 () Bool)

(assert (=> b!100998 m!146969))

(push 1)

(assert (not b!100989))

(assert (not b!100994))

(assert (not b!100998))

(assert (not b!100995))

(assert (not b!101000))

(assert (not b!100996))

(assert (not b!100992))

(assert (not b!100993))

(assert (not start!20206))

(assert (not b!100997))

(assert (not b!100990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

