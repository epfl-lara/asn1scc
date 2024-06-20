; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72204 () Bool)

(assert start!72204)

(declare-fun b!323800 () Bool)

(declare-fun res!265823 () Bool)

(declare-fun e!233259 () Bool)

(assert (=> b!323800 (=> res!265823 e!233259)))

(declare-fun lt!446210 () (_ BitVec 64))

(declare-datatypes ((array!20696 0))(
  ( (array!20697 (arr!10101 (Array (_ BitVec 32) (_ BitVec 8))) (size!9009 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14180 0))(
  ( (BitStream!14181 (buf!8151 array!20696) (currentByte!15028 (_ BitVec 32)) (currentBit!15023 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23732 0))(
  ( (tuple2!23733 (_1!13495 (_ BitVec 64)) (_2!13495 BitStream!14180)) )
))
(declare-fun lt!446213 () tuple2!23732)

(declare-fun thiss!1793 () BitStream!14180)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323800 (= res!265823 (not (= (bitIndex!0 (size!9009 (buf!8151 (_2!13495 lt!446213))) (currentByte!15028 (_2!13495 lt!446213)) (currentBit!15023 (_2!13495 lt!446213))) (bvadd (bitIndex!0 (size!9009 (buf!8151 thiss!1793)) (currentByte!15028 thiss!1793) (currentBit!15023 thiss!1793)) lt!446210))))))

(declare-fun b!323801 () Bool)

(declare-fun e!233260 () Bool)

(declare-fun e!233265 () Bool)

(assert (=> b!323801 (= e!233260 e!233265)))

(declare-fun res!265821 () Bool)

(assert (=> b!323801 (=> (not res!265821) (not e!233265))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323801 (= res!265821 (validate_offset_bits!1 ((_ sign_extend 32) (size!9009 (buf!8151 thiss!1793))) ((_ sign_extend 32) (currentByte!15028 thiss!1793)) ((_ sign_extend 32) (currentBit!15023 thiss!1793)) lt!446210))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun i!743 () (_ BitVec 32))

(assert (=> b!323801 (= lt!446210 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun res!265824 () Bool)

(assert (=> start!72204 (=> (not res!265824) (not e!233260))))

(assert (=> start!72204 (= res!265824 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72204 e!233260))

(assert (=> start!72204 true))

(declare-fun e!233263 () Bool)

(declare-fun inv!12 (BitStream!14180) Bool)

(assert (=> start!72204 (and (inv!12 thiss!1793) e!233263)))

(declare-fun b!323802 () Bool)

(declare-fun res!265819 () Bool)

(assert (=> b!323802 (=> (not res!265819) (not e!233265))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323802 (= res!265819 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323803 () Bool)

(assert (=> b!323803 (= e!233265 e!233259)))

(declare-fun res!265825 () Bool)

(assert (=> b!323803 (=> res!265825 e!233259)))

(assert (=> b!323803 (= res!265825 (not (= (buf!8151 (_2!13495 lt!446213)) (buf!8151 thiss!1793))))))

(declare-datatypes ((tuple2!23734 0))(
  ( (tuple2!23735 (_1!13496 Bool) (_2!13496 BitStream!14180)) )
))
(declare-fun lt!446211 () tuple2!23734)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23732)

(assert (=> b!323803 (= lt!446213 (readNBitsLSBFirstsLoop!0 (_2!13496 lt!446211) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13496 lt!446211) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14180) tuple2!23734)

(assert (=> b!323803 (= lt!446211 (readBit!0 thiss!1793))))

(declare-fun e!233264 () Bool)

(declare-fun b!323804 () Bool)

(declare-datatypes ((tuple2!23736 0))(
  ( (tuple2!23737 (_1!13497 BitStream!14180) (_2!13497 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!14180) tuple2!23736)

(assert (=> b!323804 (= e!233264 (not (= (= (bvand (bvlshr (_1!13495 lt!446213) ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13497 (readBitPure!0 thiss!1793)))))))

(declare-fun b!323805 () Bool)

(declare-fun res!265817 () Bool)

(declare-fun e!233262 () Bool)

(assert (=> b!323805 (=> res!265817 e!233262)))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323805 (= res!265817 (not (= (bvand (_1!13495 lt!446213) (onesLSBLong!0 nBits!548)) (_1!13495 lt!446213))))))

(declare-fun b!323806 () Bool)

(assert (=> b!323806 (= e!233259 e!233262)))

(declare-fun res!265820 () Bool)

(assert (=> b!323806 (=> res!265820 e!233262)))

(declare-fun lt!446212 () (_ BitVec 64))

(assert (=> b!323806 (= res!265820 (not (= (bvand (_1!13495 lt!446213) lt!446212) (bvand acc!161 lt!446212))))))

(assert (=> b!323806 (= lt!446212 (onesLSBLong!0 i!743))))

(declare-fun b!323807 () Bool)

(declare-fun res!265818 () Bool)

(assert (=> b!323807 (=> (not res!265818) (not e!233265))))

(assert (=> b!323807 (= res!265818 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!323808 () Bool)

(declare-fun array_inv!8561 (array!20696) Bool)

(assert (=> b!323808 (= e!233263 (array_inv!8561 (buf!8151 thiss!1793)))))

(declare-fun b!323809 () Bool)

(assert (=> b!323809 (= e!233262 e!233264)))

(declare-fun res!265822 () Bool)

(assert (=> b!323809 (=> (not res!265822) (not e!233264))))

(assert (=> b!323809 (= res!265822 (bvslt i!743 nBits!548))))

(assert (= (and start!72204 res!265824) b!323801))

(assert (= (and b!323801 res!265821) b!323802))

(assert (= (and b!323802 res!265819) b!323807))

(assert (= (and b!323807 res!265818) b!323803))

(assert (= (and b!323803 (not res!265825)) b!323800))

(assert (= (and b!323800 (not res!265823)) b!323806))

(assert (= (and b!323806 (not res!265820)) b!323805))

(assert (= (and b!323805 (not res!265817)) b!323809))

(assert (= (and b!323809 res!265822) b!323804))

(assert (= start!72204 b!323808))

(declare-fun m!461789 () Bool)

(assert (=> b!323800 m!461789))

(declare-fun m!461791 () Bool)

(assert (=> b!323800 m!461791))

(declare-fun m!461793 () Bool)

(assert (=> start!72204 m!461793))

(declare-fun m!461795 () Bool)

(assert (=> b!323808 m!461795))

(declare-fun m!461797 () Bool)

(assert (=> b!323806 m!461797))

(declare-fun m!461799 () Bool)

(assert (=> b!323805 m!461799))

(declare-fun m!461801 () Bool)

(assert (=> b!323804 m!461801))

(declare-fun m!461803 () Bool)

(assert (=> b!323802 m!461803))

(declare-fun m!461805 () Bool)

(assert (=> b!323803 m!461805))

(declare-fun m!461807 () Bool)

(assert (=> b!323803 m!461807))

(declare-fun m!461809 () Bool)

(assert (=> b!323801 m!461809))

(push 1)

(assert (not b!323805))

(assert (not b!323801))

(assert (not b!323808))

(assert (not b!323800))

(assert (not b!323803))

(assert (not start!72204))

(assert (not b!323806))

(assert (not b!323802))

(assert (not b!323804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106128 () Bool)

(assert (=> d!106128 (= (onesLSBLong!0 i!743) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!743))))))

(assert (=> b!323806 d!106128))

(declare-fun d!106130 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106130 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!9009 (buf!8151 thiss!1793))) ((_ sign_extend 32) (currentByte!15028 thiss!1793)) ((_ sign_extend 32) (currentBit!15023 thiss!1793)) lt!446210) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9009 (buf!8151 thiss!1793))) ((_ sign_extend 32) (currentByte!15028 thiss!1793)) ((_ sign_extend 32) (currentBit!15023 thiss!1793))) lt!446210))))

(declare-fun bs!27961 () Bool)

(assert (= bs!27961 d!106130))

(declare-fun m!461819 () Bool)

(assert (=> bs!27961 m!461819))

(assert (=> b!323801 d!106130))

(declare-fun d!106132 () Bool)

(declare-fun e!233291 () Bool)

(assert (=> d!106132 e!233291))

(declare-fun res!265869 () Bool)

(assert (=> d!106132 (=> (not res!265869) (not e!233291))))

(declare-fun lt!446291 () (_ BitVec 64))

(declare-fun lt!446286 () (_ BitVec 64))

(declare-fun lt!446289 () (_ BitVec 64))

(assert (=> d!106132 (= res!265869 (= lt!446289 (bvsub lt!446291 lt!446286)))))

(assert (=> d!106132 (or (= (bvand lt!446291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446286 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446291 lt!446286) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106132 (= lt!446286 (remainingBits!0 ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13495 lt!446213)))) ((_ sign_extend 32) (currentByte!15028 (_2!13495 lt!446213))) ((_ sign_extend 32) (currentBit!15023 (_2!13495 lt!446213)))))))

