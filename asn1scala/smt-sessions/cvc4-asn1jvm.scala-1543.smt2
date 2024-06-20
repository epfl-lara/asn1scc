; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43264 () Bool)

(assert start!43264)

(declare-fun b!204043 () Bool)

(declare-fun res!170969 () Bool)

(declare-fun e!139772 () Bool)

(assert (=> b!204043 (=> (not res!170969) (not e!139772))))

(declare-datatypes ((array!10329 0))(
  ( (array!10330 (arr!5472 (Array (_ BitVec 32) (_ BitVec 8))) (size!4542 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8192 0))(
  ( (BitStream!8193 (buf!5047 array!10329) (currentByte!9523 (_ BitVec 32)) (currentBit!9518 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8192)

(declare-datatypes ((Unit!14542 0))(
  ( (Unit!14543) )
))
(declare-datatypes ((tuple2!17458 0))(
  ( (tuple2!17459 (_1!9381 Unit!14542) (_2!9381 BitStream!8192)) )
))
(declare-fun lt!318648 () tuple2!17458)

(declare-fun isPrefixOf!0 (BitStream!8192 BitStream!8192) Bool)

(assert (=> b!204043 (= res!170969 (isPrefixOf!0 thiss!1204 (_2!9381 lt!318648)))))

(declare-fun b!204044 () Bool)

(declare-fun res!170965 () Bool)

(declare-fun e!139776 () Bool)

(assert (=> b!204044 (=> res!170965 e!139776)))

(declare-fun lt!318649 () tuple2!17458)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!204044 (= res!170965 (not (invariant!0 (currentBit!9518 (_2!9381 lt!318649)) (currentByte!9523 (_2!9381 lt!318649)) (size!4542 (buf!5047 (_2!9381 lt!318649))))))))

(declare-fun b!204045 () Bool)

(declare-fun res!170968 () Bool)

(declare-fun e!139773 () Bool)

(assert (=> b!204045 (=> (not res!170968) (not e!139773))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204045 (= res!170968 (validate_offset_bits!1 ((_ sign_extend 32) (size!4542 (buf!5047 thiss!1204))) ((_ sign_extend 32) (currentByte!9523 thiss!1204)) ((_ sign_extend 32) (currentBit!9518 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!204046 () Bool)

(declare-fun e!139775 () Bool)

(assert (=> b!204046 (= e!139775 e!139772)))

(declare-fun res!170964 () Bool)

(assert (=> b!204046 (=> (not res!170964) (not e!139772))))

(declare-fun lt!318645 () (_ BitVec 64))

(declare-fun lt!318652 () (_ BitVec 64))

(assert (=> b!204046 (= res!170964 (= lt!318645 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!318652)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204046 (= lt!318645 (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!318648))) (currentByte!9523 (_2!9381 lt!318648)) (currentBit!9518 (_2!9381 lt!318648))))))

(assert (=> b!204046 (= lt!318652 (bitIndex!0 (size!4542 (buf!5047 thiss!1204)) (currentByte!9523 thiss!1204) (currentBit!9518 thiss!1204)))))

(declare-fun lt!318651 () (_ BitVec 64))

(declare-fun b!204047 () Bool)

(assert (=> b!204047 (= e!139776 (or (not (= (size!4542 (buf!5047 (_2!9381 lt!318649))) (size!4542 (buf!5047 thiss!1204)))) (let ((bdg!12240 (bvadd lt!318651 ((_ sign_extend 32) nBits!348)))) (let ((bdg!12241 (bvand bdg!12240 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (= bdg!12241 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000)) (= bdg!12241 (bvand (bvsub bdg!12240 ((_ sign_extend 32) i!590)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!204048 () Bool)

(declare-fun e!139770 () Bool)

(declare-datatypes ((tuple2!17460 0))(
  ( (tuple2!17461 (_1!9382 BitStream!8192) (_2!9382 Bool)) )
))
(declare-fun lt!318646 () tuple2!17460)

(assert (=> b!204048 (= e!139770 (= (bitIndex!0 (size!4542 (buf!5047 (_1!9382 lt!318646))) (currentByte!9523 (_1!9382 lt!318646)) (currentBit!9518 (_1!9382 lt!318646))) lt!318645))))

(declare-fun b!204049 () Bool)

(declare-fun e!139774 () Bool)

(assert (=> b!204049 (= e!139773 (not e!139774))))

(declare-fun res!170963 () Bool)

(assert (=> b!204049 (=> res!170963 e!139774)))

(declare-fun lt!318647 () (_ BitVec 64))

(assert (=> b!204049 (= res!170963 (not (= lt!318647 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!318651))))))

(assert (=> b!204049 (= lt!318647 (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!318648))) (currentByte!9523 (_2!9381 lt!318648)) (currentBit!9518 (_2!9381 lt!318648))))))

(assert (=> b!204049 (= lt!318651 (bitIndex!0 (size!4542 (buf!5047 thiss!1204)) (currentByte!9523 thiss!1204) (currentBit!9518 thiss!1204)))))

(assert (=> b!204049 e!139775))

(declare-fun res!170966 () Bool)

(assert (=> b!204049 (=> (not res!170966) (not e!139775))))

(assert (=> b!204049 (= res!170966 (= (size!4542 (buf!5047 thiss!1204)) (size!4542 (buf!5047 (_2!9381 lt!318648)))))))

(declare-fun lt!318650 () Bool)

(declare-fun appendBit!0 (BitStream!8192 Bool) tuple2!17458)

(assert (=> b!204049 (= lt!318648 (appendBit!0 thiss!1204 lt!318650))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!204049 (= lt!318650 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!204050 () Bool)

(declare-fun res!170960 () Bool)

(assert (=> b!204050 (=> (not res!170960) (not e!139773))))

(assert (=> b!204050 (= res!170960 (not (= i!590 nBits!348)))))

(declare-fun res!170967 () Bool)

(assert (=> start!43264 (=> (not res!170967) (not e!139773))))

(assert (=> start!43264 (= res!170967 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43264 e!139773))

(assert (=> start!43264 true))

(declare-fun e!139769 () Bool)

(declare-fun inv!12 (BitStream!8192) Bool)

(assert (=> start!43264 (and (inv!12 thiss!1204) e!139769)))

(declare-fun b!204051 () Bool)

(assert (=> b!204051 (= e!139774 e!139776)))

(declare-fun res!170962 () Bool)

(assert (=> b!204051 (=> res!170962 e!139776)))

(assert (=> b!204051 (= res!170962 (not (= (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!318649))) (currentByte!9523 (_2!9381 lt!318649)) (currentBit!9518 (_2!9381 lt!318649))) (bvsub (bvsub (bvadd lt!318647 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!204051 (isPrefixOf!0 thiss!1204 (_2!9381 lt!318649))))

(declare-fun lt!318653 () Unit!14542)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8192 BitStream!8192 BitStream!8192) Unit!14542)

(assert (=> b!204051 (= lt!318653 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9381 lt!318648) (_2!9381 lt!318649)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8192 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17458)

(assert (=> b!204051 (= lt!318649 (appendBitsLSBFirstLoopTR!0 (_2!9381 lt!318648) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!204052 () Bool)

(declare-fun array_inv!4283 (array!10329) Bool)

(assert (=> b!204052 (= e!139769 (array_inv!4283 (buf!5047 thiss!1204)))))

(declare-fun b!204053 () Bool)

(declare-fun res!170959 () Bool)

(assert (=> b!204053 (=> (not res!170959) (not e!139773))))

(assert (=> b!204053 (= res!170959 (invariant!0 (currentBit!9518 thiss!1204) (currentByte!9523 thiss!1204) (size!4542 (buf!5047 thiss!1204))))))

(declare-fun b!204054 () Bool)

(assert (=> b!204054 (= e!139772 e!139770)))

(declare-fun res!170961 () Bool)

(assert (=> b!204054 (=> (not res!170961) (not e!139770))))

(assert (=> b!204054 (= res!170961 (and (= (_2!9382 lt!318646) lt!318650) (= (_1!9382 lt!318646) (_2!9381 lt!318648))))))

(declare-fun readBitPure!0 (BitStream!8192) tuple2!17460)

(declare-fun readerFrom!0 (BitStream!8192 (_ BitVec 32) (_ BitVec 32)) BitStream!8192)

(assert (=> b!204054 (= lt!318646 (readBitPure!0 (readerFrom!0 (_2!9381 lt!318648) (currentBit!9518 thiss!1204) (currentByte!9523 thiss!1204))))))

(assert (= (and start!43264 res!170967) b!204045))

(assert (= (and b!204045 res!170968) b!204053))

(assert (= (and b!204053 res!170959) b!204050))

(assert (= (and b!204050 res!170960) b!204049))

(assert (= (and b!204049 res!170966) b!204046))

(assert (= (and b!204046 res!170964) b!204043))

(assert (= (and b!204043 res!170969) b!204054))

(assert (= (and b!204054 res!170961) b!204048))

(assert (= (and b!204049 (not res!170963)) b!204051))

(assert (= (and b!204051 (not res!170962)) b!204044))

(assert (= (and b!204044 (not res!170965)) b!204047))

(assert (= start!43264 b!204052))

(declare-fun m!315073 () Bool)

(assert (=> b!204049 m!315073))

(declare-fun m!315075 () Bool)

(assert (=> b!204049 m!315075))

(declare-fun m!315077 () Bool)

(assert (=> b!204049 m!315077))

(declare-fun m!315079 () Bool)

(assert (=> b!204048 m!315079))

(declare-fun m!315081 () Bool)

(assert (=> b!204043 m!315081))

(declare-fun m!315083 () Bool)

(assert (=> start!43264 m!315083))

(declare-fun m!315085 () Bool)

(assert (=> b!204053 m!315085))

(declare-fun m!315087 () Bool)

(assert (=> b!204054 m!315087))

(assert (=> b!204054 m!315087))

(declare-fun m!315089 () Bool)

(assert (=> b!204054 m!315089))

(declare-fun m!315091 () Bool)

(assert (=> b!204045 m!315091))

(declare-fun m!315093 () Bool)

(assert (=> b!204044 m!315093))

(declare-fun m!315095 () Bool)

(assert (=> b!204052 m!315095))

(declare-fun m!315097 () Bool)

(assert (=> b!204051 m!315097))

(declare-fun m!315099 () Bool)

(assert (=> b!204051 m!315099))

(declare-fun m!315101 () Bool)

(assert (=> b!204051 m!315101))

(declare-fun m!315103 () Bool)

(assert (=> b!204051 m!315103))

(assert (=> b!204046 m!315073))

(assert (=> b!204046 m!315075))

(push 1)

(assert (not b!204043))

(assert (not b!204045))

(assert (not b!204053))

(assert (not b!204044))

(assert (not b!204054))

(assert (not b!204049))

(assert (not b!204051))

(assert (not start!43264))

(assert (not b!204052))

(assert (not b!204048))

(assert (not b!204046))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69689 () Bool)

(declare-fun e!139819 () Bool)

(assert (=> d!69689 e!139819))

(declare-fun res!171043 () Bool)

(assert (=> d!69689 (=> (not res!171043) (not e!139819))))

(declare-fun lt!318765 () (_ BitVec 64))

(declare-fun lt!318764 () (_ BitVec 64))

(declare-fun lt!318767 () (_ BitVec 64))

(assert (=> d!69689 (= res!171043 (= lt!318767 (bvsub lt!318764 lt!318765)))))

(assert (=> d!69689 (or (= (bvand lt!318764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318765 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318764 lt!318765) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69689 (= lt!318765 (remainingBits!0 ((_ sign_extend 32) (size!4542 (buf!5047 (_2!9381 lt!318648)))) ((_ sign_extend 32) (currentByte!9523 (_2!9381 lt!318648))) ((_ sign_extend 32) (currentBit!9518 (_2!9381 lt!318648)))))))

(declare-fun lt!318762 () (_ BitVec 64))

(declare-fun lt!318766 () (_ BitVec 64))

(assert (=> d!69689 (= lt!318764 (bvmul lt!318762 lt!318766))))

(assert (=> d!69689 (or (= lt!318762 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318766 (bvsdiv (bvmul lt!318762 lt!318766) lt!318762)))))

(assert (=> d!69689 (= lt!318766 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69689 (= lt!318762 ((_ sign_extend 32) (size!4542 (buf!5047 (_2!9381 lt!318648)))))))

(assert (=> d!69689 (= lt!318767 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9523 (_2!9381 lt!318648))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9518 (_2!9381 lt!318648)))))))

(assert (=> d!69689 (invariant!0 (currentBit!9518 (_2!9381 lt!318648)) (currentByte!9523 (_2!9381 lt!318648)) (size!4542 (buf!5047 (_2!9381 lt!318648))))))

(assert (=> d!69689 (= (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!318648))) (currentByte!9523 (_2!9381 lt!318648)) (currentBit!9518 (_2!9381 lt!318648))) lt!318767)))

(declare-fun b!204126 () Bool)

(declare-fun res!171042 () Bool)

(assert (=> b!204126 (=> (not res!171042) (not e!139819))))

(assert (=> b!204126 (= res!171042 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318767))))

(declare-fun b!204127 () Bool)

(declare-fun lt!318763 () (_ BitVec 64))

(assert (=> b!204127 (= e!139819 (bvsle lt!318767 (bvmul lt!318763 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204127 (or (= lt!318763 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318763 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318763)))))

(assert (=> b!204127 (= lt!318763 ((_ sign_extend 32) (size!4542 (buf!5047 (_2!9381 lt!318648)))))))

(assert (= (and d!69689 res!171043) b!204126))

(assert (= (and b!204126 res!171042) b!204127))

(declare-fun m!315163 () Bool)

(assert (=> d!69689 m!315163))

(declare-fun m!315165 () Bool)

(assert (=> d!69689 m!315165))

(assert (=> b!204049 d!69689))

(declare-fun d!69705 () Bool)

(declare-fun e!139820 () Bool)

(assert (=> d!69705 e!139820))

(declare-fun res!171045 () Bool)

(assert (=> d!69705 (=> (not res!171045) (not e!139820))))

(declare-fun lt!318770 () (_ BitVec 64))

(declare-fun lt!318771 () (_ BitVec 64))

(declare-fun lt!318773 () (_ BitVec 64))

(assert (=> d!69705 (= res!171045 (= lt!318773 (bvsub lt!318770 lt!318771)))))

(assert (=> d!69705 (or (= (bvand lt!318770 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318771 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318770 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318770 lt!318771) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69705 (= lt!318771 (remainingBits!0 ((_ sign_extend 32) (size!4542 (buf!5047 thiss!1204))) ((_ sign_extend 32) (currentByte!9523 thiss!1204)) ((_ sign_extend 32) (currentBit!9518 thiss!1204))))))

(declare-fun lt!318768 () (_ BitVec 64))

(declare-fun lt!318772 () (_ BitVec 64))

(assert (=> d!69705 (= lt!318770 (bvmul lt!318768 lt!318772))))

(assert (=> d!69705 (or (= lt!318768 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318772 (bvsdiv (bvmul lt!318768 lt!318772) lt!318768)))))

(assert (=> d!69705 (= lt!318772 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69705 (= lt!318768 ((_ sign_extend 32) (size!4542 (buf!5047 thiss!1204))))))

(assert (=> d!69705 (= lt!318773 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9523 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9518 thiss!1204))))))

(assert (=> d!69705 (invariant!0 (currentBit!9518 thiss!1204) (currentByte!9523 thiss!1204) (size!4542 (buf!5047 thiss!1204)))))

(assert (=> d!69705 (= (bitIndex!0 (size!4542 (buf!5047 thiss!1204)) (currentByte!9523 thiss!1204) (currentBit!9518 thiss!1204)) lt!318773)))

(declare-fun b!204128 () Bool)

(declare-fun res!171044 () Bool)

(assert (=> b!204128 (=> (not res!171044) (not e!139820))))

(assert (=> b!204128 (= res!171044 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318773))))

(declare-fun b!204129 () Bool)

(declare-fun lt!318769 () (_ BitVec 64))

(assert (=> b!204129 (= e!139820 (bvsle lt!318773 (bvmul lt!318769 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204129 (or (= lt!318769 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318769 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318769)))))

(assert (=> b!204129 (= lt!318769 ((_ sign_extend 32) (size!4542 (buf!5047 thiss!1204))))))

(assert (= (and d!69705 res!171045) b!204128))

(assert (= (and b!204128 res!171044) b!204129))

(declare-fun m!315167 () Bool)

(assert (=> d!69705 m!315167))

(assert (=> d!69705 m!315085))

(assert (=> b!204049 d!69705))

(declare-fun b!204142 () Bool)

(declare-fun e!139825 () Bool)

(declare-fun lt!318785 () tuple2!17460)

(declare-fun lt!318782 () tuple2!17458)

(assert (=> b!204142 (= e!139825 (= (bitIndex!0 (size!4542 (buf!5047 (_1!9382 lt!318785))) (currentByte!9523 (_1!9382 lt!318785)) (currentBit!9518 (_1!9382 lt!318785))) (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!318782))) (currentByte!9523 (_2!9381 lt!318782)) (currentBit!9518 (_2!9381 lt!318782)))))))

(declare-fun b!204141 () Bool)

(declare-fun e!139826 () Bool)

(assert (=> b!204141 (= e!139826 e!139825)))

(declare-fun res!171057 () Bool)

(assert (=> b!204141 (=> (not res!171057) (not e!139825))))

(assert (=> b!204141 (= res!171057 (and (= (_2!9382 lt!318785) lt!318650) (= (_1!9382 lt!318785) (_2!9381 lt!318782))))))

(assert (=> b!204141 (= lt!318785 (readBitPure!0 (readerFrom!0 (_2!9381 lt!318782) (currentBit!9518 thiss!1204) (currentByte!9523 thiss!1204))))))

(declare-fun d!69707 () Bool)

(assert (=> d!69707 e!139826))

(declare-fun res!171054 () Bool)

(assert (=> d!69707 (=> (not res!171054) (not e!139826))))

(assert (=> d!69707 (= res!171054 (= (size!4542 (buf!5047 thiss!1204)) (size!4542 (buf!5047 (_2!9381 lt!318782)))))))

(declare-fun choose!16 (BitStream!8192 Bool) tuple2!17458)

(assert (=> d!69707 (= lt!318782 (choose!16 thiss!1204 lt!318650))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69707 (validate_offset_bit!0 ((_ sign_extend 32) (size!4542 (buf!5047 thiss!1204))) ((_ sign_extend 32) (currentByte!9523 thiss!1204)) ((_ sign_extend 32) (currentBit!9518 thiss!1204)))))

(assert (=> d!69707 (= (appendBit!0 thiss!1204 lt!318650) lt!318782)))

(declare-fun b!204139 () Bool)

(declare-fun res!171055 () Bool)

(assert (=> b!204139 (=> (not res!171055) (not e!139826))))

(declare-fun lt!318784 () (_ BitVec 64))

(declare-fun lt!318783 () (_ BitVec 64))

(assert (=> b!204139 (= res!171055 (= (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!318782))) (currentByte!9523 (_2!9381 lt!318782)) (currentBit!9518 (_2!9381 lt!318782))) (bvadd lt!318783 lt!318784)))))

(assert (=> b!204139 (or (not (= (bvand lt!318783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318784 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!318783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!318783 lt!318784) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204139 (= lt!318784 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!204139 (= lt!318783 (bitIndex!0 (size!4542 (buf!5047 thiss!1204)) (currentByte!9523 thiss!1204) (currentBit!9518 thiss!1204)))))

(declare-fun b!204140 () Bool)

(declare-fun res!171056 () Bool)

(assert (=> b!204140 (=> (not res!171056) (not e!139826))))

(assert (=> b!204140 (= res!171056 (isPrefixOf!0 thiss!1204 (_2!9381 lt!318782)))))

(assert (= (and d!69707 res!171054) b!204139))

(assert (= (and b!204139 res!171055) b!204140))

(assert (= (and b!204140 res!171056) b!204141))

(assert (= (and b!204141 res!171057) b!204142))

(declare-fun m!315169 () Bool)

(assert (=> d!69707 m!315169))

(declare-fun m!315171 () Bool)

(assert (=> d!69707 m!315171))

(declare-fun m!315173 () Bool)

(assert (=> b!204142 m!315173))

(declare-fun m!315175 () Bool)

(assert (=> b!204142 m!315175))

(declare-fun m!315177 () Bool)

(assert (=> b!204140 m!315177))

(declare-fun m!315179 () Bool)

(assert (=> b!204141 m!315179))

(assert (=> b!204141 m!315179))

(declare-fun m!315181 () Bool)

(assert (=> b!204141 m!315181))

(assert (=> b!204139 m!315175))

(assert (=> b!204139 m!315075))

(assert (=> b!204049 d!69707))

(declare-fun d!69709 () Bool)

(assert (=> d!69709 (= (invariant!0 (currentBit!9518 (_2!9381 lt!318649)) (currentByte!9523 (_2!9381 lt!318649)) (size!4542 (buf!5047 (_2!9381 lt!318649)))) (and (bvsge (currentBit!9518 (_2!9381 lt!318649)) #b00000000000000000000000000000000) (bvslt (currentBit!9518 (_2!9381 lt!318649)) #b00000000000000000000000000001000) (bvsge (currentByte!9523 (_2!9381 lt!318649)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9523 (_2!9381 lt!318649)) (size!4542 (buf!5047 (_2!9381 lt!318649)))) (and (= (currentBit!9518 (_2!9381 lt!318649)) #b00000000000000000000000000000000) (= (currentByte!9523 (_2!9381 lt!318649)) (size!4542 (buf!5047 (_2!9381 lt!318649))))))))))

(assert (=> b!204044 d!69709))

(declare-fun d!69711 () Bool)

(declare-fun res!171065 () Bool)

(declare-fun e!139832 () Bool)

(assert (=> d!69711 (=> (not res!171065) (not e!139832))))

(assert (=> d!69711 (= res!171065 (= (size!4542 (buf!5047 thiss!1204)) (size!4542 (buf!5047 (_2!9381 lt!318648)))))))

(assert (=> d!69711 (= (isPrefixOf!0 thiss!1204 (_2!9381 lt!318648)) e!139832)))

(declare-fun b!204149 () Bool)

(declare-fun res!171066 () Bool)

(assert (=> b!204149 (=> (not res!171066) (not e!139832))))

(assert (=> b!204149 (= res!171066 (bvsle (bitIndex!0 (size!4542 (buf!5047 thiss!1204)) (currentByte!9523 thiss!1204) (currentBit!9518 thiss!1204)) (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!318648))) (currentByte!9523 (_2!9381 lt!318648)) (currentBit!9518 (_2!9381 lt!318648)))))))

(declare-fun b!204150 () Bool)

(declare-fun e!139831 () Bool)

(assert (=> b!204150 (= e!139832 e!139831)))

(declare-fun res!171064 () Bool)

(assert (=> b!204150 (=> res!171064 e!139831)))

(assert (=> b!204150 (= res!171064 (= (size!4542 (buf!5047 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!204151 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10329 array!10329 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204151 (= e!139831 (arrayBitRangesEq!0 (buf!5047 thiss!1204) (buf!5047 (_2!9381 lt!318648)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4542 (buf!5047 thiss!1204)) (currentByte!9523 thiss!1204) (currentBit!9518 thiss!1204))))))

(assert (= (and d!69711 res!171065) b!204149))

(assert (= (and b!204149 res!171066) b!204150))

(assert (= (and b!204150 (not res!171064)) b!204151))

(assert (=> b!204149 m!315075))

(assert (=> b!204149 m!315073))

(assert (=> b!204151 m!315075))

(assert (=> b!204151 m!315075))

(declare-fun m!315183 () Bool)

(assert (=> b!204151 m!315183))

(assert (=> b!204043 d!69711))

(declare-fun d!69713 () Bool)

(declare-datatypes ((tuple2!17474 0))(
  ( (tuple2!17475 (_1!9389 Bool) (_2!9389 BitStream!8192)) )
))
(declare-fun lt!318788 () tuple2!17474)

(declare-fun readBit!0 (BitStream!8192) tuple2!17474)

(assert (=> d!69713 (= lt!318788 (readBit!0 (readerFrom!0 (_2!9381 lt!318648) (currentBit!9518 thiss!1204) (currentByte!9523 thiss!1204))))))

(assert (=> d!69713 (= (readBitPure!0 (readerFrom!0 (_2!9381 lt!318648) (currentBit!9518 thiss!1204) (currentByte!9523 thiss!1204))) (tuple2!17461 (_2!9389 lt!318788) (_1!9389 lt!318788)))))

(declare-fun bs!17161 () Bool)

(assert (= bs!17161 d!69713))

(assert (=> bs!17161 m!315087))

(declare-fun m!315185 () Bool)

(assert (=> bs!17161 m!315185))

(assert (=> b!204054 d!69713))

(declare-fun d!69715 () Bool)

(declare-fun e!139835 () Bool)

(assert (=> d!69715 e!139835))

(declare-fun res!171070 () Bool)

(assert (=> d!69715 (=> (not res!171070) (not e!139835))))

(assert (=> d!69715 (= res!171070 (invariant!0 (currentBit!9518 (_2!9381 lt!318648)) (currentByte!9523 (_2!9381 lt!318648)) (size!4542 (buf!5047 (_2!9381 lt!318648)))))))

(assert (=> d!69715 (= (readerFrom!0 (_2!9381 lt!318648) (currentBit!9518 thiss!1204) (currentByte!9523 thiss!1204)) (BitStream!8193 (buf!5047 (_2!9381 lt!318648)) (currentByte!9523 thiss!1204) (currentBit!9518 thiss!1204)))))

(declare-fun b!204154 () Bool)

(assert (=> b!204154 (= e!139835 (invariant!0 (currentBit!9518 thiss!1204) (currentByte!9523 thiss!1204) (size!4542 (buf!5047 (_2!9381 lt!318648)))))))

(assert (= (and d!69715 res!171070) b!204154))

(assert (=> d!69715 m!315165))

(declare-fun m!315187 () Bool)

(assert (=> b!204154 m!315187))

(assert (=> b!204054 d!69715))

(declare-fun d!69717 () Bool)

(assert (=> d!69717 (= (invariant!0 (currentBit!9518 thiss!1204) (currentByte!9523 thiss!1204) (size!4542 (buf!5047 thiss!1204))) (and (bvsge (currentBit!9518 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9518 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9523 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9523 thiss!1204) (size!4542 (buf!5047 thiss!1204))) (and (= (currentBit!9518 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9523 thiss!1204) (size!4542 (buf!5047 thiss!1204)))))))))

(assert (=> b!204053 d!69717))

(declare-fun d!69719 () Bool)

(declare-fun e!139836 () Bool)

(assert (=> d!69719 e!139836))

(declare-fun res!171072 () Bool)

(assert (=> d!69719 (=> (not res!171072) (not e!139836))))

(declare-fun lt!318794 () (_ BitVec 64))

(declare-fun lt!318792 () (_ BitVec 64))

(declare-fun lt!318791 () (_ BitVec 64))

(assert (=> d!69719 (= res!171072 (= lt!318794 (bvsub lt!318791 lt!318792)))))

(assert (=> d!69719 (or (= (bvand lt!318791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318792 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318791 lt!318792) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69719 (= lt!318792 (remainingBits!0 ((_ sign_extend 32) (size!4542 (buf!5047 (_1!9382 lt!318646)))) ((_ sign_extend 32) (currentByte!9523 (_1!9382 lt!318646))) ((_ sign_extend 32) (currentBit!9518 (_1!9382 lt!318646)))))))

(declare-fun lt!318789 () (_ BitVec 64))

(declare-fun lt!318793 () (_ BitVec 64))

(assert (=> d!69719 (= lt!318791 (bvmul lt!318789 lt!318793))))

(assert (=> d!69719 (or (= lt!318789 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318793 (bvsdiv (bvmul lt!318789 lt!318793) lt!318789)))))

(assert (=> d!69719 (= lt!318793 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69719 (= lt!318789 ((_ sign_extend 32) (size!4542 (buf!5047 (_1!9382 lt!318646)))))))

(assert (=> d!69719 (= lt!318794 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9523 (_1!9382 lt!318646))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9518 (_1!9382 lt!318646)))))))

(assert (=> d!69719 (invariant!0 (currentBit!9518 (_1!9382 lt!318646)) (currentByte!9523 (_1!9382 lt!318646)) (size!4542 (buf!5047 (_1!9382 lt!318646))))))

(assert (=> d!69719 (= (bitIndex!0 (size!4542 (buf!5047 (_1!9382 lt!318646))) (currentByte!9523 (_1!9382 lt!318646)) (currentBit!9518 (_1!9382 lt!318646))) lt!318794)))

(declare-fun b!204155 () Bool)

(declare-fun res!171071 () Bool)

(assert (=> b!204155 (=> (not res!171071) (not e!139836))))

(assert (=> b!204155 (= res!171071 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318794))))

(declare-fun b!204156 () Bool)

(declare-fun lt!318790 () (_ BitVec 64))

(assert (=> b!204156 (= e!139836 (bvsle lt!318794 (bvmul lt!318790 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204156 (or (= lt!318790 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318790 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318790)))))

(assert (=> b!204156 (= lt!318790 ((_ sign_extend 32) (size!4542 (buf!5047 (_1!9382 lt!318646)))))))

(assert (= (and d!69719 res!171072) b!204155))

(assert (= (and b!204155 res!171071) b!204156))

(declare-fun m!315189 () Bool)

(assert (=> d!69719 m!315189))

(declare-fun m!315191 () Bool)

(assert (=> d!69719 m!315191))

(assert (=> b!204048 d!69719))

(declare-fun d!69721 () Bool)

(assert (=> d!69721 (= (array_inv!4283 (buf!5047 thiss!1204)) (bvsge (size!4542 (buf!5047 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!204052 d!69721))

(declare-fun d!69723 () Bool)

(declare-fun e!139837 () Bool)

(assert (=> d!69723 e!139837))

(declare-fun res!171074 () Bool)

(assert (=> d!69723 (=> (not res!171074) (not e!139837))))

(declare-fun lt!318798 () (_ BitVec 64))

(declare-fun lt!318797 () (_ BitVec 64))

(declare-fun lt!318800 () (_ BitVec 64))

(assert (=> d!69723 (= res!171074 (= lt!318800 (bvsub lt!318797 lt!318798)))))

(assert (=> d!69723 (or (= (bvand lt!318797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318798 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318797 lt!318798) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69723 (= lt!318798 (remainingBits!0 ((_ sign_extend 32) (size!4542 (buf!5047 (_2!9381 lt!318649)))) ((_ sign_extend 32) (currentByte!9523 (_2!9381 lt!318649))) ((_ sign_extend 32) (currentBit!9518 (_2!9381 lt!318649)))))))

(declare-fun lt!318795 () (_ BitVec 64))

(declare-fun lt!318799 () (_ BitVec 64))

(assert (=> d!69723 (= lt!318797 (bvmul lt!318795 lt!318799))))

(assert (=> d!69723 (or (= lt!318795 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318799 (bvsdiv (bvmul lt!318795 lt!318799) lt!318795)))))

(assert (=> d!69723 (= lt!318799 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69723 (= lt!318795 ((_ sign_extend 32) (size!4542 (buf!5047 (_2!9381 lt!318649)))))))

(assert (=> d!69723 (= lt!318800 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9523 (_2!9381 lt!318649))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9518 (_2!9381 lt!318649)))))))

(assert (=> d!69723 (invariant!0 (currentBit!9518 (_2!9381 lt!318649)) (currentByte!9523 (_2!9381 lt!318649)) (size!4542 (buf!5047 (_2!9381 lt!318649))))))

(assert (=> d!69723 (= (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!318649))) (currentByte!9523 (_2!9381 lt!318649)) (currentBit!9518 (_2!9381 lt!318649))) lt!318800)))

(declare-fun b!204157 () Bool)

(declare-fun res!171073 () Bool)

(assert (=> b!204157 (=> (not res!171073) (not e!139837))))

(assert (=> b!204157 (= res!171073 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318800))))

(declare-fun b!204158 () Bool)

(declare-fun lt!318796 () (_ BitVec 64))

(assert (=> b!204158 (= e!139837 (bvsle lt!318800 (bvmul lt!318796 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204158 (or (= lt!318796 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318796 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318796)))))

(assert (=> b!204158 (= lt!318796 ((_ sign_extend 32) (size!4542 (buf!5047 (_2!9381 lt!318649)))))))

(assert (= (and d!69723 res!171074) b!204157))

(assert (= (and b!204157 res!171073) b!204158))

(declare-fun m!315193 () Bool)

(assert (=> d!69723 m!315193))

(assert (=> d!69723 m!315093))

(assert (=> b!204051 d!69723))

(declare-fun d!69725 () Bool)

(declare-fun res!171076 () Bool)

(declare-fun e!139839 () Bool)

(assert (=> d!69725 (=> (not res!171076) (not e!139839))))

(assert (=> d!69725 (= res!171076 (= (size!4542 (buf!5047 thiss!1204)) (size!4542 (buf!5047 (_2!9381 lt!318649)))))))

(assert (=> d!69725 (= (isPrefixOf!0 thiss!1204 (_2!9381 lt!318649)) e!139839)))

(declare-fun b!204159 () Bool)

(declare-fun res!171077 () Bool)

(assert (=> b!204159 (=> (not res!171077) (not e!139839))))

(assert (=> b!204159 (= res!171077 (bvsle (bitIndex!0 (size!4542 (buf!5047 thiss!1204)) (currentByte!9523 thiss!1204) (currentBit!9518 thiss!1204)) (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!318649))) (currentByte!9523 (_2!9381 lt!318649)) (currentBit!9518 (_2!9381 lt!318649)))))))

(declare-fun b!204160 () Bool)

(declare-fun e!139838 () Bool)

(assert (=> b!204160 (= e!139839 e!139838)))

(declare-fun res!171075 () Bool)

(assert (=> b!204160 (=> res!171075 e!139838)))

(assert (=> b!204160 (= res!171075 (= (size!4542 (buf!5047 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!204161 () Bool)

(assert (=> b!204161 (= e!139838 (arrayBitRangesEq!0 (buf!5047 thiss!1204) (buf!5047 (_2!9381 lt!318649)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4542 (buf!5047 thiss!1204)) (currentByte!9523 thiss!1204) (currentBit!9518 thiss!1204))))))

(assert (= (and d!69725 res!171076) b!204159))

(assert (= (and b!204159 res!171077) b!204160))

(assert (= (and b!204160 (not res!171075)) b!204161))

(assert (=> b!204159 m!315075))

(assert (=> b!204159 m!315097))

(assert (=> b!204161 m!315075))

(assert (=> b!204161 m!315075))

(declare-fun m!315195 () Bool)

(assert (=> b!204161 m!315195))

(assert (=> b!204051 d!69725))

(declare-fun d!69727 () Bool)

(assert (=> d!69727 (isPrefixOf!0 thiss!1204 (_2!9381 lt!318649))))

(declare-fun lt!318803 () Unit!14542)

(declare-fun choose!30 (BitStream!8192 BitStream!8192 BitStream!8192) Unit!14542)

(assert (=> d!69727 (= lt!318803 (choose!30 thiss!1204 (_2!9381 lt!318648) (_2!9381 lt!318649)))))

(assert (=> d!69727 (isPrefixOf!0 thiss!1204 (_2!9381 lt!318648))))

(assert (=> d!69727 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9381 lt!318648) (_2!9381 lt!318649)) lt!318803)))

(declare-fun bs!17162 () Bool)

(assert (= bs!17162 d!69727))

(assert (=> bs!17162 m!315099))

(declare-fun m!315197 () Bool)

(assert (=> bs!17162 m!315197))

(assert (=> bs!17162 m!315081))

(assert (=> b!204051 d!69727))

(declare-fun call!3234 () Bool)

(declare-fun bm!3231 () Bool)

(declare-fun c!10132 () Bool)

(declare-fun lt!319282 () tuple2!17458)

(assert (=> bm!3231 (= call!3234 (isPrefixOf!0 (_2!9381 lt!318648) (ite c!10132 (_2!9381 lt!318648) (_2!9381 lt!319282))))))

(declare-fun b!204303 () Bool)

(declare-fun e!139922 () tuple2!17458)

(declare-fun lt!319297 () tuple2!17458)

(assert (=> b!204303 (= e!139922 (tuple2!17459 (_1!9381 lt!319297) (_2!9381 lt!319297)))))

(declare-fun lt!319286 () Bool)

(assert (=> b!204303 (= lt!319286 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204303 (= lt!319282 (appendBit!0 (_2!9381 lt!318648) lt!319286))))

(declare-fun res!171195 () Bool)

(assert (=> b!204303 (= res!171195 (= (size!4542 (buf!5047 (_2!9381 lt!318648))) (size!4542 (buf!5047 (_2!9381 lt!319282)))))))

(declare-fun e!139919 () Bool)

(assert (=> b!204303 (=> (not res!171195) (not e!139919))))

(assert (=> b!204303 e!139919))

(declare-fun lt!319278 () tuple2!17458)

(assert (=> b!204303 (= lt!319278 lt!319282)))

(assert (=> b!204303 (= lt!319297 (appendBitsLSBFirstLoopTR!0 (_2!9381 lt!319278) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!319304 () Unit!14542)

(assert (=> b!204303 (= lt!319304 (lemmaIsPrefixTransitive!0 (_2!9381 lt!318648) (_2!9381 lt!319278) (_2!9381 lt!319297)))))

(assert (=> b!204303 (isPrefixOf!0 (_2!9381 lt!318648) (_2!9381 lt!319297))))

(declare-fun lt!319289 () Unit!14542)

(assert (=> b!204303 (= lt!319289 lt!319304)))

(assert (=> b!204303 (invariant!0 (currentBit!9518 (_2!9381 lt!318648)) (currentByte!9523 (_2!9381 lt!318648)) (size!4542 (buf!5047 (_2!9381 lt!319278))))))

(declare-fun lt!319317 () BitStream!8192)

(assert (=> b!204303 (= lt!319317 (BitStream!8193 (buf!5047 (_2!9381 lt!319278)) (currentByte!9523 (_2!9381 lt!318648)) (currentBit!9518 (_2!9381 lt!318648))))))

(assert (=> b!204303 (invariant!0 (currentBit!9518 lt!319317) (currentByte!9523 lt!319317) (size!4542 (buf!5047 (_2!9381 lt!319297))))))

(declare-fun lt!319273 () BitStream!8192)

(assert (=> b!204303 (= lt!319273 (BitStream!8193 (buf!5047 (_2!9381 lt!319297)) (currentByte!9523 lt!319317) (currentBit!9518 lt!319317)))))

(declare-fun lt!319296 () tuple2!17460)

(assert (=> b!204303 (= lt!319296 (readBitPure!0 lt!319317))))

(declare-fun lt!319306 () tuple2!17460)

(assert (=> b!204303 (= lt!319306 (readBitPure!0 lt!319273))))

(declare-fun lt!319315 () Unit!14542)

(declare-fun readBitPrefixLemma!0 (BitStream!8192 BitStream!8192) Unit!14542)

(assert (=> b!204303 (= lt!319315 (readBitPrefixLemma!0 lt!319317 (_2!9381 lt!319297)))))

(declare-fun res!171193 () Bool)

(assert (=> b!204303 (= res!171193 (= (bitIndex!0 (size!4542 (buf!5047 (_1!9382 lt!319296))) (currentByte!9523 (_1!9382 lt!319296)) (currentBit!9518 (_1!9382 lt!319296))) (bitIndex!0 (size!4542 (buf!5047 (_1!9382 lt!319306))) (currentByte!9523 (_1!9382 lt!319306)) (currentBit!9518 (_1!9382 lt!319306)))))))

(declare-fun e!139924 () Bool)

(assert (=> b!204303 (=> (not res!171193) (not e!139924))))

(assert (=> b!204303 e!139924))

(declare-fun lt!319318 () Unit!14542)

(assert (=> b!204303 (= lt!319318 lt!319315)))

(declare-datatypes ((tuple2!17476 0))(
  ( (tuple2!17477 (_1!9390 BitStream!8192) (_2!9390 BitStream!8192)) )
))
(declare-fun lt!319265 () tuple2!17476)

(declare-fun reader!0 (BitStream!8192 BitStream!8192) tuple2!17476)

(assert (=> b!204303 (= lt!319265 (reader!0 (_2!9381 lt!318648) (_2!9381 lt!319297)))))

(declare-fun lt!319308 () tuple2!17476)

(assert (=> b!204303 (= lt!319308 (reader!0 (_2!9381 lt!319278) (_2!9381 lt!319297)))))

(declare-fun lt!319279 () tuple2!17460)

(assert (=> b!204303 (= lt!319279 (readBitPure!0 (_1!9390 lt!319265)))))

(assert (=> b!204303 (= (_2!9382 lt!319279) lt!319286)))

(declare-fun lt!319267 () Unit!14542)

(declare-fun Unit!14566 () Unit!14542)

(assert (=> b!204303 (= lt!319267 Unit!14566)))

(declare-fun lt!319276 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204303 (= lt!319276 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319274 () (_ BitVec 64))

(assert (=> b!204303 (= lt!319274 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319266 () Unit!14542)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8192 array!10329 (_ BitVec 64)) Unit!14542)

(assert (=> b!204303 (= lt!319266 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9381 lt!318648) (buf!5047 (_2!9381 lt!319297)) lt!319274))))

(assert (=> b!204303 (validate_offset_bits!1 ((_ sign_extend 32) (size!4542 (buf!5047 (_2!9381 lt!319297)))) ((_ sign_extend 32) (currentByte!9523 (_2!9381 lt!318648))) ((_ sign_extend 32) (currentBit!9518 (_2!9381 lt!318648))) lt!319274)))

(declare-fun lt!319314 () Unit!14542)

(assert (=> b!204303 (= lt!319314 lt!319266)))

(declare-datatypes ((tuple2!17478 0))(
  ( (tuple2!17479 (_1!9391 BitStream!8192) (_2!9391 (_ BitVec 64))) )
))
(declare-fun lt!319275 () tuple2!17478)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8192 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17478)

(assert (=> b!204303 (= lt!319275 (readNBitsLSBFirstsLoopPure!0 (_1!9390 lt!319265) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!319276))))

(declare-fun lt!319307 () (_ BitVec 64))

(assert (=> b!204303 (= lt!319307 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!319270 () Unit!14542)

(assert (=> b!204303 (= lt!319270 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9381 lt!319278) (buf!5047 (_2!9381 lt!319297)) lt!319307))))

(assert (=> b!204303 (validate_offset_bits!1 ((_ sign_extend 32) (size!4542 (buf!5047 (_2!9381 lt!319297)))) ((_ sign_extend 32) (currentByte!9523 (_2!9381 lt!319278))) ((_ sign_extend 32) (currentBit!9518 (_2!9381 lt!319278))) lt!319307)))

(declare-fun lt!319305 () Unit!14542)

(assert (=> b!204303 (= lt!319305 lt!319270)))

(declare-fun lt!319272 () tuple2!17478)

(assert (=> b!204303 (= lt!319272 (readNBitsLSBFirstsLoopPure!0 (_1!9390 lt!319308) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!319276 (ite (_2!9382 lt!319279) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!319283 () tuple2!17478)

(assert (=> b!204303 (= lt!319283 (readNBitsLSBFirstsLoopPure!0 (_1!9390 lt!319265) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!319276))))

(declare-fun c!10133 () Bool)

(assert (=> b!204303 (= c!10133 (_2!9382 (readBitPure!0 (_1!9390 lt!319265))))))

(declare-fun lt!319271 () tuple2!17478)

(declare-fun e!139920 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8192 (_ BitVec 64)) BitStream!8192)

(assert (=> b!204303 (= lt!319271 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9390 lt!319265) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!319276 e!139920)))))

(declare-fun lt!319298 () Unit!14542)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8192 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14542)

(assert (=> b!204303 (= lt!319298 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9390 lt!319265) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!319276))))

(assert (=> b!204303 (and (= (_2!9391 lt!319283) (_2!9391 lt!319271)) (= (_1!9391 lt!319283) (_1!9391 lt!319271)))))

(declare-fun lt!319264 () Unit!14542)

(assert (=> b!204303 (= lt!319264 lt!319298)))

(assert (=> b!204303 (= (_1!9390 lt!319265) (withMovedBitIndex!0 (_2!9390 lt!319265) (bvsub (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!318648))) (currentByte!9523 (_2!9381 lt!318648)) (currentBit!9518 (_2!9381 lt!318648))) (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!319297))) (currentByte!9523 (_2!9381 lt!319297)) (currentBit!9518 (_2!9381 lt!319297))))))))

(declare-fun lt!319316 () Unit!14542)

(declare-fun Unit!14567 () Unit!14542)

(assert (=> b!204303 (= lt!319316 Unit!14567)))

(assert (=> b!204303 (= (_1!9390 lt!319308) (withMovedBitIndex!0 (_2!9390 lt!319308) (bvsub (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!319278))) (currentByte!9523 (_2!9381 lt!319278)) (currentBit!9518 (_2!9381 lt!319278))) (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!319297))) (currentByte!9523 (_2!9381 lt!319297)) (currentBit!9518 (_2!9381 lt!319297))))))))

(declare-fun lt!319277 () Unit!14542)

(declare-fun Unit!14568 () Unit!14542)

(assert (=> b!204303 (= lt!319277 Unit!14568)))

(assert (=> b!204303 (= (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!318648))) (currentByte!9523 (_2!9381 lt!318648)) (currentBit!9518 (_2!9381 lt!318648))) (bvsub (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!319278))) (currentByte!9523 (_2!9381 lt!319278)) (currentBit!9518 (_2!9381 lt!319278))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!319292 () Unit!14542)

(declare-fun Unit!14569 () Unit!14542)

(assert (=> b!204303 (= lt!319292 Unit!14569)))

(assert (=> b!204303 (= (_2!9391 lt!319275) (_2!9391 lt!319272))))

(declare-fun lt!319299 () Unit!14542)

(declare-fun Unit!14570 () Unit!14542)

(assert (=> b!204303 (= lt!319299 Unit!14570)))

(assert (=> b!204303 (invariant!0 (currentBit!9518 (_2!9381 lt!319297)) (currentByte!9523 (_2!9381 lt!319297)) (size!4542 (buf!5047 (_2!9381 lt!319297))))))

(declare-fun lt!319319 () Unit!14542)

(declare-fun Unit!14571 () Unit!14542)

(assert (=> b!204303 (= lt!319319 Unit!14571)))

(assert (=> b!204303 (= (size!4542 (buf!5047 (_2!9381 lt!318648))) (size!4542 (buf!5047 (_2!9381 lt!319297))))))

(declare-fun lt!319287 () Unit!14542)

(declare-fun Unit!14572 () Unit!14542)

(assert (=> b!204303 (= lt!319287 Unit!14572)))

(assert (=> b!204303 (= (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!319297))) (currentByte!9523 (_2!9381 lt!319297)) (currentBit!9518 (_2!9381 lt!319297))) (bvsub (bvadd (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!318648))) (currentByte!9523 (_2!9381 lt!318648)) (currentBit!9518 (_2!9381 lt!318648))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319313 () Unit!14542)

(declare-fun Unit!14573 () Unit!14542)

(assert (=> b!204303 (= lt!319313 Unit!14573)))

(declare-fun lt!319290 () Unit!14542)

(declare-fun Unit!14574 () Unit!14542)

(assert (=> b!204303 (= lt!319290 Unit!14574)))

(declare-fun lt!319311 () tuple2!17476)

(assert (=> b!204303 (= lt!319311 (reader!0 (_2!9381 lt!318648) (_2!9381 lt!319297)))))

(declare-fun lt!319312 () (_ BitVec 64))

(assert (=> b!204303 (= lt!319312 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319295 () Unit!14542)

(assert (=> b!204303 (= lt!319295 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9381 lt!318648) (buf!5047 (_2!9381 lt!319297)) lt!319312))))

(assert (=> b!204303 (validate_offset_bits!1 ((_ sign_extend 32) (size!4542 (buf!5047 (_2!9381 lt!319297)))) ((_ sign_extend 32) (currentByte!9523 (_2!9381 lt!318648))) ((_ sign_extend 32) (currentBit!9518 (_2!9381 lt!318648))) lt!319312)))

(declare-fun lt!319269 () Unit!14542)

(assert (=> b!204303 (= lt!319269 lt!319295)))

(declare-fun lt!319285 () tuple2!17478)

(assert (=> b!204303 (= lt!319285 (readNBitsLSBFirstsLoopPure!0 (_1!9390 lt!319311) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!171192 () Bool)

(assert (=> b!204303 (= res!171192 (= (_2!9391 lt!319285) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!139918 () Bool)

(assert (=> b!204303 (=> (not res!171192) (not e!139918))))

(assert (=> b!204303 e!139918))

(declare-fun lt!319281 () Unit!14542)

(declare-fun Unit!14575 () Unit!14542)

(assert (=> b!204303 (= lt!319281 Unit!14575)))

(declare-fun b!204304 () Bool)

(assert (=> b!204304 (= e!139920 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!204305 () Bool)

(declare-fun res!171191 () Bool)

(declare-fun e!139921 () Bool)

(assert (=> b!204305 (=> (not res!171191) (not e!139921))))

(declare-fun lt!319309 () tuple2!17458)

(assert (=> b!204305 (= res!171191 (= (size!4542 (buf!5047 (_2!9381 lt!318648))) (size!4542 (buf!5047 (_2!9381 lt!319309)))))))

(declare-fun b!204306 () Bool)

(assert (=> b!204306 (= e!139924 (= (_2!9382 lt!319296) (_2!9382 lt!319306)))))

(declare-fun b!204307 () Bool)

(assert (=> b!204307 (= e!139920 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!204309 () Bool)

(assert (=> b!204309 (= e!139918 (= (_1!9391 lt!319285) (_2!9390 lt!319311)))))

(declare-fun b!204310 () Bool)

(declare-fun res!171188 () Bool)

(assert (=> b!204310 (= res!171188 call!3234)))

(assert (=> b!204310 (=> (not res!171188) (not e!139919))))

(declare-fun b!204311 () Bool)

(declare-fun res!171187 () Bool)

(assert (=> b!204311 (=> (not res!171187) (not e!139921))))

(assert (=> b!204311 (= res!171187 (isPrefixOf!0 (_2!9381 lt!318648) (_2!9381 lt!319309)))))

(declare-fun b!204312 () Bool)

(declare-fun Unit!14576 () Unit!14542)

(assert (=> b!204312 (= e!139922 (tuple2!17459 Unit!14576 (_2!9381 lt!318648)))))

(declare-fun lt!319301 () Unit!14542)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8192) Unit!14542)

(assert (=> b!204312 (= lt!319301 (lemmaIsPrefixRefl!0 (_2!9381 lt!318648)))))

(assert (=> b!204312 call!3234))

(declare-fun lt!319288 () Unit!14542)

(assert (=> b!204312 (= lt!319288 lt!319301)))

(declare-fun b!204313 () Bool)

(declare-fun lt!319280 () tuple2!17460)

(assert (=> b!204313 (= lt!319280 (readBitPure!0 (readerFrom!0 (_2!9381 lt!319282) (currentBit!9518 (_2!9381 lt!318648)) (currentByte!9523 (_2!9381 lt!318648)))))))

(declare-fun res!171197 () Bool)

(assert (=> b!204313 (= res!171197 (and (= (_2!9382 lt!319280) lt!319286) (= (_1!9382 lt!319280) (_2!9381 lt!319282))))))

(declare-fun e!139923 () Bool)

(assert (=> b!204313 (=> (not res!171197) (not e!139923))))

(assert (=> b!204313 (= e!139919 e!139923)))

(declare-fun b!204314 () Bool)

(declare-fun e!139925 () Bool)

(declare-fun lt!319310 () (_ BitVec 64))

(assert (=> b!204314 (= e!139925 (validate_offset_bits!1 ((_ sign_extend 32) (size!4542 (buf!5047 (_2!9381 lt!318648)))) ((_ sign_extend 32) (currentByte!9523 (_2!9381 lt!318648))) ((_ sign_extend 32) (currentBit!9518 (_2!9381 lt!318648))) lt!319310))))

(declare-fun b!204315 () Bool)

(assert (=> b!204315 (= e!139923 (= (bitIndex!0 (size!4542 (buf!5047 (_1!9382 lt!319280))) (currentByte!9523 (_1!9382 lt!319280)) (currentBit!9518 (_1!9382 lt!319280))) (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!319282))) (currentByte!9523 (_2!9381 lt!319282)) (currentBit!9518 (_2!9381 lt!319282)))))))

(declare-fun b!204316 () Bool)

(declare-fun e!139926 () Bool)

(assert (=> b!204316 (= e!139921 e!139926)))

(declare-fun res!171190 () Bool)

(assert (=> b!204316 (=> (not res!171190) (not e!139926))))

(declare-fun lt!319294 () tuple2!17478)

(assert (=> b!204316 (= res!171190 (= (_2!9391 lt!319294) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!319303 () tuple2!17476)

(assert (=> b!204316 (= lt!319294 (readNBitsLSBFirstsLoopPure!0 (_1!9390 lt!319303) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!319300 () Unit!14542)

(declare-fun lt!319291 () Unit!14542)

(assert (=> b!204316 (= lt!319300 lt!319291)))

(assert (=> b!204316 (validate_offset_bits!1 ((_ sign_extend 32) (size!4542 (buf!5047 (_2!9381 lt!319309)))) ((_ sign_extend 32) (currentByte!9523 (_2!9381 lt!318648))) ((_ sign_extend 32) (currentBit!9518 (_2!9381 lt!318648))) lt!319310)))

(assert (=> b!204316 (= lt!319291 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9381 lt!318648) (buf!5047 (_2!9381 lt!319309)) lt!319310))))

(assert (=> b!204316 e!139925))

(declare-fun res!171189 () Bool)

(assert (=> b!204316 (=> (not res!171189) (not e!139925))))

(assert (=> b!204316 (= res!171189 (and (= (size!4542 (buf!5047 (_2!9381 lt!318648))) (size!4542 (buf!5047 (_2!9381 lt!319309)))) (bvsge lt!319310 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204316 (= lt!319310 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!204316 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!204316 (= lt!319303 (reader!0 (_2!9381 lt!318648) (_2!9381 lt!319309)))))

(declare-fun b!204317 () Bool)

(declare-fun res!171196 () Bool)

(assert (=> b!204317 (=> (not res!171196) (not e!139921))))

(declare-fun lt!319302 () (_ BitVec 64))

(declare-fun lt!319293 () (_ BitVec 64))

(assert (=> b!204317 (= res!171196 (= (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!319309))) (currentByte!9523 (_2!9381 lt!319309)) (currentBit!9518 (_2!9381 lt!319309))) (bvsub lt!319293 lt!319302)))))

(assert (=> b!204317 (or (= (bvand lt!319293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319302 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!319293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!319293 lt!319302) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204317 (= lt!319302 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!319284 () (_ BitVec 64))

(declare-fun lt!319268 () (_ BitVec 64))

(assert (=> b!204317 (= lt!319293 (bvadd lt!319284 lt!319268))))

(assert (=> b!204317 (or (not (= (bvand lt!319284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319268 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!319284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!319284 lt!319268) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204317 (= lt!319268 ((_ sign_extend 32) nBits!348))))

(assert (=> b!204317 (= lt!319284 (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!318648))) (currentByte!9523 (_2!9381 lt!318648)) (currentBit!9518 (_2!9381 lt!318648))))))

(declare-fun b!204318 () Bool)

(declare-fun res!171194 () Bool)

(assert (=> b!204318 (= res!171194 (= (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!319282))) (currentByte!9523 (_2!9381 lt!319282)) (currentBit!9518 (_2!9381 lt!319282))) (bvadd (bitIndex!0 (size!4542 (buf!5047 (_2!9381 lt!318648))) (currentByte!9523 (_2!9381 lt!318648)) (currentBit!9518 (_2!9381 lt!318648))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!204318 (=> (not res!171194) (not e!139919))))

(declare-fun b!204308 () Bool)

(assert (=> b!204308 (= e!139926 (= (_1!9391 lt!319294) (_2!9390 lt!319303)))))

(declare-fun d!69729 () Bool)

(assert (=> d!69729 e!139921))

(declare-fun res!171186 () Bool)

(assert (=> d!69729 (=> (not res!171186) (not e!139921))))

(assert (=> d!69729 (= res!171186 (invariant!0 (currentBit!9518 (_2!9381 lt!319309)) (currentByte!9523 (_2!9381 lt!319309)) (size!4542 (buf!5047 (_2!9381 lt!319309)))))))

(assert (=> d!69729 (= lt!319309 e!139922)))

(assert (=> d!69729 (= c!10132 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69729 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69729 (= (appendBitsLSBFirstLoopTR!0 (_2!9381 lt!318648) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!319309)))

(assert (= (and d!69729 c!10132) b!204312))

(assert (= (and d!69729 (not c!10132)) b!204303))

(assert (= (and b!204303 res!171195) b!204318))

(assert (= (and b!204318 res!171194) b!204310))

(assert (= (and b!204310 res!171188) b!204313))

(assert (= (and b!204313 res!171197) b!204315))

(assert (= (and b!204303 res!171193) b!204306))

(assert (= (and b!204303 c!10133) b!204307))

(assert (= (and b!204303 (not c!10133)) b!204304))

(assert (= (and b!204303 res!171192) b!204309))

(assert (= (or b!204312 b!204310) bm!3231))

(assert (= (and d!69729 res!171186) b!204305))

(assert (= (and b!204305 res!171191) b!204317))

(assert (= (and b!204317 res!171196) b!204311))

(assert (= (and b!204311 res!171187) b!204316))

(assert (= (and b!204316 res!171189) b!204314))

(assert (= (and b!204316 res!171190) b!204308))

(declare-fun m!315401 () Bool)

(assert (=> b!204312 m!315401))

(declare-fun m!315403 () Bool)

(assert (=> b!204315 m!315403))

(declare-fun m!315405 () Bool)

(assert (=> b!204315 m!315405))

(declare-fun m!315407 () Bool)

(assert (=> b!204303 m!315407))

(declare-fun m!315409 () Bool)

(assert (=> b!204303 m!315409))

(declare-fun m!315411 () Bool)

(assert (=> b!204303 m!315411))

(declare-fun m!315413 () Bool)

(assert (=> b!204303 m!315413))

(declare-fun m!315415 () Bool)

(assert (=> b!204303 m!315415))

(declare-fun m!315417 () Bool)

(assert (=> b!204303 m!315417))

(declare-fun m!315419 () Bool)

(assert (=> b!204303 m!315419))

(declare-fun m!315421 () Bool)

(assert (=> b!204303 m!315421))

(declare-fun m!315423 () Bool)

(assert (=> b!204303 m!315423))

(declare-fun m!315425 () Bool)

(assert (=> b!204303 m!315425))

(declare-fun m!315427 () Bool)

(assert (=> b!204303 m!315427))

(declare-fun m!315429 () Bool)

(assert (=> b!204303 m!315429))

(declare-fun m!315431 () Bool)

(assert (=> b!204303 m!315431))

(declare-fun m!315433 () Bool)

(assert (=> b!204303 m!315433))

(declare-fun m!315435 () Bool)

(assert (=> b!204303 m!315435))

(declare-fun m!315437 () Bool)

(assert (=> b!204303 m!315437))

(declare-fun m!315439 () Bool)

(assert (=> b!204303 m!315439))

(declare-fun m!315441 () Bool)

(assert (=> b!204303 m!315441))

(declare-fun m!315443 () Bool)

(assert (=> b!204303 m!315443))

(declare-fun m!315445 () Bool)

(assert (=> b!204303 m!315445))

(declare-fun m!315447 () Bool)

(assert (=> b!204303 m!315447))

(declare-fun m!315449 () Bool)

(assert (=> b!204303 m!315449))

(declare-fun m!315451 () Bool)

(assert (=> b!204303 m!315451))

(assert (=> b!204303 m!315073))

(assert (=> b!204303 m!315413))

(declare-fun m!315453 () Bool)

(assert (=> b!204303 m!315453))

(declare-fun m!315455 () Bool)

(assert (=> b!204303 m!315455))

(declare-fun m!315457 () Bool)

(assert (=> b!204303 m!315457))

(declare-fun m!315459 () Bool)

(assert (=> b!204303 m!315459))

(declare-fun m!315461 () Bool)

(assert (=> b!204303 m!315461))

(declare-fun m!315463 () Bool)

(assert (=> b!204303 m!315463))

(declare-fun m!315465 () Bool)

(assert (=> b!204303 m!315465))

(declare-fun m!315467 () Bool)

(assert (=> b!204303 m!315467))

(declare-fun m!315469 () Bool)

(assert (=> b!204303 m!315469))

(declare-fun m!315471 () Bool)

(assert (=> b!204303 m!315471))

(declare-fun m!315473 () Bool)

(assert (=> b!204317 m!315473))

(assert (=> b!204317 m!315073))

(declare-fun m!315475 () Bool)

(assert (=> d!69729 m!315475))

(assert (=> b!204318 m!315405))

(assert (=> b!204318 m!315073))

(assert (=> b!204316 m!315415))

(declare-fun m!315477 () Bool)

(assert (=> b!204316 m!315477))

(declare-fun m!315479 () Bool)

(assert (=> b!204316 m!315479))

(assert (=> b!204316 m!315467))

(declare-fun m!315481 () Bool)

(assert (=> b!204316 m!315481))

(declare-fun m!315483 () Bool)

(assert (=> b!204316 m!315483))

(declare-fun m!315485 () Bool)

(assert (=> b!204313 m!315485))

(assert (=> b!204313 m!315485))

(declare-fun m!315487 () Bool)

(assert (=> b!204313 m!315487))

(declare-fun m!315489 () Bool)

(assert (=> b!204314 m!315489))

(declare-fun m!315491 () Bool)

(assert (=> b!204311 m!315491))

(declare-fun m!315493 () Bool)

(assert (=> bm!3231 m!315493))

(assert (=> b!204051 d!69729))

(declare-fun d!69737 () Bool)

(assert (=> d!69737 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9518 thiss!1204) (currentByte!9523 thiss!1204) (size!4542 (buf!5047 thiss!1204))))))

(declare-fun bs!17164 () Bool)

(assert (= bs!17164 d!69737))

(assert (=> bs!17164 m!315085))

(assert (=> start!43264 d!69737))

(assert (=> b!204046 d!69689))

(assert (=> b!204046 d!69705))

(declare-fun d!69739 () Bool)

(assert (=> d!69739 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4542 (buf!5047 thiss!1204))) ((_ sign_extend 32) (currentByte!9523 thiss!1204)) ((_ sign_extend 32) (currentBit!9518 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4542 (buf!5047 thiss!1204))) ((_ sign_extend 32) (currentByte!9523 thiss!1204)) ((_ sign_extend 32) (currentBit!9518 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17165 () Bool)

(assert (= bs!17165 d!69739))

(assert (=> bs!17165 m!315167))

(assert (=> b!204045 d!69739))

(push 1)

(assert (not b!204151))

(assert (not bm!3231))

(assert (not b!204317))

(assert (not d!69727))

(assert (not b!204311))

(assert (not d!69737))

(assert (not b!204149))

(assert (not b!204303))

(assert (not b!204154))

(assert (not b!204318))

(assert (not b!204161))

(assert (not b!204316))

(assert (not d!69689))

(assert (not b!204312))

(assert (not d!69713))

(assert (not b!204314))

(assert (not d!69729))

(assert (not b!204142))

(assert (not b!204315))

(assert (not b!204159))

(assert (not b!204140))

(assert (not d!69707))

(assert (not b!204139))

(assert (not d!69723))

(assert (not b!204141))

(assert (not d!69739))

(assert (not d!69705))

(assert (not b!204313))

(assert (not d!69715))

(assert (not d!69719))

(check-sat)

(pop 1)

(push 1)

(check-sat)

