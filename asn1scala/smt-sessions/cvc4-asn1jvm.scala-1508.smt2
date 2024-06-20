; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41694 () Bool)

(assert start!41694)

(declare-fun b!196087 () Bool)

(declare-fun e!134792 () Bool)

(declare-fun e!134791 () Bool)

(assert (=> b!196087 (= e!134792 e!134791)))

(declare-fun res!164061 () Bool)

(assert (=> b!196087 (=> res!164061 e!134791)))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((array!10068 0))(
  ( (array!10069 (arr!5370 (Array (_ BitVec 32) (_ BitVec 8))) (size!4440 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7988 0))(
  ( (BitStream!7989 (buf!4926 array!10068) (currentByte!9237 (_ BitVec 32)) (currentBit!9232 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13856 0))(
  ( (Unit!13857) )
))
(declare-datatypes ((tuple2!16966 0))(
  ( (tuple2!16967 (_1!9128 Unit!13856) (_2!9128 BitStream!7988)) )
))
(declare-fun lt!304808 () tuple2!16966)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!304810 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196087 (= res!164061 (not (= (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!304808))) (currentByte!9237 (_2!9128 lt!304808)) (currentBit!9232 (_2!9128 lt!304808))) (bvsub (bvsub (bvadd lt!304810 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun thiss!1204 () BitStream!7988)

(declare-fun isPrefixOf!0 (BitStream!7988 BitStream!7988) Bool)

(assert (=> b!196087 (isPrefixOf!0 thiss!1204 (_2!9128 lt!304808))))

(declare-fun lt!304815 () tuple2!16966)

(declare-fun lt!304811 () Unit!13856)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7988 BitStream!7988 BitStream!7988) Unit!13856)

(assert (=> b!196087 (= lt!304811 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9128 lt!304815) (_2!9128 lt!304808)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7988 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16966)

(assert (=> b!196087 (= lt!304808 (appendBitsLSBFirstLoopTR!0 (_2!9128 lt!304815) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!196088 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!196088 (= e!134791 (invariant!0 (currentBit!9232 (_2!9128 lt!304808)) (currentByte!9237 (_2!9128 lt!304808)) (size!4440 (buf!4926 (_2!9128 lt!304808)))))))

(declare-fun b!196089 () Bool)

(declare-fun res!164057 () Bool)

(declare-fun e!134793 () Bool)

(assert (=> b!196089 (=> (not res!164057) (not e!134793))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196089 (= res!164057 (validate_offset_bits!1 ((_ sign_extend 32) (size!4440 (buf!4926 thiss!1204))) ((_ sign_extend 32) (currentByte!9237 thiss!1204)) ((_ sign_extend 32) (currentBit!9232 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!196090 () Bool)

(declare-fun res!164058 () Bool)

(declare-fun e!134796 () Bool)

(assert (=> b!196090 (=> (not res!164058) (not e!134796))))

(assert (=> b!196090 (= res!164058 (isPrefixOf!0 thiss!1204 (_2!9128 lt!304815)))))

(declare-fun b!196091 () Bool)

(assert (=> b!196091 (= e!134793 (not e!134792))))

(declare-fun res!164054 () Bool)

(assert (=> b!196091 (=> res!164054 e!134792)))

(declare-fun lt!304816 () (_ BitVec 64))

(assert (=> b!196091 (= res!164054 (not (= lt!304810 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!304816))))))

(assert (=> b!196091 (= lt!304810 (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!304815))) (currentByte!9237 (_2!9128 lt!304815)) (currentBit!9232 (_2!9128 lt!304815))))))

(assert (=> b!196091 (= lt!304816 (bitIndex!0 (size!4440 (buf!4926 thiss!1204)) (currentByte!9237 thiss!1204) (currentBit!9232 thiss!1204)))))

(declare-fun e!134797 () Bool)

(assert (=> b!196091 e!134797))

(declare-fun res!164059 () Bool)

(assert (=> b!196091 (=> (not res!164059) (not e!134797))))

(assert (=> b!196091 (= res!164059 (= (size!4440 (buf!4926 thiss!1204)) (size!4440 (buf!4926 (_2!9128 lt!304815)))))))

(declare-fun lt!304814 () Bool)

(declare-fun appendBit!0 (BitStream!7988 Bool) tuple2!16966)

(assert (=> b!196091 (= lt!304815 (appendBit!0 thiss!1204 lt!304814))))

(assert (=> b!196091 (= lt!304814 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!164052 () Bool)

(assert (=> start!41694 (=> (not res!164052) (not e!134793))))

(assert (=> start!41694 (= res!164052 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41694 e!134793))

(assert (=> start!41694 true))

(declare-fun e!134794 () Bool)

(declare-fun inv!12 (BitStream!7988) Bool)

(assert (=> start!41694 (and (inv!12 thiss!1204) e!134794)))

(declare-fun b!196092 () Bool)

(declare-fun array_inv!4181 (array!10068) Bool)

(assert (=> b!196092 (= e!134794 (array_inv!4181 (buf!4926 thiss!1204)))))

(declare-fun b!196093 () Bool)

(declare-fun e!134798 () Bool)

(declare-datatypes ((tuple2!16968 0))(
  ( (tuple2!16969 (_1!9129 BitStream!7988) (_2!9129 Bool)) )
))
(declare-fun lt!304813 () tuple2!16968)

(declare-fun lt!304809 () (_ BitVec 64))

(assert (=> b!196093 (= e!134798 (= (bitIndex!0 (size!4440 (buf!4926 (_1!9129 lt!304813))) (currentByte!9237 (_1!9129 lt!304813)) (currentBit!9232 (_1!9129 lt!304813))) lt!304809))))

(declare-fun b!196094 () Bool)

(assert (=> b!196094 (= e!134797 e!134796)))

(declare-fun res!164056 () Bool)

(assert (=> b!196094 (=> (not res!164056) (not e!134796))))

(declare-fun lt!304812 () (_ BitVec 64))

(assert (=> b!196094 (= res!164056 (= lt!304809 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!304812)))))

(assert (=> b!196094 (= lt!304809 (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!304815))) (currentByte!9237 (_2!9128 lt!304815)) (currentBit!9232 (_2!9128 lt!304815))))))

(assert (=> b!196094 (= lt!304812 (bitIndex!0 (size!4440 (buf!4926 thiss!1204)) (currentByte!9237 thiss!1204) (currentBit!9232 thiss!1204)))))

(declare-fun b!196095 () Bool)

(declare-fun res!164060 () Bool)

(assert (=> b!196095 (=> (not res!164060) (not e!134793))))

(assert (=> b!196095 (= res!164060 (invariant!0 (currentBit!9232 thiss!1204) (currentByte!9237 thiss!1204) (size!4440 (buf!4926 thiss!1204))))))

(declare-fun b!196096 () Bool)

(assert (=> b!196096 (= e!134796 e!134798)))

(declare-fun res!164055 () Bool)

(assert (=> b!196096 (=> (not res!164055) (not e!134798))))

(assert (=> b!196096 (= res!164055 (and (= (_2!9129 lt!304813) lt!304814) (= (_1!9129 lt!304813) (_2!9128 lt!304815))))))

(declare-fun readBitPure!0 (BitStream!7988) tuple2!16968)

(declare-fun readerFrom!0 (BitStream!7988 (_ BitVec 32) (_ BitVec 32)) BitStream!7988)

(assert (=> b!196096 (= lt!304813 (readBitPure!0 (readerFrom!0 (_2!9128 lt!304815) (currentBit!9232 thiss!1204) (currentByte!9237 thiss!1204))))))

(declare-fun b!196097 () Bool)

(declare-fun res!164053 () Bool)

(assert (=> b!196097 (=> (not res!164053) (not e!134793))))

(assert (=> b!196097 (= res!164053 (not (= i!590 nBits!348)))))

(assert (= (and start!41694 res!164052) b!196089))

(assert (= (and b!196089 res!164057) b!196095))

(assert (= (and b!196095 res!164060) b!196097))

(assert (= (and b!196097 res!164053) b!196091))

(assert (= (and b!196091 res!164059) b!196094))

(assert (= (and b!196094 res!164056) b!196090))

(assert (= (and b!196090 res!164058) b!196096))

(assert (= (and b!196096 res!164055) b!196093))

(assert (= (and b!196091 (not res!164054)) b!196087))

(assert (= (and b!196087 (not res!164061)) b!196088))

(assert (= start!41694 b!196092))

(declare-fun m!303375 () Bool)

(assert (=> b!196090 m!303375))

(declare-fun m!303377 () Bool)

(assert (=> b!196096 m!303377))

(assert (=> b!196096 m!303377))

(declare-fun m!303379 () Bool)

(assert (=> b!196096 m!303379))

(declare-fun m!303381 () Bool)

(assert (=> b!196087 m!303381))

(declare-fun m!303383 () Bool)

(assert (=> b!196087 m!303383))

(declare-fun m!303385 () Bool)

(assert (=> b!196087 m!303385))

(declare-fun m!303387 () Bool)

(assert (=> b!196087 m!303387))

(declare-fun m!303389 () Bool)

(assert (=> b!196091 m!303389))

(declare-fun m!303391 () Bool)

(assert (=> b!196091 m!303391))

(declare-fun m!303393 () Bool)

(assert (=> b!196091 m!303393))

(declare-fun m!303395 () Bool)

(assert (=> b!196089 m!303395))

(declare-fun m!303397 () Bool)

(assert (=> start!41694 m!303397))

(declare-fun m!303399 () Bool)

(assert (=> b!196093 m!303399))

(declare-fun m!303401 () Bool)

(assert (=> b!196088 m!303401))

(declare-fun m!303403 () Bool)

(assert (=> b!196092 m!303403))

(declare-fun m!303405 () Bool)

(assert (=> b!196095 m!303405))

(assert (=> b!196094 m!303389))

(assert (=> b!196094 m!303391))

(push 1)

(assert (not b!196089))

(assert (not b!196095))

(assert (not b!196090))

(assert (not start!41694))

(assert (not b!196091))

(assert (not b!196094))

(assert (not b!196087))

(assert (not b!196093))

(assert (not b!196096))

(assert (not b!196092))

(assert (not b!196088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66357 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66357 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4440 (buf!4926 thiss!1204))) ((_ sign_extend 32) (currentByte!9237 thiss!1204)) ((_ sign_extend 32) (currentBit!9232 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4440 (buf!4926 thiss!1204))) ((_ sign_extend 32) (currentByte!9237 thiss!1204)) ((_ sign_extend 32) (currentBit!9232 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16499 () Bool)

(assert (= bs!16499 d!66357))

(declare-fun m!303417 () Bool)

(assert (=> bs!16499 m!303417))

(assert (=> b!196089 d!66357))

(declare-fun d!66363 () Bool)

(declare-fun e!134815 () Bool)

(assert (=> d!66363 e!134815))

(declare-fun res!164091 () Bool)

(assert (=> d!66363 (=> (not res!164091) (not e!134815))))

(declare-fun lt!304878 () (_ BitVec 64))

(declare-fun lt!304880 () (_ BitVec 64))

(declare-fun lt!304879 () (_ BitVec 64))

(assert (=> d!66363 (= res!164091 (= lt!304879 (bvsub lt!304880 lt!304878)))))

(assert (=> d!66363 (or (= (bvand lt!304880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304878 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304880 lt!304878) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66363 (= lt!304878 (remainingBits!0 ((_ sign_extend 32) (size!4440 (buf!4926 (_2!9128 lt!304815)))) ((_ sign_extend 32) (currentByte!9237 (_2!9128 lt!304815))) ((_ sign_extend 32) (currentBit!9232 (_2!9128 lt!304815)))))))

(declare-fun lt!304877 () (_ BitVec 64))

(declare-fun lt!304882 () (_ BitVec 64))

(assert (=> d!66363 (= lt!304880 (bvmul lt!304877 lt!304882))))

(assert (=> d!66363 (or (= lt!304877 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304882 (bvsdiv (bvmul lt!304877 lt!304882) lt!304877)))))

(assert (=> d!66363 (= lt!304882 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66363 (= lt!304877 ((_ sign_extend 32) (size!4440 (buf!4926 (_2!9128 lt!304815)))))))

(assert (=> d!66363 (= lt!304879 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9237 (_2!9128 lt!304815))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9232 (_2!9128 lt!304815)))))))

(assert (=> d!66363 (invariant!0 (currentBit!9232 (_2!9128 lt!304815)) (currentByte!9237 (_2!9128 lt!304815)) (size!4440 (buf!4926 (_2!9128 lt!304815))))))

(assert (=> d!66363 (= (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!304815))) (currentByte!9237 (_2!9128 lt!304815)) (currentBit!9232 (_2!9128 lt!304815))) lt!304879)))

(declare-fun b!196127 () Bool)

(declare-fun res!164092 () Bool)

(assert (=> b!196127 (=> (not res!164092) (not e!134815))))

(assert (=> b!196127 (= res!164092 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304879))))

(declare-fun b!196128 () Bool)

(declare-fun lt!304881 () (_ BitVec 64))

(assert (=> b!196128 (= e!134815 (bvsle lt!304879 (bvmul lt!304881 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196128 (or (= lt!304881 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304881 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304881)))))

(assert (=> b!196128 (= lt!304881 ((_ sign_extend 32) (size!4440 (buf!4926 (_2!9128 lt!304815)))))))

(assert (= (and d!66363 res!164091) b!196127))

(assert (= (and b!196127 res!164092) b!196128))

(declare-fun m!303423 () Bool)

(assert (=> d!66363 m!303423))

(declare-fun m!303425 () Bool)

(assert (=> d!66363 m!303425))

(assert (=> b!196094 d!66363))

(declare-fun d!66369 () Bool)

(declare-fun e!134816 () Bool)

(assert (=> d!66369 e!134816))

(declare-fun res!164093 () Bool)

(assert (=> d!66369 (=> (not res!164093) (not e!134816))))

(declare-fun lt!304885 () (_ BitVec 64))

(declare-fun lt!304886 () (_ BitVec 64))

(declare-fun lt!304884 () (_ BitVec 64))

(assert (=> d!66369 (= res!164093 (= lt!304885 (bvsub lt!304886 lt!304884)))))

(assert (=> d!66369 (or (= (bvand lt!304886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304884 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304886 lt!304884) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66369 (= lt!304884 (remainingBits!0 ((_ sign_extend 32) (size!4440 (buf!4926 thiss!1204))) ((_ sign_extend 32) (currentByte!9237 thiss!1204)) ((_ sign_extend 32) (currentBit!9232 thiss!1204))))))

(declare-fun lt!304883 () (_ BitVec 64))

(declare-fun lt!304888 () (_ BitVec 64))

(assert (=> d!66369 (= lt!304886 (bvmul lt!304883 lt!304888))))

(assert (=> d!66369 (or (= lt!304883 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304888 (bvsdiv (bvmul lt!304883 lt!304888) lt!304883)))))

(assert (=> d!66369 (= lt!304888 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66369 (= lt!304883 ((_ sign_extend 32) (size!4440 (buf!4926 thiss!1204))))))

(assert (=> d!66369 (= lt!304885 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9237 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9232 thiss!1204))))))

(assert (=> d!66369 (invariant!0 (currentBit!9232 thiss!1204) (currentByte!9237 thiss!1204) (size!4440 (buf!4926 thiss!1204)))))

(assert (=> d!66369 (= (bitIndex!0 (size!4440 (buf!4926 thiss!1204)) (currentByte!9237 thiss!1204) (currentBit!9232 thiss!1204)) lt!304885)))

(declare-fun b!196129 () Bool)

(declare-fun res!164094 () Bool)

(assert (=> b!196129 (=> (not res!164094) (not e!134816))))

(assert (=> b!196129 (= res!164094 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304885))))

(declare-fun b!196130 () Bool)

(declare-fun lt!304887 () (_ BitVec 64))

(assert (=> b!196130 (= e!134816 (bvsle lt!304885 (bvmul lt!304887 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196130 (or (= lt!304887 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304887 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304887)))))

(assert (=> b!196130 (= lt!304887 ((_ sign_extend 32) (size!4440 (buf!4926 thiss!1204))))))

(assert (= (and d!66369 res!164093) b!196129))

(assert (= (and b!196129 res!164094) b!196130))

(assert (=> d!66369 m!303417))

(assert (=> d!66369 m!303405))

(assert (=> b!196094 d!66369))

(declare-fun d!66371 () Bool)

(assert (=> d!66371 (= (invariant!0 (currentBit!9232 (_2!9128 lt!304808)) (currentByte!9237 (_2!9128 lt!304808)) (size!4440 (buf!4926 (_2!9128 lt!304808)))) (and (bvsge (currentBit!9232 (_2!9128 lt!304808)) #b00000000000000000000000000000000) (bvslt (currentBit!9232 (_2!9128 lt!304808)) #b00000000000000000000000000001000) (bvsge (currentByte!9237 (_2!9128 lt!304808)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9237 (_2!9128 lt!304808)) (size!4440 (buf!4926 (_2!9128 lt!304808)))) (and (= (currentBit!9232 (_2!9128 lt!304808)) #b00000000000000000000000000000000) (= (currentByte!9237 (_2!9128 lt!304808)) (size!4440 (buf!4926 (_2!9128 lt!304808))))))))))

(assert (=> b!196088 d!66371))

(declare-fun d!66373 () Bool)

(declare-fun e!134817 () Bool)

(assert (=> d!66373 e!134817))

(declare-fun res!164095 () Bool)

(assert (=> d!66373 (=> (not res!164095) (not e!134817))))

(declare-fun lt!304893 () (_ BitVec 64))

(declare-fun lt!304892 () (_ BitVec 64))

(declare-fun lt!304894 () (_ BitVec 64))

(assert (=> d!66373 (= res!164095 (= lt!304893 (bvsub lt!304894 lt!304892)))))

(assert (=> d!66373 (or (= (bvand lt!304894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304892 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304894 lt!304892) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66373 (= lt!304892 (remainingBits!0 ((_ sign_extend 32) (size!4440 (buf!4926 (_1!9129 lt!304813)))) ((_ sign_extend 32) (currentByte!9237 (_1!9129 lt!304813))) ((_ sign_extend 32) (currentBit!9232 (_1!9129 lt!304813)))))))

(declare-fun lt!304891 () (_ BitVec 64))

(declare-fun lt!304896 () (_ BitVec 64))

(assert (=> d!66373 (= lt!304894 (bvmul lt!304891 lt!304896))))

(assert (=> d!66373 (or (= lt!304891 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304896 (bvsdiv (bvmul lt!304891 lt!304896) lt!304891)))))

(assert (=> d!66373 (= lt!304896 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66373 (= lt!304891 ((_ sign_extend 32) (size!4440 (buf!4926 (_1!9129 lt!304813)))))))

(assert (=> d!66373 (= lt!304893 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9237 (_1!9129 lt!304813))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9232 (_1!9129 lt!304813)))))))

(assert (=> d!66373 (invariant!0 (currentBit!9232 (_1!9129 lt!304813)) (currentByte!9237 (_1!9129 lt!304813)) (size!4440 (buf!4926 (_1!9129 lt!304813))))))

(assert (=> d!66373 (= (bitIndex!0 (size!4440 (buf!4926 (_1!9129 lt!304813))) (currentByte!9237 (_1!9129 lt!304813)) (currentBit!9232 (_1!9129 lt!304813))) lt!304893)))

(declare-fun b!196132 () Bool)

(declare-fun res!164096 () Bool)

(assert (=> b!196132 (=> (not res!164096) (not e!134817))))

(assert (=> b!196132 (= res!164096 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304893))))

(declare-fun b!196133 () Bool)

(declare-fun lt!304895 () (_ BitVec 64))

(assert (=> b!196133 (= e!134817 (bvsle lt!304893 (bvmul lt!304895 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196133 (or (= lt!304895 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304895 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304895)))))

(assert (=> b!196133 (= lt!304895 ((_ sign_extend 32) (size!4440 (buf!4926 (_1!9129 lt!304813)))))))

(assert (= (and d!66373 res!164095) b!196132))

(assert (= (and b!196132 res!164096) b!196133))

(declare-fun m!303427 () Bool)

(assert (=> d!66373 m!303427))

(declare-fun m!303429 () Bool)

(assert (=> d!66373 m!303429))

(assert (=> b!196093 d!66373))

(declare-fun d!66375 () Bool)

(declare-fun e!134820 () Bool)

(assert (=> d!66375 e!134820))

(declare-fun res!164101 () Bool)

(assert (=> d!66375 (=> (not res!164101) (not e!134820))))

(declare-fun lt!304903 () (_ BitVec 64))

(declare-fun lt!304904 () (_ BitVec 64))

(declare-fun lt!304902 () (_ BitVec 64))

(assert (=> d!66375 (= res!164101 (= lt!304903 (bvsub lt!304904 lt!304902)))))

(assert (=> d!66375 (or (= (bvand lt!304904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304902 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304904 lt!304902) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66375 (= lt!304902 (remainingBits!0 ((_ sign_extend 32) (size!4440 (buf!4926 (_2!9128 lt!304808)))) ((_ sign_extend 32) (currentByte!9237 (_2!9128 lt!304808))) ((_ sign_extend 32) (currentBit!9232 (_2!9128 lt!304808)))))))

(declare-fun lt!304901 () (_ BitVec 64))

(declare-fun lt!304906 () (_ BitVec 64))

(assert (=> d!66375 (= lt!304904 (bvmul lt!304901 lt!304906))))

(assert (=> d!66375 (or (= lt!304901 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304906 (bvsdiv (bvmul lt!304901 lt!304906) lt!304901)))))

(assert (=> d!66375 (= lt!304906 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66375 (= lt!304901 ((_ sign_extend 32) (size!4440 (buf!4926 (_2!9128 lt!304808)))))))

(assert (=> d!66375 (= lt!304903 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9237 (_2!9128 lt!304808))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9232 (_2!9128 lt!304808)))))))

(assert (=> d!66375 (invariant!0 (currentBit!9232 (_2!9128 lt!304808)) (currentByte!9237 (_2!9128 lt!304808)) (size!4440 (buf!4926 (_2!9128 lt!304808))))))

(assert (=> d!66375 (= (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!304808))) (currentByte!9237 (_2!9128 lt!304808)) (currentBit!9232 (_2!9128 lt!304808))) lt!304903)))

(declare-fun b!196136 () Bool)

(declare-fun res!164102 () Bool)

(assert (=> b!196136 (=> (not res!164102) (not e!134820))))

(assert (=> b!196136 (= res!164102 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304903))))

(declare-fun b!196137 () Bool)

(declare-fun lt!304905 () (_ BitVec 64))

(assert (=> b!196137 (= e!134820 (bvsle lt!304903 (bvmul lt!304905 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196137 (or (= lt!304905 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304905 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304905)))))

(assert (=> b!196137 (= lt!304905 ((_ sign_extend 32) (size!4440 (buf!4926 (_2!9128 lt!304808)))))))

(assert (= (and d!66375 res!164101) b!196136))

(assert (= (and b!196136 res!164102) b!196137))

(declare-fun m!303431 () Bool)

(assert (=> d!66375 m!303431))

(assert (=> d!66375 m!303401))

(assert (=> b!196087 d!66375))

(declare-fun d!66377 () Bool)

(declare-fun res!164119 () Bool)

(declare-fun e!134830 () Bool)

(assert (=> d!66377 (=> (not res!164119) (not e!134830))))

(assert (=> d!66377 (= res!164119 (= (size!4440 (buf!4926 thiss!1204)) (size!4440 (buf!4926 (_2!9128 lt!304808)))))))

(assert (=> d!66377 (= (isPrefixOf!0 thiss!1204 (_2!9128 lt!304808)) e!134830)))

(declare-fun b!196154 () Bool)

(declare-fun res!164117 () Bool)

(assert (=> b!196154 (=> (not res!164117) (not e!134830))))

(assert (=> b!196154 (= res!164117 (bvsle (bitIndex!0 (size!4440 (buf!4926 thiss!1204)) (currentByte!9237 thiss!1204) (currentBit!9232 thiss!1204)) (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!304808))) (currentByte!9237 (_2!9128 lt!304808)) (currentBit!9232 (_2!9128 lt!304808)))))))

(declare-fun b!196155 () Bool)

(declare-fun e!134829 () Bool)

(assert (=> b!196155 (= e!134830 e!134829)))

(declare-fun res!164118 () Bool)

(assert (=> b!196155 (=> res!164118 e!134829)))

(assert (=> b!196155 (= res!164118 (= (size!4440 (buf!4926 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!196156 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10068 array!10068 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196156 (= e!134829 (arrayBitRangesEq!0 (buf!4926 thiss!1204) (buf!4926 (_2!9128 lt!304808)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4440 (buf!4926 thiss!1204)) (currentByte!9237 thiss!1204) (currentBit!9232 thiss!1204))))))

(assert (= (and d!66377 res!164119) b!196154))

(assert (= (and b!196154 res!164117) b!196155))

(assert (= (and b!196155 (not res!164118)) b!196156))

(assert (=> b!196154 m!303391))

(assert (=> b!196154 m!303381))

(assert (=> b!196156 m!303391))

(assert (=> b!196156 m!303391))

(declare-fun m!303447 () Bool)

(assert (=> b!196156 m!303447))

(assert (=> b!196087 d!66377))

(declare-fun d!66381 () Bool)

(assert (=> d!66381 (isPrefixOf!0 thiss!1204 (_2!9128 lt!304808))))

(declare-fun lt!304918 () Unit!13856)

(declare-fun choose!30 (BitStream!7988 BitStream!7988 BitStream!7988) Unit!13856)

(assert (=> d!66381 (= lt!304918 (choose!30 thiss!1204 (_2!9128 lt!304815) (_2!9128 lt!304808)))))

(assert (=> d!66381 (isPrefixOf!0 thiss!1204 (_2!9128 lt!304815))))

(assert (=> d!66381 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9128 lt!304815) (_2!9128 lt!304808)) lt!304918)))

(declare-fun bs!16501 () Bool)

(assert (= bs!16501 d!66381))

(assert (=> bs!16501 m!303383))

(declare-fun m!303451 () Bool)

(assert (=> bs!16501 m!303451))

(assert (=> bs!16501 m!303375))

(assert (=> b!196087 d!66381))

(declare-fun b!196246 () Bool)

(declare-fun e!134886 () Bool)

(declare-fun lt!305167 () tuple2!16968)

(declare-fun lt!305196 () tuple2!16968)

(assert (=> b!196246 (= e!134886 (= (_2!9129 lt!305167) (_2!9129 lt!305196)))))

(declare-fun b!196247 () Bool)

(declare-fun e!134884 () Bool)

(declare-fun lt!305197 () (_ BitVec 64))

(assert (=> b!196247 (= e!134884 (validate_offset_bits!1 ((_ sign_extend 32) (size!4440 (buf!4926 (_2!9128 lt!304815)))) ((_ sign_extend 32) (currentByte!9237 (_2!9128 lt!304815))) ((_ sign_extend 32) (currentBit!9232 (_2!9128 lt!304815))) lt!305197))))

(declare-fun b!196248 () Bool)

(declare-fun res!164202 () Bool)

(declare-fun e!134887 () Bool)

(assert (=> b!196248 (=> (not res!164202) (not e!134887))))

(declare-fun lt!305155 () tuple2!16966)

(assert (=> b!196248 (= res!164202 (= (size!4440 (buf!4926 (_2!9128 lt!304815))) (size!4440 (buf!4926 (_2!9128 lt!305155)))))))

(declare-fun b!196249 () Bool)

(declare-fun lt!305168 () tuple2!16968)

(declare-fun lt!305164 () tuple2!16966)

(assert (=> b!196249 (= lt!305168 (readBitPure!0 (readerFrom!0 (_2!9128 lt!305164) (currentBit!9232 (_2!9128 lt!304815)) (currentByte!9237 (_2!9128 lt!304815)))))))

(declare-fun res!164201 () Bool)

(declare-fun lt!305152 () Bool)

(assert (=> b!196249 (= res!164201 (and (= (_2!9129 lt!305168) lt!305152) (= (_1!9129 lt!305168) (_2!9128 lt!305164))))))

(declare-fun e!134888 () Bool)

(assert (=> b!196249 (=> (not res!164201) (not e!134888))))

(declare-fun e!134883 () Bool)

(assert (=> b!196249 (= e!134883 e!134888)))

(declare-fun b!196250 () Bool)

(declare-fun res!164194 () Bool)

(assert (=> b!196250 (=> (not res!164194) (not e!134887))))

(assert (=> b!196250 (= res!164194 (isPrefixOf!0 (_2!9128 lt!304815) (_2!9128 lt!305155)))))

(declare-fun b!196251 () Bool)

(declare-fun e!134891 () Bool)

(assert (=> b!196251 (= e!134887 e!134891)))

(declare-fun res!164199 () Bool)

(assert (=> b!196251 (=> (not res!164199) (not e!134891))))

(declare-datatypes ((tuple2!16976 0))(
  ( (tuple2!16977 (_1!9133 BitStream!7988) (_2!9133 (_ BitVec 64))) )
))
(declare-fun lt!305173 () tuple2!16976)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196251 (= res!164199 (= (_2!9133 lt!305173) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-datatypes ((tuple2!16978 0))(
  ( (tuple2!16979 (_1!9134 BitStream!7988) (_2!9134 BitStream!7988)) )
))
(declare-fun lt!305184 () tuple2!16978)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16976)

(assert (=> b!196251 (= lt!305173 (readNBitsLSBFirstsLoopPure!0 (_1!9134 lt!305184) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!305158 () Unit!13856)

(declare-fun lt!305166 () Unit!13856)

(assert (=> b!196251 (= lt!305158 lt!305166)))

(assert (=> b!196251 (validate_offset_bits!1 ((_ sign_extend 32) (size!4440 (buf!4926 (_2!9128 lt!305155)))) ((_ sign_extend 32) (currentByte!9237 (_2!9128 lt!304815))) ((_ sign_extend 32) (currentBit!9232 (_2!9128 lt!304815))) lt!305197)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7988 array!10068 (_ BitVec 64)) Unit!13856)

(assert (=> b!196251 (= lt!305166 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9128 lt!304815) (buf!4926 (_2!9128 lt!305155)) lt!305197))))

(assert (=> b!196251 e!134884))

(declare-fun res!164195 () Bool)

(assert (=> b!196251 (=> (not res!164195) (not e!134884))))

(assert (=> b!196251 (= res!164195 (and (= (size!4440 (buf!4926 (_2!9128 lt!304815))) (size!4440 (buf!4926 (_2!9128 lt!305155)))) (bvsge lt!305197 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196251 (= lt!305197 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!196251 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!7988 BitStream!7988) tuple2!16978)

(assert (=> b!196251 (= lt!305184 (reader!0 (_2!9128 lt!304815) (_2!9128 lt!305155)))))

(declare-fun b!196252 () Bool)

(declare-fun e!134889 () (_ BitVec 64))

(assert (=> b!196252 (= e!134889 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!196253 () Bool)

(declare-fun res!164196 () Bool)

(assert (=> b!196253 (=> (not res!164196) (not e!134887))))

(declare-fun lt!305180 () (_ BitVec 64))

(declare-fun lt!305194 () (_ BitVec 64))

(assert (=> b!196253 (= res!164196 (= (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!305155))) (currentByte!9237 (_2!9128 lt!305155)) (currentBit!9232 (_2!9128 lt!305155))) (bvsub lt!305180 lt!305194)))))

(assert (=> b!196253 (or (= (bvand lt!305180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305194 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!305180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!305180 lt!305194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196253 (= lt!305194 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!305179 () (_ BitVec 64))

(declare-fun lt!305165 () (_ BitVec 64))

(assert (=> b!196253 (= lt!305180 (bvadd lt!305179 lt!305165))))

(assert (=> b!196253 (or (not (= (bvand lt!305179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305165 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!305179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!305179 lt!305165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196253 (= lt!305165 ((_ sign_extend 32) nBits!348))))

(assert (=> b!196253 (= lt!305179 (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!304815))) (currentByte!9237 (_2!9128 lt!304815)) (currentBit!9232 (_2!9128 lt!304815))))))

(declare-fun b!196254 () Bool)

(assert (=> b!196254 (= e!134889 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!196255 () Bool)

(assert (=> b!196255 (= e!134891 (= (_1!9133 lt!305173) (_2!9134 lt!305184)))))

(declare-fun b!196256 () Bool)

(declare-fun res!164204 () Bool)

(assert (=> b!196256 (= res!164204 (= (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!305164))) (currentByte!9237 (_2!9128 lt!305164)) (currentBit!9232 (_2!9128 lt!305164))) (bvadd (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!304815))) (currentByte!9237 (_2!9128 lt!304815)) (currentBit!9232 (_2!9128 lt!304815))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!196256 (=> (not res!164204) (not e!134883))))

(declare-fun d!66385 () Bool)

(assert (=> d!66385 e!134887))

(declare-fun res!164200 () Bool)

(assert (=> d!66385 (=> (not res!164200) (not e!134887))))

(assert (=> d!66385 (= res!164200 (invariant!0 (currentBit!9232 (_2!9128 lt!305155)) (currentByte!9237 (_2!9128 lt!305155)) (size!4440 (buf!4926 (_2!9128 lt!305155)))))))

(declare-fun e!134890 () tuple2!16966)

(assert (=> d!66385 (= lt!305155 e!134890)))

(declare-fun c!9767 () Bool)

(assert (=> d!66385 (= c!9767 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!66385 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66385 (= (appendBitsLSBFirstLoopTR!0 (_2!9128 lt!304815) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!305155)))

(declare-fun b!196257 () Bool)

(assert (=> b!196257 (= e!134888 (= (bitIndex!0 (size!4440 (buf!4926 (_1!9129 lt!305168))) (currentByte!9237 (_1!9129 lt!305168)) (currentBit!9232 (_1!9129 lt!305168))) (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!305164))) (currentByte!9237 (_2!9128 lt!305164)) (currentBit!9232 (_2!9128 lt!305164)))))))

(declare-fun b!196258 () Bool)

(declare-fun e!134885 () Bool)

(declare-fun lt!305147 () tuple2!16976)

(declare-fun lt!305172 () tuple2!16978)

(assert (=> b!196258 (= e!134885 (= (_1!9133 lt!305147) (_2!9134 lt!305172)))))

(declare-fun b!196259 () Bool)

(declare-fun res!164205 () Bool)

(assert (=> b!196259 (= res!164205 (isPrefixOf!0 (_2!9128 lt!304815) (_2!9128 lt!305164)))))

(assert (=> b!196259 (=> (not res!164205) (not e!134883))))

(declare-fun call!3077 () Bool)

(declare-fun bm!3074 () Bool)

(declare-fun lt!305201 () tuple2!16966)

(assert (=> bm!3074 (= call!3077 (isPrefixOf!0 (_2!9128 lt!304815) (ite c!9767 (_2!9128 lt!304815) (_2!9128 lt!305201))))))

(declare-fun b!196260 () Bool)

(declare-fun Unit!13860 () Unit!13856)

(assert (=> b!196260 (= e!134890 (tuple2!16967 Unit!13860 (_2!9128 lt!304815)))))

(declare-fun lt!305175 () Unit!13856)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7988) Unit!13856)

(assert (=> b!196260 (= lt!305175 (lemmaIsPrefixRefl!0 (_2!9128 lt!304815)))))

(assert (=> b!196260 call!3077))

(declare-fun lt!305170 () Unit!13856)

(assert (=> b!196260 (= lt!305170 lt!305175)))

(declare-fun b!196261 () Bool)

(assert (=> b!196261 (= e!134890 (tuple2!16967 (_1!9128 lt!305201) (_2!9128 lt!305201)))))

(assert (=> b!196261 (= lt!305152 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196261 (= lt!305164 (appendBit!0 (_2!9128 lt!304815) lt!305152))))

(declare-fun res!164197 () Bool)

(assert (=> b!196261 (= res!164197 (= (size!4440 (buf!4926 (_2!9128 lt!304815))) (size!4440 (buf!4926 (_2!9128 lt!305164)))))))

(assert (=> b!196261 (=> (not res!164197) (not e!134883))))

(assert (=> b!196261 e!134883))

(declare-fun lt!305192 () tuple2!16966)

(assert (=> b!196261 (= lt!305192 lt!305164)))

(assert (=> b!196261 (= lt!305201 (appendBitsLSBFirstLoopTR!0 (_2!9128 lt!305192) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!305182 () Unit!13856)

(assert (=> b!196261 (= lt!305182 (lemmaIsPrefixTransitive!0 (_2!9128 lt!304815) (_2!9128 lt!305192) (_2!9128 lt!305201)))))

(assert (=> b!196261 call!3077))

(declare-fun lt!305163 () Unit!13856)

(assert (=> b!196261 (= lt!305163 lt!305182)))

(assert (=> b!196261 (invariant!0 (currentBit!9232 (_2!9128 lt!304815)) (currentByte!9237 (_2!9128 lt!304815)) (size!4440 (buf!4926 (_2!9128 lt!305192))))))

(declare-fun lt!305153 () BitStream!7988)

(assert (=> b!196261 (= lt!305153 (BitStream!7989 (buf!4926 (_2!9128 lt!305192)) (currentByte!9237 (_2!9128 lt!304815)) (currentBit!9232 (_2!9128 lt!304815))))))

(assert (=> b!196261 (invariant!0 (currentBit!9232 lt!305153) (currentByte!9237 lt!305153) (size!4440 (buf!4926 (_2!9128 lt!305201))))))

(declare-fun lt!305195 () BitStream!7988)

(assert (=> b!196261 (= lt!305195 (BitStream!7989 (buf!4926 (_2!9128 lt!305201)) (currentByte!9237 lt!305153) (currentBit!9232 lt!305153)))))

(assert (=> b!196261 (= lt!305167 (readBitPure!0 lt!305153))))

(assert (=> b!196261 (= lt!305196 (readBitPure!0 lt!305195))))

(declare-fun lt!305154 () Unit!13856)

(declare-fun readBitPrefixLemma!0 (BitStream!7988 BitStream!7988) Unit!13856)

(assert (=> b!196261 (= lt!305154 (readBitPrefixLemma!0 lt!305153 (_2!9128 lt!305201)))))

(declare-fun res!164198 () Bool)

(assert (=> b!196261 (= res!164198 (= (bitIndex!0 (size!4440 (buf!4926 (_1!9129 lt!305167))) (currentByte!9237 (_1!9129 lt!305167)) (currentBit!9232 (_1!9129 lt!305167))) (bitIndex!0 (size!4440 (buf!4926 (_1!9129 lt!305196))) (currentByte!9237 (_1!9129 lt!305196)) (currentBit!9232 (_1!9129 lt!305196)))))))

(assert (=> b!196261 (=> (not res!164198) (not e!134886))))

(assert (=> b!196261 e!134886))

(declare-fun lt!305187 () Unit!13856)

(assert (=> b!196261 (= lt!305187 lt!305154)))

(declare-fun lt!305161 () tuple2!16978)

(assert (=> b!196261 (= lt!305161 (reader!0 (_2!9128 lt!304815) (_2!9128 lt!305201)))))

(declare-fun lt!305156 () tuple2!16978)

(assert (=> b!196261 (= lt!305156 (reader!0 (_2!9128 lt!305192) (_2!9128 lt!305201)))))

(declare-fun lt!305181 () tuple2!16968)

(assert (=> b!196261 (= lt!305181 (readBitPure!0 (_1!9134 lt!305161)))))

(assert (=> b!196261 (= (_2!9129 lt!305181) lt!305152)))

(declare-fun lt!305174 () Unit!13856)

(declare-fun Unit!13870 () Unit!13856)

(assert (=> b!196261 (= lt!305174 Unit!13870)))

(declare-fun lt!305178 () (_ BitVec 64))

(assert (=> b!196261 (= lt!305178 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305148 () (_ BitVec 64))

(assert (=> b!196261 (= lt!305148 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305189 () Unit!13856)

(assert (=> b!196261 (= lt!305189 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9128 lt!304815) (buf!4926 (_2!9128 lt!305201)) lt!305148))))

(assert (=> b!196261 (validate_offset_bits!1 ((_ sign_extend 32) (size!4440 (buf!4926 (_2!9128 lt!305201)))) ((_ sign_extend 32) (currentByte!9237 (_2!9128 lt!304815))) ((_ sign_extend 32) (currentBit!9232 (_2!9128 lt!304815))) lt!305148)))

(declare-fun lt!305186 () Unit!13856)

(assert (=> b!196261 (= lt!305186 lt!305189)))

(declare-fun lt!305162 () tuple2!16976)

(assert (=> b!196261 (= lt!305162 (readNBitsLSBFirstsLoopPure!0 (_1!9134 lt!305161) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!305178))))

(declare-fun lt!305176 () (_ BitVec 64))

(assert (=> b!196261 (= lt!305176 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!305191 () Unit!13856)

(assert (=> b!196261 (= lt!305191 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9128 lt!305192) (buf!4926 (_2!9128 lt!305201)) lt!305176))))

(assert (=> b!196261 (validate_offset_bits!1 ((_ sign_extend 32) (size!4440 (buf!4926 (_2!9128 lt!305201)))) ((_ sign_extend 32) (currentByte!9237 (_2!9128 lt!305192))) ((_ sign_extend 32) (currentBit!9232 (_2!9128 lt!305192))) lt!305176)))

(declare-fun lt!305171 () Unit!13856)

(assert (=> b!196261 (= lt!305171 lt!305191)))

(declare-fun lt!305190 () tuple2!16976)

(assert (=> b!196261 (= lt!305190 (readNBitsLSBFirstsLoopPure!0 (_1!9134 lt!305156) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!305178 (ite (_2!9129 lt!305181) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!305200 () tuple2!16976)

(assert (=> b!196261 (= lt!305200 (readNBitsLSBFirstsLoopPure!0 (_1!9134 lt!305161) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!305178))))

(declare-fun c!9766 () Bool)

(assert (=> b!196261 (= c!9766 (_2!9129 (readBitPure!0 (_1!9134 lt!305161))))))

(declare-fun lt!305183 () tuple2!16976)

(declare-fun withMovedBitIndex!0 (BitStream!7988 (_ BitVec 64)) BitStream!7988)

(assert (=> b!196261 (= lt!305183 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9134 lt!305161) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!305178 e!134889)))))

(declare-fun lt!305198 () Unit!13856)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13856)

(assert (=> b!196261 (= lt!305198 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9134 lt!305161) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!305178))))

(assert (=> b!196261 (and (= (_2!9133 lt!305200) (_2!9133 lt!305183)) (= (_1!9133 lt!305200) (_1!9133 lt!305183)))))

(declare-fun lt!305177 () Unit!13856)

(assert (=> b!196261 (= lt!305177 lt!305198)))

(assert (=> b!196261 (= (_1!9134 lt!305161) (withMovedBitIndex!0 (_2!9134 lt!305161) (bvsub (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!304815))) (currentByte!9237 (_2!9128 lt!304815)) (currentBit!9232 (_2!9128 lt!304815))) (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!305201))) (currentByte!9237 (_2!9128 lt!305201)) (currentBit!9232 (_2!9128 lt!305201))))))))

(declare-fun lt!305185 () Unit!13856)

(declare-fun Unit!13871 () Unit!13856)

(assert (=> b!196261 (= lt!305185 Unit!13871)))

(assert (=> b!196261 (= (_1!9134 lt!305156) (withMovedBitIndex!0 (_2!9134 lt!305156) (bvsub (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!305192))) (currentByte!9237 (_2!9128 lt!305192)) (currentBit!9232 (_2!9128 lt!305192))) (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!305201))) (currentByte!9237 (_2!9128 lt!305201)) (currentBit!9232 (_2!9128 lt!305201))))))))

(declare-fun lt!305150 () Unit!13856)

(declare-fun Unit!13872 () Unit!13856)

(assert (=> b!196261 (= lt!305150 Unit!13872)))

(assert (=> b!196261 (= (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!304815))) (currentByte!9237 (_2!9128 lt!304815)) (currentBit!9232 (_2!9128 lt!304815))) (bvsub (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!305192))) (currentByte!9237 (_2!9128 lt!305192)) (currentBit!9232 (_2!9128 lt!305192))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!305151 () Unit!13856)

(declare-fun Unit!13873 () Unit!13856)

(assert (=> b!196261 (= lt!305151 Unit!13873)))

(assert (=> b!196261 (= (_2!9133 lt!305162) (_2!9133 lt!305190))))

(declare-fun lt!305199 () Unit!13856)

(declare-fun Unit!13874 () Unit!13856)

(assert (=> b!196261 (= lt!305199 Unit!13874)))

(assert (=> b!196261 (invariant!0 (currentBit!9232 (_2!9128 lt!305201)) (currentByte!9237 (_2!9128 lt!305201)) (size!4440 (buf!4926 (_2!9128 lt!305201))))))

(declare-fun lt!305157 () Unit!13856)

(declare-fun Unit!13875 () Unit!13856)

(assert (=> b!196261 (= lt!305157 Unit!13875)))

(assert (=> b!196261 (= (size!4440 (buf!4926 (_2!9128 lt!304815))) (size!4440 (buf!4926 (_2!9128 lt!305201))))))

(declare-fun lt!305146 () Unit!13856)

(declare-fun Unit!13876 () Unit!13856)

(assert (=> b!196261 (= lt!305146 Unit!13876)))

(assert (=> b!196261 (= (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!305201))) (currentByte!9237 (_2!9128 lt!305201)) (currentBit!9232 (_2!9128 lt!305201))) (bvsub (bvadd (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!304815))) (currentByte!9237 (_2!9128 lt!304815)) (currentBit!9232 (_2!9128 lt!304815))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305193 () Unit!13856)