(declare-fun lt!446287 () (_ BitVec 64))

(declare-fun lt!446290 () (_ BitVec 64))

(assert (=> d!106132 (= lt!446291 (bvmul lt!446287 lt!446290))))

(assert (=> d!106132 (or (= lt!446287 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446290 (bvsdiv (bvmul lt!446287 lt!446290) lt!446287)))))

(assert (=> d!106132 (= lt!446290 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106132 (= lt!446287 ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13495 lt!446213)))))))

(assert (=> d!106132 (= lt!446289 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15028 (_2!13495 lt!446213))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15023 (_2!13495 lt!446213)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106132 (invariant!0 (currentBit!15023 (_2!13495 lt!446213)) (currentByte!15028 (_2!13495 lt!446213)) (size!9009 (buf!8151 (_2!13495 lt!446213))))))

(assert (=> d!106132 (= (bitIndex!0 (size!9009 (buf!8151 (_2!13495 lt!446213))) (currentByte!15028 (_2!13495 lt!446213)) (currentBit!15023 (_2!13495 lt!446213))) lt!446289)))

(declare-fun b!323864 () Bool)

(declare-fun res!265868 () Bool)

(assert (=> b!323864 (=> (not res!265868) (not e!233291))))

(assert (=> b!323864 (= res!265868 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446289))))

(declare-fun b!323865 () Bool)

(declare-fun lt!446288 () (_ BitVec 64))

(assert (=> b!323865 (= e!233291 (bvsle lt!446289 (bvmul lt!446288 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323865 (or (= lt!446288 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446288 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446288)))))

(assert (=> b!323865 (= lt!446288 ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13495 lt!446213)))))))

(assert (= (and d!106132 res!265869) b!323864))

(assert (= (and b!323864 res!265868) b!323865))

(declare-fun m!461845 () Bool)

(assert (=> d!106132 m!461845))

(declare-fun m!461847 () Bool)

(assert (=> d!106132 m!461847))

(assert (=> b!323800 d!106132))

(declare-fun d!106138 () Bool)

(declare-fun e!233294 () Bool)

(assert (=> d!106138 e!233294))

(declare-fun res!265871 () Bool)

(assert (=> d!106138 (=> (not res!265871) (not e!233294))))

(declare-fun lt!446297 () (_ BitVec 64))

(declare-fun lt!446295 () (_ BitVec 64))

(declare-fun lt!446292 () (_ BitVec 64))

(assert (=> d!106138 (= res!265871 (= lt!446295 (bvsub lt!446297 lt!446292)))))

(assert (=> d!106138 (or (= (bvand lt!446297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446292 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446297 lt!446292) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106138 (= lt!446292 (remainingBits!0 ((_ sign_extend 32) (size!9009 (buf!8151 thiss!1793))) ((_ sign_extend 32) (currentByte!15028 thiss!1793)) ((_ sign_extend 32) (currentBit!15023 thiss!1793))))))

(declare-fun lt!446293 () (_ BitVec 64))

(declare-fun lt!446296 () (_ BitVec 64))

(assert (=> d!106138 (= lt!446297 (bvmul lt!446293 lt!446296))))

(assert (=> d!106138 (or (= lt!446293 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446296 (bvsdiv (bvmul lt!446293 lt!446296) lt!446293)))))

(assert (=> d!106138 (= lt!446296 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106138 (= lt!446293 ((_ sign_extend 32) (size!9009 (buf!8151 thiss!1793))))))

(assert (=> d!106138 (= lt!446295 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15028 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15023 thiss!1793))))))

(assert (=> d!106138 (invariant!0 (currentBit!15023 thiss!1793) (currentByte!15028 thiss!1793) (size!9009 (buf!8151 thiss!1793)))))

