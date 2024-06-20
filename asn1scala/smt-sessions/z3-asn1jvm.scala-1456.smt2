; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39952 () Bool)

(assert start!39952)

(declare-fun b!181814 () Bool)

(declare-fun e!126227 () Bool)

(declare-datatypes ((array!9712 0))(
  ( (array!9713 (arr!5213 (Array (_ BitVec 32) (_ BitVec 8))) (size!4283 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7674 0))(
  ( (BitStream!7675 (buf!4732 array!9712) (currentByte!8954 (_ BitVec 32)) (currentBit!8949 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7674)

(declare-datatypes ((Unit!13063 0))(
  ( (Unit!13064) )
))
(declare-datatypes ((tuple2!15676 0))(
  ( (tuple2!15677 (_1!8483 Unit!13063) (_2!8483 BitStream!7674)) )
))
(declare-fun lt!279265 () tuple2!15676)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!181814 (= e!126227 (invariant!0 (currentBit!8949 thiss!1204) (currentByte!8954 thiss!1204) (size!4283 (buf!4732 (_2!8483 lt!279265)))))))

(declare-fun b!181815 () Bool)

(declare-fun res!151047 () Bool)

(declare-fun e!126221 () Bool)

(assert (=> b!181815 (=> res!151047 e!126221)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!279268 () (_ BitVec 64))

(declare-fun lt!279269 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!181815 (= res!151047 (or (not (= (size!4283 (buf!4732 (_2!8483 lt!279265))) (size!4283 (buf!4732 thiss!1204)))) (not (= lt!279269 (bvsub (bvadd lt!279268 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun res!151043 () Bool)

(declare-fun e!126228 () Bool)

(assert (=> start!39952 (=> (not res!151043) (not e!126228))))

(assert (=> start!39952 (= res!151043 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39952 e!126228))

(assert (=> start!39952 true))

(declare-fun e!126226 () Bool)

(declare-fun inv!12 (BitStream!7674) Bool)

(assert (=> start!39952 (and (inv!12 thiss!1204) e!126226)))

(declare-fun b!181816 () Bool)

(declare-fun e!126220 () Bool)

(assert (=> b!181816 (= e!126220 e!126221)))

(declare-fun res!151041 () Bool)

(assert (=> b!181816 (=> res!151041 e!126221)))

(declare-fun lt!279258 () (_ BitVec 64))

(assert (=> b!181816 (= res!151041 (not (= lt!279269 (bvsub (bvsub (bvadd lt!279258 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181816 (= lt!279269 (bitIndex!0 (size!4283 (buf!4732 (_2!8483 lt!279265))) (currentByte!8954 (_2!8483 lt!279265)) (currentBit!8949 (_2!8483 lt!279265))))))

(declare-fun isPrefixOf!0 (BitStream!7674 BitStream!7674) Bool)

(assert (=> b!181816 (isPrefixOf!0 thiss!1204 (_2!8483 lt!279265))))

(declare-fun lt!279252 () tuple2!15676)

(declare-fun lt!279259 () Unit!13063)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7674 BitStream!7674 BitStream!7674) Unit!13063)

(assert (=> b!181816 (= lt!279259 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8483 lt!279252) (_2!8483 lt!279265)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7674 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15676)

(assert (=> b!181816 (= lt!279265 (appendBitsLSBFirstLoopTR!0 (_2!8483 lt!279252) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!181817 () Bool)

(declare-fun e!126219 () Bool)

(assert (=> b!181817 (= e!126219 (not e!126220))))

(declare-fun res!151050 () Bool)

(assert (=> b!181817 (=> res!151050 e!126220)))

(assert (=> b!181817 (= res!151050 (not (= lt!279258 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279268))))))

(assert (=> b!181817 (= lt!279258 (bitIndex!0 (size!4283 (buf!4732 (_2!8483 lt!279252))) (currentByte!8954 (_2!8483 lt!279252)) (currentBit!8949 (_2!8483 lt!279252))))))

(assert (=> b!181817 (= lt!279268 (bitIndex!0 (size!4283 (buf!4732 thiss!1204)) (currentByte!8954 thiss!1204) (currentBit!8949 thiss!1204)))))

(declare-fun e!126225 () Bool)

(assert (=> b!181817 e!126225))

(declare-fun res!151056 () Bool)

(assert (=> b!181817 (=> (not res!151056) (not e!126225))))

(assert (=> b!181817 (= res!151056 (= (size!4283 (buf!4732 thiss!1204)) (size!4283 (buf!4732 (_2!8483 lt!279252)))))))

(declare-fun lt!279260 () Bool)

(declare-fun appendBit!0 (BitStream!7674 Bool) tuple2!15676)

(assert (=> b!181817 (= lt!279252 (appendBit!0 thiss!1204 lt!279260))))

(assert (=> b!181817 (= lt!279260 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181818 () Bool)

(declare-fun e!126222 () Bool)

(assert (=> b!181818 (= e!126225 e!126222)))

(declare-fun res!151049 () Bool)

(assert (=> b!181818 (=> (not res!151049) (not e!126222))))

(declare-fun lt!279262 () (_ BitVec 64))

(declare-fun lt!279264 () (_ BitVec 64))

(assert (=> b!181818 (= res!151049 (= lt!279262 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279264)))))

(assert (=> b!181818 (= lt!279262 (bitIndex!0 (size!4283 (buf!4732 (_2!8483 lt!279252))) (currentByte!8954 (_2!8483 lt!279252)) (currentBit!8949 (_2!8483 lt!279252))))))

(assert (=> b!181818 (= lt!279264 (bitIndex!0 (size!4283 (buf!4732 thiss!1204)) (currentByte!8954 thiss!1204) (currentBit!8949 thiss!1204)))))

(declare-fun b!181819 () Bool)

(declare-fun res!151042 () Bool)

(assert (=> b!181819 (=> res!151042 e!126221)))

(assert (=> b!181819 (= res!151042 (not (invariant!0 (currentBit!8949 (_2!8483 lt!279265)) (currentByte!8954 (_2!8483 lt!279265)) (size!4283 (buf!4732 (_2!8483 lt!279265))))))))

(declare-fun b!181820 () Bool)

(assert (=> b!181820 (= e!126221 true)))

(declare-datatypes ((tuple2!15678 0))(
  ( (tuple2!15679 (_1!8484 BitStream!7674) (_2!8484 BitStream!7674)) )
))
(declare-fun lt!279263 () tuple2!15678)

(declare-datatypes ((tuple2!15680 0))(
  ( (tuple2!15681 (_1!8485 BitStream!7674) (_2!8485 (_ BitVec 64))) )
))
(declare-fun lt!279257 () tuple2!15680)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15680)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181820 (= lt!279257 (readNBitsLSBFirstsLoopPure!0 (_1!8484 lt!279263) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!279255 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!181820 (validate_offset_bits!1 ((_ sign_extend 32) (size!4283 (buf!4732 (_2!8483 lt!279265)))) ((_ sign_extend 32) (currentByte!8954 thiss!1204)) ((_ sign_extend 32) (currentBit!8949 thiss!1204)) lt!279255)))

(declare-fun lt!279251 () Unit!13063)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7674 array!9712 (_ BitVec 64)) Unit!13063)

(assert (=> b!181820 (= lt!279251 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4732 (_2!8483 lt!279265)) lt!279255))))

(declare-datatypes ((tuple2!15682 0))(
  ( (tuple2!15683 (_1!8486 BitStream!7674) (_2!8486 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7674) tuple2!15682)

(assert (=> b!181820 (= (_2!8486 (readBitPure!0 (_1!8484 lt!279263))) lt!279260)))

(declare-fun lt!279267 () tuple2!15678)

(declare-fun reader!0 (BitStream!7674 BitStream!7674) tuple2!15678)

(assert (=> b!181820 (= lt!279267 (reader!0 (_2!8483 lt!279252) (_2!8483 lt!279265)))))

(assert (=> b!181820 (= lt!279263 (reader!0 thiss!1204 (_2!8483 lt!279265)))))

(declare-fun e!126229 () Bool)

(assert (=> b!181820 e!126229))

(declare-fun res!151054 () Bool)

(assert (=> b!181820 (=> (not res!151054) (not e!126229))))

(declare-fun lt!279253 () tuple2!15682)

(declare-fun lt!279261 () tuple2!15682)

(assert (=> b!181820 (= res!151054 (= (bitIndex!0 (size!4283 (buf!4732 (_1!8486 lt!279253))) (currentByte!8954 (_1!8486 lt!279253)) (currentBit!8949 (_1!8486 lt!279253))) (bitIndex!0 (size!4283 (buf!4732 (_1!8486 lt!279261))) (currentByte!8954 (_1!8486 lt!279261)) (currentBit!8949 (_1!8486 lt!279261)))))))

(declare-fun lt!279256 () Unit!13063)

(declare-fun lt!279254 () BitStream!7674)

(declare-fun readBitPrefixLemma!0 (BitStream!7674 BitStream!7674) Unit!13063)

(assert (=> b!181820 (= lt!279256 (readBitPrefixLemma!0 lt!279254 (_2!8483 lt!279265)))))

(assert (=> b!181820 (= lt!279261 (readBitPure!0 (BitStream!7675 (buf!4732 (_2!8483 lt!279265)) (currentByte!8954 thiss!1204) (currentBit!8949 thiss!1204))))))

(assert (=> b!181820 (= lt!279253 (readBitPure!0 lt!279254))))

(assert (=> b!181820 e!126227))

(declare-fun res!151048 () Bool)

(assert (=> b!181820 (=> (not res!151048) (not e!126227))))

(assert (=> b!181820 (= res!151048 (invariant!0 (currentBit!8949 thiss!1204) (currentByte!8954 thiss!1204) (size!4283 (buf!4732 (_2!8483 lt!279252)))))))

(assert (=> b!181820 (= lt!279254 (BitStream!7675 (buf!4732 (_2!8483 lt!279252)) (currentByte!8954 thiss!1204) (currentBit!8949 thiss!1204)))))

(declare-fun b!181821 () Bool)

(declare-fun res!151053 () Bool)

(assert (=> b!181821 (=> (not res!151053) (not e!126222))))

(assert (=> b!181821 (= res!151053 (isPrefixOf!0 thiss!1204 (_2!8483 lt!279252)))))

(declare-fun b!181822 () Bool)

(assert (=> b!181822 (= e!126229 (= (_2!8486 lt!279253) (_2!8486 lt!279261)))))

(declare-fun b!181823 () Bool)

(declare-fun res!151051 () Bool)

(assert (=> b!181823 (=> (not res!151051) (not e!126219))))

(assert (=> b!181823 (= res!151051 (invariant!0 (currentBit!8949 thiss!1204) (currentByte!8954 thiss!1204) (size!4283 (buf!4732 thiss!1204))))))

(declare-fun b!181824 () Bool)

(declare-fun e!126224 () Bool)

(declare-fun lt!279266 () tuple2!15682)

(assert (=> b!181824 (= e!126224 (= (bitIndex!0 (size!4283 (buf!4732 (_1!8486 lt!279266))) (currentByte!8954 (_1!8486 lt!279266)) (currentBit!8949 (_1!8486 lt!279266))) lt!279262))))

(declare-fun b!181825 () Bool)

(declare-fun res!151055 () Bool)

(assert (=> b!181825 (=> res!151055 e!126221)))

(assert (=> b!181825 (= res!151055 (not (isPrefixOf!0 (_2!8483 lt!279252) (_2!8483 lt!279265))))))

(declare-fun b!181826 () Bool)

(declare-fun res!151044 () Bool)

(assert (=> b!181826 (=> res!151044 e!126221)))

(assert (=> b!181826 (= res!151044 (not (isPrefixOf!0 thiss!1204 (_2!8483 lt!279252))))))

(declare-fun b!181827 () Bool)

(assert (=> b!181827 (= e!126222 e!126224)))

(declare-fun res!151046 () Bool)

(assert (=> b!181827 (=> (not res!151046) (not e!126224))))

(assert (=> b!181827 (= res!151046 (and (= (_2!8486 lt!279266) lt!279260) (= (_1!8486 lt!279266) (_2!8483 lt!279252))))))

(declare-fun readerFrom!0 (BitStream!7674 (_ BitVec 32) (_ BitVec 32)) BitStream!7674)

(assert (=> b!181827 (= lt!279266 (readBitPure!0 (readerFrom!0 (_2!8483 lt!279252) (currentBit!8949 thiss!1204) (currentByte!8954 thiss!1204))))))

(declare-fun b!181828 () Bool)

(declare-fun array_inv!4024 (array!9712) Bool)

(assert (=> b!181828 (= e!126226 (array_inv!4024 (buf!4732 thiss!1204)))))

(declare-fun b!181829 () Bool)

(declare-fun res!151052 () Bool)

(assert (=> b!181829 (=> (not res!151052) (not e!126219))))

(assert (=> b!181829 (= res!151052 (not (= i!590 nBits!348)))))

(declare-fun b!181830 () Bool)

(assert (=> b!181830 (= e!126228 e!126219)))

(declare-fun res!151045 () Bool)

(assert (=> b!181830 (=> (not res!151045) (not e!126219))))

(assert (=> b!181830 (= res!151045 (validate_offset_bits!1 ((_ sign_extend 32) (size!4283 (buf!4732 thiss!1204))) ((_ sign_extend 32) (currentByte!8954 thiss!1204)) ((_ sign_extend 32) (currentBit!8949 thiss!1204)) lt!279255))))

(assert (=> b!181830 (= lt!279255 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!39952 res!151043) b!181830))

(assert (= (and b!181830 res!151045) b!181823))

(assert (= (and b!181823 res!151051) b!181829))

(assert (= (and b!181829 res!151052) b!181817))

(assert (= (and b!181817 res!151056) b!181818))

(assert (= (and b!181818 res!151049) b!181821))

(assert (= (and b!181821 res!151053) b!181827))

(assert (= (and b!181827 res!151046) b!181824))

(assert (= (and b!181817 (not res!151050)) b!181816))

(assert (= (and b!181816 (not res!151041)) b!181819))

(assert (= (and b!181819 (not res!151042)) b!181815))

(assert (= (and b!181815 (not res!151047)) b!181825))

(assert (= (and b!181825 (not res!151055)) b!181826))

(assert (= (and b!181826 (not res!151044)) b!181820))

(assert (= (and b!181820 res!151048) b!181814))

(assert (= (and b!181820 res!151054) b!181822))

(assert (= start!39952 b!181828))

(declare-fun m!282921 () Bool)

(assert (=> b!181814 m!282921))

(declare-fun m!282923 () Bool)

(assert (=> b!181818 m!282923))

(declare-fun m!282925 () Bool)

(assert (=> b!181818 m!282925))

(declare-fun m!282927 () Bool)

(assert (=> b!181820 m!282927))

(declare-fun m!282929 () Bool)

(assert (=> b!181820 m!282929))

(declare-fun m!282931 () Bool)

(assert (=> b!181820 m!282931))

(declare-fun m!282933 () Bool)

(assert (=> b!181820 m!282933))

(declare-fun m!282935 () Bool)

(assert (=> b!181820 m!282935))

(declare-fun m!282937 () Bool)

(assert (=> b!181820 m!282937))

(declare-fun m!282939 () Bool)

(assert (=> b!181820 m!282939))

(declare-fun m!282941 () Bool)

(assert (=> b!181820 m!282941))

(declare-fun m!282943 () Bool)

(assert (=> b!181820 m!282943))

(declare-fun m!282945 () Bool)

(assert (=> b!181820 m!282945))

(declare-fun m!282947 () Bool)

(assert (=> b!181820 m!282947))

(declare-fun m!282949 () Bool)

(assert (=> b!181820 m!282949))

(declare-fun m!282951 () Bool)

(assert (=> b!181820 m!282951))

(declare-fun m!282953 () Bool)

(assert (=> b!181825 m!282953))

(declare-fun m!282955 () Bool)

(assert (=> b!181826 m!282955))

(declare-fun m!282957 () Bool)

(assert (=> b!181828 m!282957))

(declare-fun m!282959 () Bool)

(assert (=> start!39952 m!282959))

(declare-fun m!282961 () Bool)

(assert (=> b!181819 m!282961))

(declare-fun m!282963 () Bool)

(assert (=> b!181816 m!282963))

(declare-fun m!282965 () Bool)

(assert (=> b!181816 m!282965))

(declare-fun m!282967 () Bool)

(assert (=> b!181816 m!282967))

(declare-fun m!282969 () Bool)

(assert (=> b!181816 m!282969))

(declare-fun m!282971 () Bool)

(assert (=> b!181823 m!282971))

(declare-fun m!282973 () Bool)

(assert (=> b!181830 m!282973))

(declare-fun m!282975 () Bool)

(assert (=> b!181824 m!282975))

(assert (=> b!181821 m!282955))

(assert (=> b!181817 m!282923))

(assert (=> b!181817 m!282925))

(declare-fun m!282977 () Bool)

(assert (=> b!181817 m!282977))

(declare-fun m!282979 () Bool)

(assert (=> b!181827 m!282979))

(assert (=> b!181827 m!282979))

(declare-fun m!282981 () Bool)

(assert (=> b!181827 m!282981))

(check-sat (not b!181823) (not b!181828) (not b!181826) (not start!39952) (not b!181819) (not b!181821) (not b!181816) (not b!181825) (not b!181817) (not b!181820) (not b!181824) (not b!181818) (not b!181814) (not b!181830) (not b!181827))