(declare-fun Unit!13877 () Unit!13856)

(assert (=> b!196261 (= lt!305193 Unit!13877)))

(declare-fun lt!305160 () Unit!13856)

(declare-fun Unit!13878 () Unit!13856)

(assert (=> b!196261 (= lt!305160 Unit!13878)))

(assert (=> b!196261 (= lt!305172 (reader!0 (_2!9128 lt!304815) (_2!9128 lt!305201)))))

(declare-fun lt!305188 () (_ BitVec 64))

(assert (=> b!196261 (= lt!305188 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305169 () Unit!13856)

(assert (=> b!196261 (= lt!305169 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9128 lt!304815) (buf!4926 (_2!9128 lt!305201)) lt!305188))))

(assert (=> b!196261 (validate_offset_bits!1 ((_ sign_extend 32) (size!4440 (buf!4926 (_2!9128 lt!305201)))) ((_ sign_extend 32) (currentByte!9237 (_2!9128 lt!304815))) ((_ sign_extend 32) (currentBit!9232 (_2!9128 lt!304815))) lt!305188)))

(declare-fun lt!305149 () Unit!13856)

(assert (=> b!196261 (= lt!305149 lt!305169)))

(assert (=> b!196261 (= lt!305147 (readNBitsLSBFirstsLoopPure!0 (_1!9134 lt!305172) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!164203 () Bool)

(assert (=> b!196261 (= res!164203 (= (_2!9133 lt!305147) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!196261 (=> (not res!164203) (not e!134885))))

(assert (=> b!196261 e!134885))

(declare-fun lt!305159 () Unit!13856)

(declare-fun Unit!13879 () Unit!13856)

(assert (=> b!196261 (= lt!305159 Unit!13879)))

(assert (= (and d!66385 c!9767) b!196260))

(assert (= (and d!66385 (not c!9767)) b!196261))

(assert (= (and b!196261 res!164197) b!196256))

(assert (= (and b!196256 res!164204) b!196259))

(assert (= (and b!196259 res!164205) b!196249))

(assert (= (and b!196249 res!164201) b!196257))

(assert (= (and b!196261 res!164198) b!196246))

(assert (= (and b!196261 c!9766) b!196254))

(assert (= (and b!196261 (not c!9766)) b!196252))

(assert (= (and b!196261 res!164203) b!196258))

(assert (= (or b!196260 b!196261) bm!3074))

(assert (= (and d!66385 res!164200) b!196248))

(assert (= (and b!196248 res!164202) b!196253))

(assert (= (and b!196253 res!164196) b!196250))

(assert (= (and b!196250 res!164194) b!196251))

(assert (= (and b!196251 res!164195) b!196247))

(assert (= (and b!196251 res!164199) b!196255))

(declare-fun m!303493 () Bool)

(assert (=> b!196259 m!303493))

(declare-fun m!303495 () Bool)

(assert (=> b!196253 m!303495))

(assert (=> b!196253 m!303389))

(declare-fun m!303497 () Bool)

(assert (=> b!196247 m!303497))

(declare-fun m!303499 () Bool)

(assert (=> b!196257 m!303499))

(declare-fun m!303501 () Bool)

(assert (=> b!196257 m!303501))

(declare-fun m!303503 () Bool)

(assert (=> d!66385 m!303503))

(declare-fun m!303505 () Bool)

(assert (=> b!196249 m!303505))

(assert (=> b!196249 m!303505))

(declare-fun m!303507 () Bool)

(assert (=> b!196249 m!303507))

(declare-fun m!303509 () Bool)

(assert (=> bm!3074 m!303509))

(declare-fun m!303511 () Bool)

(assert (=> b!196250 m!303511))

(declare-fun m!303513 () Bool)

(assert (=> b!196261 m!303513))

(declare-fun m!303515 () Bool)

(assert (=> b!196261 m!303515))

(declare-fun m!303517 () Bool)

(assert (=> b!196261 m!303517))

(declare-fun m!303519 () Bool)

(assert (=> b!196261 m!303519))

(declare-fun m!303521 () Bool)

(assert (=> b!196261 m!303521))

(declare-fun m!303523 () Bool)

(assert (=> b!196261 m!303523))

(declare-fun m!303525 () Bool)

(assert (=> b!196261 m!303525))

(declare-fun m!303527 () Bool)

(assert (=> b!196261 m!303527))

(declare-fun m!303529 () Bool)

(assert (=> b!196261 m!303529))

(declare-fun m!303531 () Bool)

(assert (=> b!196261 m!303531))

(declare-fun m!303533 () Bool)

(assert (=> b!196261 m!303533))

(declare-fun m!303535 () Bool)

(assert (=> b!196261 m!303535))

(declare-fun m!303537 () Bool)

(assert (=> b!196261 m!303537))

(declare-fun m!303539 () Bool)

(assert (=> b!196261 m!303539))

(declare-fun m!303541 () Bool)

(assert (=> b!196261 m!303541))

(declare-fun m!303543 () Bool)

(assert (=> b!196261 m!303543))

(declare-fun m!303545 () Bool)

(assert (=> b!196261 m!303545))

(declare-fun m!303547 () Bool)

(assert (=> b!196261 m!303547))

(declare-fun m!303549 () Bool)

(assert (=> b!196261 m!303549))

(declare-fun m!303551 () Bool)

(assert (=> b!196261 m!303551))

(declare-fun m!303553 () Bool)

(assert (=> b!196261 m!303553))

(declare-fun m!303555 () Bool)

(assert (=> b!196261 m!303555))

(declare-fun m!303557 () Bool)

(assert (=> b!196261 m!303557))

(declare-fun m!303559 () Bool)

(assert (=> b!196261 m!303559))

(declare-fun m!303561 () Bool)

(assert (=> b!196261 m!303561))

(declare-fun m!303563 () Bool)

(assert (=> b!196261 m!303563))

(declare-fun m!303565 () Bool)

(assert (=> b!196261 m!303565))

(declare-fun m!303567 () Bool)

(assert (=> b!196261 m!303567))

(declare-fun m!303569 () Bool)

(assert (=> b!196261 m!303569))

(assert (=> b!196261 m!303535))

(declare-fun m!303571 () Bool)

(assert (=> b!196261 m!303571))

(assert (=> b!196261 m!303389))

(declare-fun m!303573 () Bool)

(assert (=> b!196261 m!303573))

(declare-fun m!303575 () Bool)

(assert (=> b!196261 m!303575))

(declare-fun m!303577 () Bool)

(assert (=> b!196251 m!303577))

(declare-fun m!303579 () Bool)

(assert (=> b!196251 m!303579))

(declare-fun m!303581 () Bool)

(assert (=> b!196251 m!303581))

(assert (=> b!196251 m!303575))

(assert (=> b!196251 m!303527))

(declare-fun m!303583 () Bool)

(assert (=> b!196251 m!303583))

(assert (=> b!196256 m!303501))

(assert (=> b!196256 m!303389))

(declare-fun m!303585 () Bool)

(assert (=> b!196260 m!303585))

(assert (=> b!196087 d!66385))

(declare-fun d!66419 () Bool)

(assert (=> d!66419 (= (array_inv!4181 (buf!4926 thiss!1204)) (bvsge (size!4440 (buf!4926 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!196092 d!66419))

(assert (=> b!196091 d!66363))

(assert (=> b!196091 d!66369))

(declare-fun b!196301 () Bool)

(declare-fun res!164241 () Bool)

(declare-fun e!134913 () Bool)

(assert (=> b!196301 (=> (not res!164241) (not e!134913))))

(declare-fun lt!305311 () (_ BitVec 64))

(declare-fun lt!305308 () tuple2!16966)

(declare-fun lt!305310 () (_ BitVec 64))

(assert (=> b!196301 (= res!164241 (= (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!305308))) (currentByte!9237 (_2!9128 lt!305308)) (currentBit!9232 (_2!9128 lt!305308))) (bvadd lt!305311 lt!305310)))))

(assert (=> b!196301 (or (not (= (bvand lt!305311 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305310 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!305311 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!305311 lt!305310) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196301 (= lt!305310 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!196301 (= lt!305311 (bitIndex!0 (size!4440 (buf!4926 thiss!1204)) (currentByte!9237 thiss!1204) (currentBit!9232 thiss!1204)))))

(declare-fun b!196303 () Bool)

(declare-fun e!134914 () Bool)

(assert (=> b!196303 (= e!134913 e!134914)))

(declare-fun res!164240 () Bool)

(assert (=> b!196303 (=> (not res!164240) (not e!134914))))

(declare-fun lt!305309 () tuple2!16968)

(assert (=> b!196303 (= res!164240 (and (= (_2!9129 lt!305309) lt!304814) (= (_1!9129 lt!305309) (_2!9128 lt!305308))))))

(assert (=> b!196303 (= lt!305309 (readBitPure!0 (readerFrom!0 (_2!9128 lt!305308) (currentBit!9232 thiss!1204) (currentByte!9237 thiss!1204))))))

(declare-fun b!196302 () Bool)

(declare-fun res!164243 () Bool)

(assert (=> b!196302 (=> (not res!164243) (not e!134913))))

(assert (=> b!196302 (= res!164243 (isPrefixOf!0 thiss!1204 (_2!9128 lt!305308)))))

(declare-fun d!66421 () Bool)

(assert (=> d!66421 e!134913))

(declare-fun res!164242 () Bool)

(assert (=> d!66421 (=> (not res!164242) (not e!134913))))

(assert (=> d!66421 (= res!164242 (= (size!4440 (buf!4926 thiss!1204)) (size!4440 (buf!4926 (_2!9128 lt!305308)))))))

(declare-fun choose!16 (BitStream!7988 Bool) tuple2!16966)

(assert (=> d!66421 (= lt!305308 (choose!16 thiss!1204 lt!304814))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66421 (validate_offset_bit!0 ((_ sign_extend 32) (size!4440 (buf!4926 thiss!1204))) ((_ sign_extend 32) (currentByte!9237 thiss!1204)) ((_ sign_extend 32) (currentBit!9232 thiss!1204)))))

(assert (=> d!66421 (= (appendBit!0 thiss!1204 lt!304814) lt!305308)))

(declare-fun b!196304 () Bool)

(assert (=> b!196304 (= e!134914 (= (bitIndex!0 (size!4440 (buf!4926 (_1!9129 lt!305309))) (currentByte!9237 (_1!9129 lt!305309)) (currentBit!9232 (_1!9129 lt!305309))) (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!305308))) (currentByte!9237 (_2!9128 lt!305308)) (currentBit!9232 (_2!9128 lt!305308)))))))

(assert (= (and d!66421 res!164242) b!196301))

(assert (= (and b!196301 res!164241) b!196302))

(assert (= (and b!196302 res!164243) b!196303))

(assert (= (and b!196303 res!164240) b!196304))

(declare-fun m!303659 () Bool)

(assert (=> b!196304 m!303659))

(declare-fun m!303665 () Bool)

(assert (=> b!196304 m!303665))

(declare-fun m!303667 () Bool)

(assert (=> b!196303 m!303667))

(assert (=> b!196303 m!303667))

(declare-fun m!303673 () Bool)

(assert (=> b!196303 m!303673))

(declare-fun m!303677 () Bool)

(assert (=> d!66421 m!303677))

(declare-fun m!303679 () Bool)

(assert (=> d!66421 m!303679))

(declare-fun m!303683 () Bool)

(assert (=> b!196302 m!303683))

(assert (=> b!196301 m!303665))

(assert (=> b!196301 m!303391))

(assert (=> b!196091 d!66421))

(declare-fun d!66423 () Bool)

(declare-datatypes ((tuple2!16982 0))(
  ( (tuple2!16983 (_1!9136 Bool) (_2!9136 BitStream!7988)) )
))
(declare-fun lt!305314 () tuple2!16982)

(declare-fun readBit!0 (BitStream!7988) tuple2!16982)

(assert (=> d!66423 (= lt!305314 (readBit!0 (readerFrom!0 (_2!9128 lt!304815) (currentBit!9232 thiss!1204) (currentByte!9237 thiss!1204))))))

(assert (=> d!66423 (= (readBitPure!0 (readerFrom!0 (_2!9128 lt!304815) (currentBit!9232 thiss!1204) (currentByte!9237 thiss!1204))) (tuple2!16969 (_2!9136 lt!305314) (_1!9136 lt!305314)))))

(declare-fun bs!16507 () Bool)

(assert (= bs!16507 d!66423))

(assert (=> bs!16507 m!303377))

(declare-fun m!303695 () Bool)

(assert (=> bs!16507 m!303695))

(assert (=> b!196096 d!66423))

(declare-fun d!66427 () Bool)

(declare-fun e!134917 () Bool)

(assert (=> d!66427 e!134917))

(declare-fun res!164247 () Bool)

(assert (=> d!66427 (=> (not res!164247) (not e!134917))))

(assert (=> d!66427 (= res!164247 (invariant!0 (currentBit!9232 (_2!9128 lt!304815)) (currentByte!9237 (_2!9128 lt!304815)) (size!4440 (buf!4926 (_2!9128 lt!304815)))))))

(assert (=> d!66427 (= (readerFrom!0 (_2!9128 lt!304815) (currentBit!9232 thiss!1204) (currentByte!9237 thiss!1204)) (BitStream!7989 (buf!4926 (_2!9128 lt!304815)) (currentByte!9237 thiss!1204) (currentBit!9232 thiss!1204)))))

(declare-fun b!196307 () Bool)

(assert (=> b!196307 (= e!134917 (invariant!0 (currentBit!9232 thiss!1204) (currentByte!9237 thiss!1204) (size!4440 (buf!4926 (_2!9128 lt!304815)))))))

(assert (= (and d!66427 res!164247) b!196307))

(assert (=> d!66427 m!303425))

(declare-fun m!303697 () Bool)

(assert (=> b!196307 m!303697))

(assert (=> b!196096 d!66427))

(declare-fun d!66429 () Bool)

(declare-fun res!164250 () Bool)

(declare-fun e!134919 () Bool)

(assert (=> d!66429 (=> (not res!164250) (not e!134919))))

(assert (=> d!66429 (= res!164250 (= (size!4440 (buf!4926 thiss!1204)) (size!4440 (buf!4926 (_2!9128 lt!304815)))))))

(assert (=> d!66429 (= (isPrefixOf!0 thiss!1204 (_2!9128 lt!304815)) e!134919)))

(declare-fun b!196308 () Bool)

(declare-fun res!164248 () Bool)

(assert (=> b!196308 (=> (not res!164248) (not e!134919))))

(assert (=> b!196308 (= res!164248 (bvsle (bitIndex!0 (size!4440 (buf!4926 thiss!1204)) (currentByte!9237 thiss!1204) (currentBit!9232 thiss!1204)) (bitIndex!0 (size!4440 (buf!4926 (_2!9128 lt!304815))) (currentByte!9237 (_2!9128 lt!304815)) (currentBit!9232 (_2!9128 lt!304815)))))))

(declare-fun b!196309 () Bool)

(declare-fun e!134918 () Bool)

(assert (=> b!196309 (= e!134919 e!134918)))

(declare-fun res!164249 () Bool)

(assert (=> b!196309 (=> res!164249 e!134918)))

(assert (=> b!196309 (= res!164249 (= (size!4440 (buf!4926 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!196310 () Bool)

(assert (=> b!196310 (= e!134918 (arrayBitRangesEq!0 (buf!4926 thiss!1204) (buf!4926 (_2!9128 lt!304815)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4440 (buf!4926 thiss!1204)) (currentByte!9237 thiss!1204) (currentBit!9232 thiss!1204))))))

(assert (= (and d!66429 res!164250) b!196308))

(assert (= (and b!196308 res!164248) b!196309))

(assert (= (and b!196309 (not res!164249)) b!196310))

(assert (=> b!196308 m!303391))

(assert (=> b!196308 m!303389))

(assert (=> b!196310 m!303391))

(assert (=> b!196310 m!303391))

(declare-fun m!303699 () Bool)

(assert (=> b!196310 m!303699))

(assert (=> b!196090 d!66429))

(declare-fun d!66431 () Bool)

(assert (=> d!66431 (= (invariant!0 (currentBit!9232 thiss!1204) (currentByte!9237 thiss!1204) (size!4440 (buf!4926 thiss!1204))) (and (bvsge (currentBit!9232 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9232 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9237 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9237 thiss!1204) (size!4440 (buf!4926 thiss!1204))) (and (= (currentBit!9232 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9237 thiss!1204) (size!4440 (buf!4926 thiss!1204)))))))))

(assert (=> b!196095 d!66431))

(declare-fun d!66433 () Bool)

(assert (=> d!66433 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9232 thiss!1204) (currentByte!9237 thiss!1204) (size!4440 (buf!4926 thiss!1204))))))

(declare-fun bs!16508 () Bool)

(assert (= bs!16508 d!66433))

(assert (=> bs!16508 m!303405))

(assert (=> start!41694 d!66433))

(push 1)