(assert (=> d!106138 (= (bitIndex!0 (size!9009 (buf!8151 thiss!1793)) (currentByte!15028 thiss!1793) (currentBit!15023 thiss!1793)) lt!446295)))

(declare-fun b!323866 () Bool)

(declare-fun res!265870 () Bool)

(assert (=> b!323866 (=> (not res!265870) (not e!233294))))

(assert (=> b!323866 (= res!265870 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446295))))

(declare-fun b!323867 () Bool)

(declare-fun lt!446294 () (_ BitVec 64))

(assert (=> b!323867 (= e!233294 (bvsle lt!446295 (bvmul lt!446294 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323867 (or (= lt!446294 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446294 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446294)))))

(assert (=> b!323867 (= lt!446294 ((_ sign_extend 32) (size!9009 (buf!8151 thiss!1793))))))

(assert (= (and d!106138 res!265871) b!323866))

(assert (= (and b!323866 res!265870) b!323867))

(assert (=> d!106138 m!461819))

(declare-fun m!461849 () Bool)

(assert (=> d!106138 m!461849))

(assert (=> b!323800 d!106138))

(declare-fun d!106140 () Bool)

(assert (=> d!106140 (= (onesLSBLong!0 nBits!548) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!548))))))

(assert (=> b!323805 d!106140))

(declare-fun d!106142 () Bool)

(assert (=> d!106142 (= (inv!12 thiss!1793) (invariant!0 (currentBit!15023 thiss!1793) (currentByte!15028 thiss!1793) (size!9009 (buf!8151 thiss!1793))))))

(declare-fun bs!27962 () Bool)

(assert (= bs!27962 d!106142))

(assert (=> bs!27962 m!461849))

(assert (=> start!72204 d!106142))

(declare-fun d!106144 () Bool)

(declare-fun lt!446300 () tuple2!23734)

(assert (=> d!106144 (= lt!446300 (readBit!0 thiss!1793))))

(assert (=> d!106144 (= (readBitPure!0 thiss!1793) (tuple2!23737 (_2!13496 lt!446300) (_1!13496 lt!446300)))))

(declare-fun bs!27963 () Bool)

(assert (= bs!27963 d!106144))

(assert (=> bs!27963 m!461807))

(assert (=> b!323804 d!106144))

(declare-fun d!106146 () Bool)

(assert (=> d!106146 (= (array_inv!8561 (buf!8151 thiss!1793)) (bvsge (size!9009 (buf!8151 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!323808 d!106146))

(declare-fun b!323896 () Bool)

(declare-fun e!233316 () tuple2!23732)

(declare-fun lt!446386 () tuple2!23732)

(assert (=> b!323896 (= e!233316 (tuple2!23733 (_1!13495 lt!446386) (_2!13495 lt!446386)))))

(declare-fun lt!446384 () tuple2!23734)

(assert (=> b!323896 (= lt!446384 (readBit!0 (_2!13496 lt!446211)))))

(assert (=> b!323896 (= lt!446386 (readNBitsLSBFirstsLoop!0 (_2!13496 lt!446384) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13496 lt!446211) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13496 lt!446384) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!446383 () (_ BitVec 64))

(declare-fun b!323897 () Bool)

(declare-fun e!233318 () Bool)

(declare-fun lt!446387 () tuple2!23732)

(assert (=> b!323897 (= e!233318 (= (= (bvand (bvlshr (_1!13495 lt!446387) lt!446383) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13497 (readBitPure!0 (_2!13496 lt!446211)))))))

(assert (=> b!323897 (and (bvsge lt!446383 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!446383 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!323897 (= lt!446383 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743)))))

(declare-fun b!323898 () Bool)

(assert (=> b!323898 (= e!233316 (tuple2!23733 (bvor acc!161 (ite (_1!13496 lt!446211) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13496 lt!446211)))))

(declare-fun b!323899 () Bool)

(declare-fun res!265898 () Bool)

(declare-fun e!233317 () Bool)

(assert (=> b!323899 (=> (not res!265898) (not e!233317))))

(assert (=> b!323899 (= res!265898 (= (bvand (_1!13495 lt!446387) (onesLSBLong!0 nBits!548)) (_1!13495 lt!446387)))))

(declare-fun b!323900 () Bool)

(declare-fun res!265900 () Bool)

(assert (=> b!323900 (=> (not res!265900) (not e!233317))))

(assert (=> b!323900 (= res!265900 (= (bvand (_1!13495 lt!446387) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743))) (bvand (bvor acc!161 (ite (_1!13496 lt!446211) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun b!323901 () Bool)

(declare-fun res!265896 () Bool)

(assert (=> b!323901 (=> (not res!265896) (not e!233317))))

(declare-fun lt!446385 () (_ BitVec 64))

(declare-fun lt!446382 () (_ BitVec 64))

(assert (=> b!323901 (= res!265896 (= (bitIndex!0 (size!9009 (buf!8151 (_2!13495 lt!446387))) (currentByte!15028 (_2!13495 lt!446387)) (currentBit!15023 (_2!13495 lt!446387))) (bvadd lt!446382 lt!446385)))))

(assert (=> b!323901 (or (not (= (bvand lt!446382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446385 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446382 lt!446385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323901 (= lt!446385 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))

(assert (=> b!323901 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) #b10000000000000000000000000000000)))))

(assert (=> b!323901 (= lt!446382 (bitIndex!0 (size!9009 (buf!8151 (_2!13496 lt!446211))) (currentByte!15028 (_2!13496 lt!446211)) (currentBit!15023 (_2!13496 lt!446211))))))

(declare-fun d!106148 () Bool)

(assert (=> d!106148 e!233317))

(declare-fun res!265899 () Bool)

(assert (=> d!106148 (=> (not res!265899) (not e!233317))))

(assert (=> d!106148 (= res!265899 (= (buf!8151 (_2!13495 lt!446387)) (buf!8151 (_2!13496 lt!446211))))))

(assert (=> d!106148 (= lt!446387 e!233316)))

(declare-fun c!15460 () Bool)

(assert (=> d!106148 (= c!15460 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))

(assert (=> d!106148 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!106148 (= (readNBitsLSBFirstsLoop!0 (_2!13496 lt!446211) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13496 lt!446211) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!446387)))

(declare-fun b!323902 () Bool)

(assert (=> b!323902 (= e!233317 e!233318)))

(declare-fun res!265897 () Bool)

(assert (=> b!323902 (=> res!265897 e!233318)))

(assert (=> b!323902 (= res!265897 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(assert (= (and d!106148 c!15460) b!323898))

(assert (= (and d!106148 (not c!15460)) b!323896))

(assert (= (and d!106148 res!265899) b!323901))

(assert (= (and b!323901 res!265896) b!323900))

(assert (= (and b!323900 res!265900) b!323899))

(assert (= (and b!323899 res!265898) b!323902))

(assert (= (and b!323902 (not res!265897)) b!323897))

(declare-fun m!461879 () Bool)

(assert (=> b!323897 m!461879))

(declare-fun m!461881 () Bool)

(assert (=> b!323901 m!461881))

(declare-fun m!461883 () Bool)

(assert (=> b!323901 m!461883))

(assert (=> b!323899 m!461799))

(declare-fun m!461885 () Bool)

(assert (=> b!323896 m!461885))

(declare-fun m!461887 () Bool)

(assert (=> b!323896 m!461887))

(declare-fun m!461889 () Bool)

(assert (=> b!323900 m!461889))

(assert (=> b!323803 d!106148))

(declare-fun d!106168 () Bool)

(declare-fun e!233325 () Bool)

(assert (=> d!106168 e!233325))

(declare-fun res!265903 () Bool)

(assert (=> d!106168 (=> (not res!265903) (not e!233325))))

(declare-datatypes ((Unit!22048 0))(
  ( (Unit!22049) )
))
(declare-datatypes ((tuple2!23742 0))(
  ( (tuple2!23743 (_1!13500 Unit!22048) (_2!13500 BitStream!14180)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14180) tuple2!23742)

(assert (=> d!106168 (= res!265903 (= (buf!8151 (_2!13500 (increaseBitIndex!0 thiss!1793))) (buf!8151 thiss!1793)))))

(declare-fun lt!446408 () Bool)

(assert (=> d!106168 (= lt!446408 (not (= (bvand ((_ sign_extend 24) (select (arr!10101 (buf!8151 thiss!1793)) (currentByte!15028 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15023 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446411 () tuple2!23734)

(assert (=> d!106168 (= lt!446411 (tuple2!23735 (not (= (bvand ((_ sign_extend 24) (select (arr!10101 (buf!8151 thiss!1793)) (currentByte!15028 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15023 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13500 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!106168 (validate_offset_bit!0 ((_ sign_extend 32) (size!9009 (buf!8151 thiss!1793))) ((_ sign_extend 32) (currentByte!15028 thiss!1793)) ((_ sign_extend 32) (currentBit!15023 thiss!1793)))))

(assert (=> d!106168 (= (readBit!0 thiss!1793) lt!446411)))

(declare-fun lt!446405 () (_ BitVec 64))

(declare-fun b!323905 () Bool)

(declare-fun lt!446409 () (_ BitVec 64))

(assert (=> b!323905 (= e!233325 (= (bitIndex!0 (size!9009 (buf!8151 (_2!13500 (increaseBitIndex!0 thiss!1793)))) (currentByte!15028 (_2!13500 (increaseBitIndex!0 thiss!1793))) (currentBit!15023 (_2!13500 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!446405 lt!446409)))))

(assert (=> b!323905 (or (not (= (bvand lt!446405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446409 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446405 lt!446409) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323905 (= lt!446409 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!323905 (= lt!446405 (bitIndex!0 (size!9009 (buf!8151 thiss!1793)) (currentByte!15028 thiss!1793) (currentBit!15023 thiss!1793)))))

(declare-fun lt!446406 () Bool)

(assert (=> b!323905 (= lt!446406 (not (= (bvand ((_ sign_extend 24) (select (arr!10101 (buf!8151 thiss!1793)) (currentByte!15028 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15023 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446410 () Bool)

(assert (=> b!323905 (= lt!446410 (not (= (bvand ((_ sign_extend 24) (select (arr!10101 (buf!8151 thiss!1793)) (currentByte!15028 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15023 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446407 () Bool)

(assert (=> b!323905 (= lt!446407 (not (= (bvand ((_ sign_extend 24) (select (arr!10101 (buf!8151 thiss!1793)) (currentByte!15028 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15023 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!106168 res!265903) b!323905))

(declare-fun m!461891 () Bool)

(assert (=> d!106168 m!461891))

(declare-fun m!461893 () Bool)

(assert (=> d!106168 m!461893))

(declare-fun m!461895 () Bool)

(assert (=> d!106168 m!461895))

(declare-fun m!461897 () Bool)

(assert (=> d!106168 m!461897))

(assert (=> b!323905 m!461791))

(assert (=> b!323905 m!461893))

(assert (=> b!323905 m!461895))

(assert (=> b!323905 m!461891))

(declare-fun m!461899 () Bool)

(assert (=> b!323905 m!461899))

(assert (=> b!323803 d!106168))

(declare-fun d!106172 () Bool)

(assert (=> d!106172 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!323802 d!106172))

(push 1)

(assert (not d!106168))

(assert (not b!323896))

(assert (not d!106130))

(assert (not b!323897))

(assert (not b!323901))

(assert (not b!323899))

(assert (not d!106142))

(assert (not b!323905))

(assert (not d!106144))

(assert (not d!106132))

(assert (not d!106138))

(assert (not b!323900))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106200 () Bool)

(declare-fun e!233338 () Bool)

(assert (=> d!106200 e!233338))

(declare-fun res!265926 () Bool)

(assert (=> d!106200 (=> (not res!265926) (not e!233338))))

(declare-fun lt!446471 () (_ BitVec 64))

(declare-fun lt!446473 () tuple2!23742)

(declare-fun lt!446469 () (_ BitVec 64))

(assert (=> d!106200 (= res!265926 (= (bvadd lt!446469 lt!446471) (bitIndex!0 (size!9009 (buf!8151 (_2!13500 lt!446473))) (currentByte!15028 (_2!13500 lt!446473)) (currentBit!15023 (_2!13500 lt!446473)))))))

(assert (=> d!106200 (or (not (= (bvand lt!446469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446471 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446469 lt!446471) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106200 (= lt!446471 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!106200 (= lt!446469 (bitIndex!0 (size!9009 (buf!8151 thiss!1793)) (currentByte!15028 thiss!1793) (currentBit!15023 thiss!1793)))))

(declare-fun Unit!22052 () Unit!22048)

(declare-fun Unit!22053 () Unit!22048)

(assert (=> d!106200 (= lt!446473 (ite (bvslt (currentBit!15023 thiss!1793) #b00000000000000000000000000000111) (tuple2!23743 Unit!22052 (BitStream!14181 (buf!8151 thiss!1793) (currentByte!15028 thiss!1793) (bvadd (currentBit!15023 thiss!1793) #b00000000000000000000000000000001))) (tuple2!23743 Unit!22053 (BitStream!14181 (buf!8151 thiss!1793) (bvadd (currentByte!15028 thiss!1793) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!106200 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9009 (buf!8151 thiss!1793))) ((_ sign_extend 32) (currentByte!15028 thiss!1793)) ((_ sign_extend 32) (currentBit!15023 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!106200 (= (increaseBitIndex!0 thiss!1793) lt!446473)))

(declare-fun b!323930 () Bool)

(declare-fun res!265927 () Bool)

(assert (=> b!323930 (=> (not res!265927) (not e!233338))))

(declare-fun lt!446470 () (_ BitVec 64))

(declare-fun lt!446472 () (_ BitVec 64))

(assert (=> b!323930 (= res!265927 (= (bvsub lt!446470 lt!446472) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!323930 (or (= (bvand lt!446470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446472 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446470 lt!446472) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323930 (= lt!446472 (remainingBits!0 ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13500 lt!446473)))) ((_ sign_extend 32) (currentByte!15028 (_2!13500 lt!446473))) ((_ sign_extend 32) (currentBit!15023 (_2!13500 lt!446473)))))))

(assert (=> b!323930 (= lt!446470 (remainingBits!0 ((_ sign_extend 32) (size!9009 (buf!8151 thiss!1793))) ((_ sign_extend 32) (currentByte!15028 thiss!1793)) ((_ sign_extend 32) (currentBit!15023 thiss!1793))))))

(declare-fun b!323931 () Bool)

(assert (=> b!323931 (= e!233338 (= (size!9009 (buf!8151 thiss!1793)) (size!9009 (buf!8151 (_2!13500 lt!446473)))))))

(assert (= (and d!106200 res!265926) b!323930))

(assert (= (and b!323930 res!265927) b!323931))

(declare-fun m!461939 () Bool)

(assert (=> d!106200 m!461939))

(assert (=> d!106200 m!461791))

(assert (=> d!106200 m!461819))

(declare-fun m!461941 () Bool)

(assert (=> b!323930 m!461941))

(assert (=> b!323930 m!461819))

(assert (=> d!106168 d!106200))

(declare-fun d!106202 () Bool)

(assert (=> d!106202 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9009 (buf!8151 thiss!1793))) ((_ sign_extend 32) (currentByte!15028 thiss!1793)) ((_ sign_extend 32) (currentBit!15023 thiss!1793))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9009 (buf!8151 thiss!1793))) ((_ sign_extend 32) (currentByte!15028 thiss!1793)) ((_ sign_extend 32) (currentBit!15023 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27971 () Bool)

(assert (= bs!27971 d!106202))

(assert (=> bs!27971 m!461819))

(assert (=> d!106168 d!106202))

(assert (=> d!106144 d!106168))

(declare-fun d!106204 () Bool)

(declare-fun e!233339 () Bool)

(assert (=> d!106204 e!233339))

(declare-fun res!265929 () Bool)

(assert (=> d!106204 (=> (not res!265929) (not e!233339))))

(declare-fun lt!446474 () (_ BitVec 64))

(declare-fun lt!446479 () (_ BitVec 64))

(declare-fun lt!446477 () (_ BitVec 64))

(assert (=> d!106204 (= res!265929 (= lt!446477 (bvsub lt!446479 lt!446474)))))

(assert (=> d!106204 (or (= (bvand lt!446479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446474 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446479 lt!446474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106204 (= lt!446474 (remainingBits!0 ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13495 lt!446387)))) ((_ sign_extend 32) (currentByte!15028 (_2!13495 lt!446387))) ((_ sign_extend 32) (currentBit!15023 (_2!13495 lt!446387)))))))

(declare-fun lt!446475 () (_ BitVec 64))

(declare-fun lt!446478 () (_ BitVec 64))

(assert (=> d!106204 (= lt!446479 (bvmul lt!446475 lt!446478))))

(assert (=> d!106204 (or (= lt!446475 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446478 (bvsdiv (bvmul lt!446475 lt!446478) lt!446475)))))

(assert (=> d!106204 (= lt!446478 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106204 (= lt!446475 ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13495 lt!446387)))))))

(assert (=> d!106204 (= lt!446477 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15028 (_2!13495 lt!446387))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15023 (_2!13495 lt!446387)))))))

(assert (=> d!106204 (invariant!0 (currentBit!15023 (_2!13495 lt!446387)) (currentByte!15028 (_2!13495 lt!446387)) (size!9009 (buf!8151 (_2!13495 lt!446387))))))

(assert (=> d!106204 (= (bitIndex!0 (size!9009 (buf!8151 (_2!13495 lt!446387))) (currentByte!15028 (_2!13495 lt!446387)) (currentBit!15023 (_2!13495 lt!446387))) lt!446477)))

(declare-fun b!323932 () Bool)

(declare-fun res!265928 () Bool)

(assert (=> b!323932 (=> (not res!265928) (not e!233339))))

(assert (=> b!323932 (= res!265928 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446477))))

(declare-fun b!323933 () Bool)

(declare-fun lt!446476 () (_ BitVec 64))

(assert (=> b!323933 (= e!233339 (bvsle lt!446477 (bvmul lt!446476 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323933 (or (= lt!446476 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446476 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446476)))))

(assert (=> b!323933 (= lt!446476 ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13495 lt!446387)))))))

(assert (= (and d!106204 res!265929) b!323932))

(assert (= (and b!323932 res!265928) b!323933))

(declare-fun m!461943 () Bool)

(assert (=> d!106204 m!461943))

(declare-fun m!461945 () Bool)

(assert (=> d!106204 m!461945))

(assert (=> b!323901 d!106204))

(declare-fun d!106206 () Bool)

(declare-fun e!233340 () Bool)

(assert (=> d!106206 e!233340))

(declare-fun res!265931 () Bool)

(assert (=> d!106206 (=> (not res!265931) (not e!233340))))

(declare-fun lt!446485 () (_ BitVec 64))

(declare-fun lt!446483 () (_ BitVec 64))

(declare-fun lt!446480 () (_ BitVec 64))

(assert (=> d!106206 (= res!265931 (= lt!446483 (bvsub lt!446485 lt!446480)))))

(assert (=> d!106206 (or (= (bvand lt!446485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446480 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446485 lt!446480) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106206 (= lt!446480 (remainingBits!0 ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13496 lt!446211)))) ((_ sign_extend 32) (currentByte!15028 (_2!13496 lt!446211))) ((_ sign_extend 32) (currentBit!15023 (_2!13496 lt!446211)))))))

(declare-fun lt!446481 () (_ BitVec 64))

(declare-fun lt!446484 () (_ BitVec 64))

(assert (=> d!106206 (= lt!446485 (bvmul lt!446481 lt!446484))))

(assert (=> d!106206 (or (= lt!446481 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446484 (bvsdiv (bvmul lt!446481 lt!446484) lt!446481)))))

(assert (=> d!106206 (= lt!446484 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106206 (= lt!446481 ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13496 lt!446211)))))))

(assert (=> d!106206 (= lt!446483 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15028 (_2!13496 lt!446211))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15023 (_2!13496 lt!446211)))))))

(assert (=> d!106206 (invariant!0 (currentBit!15023 (_2!13496 lt!446211)) (currentByte!15028 (_2!13496 lt!446211)) (size!9009 (buf!8151 (_2!13496 lt!446211))))))

(assert (=> d!106206 (= (bitIndex!0 (size!9009 (buf!8151 (_2!13496 lt!446211))) (currentByte!15028 (_2!13496 lt!446211)) (currentBit!15023 (_2!13496 lt!446211))) lt!446483)))

(declare-fun b!323934 () Bool)

(declare-fun res!265930 () Bool)

(assert (=> b!323934 (=> (not res!265930) (not e!233340))))

(assert (=> b!323934 (= res!265930 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446483))))

(declare-fun b!323935 () Bool)

(declare-fun lt!446482 () (_ BitVec 64))

(assert (=> b!323935 (= e!233340 (bvsle lt!446483 (bvmul lt!446482 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323935 (or (= lt!446482 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446482 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446482)))))

(assert (=> b!323935 (= lt!446482 ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13496 lt!446211)))))))

(assert (= (and d!106206 res!265931) b!323934))

(assert (= (and b!323934 res!265930) b!323935))

(declare-fun m!461947 () Bool)

(assert (=> d!106206 m!461947))

(declare-fun m!461949 () Bool)

(assert (=> d!106206 m!461949))

(assert (=> b!323901 d!106206))

(declare-fun d!106208 () Bool)

(assert (=> d!106208 (= (remainingBits!0 ((_ sign_extend 32) (size!9009 (buf!8151 thiss!1793))) ((_ sign_extend 32) (currentByte!15028 thiss!1793)) ((_ sign_extend 32) (currentBit!15023 thiss!1793))) (bvsub (bvmul ((_ sign_extend 32) (size!9009 (buf!8151 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15028 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15023 thiss!1793)))))))

(assert (=> d!106130 d!106208))

(assert (=> d!106138 d!106208))

(declare-fun d!106210 () Bool)

(assert (=> d!106210 (= (invariant!0 (currentBit!15023 thiss!1793) (currentByte!15028 thiss!1793) (size!9009 (buf!8151 thiss!1793))) (and (bvsge (currentBit!15023 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!15023 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!15028 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!15028 thiss!1793) (size!9009 (buf!8151 thiss!1793))) (and (= (currentBit!15023 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!15028 thiss!1793) (size!9009 (buf!8151 thiss!1793)))))))))

(assert (=> d!106138 d!106210))

(declare-fun d!106212 () Bool)

(assert (=> d!106212 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)))))))

(assert (=> b!323900 d!106212))

(declare-fun d!106214 () Bool)

(assert (=> d!106214 (= (remainingBits!0 ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13495 lt!446213)))) ((_ sign_extend 32) (currentByte!15028 (_2!13495 lt!446213))) ((_ sign_extend 32) (currentBit!15023 (_2!13495 lt!446213)))) (bvsub (bvmul ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13495 lt!446213)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15028 (_2!13495 lt!446213))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15023 (_2!13495 lt!446213))))))))

(assert (=> d!106132 d!106214))

(declare-fun d!106216 () Bool)

(assert (=> d!106216 (= (invariant!0 (currentBit!15023 (_2!13495 lt!446213)) (currentByte!15028 (_2!13495 lt!446213)) (size!9009 (buf!8151 (_2!13495 lt!446213)))) (and (bvsge (currentBit!15023 (_2!13495 lt!446213)) #b00000000000000000000000000000000) (bvslt (currentBit!15023 (_2!13495 lt!446213)) #b00000000000000000000000000001000) (bvsge (currentByte!15028 (_2!13495 lt!446213)) #b00000000000000000000000000000000) (or (bvslt (currentByte!15028 (_2!13495 lt!446213)) (size!9009 (buf!8151 (_2!13495 lt!446213)))) (and (= (currentBit!15023 (_2!13495 lt!446213)) #b00000000000000000000000000000000) (= (currentByte!15028 (_2!13495 lt!446213)) (size!9009 (buf!8151 (_2!13495 lt!446213))))))))))

(assert (=> d!106132 d!106216))

(assert (=> b!323899 d!106140))

(declare-fun d!106218 () Bool)

(declare-fun lt!446486 () tuple2!23734)

(assert (=> d!106218 (= lt!446486 (readBit!0 (_2!13496 lt!446211)))))

(assert (=> d!106218 (= (readBitPure!0 (_2!13496 lt!446211)) (tuple2!23737 (_2!13496 lt!446486) (_1!13496 lt!446486)))))

(declare-fun bs!27972 () Bool)

(assert (= bs!27972 d!106218))

(assert (=> bs!27972 m!461885))

(assert (=> b!323897 d!106218))

(assert (=> d!106142 d!106210))

(declare-fun d!106220 () Bool)

(declare-fun e!233341 () Bool)

(assert (=> d!106220 e!233341))

(declare-fun res!265932 () Bool)

(assert (=> d!106220 (=> (not res!265932) (not e!233341))))

(assert (=> d!106220 (= res!265932 (= (buf!8151 (_2!13500 (increaseBitIndex!0 (_2!13496 lt!446211)))) (buf!8151 (_2!13496 lt!446211))))))

(declare-fun lt!446490 () Bool)

(assert (=> d!106220 (= lt!446490 (not (= (bvand ((_ sign_extend 24) (select (arr!10101 (buf!8151 (_2!13496 lt!446211))) (currentByte!15028 (_2!13496 lt!446211)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15023 (_2!13496 lt!446211))))) #b00000000000000000000000000000000)))))

(declare-fun lt!446493 () tuple2!23734)

(assert (=> d!106220 (= lt!446493 (tuple2!23735 (not (= (bvand ((_ sign_extend 24) (select (arr!10101 (buf!8151 (_2!13496 lt!446211))) (currentByte!15028 (_2!13496 lt!446211)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15023 (_2!13496 lt!446211))))) #b00000000000000000000000000000000)) (_2!13500 (increaseBitIndex!0 (_2!13496 lt!446211)))))))

(assert (=> d!106220 (validate_offset_bit!0 ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13496 lt!446211)))) ((_ sign_extend 32) (currentByte!15028 (_2!13496 lt!446211))) ((_ sign_extend 32) (currentBit!15023 (_2!13496 lt!446211))))))

(assert (=> d!106220 (= (readBit!0 (_2!13496 lt!446211)) lt!446493)))

(declare-fun lt!446487 () (_ BitVec 64))

(declare-fun lt!446491 () (_ BitVec 64))

(declare-fun b!323936 () Bool)

(assert (=> b!323936 (= e!233341 (= (bitIndex!0 (size!9009 (buf!8151 (_2!13500 (increaseBitIndex!0 (_2!13496 lt!446211))))) (currentByte!15028 (_2!13500 (increaseBitIndex!0 (_2!13496 lt!446211)))) (currentBit!15023 (_2!13500 (increaseBitIndex!0 (_2!13496 lt!446211))))) (bvadd lt!446487 lt!446491)))))

(assert (=> b!323936 (or (not (= (bvand lt!446487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446491 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446487 lt!446491) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323936 (= lt!446491 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!323936 (= lt!446487 (bitIndex!0 (size!9009 (buf!8151 (_2!13496 lt!446211))) (currentByte!15028 (_2!13496 lt!446211)) (currentBit!15023 (_2!13496 lt!446211))))))

(declare-fun lt!446488 () Bool)

(assert (=> b!323936 (= lt!446488 (not (= (bvand ((_ sign_extend 24) (select (arr!10101 (buf!8151 (_2!13496 lt!446211))) (currentByte!15028 (_2!13496 lt!446211)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15023 (_2!13496 lt!446211))))) #b00000000000000000000000000000000)))))

(declare-fun lt!446492 () Bool)

(assert (=> b!323936 (= lt!446492 (not (= (bvand ((_ sign_extend 24) (select (arr!10101 (buf!8151 (_2!13496 lt!446211))) (currentByte!15028 (_2!13496 lt!446211)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15023 (_2!13496 lt!446211))))) #b00000000000000000000000000000000)))))

(declare-fun lt!446489 () Bool)

(assert (=> b!323936 (= lt!446489 (not (= (bvand ((_ sign_extend 24) (select (arr!10101 (buf!8151 (_2!13496 lt!446211))) (currentByte!15028 (_2!13496 lt!446211)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15023 (_2!13496 lt!446211))))) #b00000000000000000000000000000000)))))

(assert (= (and d!106220 res!265932) b!323936))

(declare-fun m!461951 () Bool)

(assert (=> d!106220 m!461951))

(declare-fun m!461953 () Bool)

(assert (=> d!106220 m!461953))

(declare-fun m!461955 () Bool)

(assert (=> d!106220 m!461955))

(declare-fun m!461957 () Bool)

(assert (=> d!106220 m!461957))

(assert (=> b!323936 m!461883))

(assert (=> b!323936 m!461953))

(assert (=> b!323936 m!461955))

(assert (=> b!323936 m!461951))

(declare-fun m!461959 () Bool)

(assert (=> b!323936 m!461959))

(assert (=> b!323896 d!106220))

(declare-fun b!323937 () Bool)

(declare-fun e!233342 () tuple2!23732)

(declare-fun lt!446498 () tuple2!23732)

(assert (=> b!323937 (= e!233342 (tuple2!23733 (_1!13495 lt!446498) (_2!13495 lt!446498)))))

(declare-fun lt!446496 () tuple2!23734)

(assert (=> b!323937 (= lt!446496 (readBit!0 (_2!13496 lt!446384)))))

(assert (=> b!323937 (= lt!446498 (readNBitsLSBFirstsLoop!0 (_2!13496 lt!446496) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor (bvor acc!161 (ite (_1!13496 lt!446211) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13496 lt!446384) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13496 lt!446496) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!446499 () tuple2!23732)

(declare-fun lt!446495 () (_ BitVec 64))

(declare-fun b!323938 () Bool)

(declare-fun e!233344 () Bool)

(assert (=> b!323938 (= e!233344 (= (= (bvand (bvlshr (_1!13495 lt!446499) lt!446495) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13497 (readBitPure!0 (_2!13496 lt!446384)))))))

(assert (=> b!323938 (and (bvsge lt!446495 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!446495 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!323938 (= lt!446495 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)))))

(declare-fun b!323939 () Bool)

(assert (=> b!323939 (= e!233342 (tuple2!23733 (bvor (bvor acc!161 (ite (_1!13496 lt!446211) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13496 lt!446384) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13496 lt!446384)))))

(declare-fun b!323940 () Bool)

(declare-fun res!265935 () Bool)

(declare-fun e!233343 () Bool)

(assert (=> b!323940 (=> (not res!265935) (not e!233343))))

(assert (=> b!323940 (= res!265935 (= (bvand (_1!13495 lt!446499) (onesLSBLong!0 nBits!548)) (_1!13495 lt!446499)))))

(declare-fun b!323941 () Bool)

(declare-fun res!265937 () Bool)

(assert (=> b!323941 (=> (not res!265937) (not e!233343))))

(assert (=> b!323941 (= res!265937 (= (bvand (_1!13495 lt!446499) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001))) (bvand (bvor (bvor acc!161 (ite (_1!13496 lt!446211) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13496 lt!446384) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)))))))

(declare-fun b!323942 () Bool)

(declare-fun res!265933 () Bool)

(assert (=> b!323942 (=> (not res!265933) (not e!233343))))

(declare-fun lt!446494 () (_ BitVec 64))

(declare-fun lt!446497 () (_ BitVec 64))

(assert (=> b!323942 (= res!265933 (= (bitIndex!0 (size!9009 (buf!8151 (_2!13495 lt!446499))) (currentByte!15028 (_2!13495 lt!446499)) (currentBit!15023 (_2!13495 lt!446499))) (bvadd lt!446494 lt!446497)))))

(assert (=> b!323942 (or (not (= (bvand lt!446494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446497 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446494 lt!446497) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323942 (= lt!446497 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001))))))

(assert (=> b!323942 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!323942 (= lt!446494 (bitIndex!0 (size!9009 (buf!8151 (_2!13496 lt!446384))) (currentByte!15028 (_2!13496 lt!446384)) (currentBit!15023 (_2!13496 lt!446384))))))

(declare-fun d!106222 () Bool)

(assert (=> d!106222 e!233343))

(declare-fun res!265936 () Bool)

(assert (=> d!106222 (=> (not res!265936) (not e!233343))))

(assert (=> d!106222 (= res!265936 (= (buf!8151 (_2!13495 lt!446499)) (buf!8151 (_2!13496 lt!446384))))))

(assert (=> d!106222 (= lt!446499 e!233342)))

(declare-fun c!15462 () Bool)

(assert (=> d!106222 (= c!15462 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)))))

(assert (=> d!106222 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!106222 (= (readNBitsLSBFirstsLoop!0 (_2!13496 lt!446384) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13496 lt!446211) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13496 lt!446384) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!446499)))

(declare-fun b!323943 () Bool)

(assert (=> b!323943 (= e!233343 e!233344)))

(declare-fun res!265934 () Bool)

(assert (=> b!323943 (=> res!265934 e!233344)))

(assert (=> b!323943 (= res!265934 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) nBits!548)))))

(assert (= (and d!106222 c!15462) b!323939))

(assert (= (and d!106222 (not c!15462)) b!323937))

(assert (= (and d!106222 res!265936) b!323942))

(assert (= (and b!323942 res!265933) b!323941))

(assert (= (and b!323941 res!265937) b!323940))

(assert (= (and b!323940 res!265935) b!323943))

(assert (= (and b!323943 (not res!265934)) b!323938))

(declare-fun m!461961 () Bool)

(assert (=> b!323938 m!461961))

(declare-fun m!461963 () Bool)

(assert (=> b!323942 m!461963))

(declare-fun m!461965 () Bool)

(assert (=> b!323942 m!461965))

(assert (=> b!323940 m!461799))

(declare-fun m!461967 () Bool)

(assert (=> b!323937 m!461967))

(declare-fun m!461969 () Bool)

(assert (=> b!323937 m!461969))

(declare-fun m!461971 () Bool)

(assert (=> b!323941 m!461971))

(assert (=> b!323896 d!106222))

(declare-fun d!106224 () Bool)

(declare-fun e!233345 () Bool)

(assert (=> d!106224 e!233345))

(declare-fun res!265939 () Bool)

(assert (=> d!106224 (=> (not res!265939) (not e!233345))))

(declare-fun lt!446500 () (_ BitVec 64))

(declare-fun lt!446503 () (_ BitVec 64))

(declare-fun lt!446505 () (_ BitVec 64))

(assert (=> d!106224 (= res!265939 (= lt!446503 (bvsub lt!446505 lt!446500)))))

(assert (=> d!106224 (or (= (bvand lt!446505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446500 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446505 lt!446500) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106224 (= lt!446500 (remainingBits!0 ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13500 (increaseBitIndex!0 thiss!1793))))) ((_ sign_extend 32) (currentByte!15028 (_2!13500 (increaseBitIndex!0 thiss!1793)))) ((_ sign_extend 32) (currentBit!15023 (_2!13500 (increaseBitIndex!0 thiss!1793))))))))

(declare-fun lt!446501 () (_ BitVec 64))

(declare-fun lt!446504 () (_ BitVec 64))

(assert (=> d!106224 (= lt!446505 (bvmul lt!446501 lt!446504))))

(assert (=> d!106224 (or (= lt!446501 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446504 (bvsdiv (bvmul lt!446501 lt!446504) lt!446501)))))

(assert (=> d!106224 (= lt!446504 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106224 (= lt!446501 ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13500 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!106224 (= lt!446503 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15028 (_2!13500 (increaseBitIndex!0 thiss!1793)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15023 (_2!13500 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!106224 (invariant!0 (currentBit!15023 (_2!13500 (increaseBitIndex!0 thiss!1793))) (currentByte!15028 (_2!13500 (increaseBitIndex!0 thiss!1793))) (size!9009 (buf!8151 (_2!13500 (increaseBitIndex!0 thiss!1793)))))))

(assert (=> d!106224 (= (bitIndex!0 (size!9009 (buf!8151 (_2!13500 (increaseBitIndex!0 thiss!1793)))) (currentByte!15028 (_2!13500 (increaseBitIndex!0 thiss!1793))) (currentBit!15023 (_2!13500 (increaseBitIndex!0 thiss!1793)))) lt!446503)))

(declare-fun b!323944 () Bool)

(declare-fun res!265938 () Bool)

(assert (=> b!323944 (=> (not res!265938) (not e!233345))))

(assert (=> b!323944 (= res!265938 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446503))))

(declare-fun b!323945 () Bool)

(declare-fun lt!446502 () (_ BitVec 64))

(assert (=> b!323945 (= e!233345 (bvsle lt!446503 (bvmul lt!446502 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323945 (or (= lt!446502 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446502 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446502)))))

(assert (=> b!323945 (= lt!446502 ((_ sign_extend 32) (size!9009 (buf!8151 (_2!13500 (increaseBitIndex!0 thiss!1793))))))))

(assert (= (and d!106224 res!265939) b!323944))

(assert (= (and b!323944 res!265938) b!323945))

(declare-fun m!461973 () Bool)

(assert (=> d!106224 m!461973))

(declare-fun m!461975 () Bool)

(assert (=> d!106224 m!461975))

(assert (=> b!323905 d!106224))

(assert (=> b!323905 d!106200))

(assert (=> b!323905 d!106138))

(push 1)

(assert (not b!323938))

(assert (not b!323930))

(assert (not d!106220))

(assert (not d!106206))

(assert (not d!106224))

(assert (not d!106200))

(assert (not d!106202))

(assert (not d!106218))

(assert (not b!323941))

(assert (not b!323940))

(assert (not b!323937))

(assert (not d!106204))

(assert (not b!323942))

(assert (not b!323936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

