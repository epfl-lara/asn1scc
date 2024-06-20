; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41692 () Bool)

(assert start!41692)

(declare-fun res!164027 () Bool)

(declare-fun e!134771 () Bool)

(assert (=> start!41692 (=> (not res!164027) (not e!134771))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!41692 (= res!164027 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41692 e!134771))

(assert (=> start!41692 true))

(declare-datatypes ((array!10066 0))(
  ( (array!10067 (arr!5369 (Array (_ BitVec 32) (_ BitVec 8))) (size!4439 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7986 0))(
  ( (BitStream!7987 (buf!4925 array!10066) (currentByte!9236 (_ BitVec 32)) (currentBit!9231 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7986)

(declare-fun e!134772 () Bool)

(declare-fun inv!12 (BitStream!7986) Bool)

(assert (=> start!41692 (and (inv!12 thiss!1204) e!134772)))

(declare-fun b!196054 () Bool)

(declare-fun e!134770 () Bool)

(declare-datatypes ((Unit!13854 0))(
  ( (Unit!13855) )
))
(declare-datatypes ((tuple2!16962 0))(
  ( (tuple2!16963 (_1!9126 Unit!13854) (_2!9126 BitStream!7986)) )
))
(declare-fun lt!304781 () tuple2!16962)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!196054 (= e!134770 (invariant!0 (currentBit!9231 (_2!9126 lt!304781)) (currentByte!9236 (_2!9126 lt!304781)) (size!4439 (buf!4925 (_2!9126 lt!304781)))))))

(declare-fun b!196055 () Bool)

(declare-fun array_inv!4180 (array!10066) Bool)

(assert (=> b!196055 (= e!134772 (array_inv!4180 (buf!4925 thiss!1204)))))

(declare-fun b!196056 () Bool)

(declare-fun e!134769 () Bool)

(assert (=> b!196056 (= e!134769 e!134770)))

(declare-fun res!164028 () Bool)

(assert (=> b!196056 (=> res!164028 e!134770)))

(declare-fun lt!304787 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196056 (= res!164028 (not (= (bitIndex!0 (size!4439 (buf!4925 (_2!9126 lt!304781))) (currentByte!9236 (_2!9126 lt!304781)) (currentBit!9231 (_2!9126 lt!304781))) (bvsub (bvsub (bvadd lt!304787 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun isPrefixOf!0 (BitStream!7986 BitStream!7986) Bool)

(assert (=> b!196056 (isPrefixOf!0 thiss!1204 (_2!9126 lt!304781))))

(declare-fun lt!304783 () tuple2!16962)

(declare-fun lt!304782 () Unit!13854)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7986 BitStream!7986 BitStream!7986) Unit!13854)

(assert (=> b!196056 (= lt!304782 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9126 lt!304783) (_2!9126 lt!304781)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7986 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16962)

(assert (=> b!196056 (= lt!304781 (appendBitsLSBFirstLoopTR!0 (_2!9126 lt!304783) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!196057 () Bool)

(declare-fun res!164023 () Bool)

(assert (=> b!196057 (=> (not res!164023) (not e!134771))))

(assert (=> b!196057 (= res!164023 (not (= i!590 nBits!348)))))

(declare-fun b!196058 () Bool)

(assert (=> b!196058 (= e!134771 (not e!134769))))

(declare-fun res!164024 () Bool)

(assert (=> b!196058 (=> res!164024 e!134769)))

(declare-fun lt!304789 () (_ BitVec 64))

(assert (=> b!196058 (= res!164024 (not (= lt!304787 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!304789))))))

(assert (=> b!196058 (= lt!304787 (bitIndex!0 (size!4439 (buf!4925 (_2!9126 lt!304783))) (currentByte!9236 (_2!9126 lt!304783)) (currentBit!9231 (_2!9126 lt!304783))))))

(assert (=> b!196058 (= lt!304789 (bitIndex!0 (size!4439 (buf!4925 thiss!1204)) (currentByte!9236 thiss!1204) (currentBit!9231 thiss!1204)))))

(declare-fun e!134773 () Bool)

(assert (=> b!196058 e!134773))

(declare-fun res!164031 () Bool)

(assert (=> b!196058 (=> (not res!164031) (not e!134773))))

(assert (=> b!196058 (= res!164031 (= (size!4439 (buf!4925 thiss!1204)) (size!4439 (buf!4925 (_2!9126 lt!304783)))))))

(declare-fun lt!304785 () Bool)

(declare-fun appendBit!0 (BitStream!7986 Bool) tuple2!16962)

(assert (=> b!196058 (= lt!304783 (appendBit!0 thiss!1204 lt!304785))))

(assert (=> b!196058 (= lt!304785 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!196059 () Bool)

(declare-fun res!164026 () Bool)

(assert (=> b!196059 (=> (not res!164026) (not e!134771))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196059 (= res!164026 (validate_offset_bits!1 ((_ sign_extend 32) (size!4439 (buf!4925 thiss!1204))) ((_ sign_extend 32) (currentByte!9236 thiss!1204)) ((_ sign_extend 32) (currentBit!9231 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!196060 () Bool)

(declare-fun res!164022 () Bool)

(declare-fun e!134767 () Bool)

(assert (=> b!196060 (=> (not res!164022) (not e!134767))))

(assert (=> b!196060 (= res!164022 (isPrefixOf!0 thiss!1204 (_2!9126 lt!304783)))))

(declare-fun b!196061 () Bool)

(declare-fun res!164029 () Bool)

(assert (=> b!196061 (=> (not res!164029) (not e!134771))))

(assert (=> b!196061 (= res!164029 (invariant!0 (currentBit!9231 thiss!1204) (currentByte!9236 thiss!1204) (size!4439 (buf!4925 thiss!1204))))))

(declare-fun b!196062 () Bool)

(declare-fun e!134774 () Bool)

(declare-datatypes ((tuple2!16964 0))(
  ( (tuple2!16965 (_1!9127 BitStream!7986) (_2!9127 Bool)) )
))
(declare-fun lt!304786 () tuple2!16964)

(declare-fun lt!304784 () (_ BitVec 64))

(assert (=> b!196062 (= e!134774 (= (bitIndex!0 (size!4439 (buf!4925 (_1!9127 lt!304786))) (currentByte!9236 (_1!9127 lt!304786)) (currentBit!9231 (_1!9127 lt!304786))) lt!304784))))

(declare-fun b!196063 () Bool)

(assert (=> b!196063 (= e!134767 e!134774)))

(declare-fun res!164025 () Bool)

(assert (=> b!196063 (=> (not res!164025) (not e!134774))))

(assert (=> b!196063 (= res!164025 (and (= (_2!9127 lt!304786) lt!304785) (= (_1!9127 lt!304786) (_2!9126 lt!304783))))))

(declare-fun readBitPure!0 (BitStream!7986) tuple2!16964)

(declare-fun readerFrom!0 (BitStream!7986 (_ BitVec 32) (_ BitVec 32)) BitStream!7986)

(assert (=> b!196063 (= lt!304786 (readBitPure!0 (readerFrom!0 (_2!9126 lt!304783) (currentBit!9231 thiss!1204) (currentByte!9236 thiss!1204))))))

(declare-fun b!196064 () Bool)

(assert (=> b!196064 (= e!134773 e!134767)))

(declare-fun res!164030 () Bool)

(assert (=> b!196064 (=> (not res!164030) (not e!134767))))

(declare-fun lt!304788 () (_ BitVec 64))

(assert (=> b!196064 (= res!164030 (= lt!304784 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!304788)))))

(assert (=> b!196064 (= lt!304784 (bitIndex!0 (size!4439 (buf!4925 (_2!9126 lt!304783))) (currentByte!9236 (_2!9126 lt!304783)) (currentBit!9231 (_2!9126 lt!304783))))))

(assert (=> b!196064 (= lt!304788 (bitIndex!0 (size!4439 (buf!4925 thiss!1204)) (currentByte!9236 thiss!1204) (currentBit!9231 thiss!1204)))))

(assert (= (and start!41692 res!164027) b!196059))

(assert (= (and b!196059 res!164026) b!196061))

(assert (= (and b!196061 res!164029) b!196057))

(assert (= (and b!196057 res!164023) b!196058))

(assert (= (and b!196058 res!164031) b!196064))

(assert (= (and b!196064 res!164030) b!196060))

(assert (= (and b!196060 res!164022) b!196063))

(assert (= (and b!196063 res!164025) b!196062))

(assert (= (and b!196058 (not res!164024)) b!196056))

(assert (= (and b!196056 (not res!164028)) b!196054))

(assert (= start!41692 b!196055))

(declare-fun m!303343 () Bool)

(assert (=> b!196062 m!303343))

(declare-fun m!303345 () Bool)

(assert (=> b!196055 m!303345))

(declare-fun m!303347 () Bool)

(assert (=> b!196061 m!303347))

(declare-fun m!303349 () Bool)

(assert (=> b!196058 m!303349))

(declare-fun m!303351 () Bool)

(assert (=> b!196058 m!303351))

(declare-fun m!303353 () Bool)

(assert (=> b!196058 m!303353))

(declare-fun m!303355 () Bool)

(assert (=> b!196060 m!303355))

(declare-fun m!303357 () Bool)

(assert (=> b!196063 m!303357))

(assert (=> b!196063 m!303357))

(declare-fun m!303359 () Bool)

(assert (=> b!196063 m!303359))

(declare-fun m!303361 () Bool)

(assert (=> b!196054 m!303361))

(declare-fun m!303363 () Bool)

(assert (=> b!196059 m!303363))

(declare-fun m!303365 () Bool)

(assert (=> start!41692 m!303365))

(assert (=> b!196064 m!303349))

(assert (=> b!196064 m!303351))

(declare-fun m!303367 () Bool)

(assert (=> b!196056 m!303367))

(declare-fun m!303369 () Bool)

(assert (=> b!196056 m!303369))

(declare-fun m!303371 () Bool)

(assert (=> b!196056 m!303371))

(declare-fun m!303373 () Bool)

(assert (=> b!196056 m!303373))

(check-sat (not b!196061) (not b!196059) (not b!196064) (not b!196056) (not b!196058) (not start!41692) (not b!196055) (not b!196060) (not b!196062) (not b!196054) (not b!196063))
(check-sat)
(get-model)

(declare-fun d!66347 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66347 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4439 (buf!4925 thiss!1204))) ((_ sign_extend 32) (currentByte!9236 thiss!1204)) ((_ sign_extend 32) (currentBit!9231 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4439 (buf!4925 thiss!1204))) ((_ sign_extend 32) (currentByte!9236 thiss!1204)) ((_ sign_extend 32) (currentBit!9231 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16497 () Bool)

(assert (= bs!16497 d!66347))

(declare-fun m!303407 () Bool)

(assert (=> bs!16497 m!303407))

(assert (=> b!196059 d!66347))

(declare-fun d!66349 () Bool)

(declare-fun e!134807 () Bool)

(assert (=> d!66349 e!134807))

(declare-fun res!164076 () Bool)

(assert (=> d!66349 (=> (not res!164076) (not e!134807))))

(declare-fun lt!304833 () (_ BitVec 64))

(declare-fun lt!304834 () (_ BitVec 64))

(declare-fun lt!304829 () (_ BitVec 64))

(assert (=> d!66349 (= res!164076 (= lt!304829 (bvsub lt!304834 lt!304833)))))

(assert (=> d!66349 (or (= (bvand lt!304834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304833 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304834 lt!304833) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66349 (= lt!304833 (remainingBits!0 ((_ sign_extend 32) (size!4439 (buf!4925 (_2!9126 lt!304783)))) ((_ sign_extend 32) (currentByte!9236 (_2!9126 lt!304783))) ((_ sign_extend 32) (currentBit!9231 (_2!9126 lt!304783)))))))

(declare-fun lt!304831 () (_ BitVec 64))

(declare-fun lt!304832 () (_ BitVec 64))

(assert (=> d!66349 (= lt!304834 (bvmul lt!304831 lt!304832))))

(assert (=> d!66349 (or (= lt!304831 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304832 (bvsdiv (bvmul lt!304831 lt!304832) lt!304831)))))

(assert (=> d!66349 (= lt!304832 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66349 (= lt!304831 ((_ sign_extend 32) (size!4439 (buf!4925 (_2!9126 lt!304783)))))))

(assert (=> d!66349 (= lt!304829 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9236 (_2!9126 lt!304783))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9231 (_2!9126 lt!304783)))))))

(assert (=> d!66349 (invariant!0 (currentBit!9231 (_2!9126 lt!304783)) (currentByte!9236 (_2!9126 lt!304783)) (size!4439 (buf!4925 (_2!9126 lt!304783))))))

(assert (=> d!66349 (= (bitIndex!0 (size!4439 (buf!4925 (_2!9126 lt!304783))) (currentByte!9236 (_2!9126 lt!304783)) (currentBit!9231 (_2!9126 lt!304783))) lt!304829)))

(declare-fun b!196111 () Bool)

(declare-fun res!164075 () Bool)

(assert (=> b!196111 (=> (not res!164075) (not e!134807))))

(assert (=> b!196111 (= res!164075 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304829))))

(declare-fun b!196112 () Bool)

(declare-fun lt!304830 () (_ BitVec 64))

(assert (=> b!196112 (= e!134807 (bvsle lt!304829 (bvmul lt!304830 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196112 (or (= lt!304830 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304830 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304830)))))

(assert (=> b!196112 (= lt!304830 ((_ sign_extend 32) (size!4439 (buf!4925 (_2!9126 lt!304783)))))))

(assert (= (and d!66349 res!164076) b!196111))

(assert (= (and b!196111 res!164075) b!196112))

(declare-fun m!303413 () Bool)

(assert (=> d!66349 m!303413))

(declare-fun m!303415 () Bool)

(assert (=> d!66349 m!303415))

(assert (=> b!196064 d!66349))

(declare-fun d!66359 () Bool)

(declare-fun e!134808 () Bool)

(assert (=> d!66359 e!134808))

(declare-fun res!164078 () Bool)

(assert (=> d!66359 (=> (not res!164078) (not e!134808))))

(declare-fun lt!304835 () (_ BitVec 64))

(declare-fun lt!304839 () (_ BitVec 64))

(declare-fun lt!304840 () (_ BitVec 64))

(assert (=> d!66359 (= res!164078 (= lt!304835 (bvsub lt!304840 lt!304839)))))

(assert (=> d!66359 (or (= (bvand lt!304840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304839 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304840 lt!304839) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66359 (= lt!304839 (remainingBits!0 ((_ sign_extend 32) (size!4439 (buf!4925 thiss!1204))) ((_ sign_extend 32) (currentByte!9236 thiss!1204)) ((_ sign_extend 32) (currentBit!9231 thiss!1204))))))

(declare-fun lt!304837 () (_ BitVec 64))

(declare-fun lt!304838 () (_ BitVec 64))

(assert (=> d!66359 (= lt!304840 (bvmul lt!304837 lt!304838))))

(assert (=> d!66359 (or (= lt!304837 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304838 (bvsdiv (bvmul lt!304837 lt!304838) lt!304837)))))

(assert (=> d!66359 (= lt!304838 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66359 (= lt!304837 ((_ sign_extend 32) (size!4439 (buf!4925 thiss!1204))))))

(assert (=> d!66359 (= lt!304835 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9236 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9231 thiss!1204))))))

(assert (=> d!66359 (invariant!0 (currentBit!9231 thiss!1204) (currentByte!9236 thiss!1204) (size!4439 (buf!4925 thiss!1204)))))

(assert (=> d!66359 (= (bitIndex!0 (size!4439 (buf!4925 thiss!1204)) (currentByte!9236 thiss!1204) (currentBit!9231 thiss!1204)) lt!304835)))

(declare-fun b!196113 () Bool)

(declare-fun res!164077 () Bool)

(assert (=> b!196113 (=> (not res!164077) (not e!134808))))

(assert (=> b!196113 (= res!164077 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304835))))

(declare-fun b!196114 () Bool)

(declare-fun lt!304836 () (_ BitVec 64))

(assert (=> b!196114 (= e!134808 (bvsle lt!304835 (bvmul lt!304836 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196114 (or (= lt!304836 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304836 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304836)))))

(assert (=> b!196114 (= lt!304836 ((_ sign_extend 32) (size!4439 (buf!4925 thiss!1204))))))

(assert (= (and d!66359 res!164078) b!196113))

(assert (= (and b!196113 res!164077) b!196114))

(assert (=> d!66359 m!303407))

(assert (=> d!66359 m!303347))

(assert (=> b!196064 d!66359))

(assert (=> b!196058 d!66349))

(assert (=> b!196058 d!66359))

(declare-fun b!196149 () Bool)

(declare-fun res!164114 () Bool)

(declare-fun e!134825 () Bool)

(assert (=> b!196149 (=> (not res!164114) (not e!134825))))

(declare-fun lt!304910 () tuple2!16962)

(assert (=> b!196149 (= res!164114 (isPrefixOf!0 thiss!1204 (_2!9126 lt!304910)))))

(declare-fun b!196151 () Bool)

(declare-fun e!134826 () Bool)

(declare-fun lt!304911 () tuple2!16964)

(assert (=> b!196151 (= e!134826 (= (bitIndex!0 (size!4439 (buf!4925 (_1!9127 lt!304911))) (currentByte!9236 (_1!9127 lt!304911)) (currentBit!9231 (_1!9127 lt!304911))) (bitIndex!0 (size!4439 (buf!4925 (_2!9126 lt!304910))) (currentByte!9236 (_2!9126 lt!304910)) (currentBit!9231 (_2!9126 lt!304910)))))))

(declare-fun d!66361 () Bool)

(assert (=> d!66361 e!134825))

(declare-fun res!164112 () Bool)

(assert (=> d!66361 (=> (not res!164112) (not e!134825))))

(assert (=> d!66361 (= res!164112 (= (size!4439 (buf!4925 thiss!1204)) (size!4439 (buf!4925 (_2!9126 lt!304910)))))))

(declare-fun choose!16 (BitStream!7986 Bool) tuple2!16962)

(assert (=> d!66361 (= lt!304910 (choose!16 thiss!1204 lt!304785))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66361 (validate_offset_bit!0 ((_ sign_extend 32) (size!4439 (buf!4925 thiss!1204))) ((_ sign_extend 32) (currentByte!9236 thiss!1204)) ((_ sign_extend 32) (currentBit!9231 thiss!1204)))))

(assert (=> d!66361 (= (appendBit!0 thiss!1204 lt!304785) lt!304910)))

(declare-fun b!196148 () Bool)

(declare-fun res!164113 () Bool)

(assert (=> b!196148 (=> (not res!164113) (not e!134825))))

(declare-fun lt!304909 () (_ BitVec 64))

(declare-fun lt!304912 () (_ BitVec 64))

(assert (=> b!196148 (= res!164113 (= (bitIndex!0 (size!4439 (buf!4925 (_2!9126 lt!304910))) (currentByte!9236 (_2!9126 lt!304910)) (currentBit!9231 (_2!9126 lt!304910))) (bvadd lt!304909 lt!304912)))))

(assert (=> b!196148 (or (not (= (bvand lt!304909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304912 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!304909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!304909 lt!304912) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196148 (= lt!304912 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!196148 (= lt!304909 (bitIndex!0 (size!4439 (buf!4925 thiss!1204)) (currentByte!9236 thiss!1204) (currentBit!9231 thiss!1204)))))

(declare-fun b!196150 () Bool)

(assert (=> b!196150 (= e!134825 e!134826)))

(declare-fun res!164111 () Bool)

(assert (=> b!196150 (=> (not res!164111) (not e!134826))))

(assert (=> b!196150 (= res!164111 (and (= (_2!9127 lt!304911) lt!304785) (= (_1!9127 lt!304911) (_2!9126 lt!304910))))))

(assert (=> b!196150 (= lt!304911 (readBitPure!0 (readerFrom!0 (_2!9126 lt!304910) (currentBit!9231 thiss!1204) (currentByte!9236 thiss!1204))))))

(assert (= (and d!66361 res!164112) b!196148))

(assert (= (and b!196148 res!164113) b!196149))

(assert (= (and b!196149 res!164114) b!196150))

(assert (= (and b!196150 res!164111) b!196151))

(declare-fun m!303433 () Bool)

(assert (=> b!196151 m!303433))

(declare-fun m!303435 () Bool)

(assert (=> b!196151 m!303435))

(declare-fun m!303437 () Bool)

(assert (=> d!66361 m!303437))

(declare-fun m!303439 () Bool)

(assert (=> d!66361 m!303439))

(declare-fun m!303441 () Bool)

(assert (=> b!196149 m!303441))

(assert (=> b!196148 m!303435))

(assert (=> b!196148 m!303351))

(declare-fun m!303443 () Bool)

(assert (=> b!196150 m!303443))

(assert (=> b!196150 m!303443))

(declare-fun m!303445 () Bool)

(assert (=> b!196150 m!303445))

(assert (=> b!196058 d!66361))

(declare-fun d!66379 () Bool)

(declare-datatypes ((tuple2!16980 0))(
  ( (tuple2!16981 (_1!9135 Bool) (_2!9135 BitStream!7986)) )
))
(declare-fun lt!304915 () tuple2!16980)

(declare-fun readBit!0 (BitStream!7986) tuple2!16980)

(assert (=> d!66379 (= lt!304915 (readBit!0 (readerFrom!0 (_2!9126 lt!304783) (currentBit!9231 thiss!1204) (currentByte!9236 thiss!1204))))))

(assert (=> d!66379 (= (readBitPure!0 (readerFrom!0 (_2!9126 lt!304783) (currentBit!9231 thiss!1204) (currentByte!9236 thiss!1204))) (tuple2!16965 (_2!9135 lt!304915) (_1!9135 lt!304915)))))

(declare-fun bs!16500 () Bool)

(assert (= bs!16500 d!66379))

(assert (=> bs!16500 m!303357))

(declare-fun m!303449 () Bool)

(assert (=> bs!16500 m!303449))

(assert (=> b!196063 d!66379))

(declare-fun d!66383 () Bool)

(declare-fun e!134833 () Bool)

(assert (=> d!66383 e!134833))

(declare-fun res!164123 () Bool)

(assert (=> d!66383 (=> (not res!164123) (not e!134833))))

(assert (=> d!66383 (= res!164123 (invariant!0 (currentBit!9231 (_2!9126 lt!304783)) (currentByte!9236 (_2!9126 lt!304783)) (size!4439 (buf!4925 (_2!9126 lt!304783)))))))

(assert (=> d!66383 (= (readerFrom!0 (_2!9126 lt!304783) (currentBit!9231 thiss!1204) (currentByte!9236 thiss!1204)) (BitStream!7987 (buf!4925 (_2!9126 lt!304783)) (currentByte!9236 thiss!1204) (currentBit!9231 thiss!1204)))))

(declare-fun b!196159 () Bool)

(assert (=> b!196159 (= e!134833 (invariant!0 (currentBit!9231 thiss!1204) (currentByte!9236 thiss!1204) (size!4439 (buf!4925 (_2!9126 lt!304783)))))))

(assert (= (and d!66383 res!164123) b!196159))

(assert (=> d!66383 m!303415))

(declare-fun m!303453 () Bool)

(assert (=> b!196159 m!303453))

(assert (=> b!196063 d!66383))

(declare-fun d!66387 () Bool)

(assert (=> d!66387 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9231 thiss!1204) (currentByte!9236 thiss!1204) (size!4439 (buf!4925 thiss!1204))))))

(declare-fun bs!16502 () Bool)

(assert (= bs!16502 d!66387))

(assert (=> bs!16502 m!303347))

(assert (=> start!41692 d!66387))

(declare-fun d!66389 () Bool)

(declare-fun e!134834 () Bool)

(assert (=> d!66389 e!134834))

(declare-fun res!164125 () Bool)

(assert (=> d!66389 (=> (not res!164125) (not e!134834))))

(declare-fun lt!304924 () (_ BitVec 64))

(declare-fun lt!304919 () (_ BitVec 64))

(declare-fun lt!304923 () (_ BitVec 64))

(assert (=> d!66389 (= res!164125 (= lt!304919 (bvsub lt!304924 lt!304923)))))

(assert (=> d!66389 (or (= (bvand lt!304924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304923 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304924 lt!304923) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66389 (= lt!304923 (remainingBits!0 ((_ sign_extend 32) (size!4439 (buf!4925 (_1!9127 lt!304786)))) ((_ sign_extend 32) (currentByte!9236 (_1!9127 lt!304786))) ((_ sign_extend 32) (currentBit!9231 (_1!9127 lt!304786)))))))

(declare-fun lt!304921 () (_ BitVec 64))

(declare-fun lt!304922 () (_ BitVec 64))

(assert (=> d!66389 (= lt!304924 (bvmul lt!304921 lt!304922))))

(assert (=> d!66389 (or (= lt!304921 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304922 (bvsdiv (bvmul lt!304921 lt!304922) lt!304921)))))

(assert (=> d!66389 (= lt!304922 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66389 (= lt!304921 ((_ sign_extend 32) (size!4439 (buf!4925 (_1!9127 lt!304786)))))))

(assert (=> d!66389 (= lt!304919 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9236 (_1!9127 lt!304786))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9231 (_1!9127 lt!304786)))))))

(assert (=> d!66389 (invariant!0 (currentBit!9231 (_1!9127 lt!304786)) (currentByte!9236 (_1!9127 lt!304786)) (size!4439 (buf!4925 (_1!9127 lt!304786))))))

(assert (=> d!66389 (= (bitIndex!0 (size!4439 (buf!4925 (_1!9127 lt!304786))) (currentByte!9236 (_1!9127 lt!304786)) (currentBit!9231 (_1!9127 lt!304786))) lt!304919)))

(declare-fun b!196160 () Bool)

(declare-fun res!164124 () Bool)

(assert (=> b!196160 (=> (not res!164124) (not e!134834))))

(assert (=> b!196160 (= res!164124 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304919))))

(declare-fun b!196161 () Bool)

(declare-fun lt!304920 () (_ BitVec 64))

(assert (=> b!196161 (= e!134834 (bvsle lt!304919 (bvmul lt!304920 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196161 (or (= lt!304920 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304920 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304920)))))

(assert (=> b!196161 (= lt!304920 ((_ sign_extend 32) (size!4439 (buf!4925 (_1!9127 lt!304786)))))))

(assert (= (and d!66389 res!164125) b!196160))

(assert (= (and b!196160 res!164124) b!196161))

(declare-fun m!303455 () Bool)

(assert (=> d!66389 m!303455))

(declare-fun m!303457 () Bool)

(assert (=> d!66389 m!303457))

(assert (=> b!196062 d!66389))

(declare-fun d!66391 () Bool)

(declare-fun e!134835 () Bool)

(assert (=> d!66391 e!134835))

(declare-fun res!164127 () Bool)

(assert (=> d!66391 (=> (not res!164127) (not e!134835))))

(declare-fun lt!304930 () (_ BitVec 64))

(declare-fun lt!304925 () (_ BitVec 64))

(declare-fun lt!304929 () (_ BitVec 64))

(assert (=> d!66391 (= res!164127 (= lt!304925 (bvsub lt!304930 lt!304929)))))

(assert (=> d!66391 (or (= (bvand lt!304930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304929 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304930 lt!304929) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66391 (= lt!304929 (remainingBits!0 ((_ sign_extend 32) (size!4439 (buf!4925 (_2!9126 lt!304781)))) ((_ sign_extend 32) (currentByte!9236 (_2!9126 lt!304781))) ((_ sign_extend 32) (currentBit!9231 (_2!9126 lt!304781)))))))

(declare-fun lt!304927 () (_ BitVec 64))

(declare-fun lt!304928 () (_ BitVec 64))

(assert (=> d!66391 (= lt!304930 (bvmul lt!304927 lt!304928))))

(assert (=> d!66391 (or (= lt!304927 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304928 (bvsdiv (bvmul lt!304927 lt!304928) lt!304927)))))

(assert (=> d!66391 (= lt!304928 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66391 (= lt!304927 ((_ sign_extend 32) (size!4439 (buf!4925 (_2!9126 lt!304781)))))))

(assert (=> d!66391 (= lt!304925 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9236 (_2!9126 lt!304781))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9231 (_2!9126 lt!304781)))))))

(assert (=> d!66391 (invariant!0 (currentBit!9231 (_2!9126 lt!304781)) (currentByte!9236 (_2!9126 lt!304781)) (size!4439 (buf!4925 (_2!9126 lt!304781))))))

(assert (=> d!66391 (= (bitIndex!0 (size!4439 (buf!4925 (_2!9126 lt!304781))) (currentByte!9236 (_2!9126 lt!304781)) (currentBit!9231 (_2!9126 lt!304781))) lt!304925)))

(declare-fun b!196162 () Bool)

(declare-fun res!164126 () Bool)

(assert (=> b!196162 (=> (not res!164126) (not e!134835))))

(assert (=> b!196162 (= res!164126 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304925))))

(declare-fun b!196163 () Bool)

(declare-fun lt!304926 () (_ BitVec 64))

(assert (=> b!196163 (= e!134835 (bvsle lt!304925 (bvmul lt!304926 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196163 (or (= lt!304926 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304926 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304926)))))

(assert (=> b!196163 (= lt!304926 ((_ sign_extend 32) (size!4439 (buf!4925 (_2!9126 lt!304781)))))))

(assert (= (and d!66391 res!164127) b!196162))

(assert (= (and b!196162 res!164126) b!196163))

(declare-fun m!303459 () Bool)

(assert (=> d!66391 m!303459))

(assert (=> d!66391 m!303361))

(assert (=> b!196056 d!66391))

(declare-fun d!66393 () Bool)

(declare-fun res!164147 () Bool)

(declare-fun e!134846 () Bool)

(assert (=> d!66393 (=> (not res!164147) (not e!134846))))

(assert (=> d!66393 (= res!164147 (= (size!4439 (buf!4925 thiss!1204)) (size!4439 (buf!4925 (_2!9126 lt!304781)))))))

(assert (=> d!66393 (= (isPrefixOf!0 thiss!1204 (_2!9126 lt!304781)) e!134846)))

(declare-fun b!196183 () Bool)

(declare-fun res!164146 () Bool)

(assert (=> b!196183 (=> (not res!164146) (not e!134846))))

(assert (=> b!196183 (= res!164146 (bvsle (bitIndex!0 (size!4439 (buf!4925 thiss!1204)) (currentByte!9236 thiss!1204) (currentBit!9231 thiss!1204)) (bitIndex!0 (size!4439 (buf!4925 (_2!9126 lt!304781))) (currentByte!9236 (_2!9126 lt!304781)) (currentBit!9231 (_2!9126 lt!304781)))))))

(declare-fun b!196184 () Bool)

(declare-fun e!134847 () Bool)

(assert (=> b!196184 (= e!134846 e!134847)))

(declare-fun res!164148 () Bool)

(assert (=> b!196184 (=> res!164148 e!134847)))

(assert (=> b!196184 (= res!164148 (= (size!4439 (buf!4925 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!196185 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10066 array!10066 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196185 (= e!134847 (arrayBitRangesEq!0 (buf!4925 thiss!1204) (buf!4925 (_2!9126 lt!304781)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4439 (buf!4925 thiss!1204)) (currentByte!9236 thiss!1204) (currentBit!9231 thiss!1204))))))

(assert (= (and d!66393 res!164147) b!196183))

(assert (= (and b!196183 res!164146) b!196184))

(assert (= (and b!196184 (not res!164148)) b!196185))

(assert (=> b!196183 m!303351))

(assert (=> b!196183 m!303367))

(assert (=> b!196185 m!303351))

(assert (=> b!196185 m!303351))

(declare-fun m!303479 () Bool)

(assert (=> b!196185 m!303479))

(assert (=> b!196056 d!66393))

(declare-fun d!66399 () Bool)

(assert (=> d!66399 (isPrefixOf!0 thiss!1204 (_2!9126 lt!304781))))

(declare-fun lt!304954 () Unit!13854)

(declare-fun choose!30 (BitStream!7986 BitStream!7986 BitStream!7986) Unit!13854)

(assert (=> d!66399 (= lt!304954 (choose!30 thiss!1204 (_2!9126 lt!304783) (_2!9126 lt!304781)))))

(assert (=> d!66399 (isPrefixOf!0 thiss!1204 (_2!9126 lt!304783))))

(assert (=> d!66399 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9126 lt!304783) (_2!9126 lt!304781)) lt!304954)))

(declare-fun bs!16504 () Bool)

(assert (= bs!16504 d!66399))

(assert (=> bs!16504 m!303369))

(declare-fun m!303483 () Bool)

(assert (=> bs!16504 m!303483))

(assert (=> bs!16504 m!303355))

(assert (=> b!196056 d!66399))

(declare-fun b!196343 () Bool)

(declare-fun e!134943 () Bool)

(declare-fun e!134938 () Bool)

(assert (=> b!196343 (= e!134943 e!134938)))

(declare-fun res!164284 () Bool)

(assert (=> b!196343 (=> (not res!164284) (not e!134938))))

(declare-datatypes ((tuple2!16984 0))(
  ( (tuple2!16985 (_1!9137 BitStream!7986) (_2!9137 (_ BitVec 64))) )
))
(declare-fun lt!305449 () tuple2!16984)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196343 (= res!164284 (= (_2!9137 lt!305449) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-datatypes ((tuple2!16986 0))(
  ( (tuple2!16987 (_1!9138 BitStream!7986) (_2!9138 BitStream!7986)) )
))
(declare-fun lt!305438 () tuple2!16986)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7986 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16984)

(assert (=> b!196343 (= lt!305449 (readNBitsLSBFirstsLoopPure!0 (_1!9138 lt!305438) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!305475 () Unit!13854)

(declare-fun lt!305458 () Unit!13854)

(assert (=> b!196343 (= lt!305475 lt!305458)))

(declare-fun lt!305432 () tuple2!16962)

(declare-fun lt!305457 () (_ BitVec 64))

(assert (=> b!196343 (validate_offset_bits!1 ((_ sign_extend 32) (size!4439 (buf!4925 (_2!9126 lt!305432)))) ((_ sign_extend 32) (currentByte!9236 (_2!9126 lt!304783))) ((_ sign_extend 32) (currentBit!9231 (_2!9126 lt!304783))) lt!305457)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7986 array!10066 (_ BitVec 64)) Unit!13854)

(assert (=> b!196343 (= lt!305458 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9126 lt!304783) (buf!4925 (_2!9126 lt!305432)) lt!305457))))

(declare-fun e!134942 () Bool)

(assert (=> b!196343 e!134942))

(declare-fun res!164277 () Bool)

(assert (=> b!196343 (=> (not res!164277) (not e!134942))))

(assert (=> b!196343 (= res!164277 (and (= (size!4439 (buf!4925 (_2!9126 lt!304783))) (size!4439 (buf!4925 (_2!9126 lt!305432)))) (bvsge lt!305457 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196343 (= lt!305457 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!196343 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!7986 BitStream!7986) tuple2!16986)

(assert (=> b!196343 (= lt!305438 (reader!0 (_2!9126 lt!304783) (_2!9126 lt!305432)))))

(declare-fun b!196344 () Bool)

(declare-fun e!134939 () Bool)

(declare-fun lt!305439 () tuple2!16984)

(declare-fun lt!305466 () tuple2!16986)

(assert (=> b!196344 (= e!134939 (= (_1!9137 lt!305439) (_2!9138 lt!305466)))))

(declare-fun b!196345 () Bool)

(assert (=> b!196345 (= e!134942 (validate_offset_bits!1 ((_ sign_extend 32) (size!4439 (buf!4925 (_2!9126 lt!304783)))) ((_ sign_extend 32) (currentByte!9236 (_2!9126 lt!304783))) ((_ sign_extend 32) (currentBit!9231 (_2!9126 lt!304783))) lt!305457))))

(declare-fun b!196347 () Bool)

(declare-fun e!134941 () (_ BitVec 64))

(assert (=> b!196347 (= e!134941 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!196348 () Bool)

(declare-fun res!164276 () Bool)

(declare-fun lt!305428 () tuple2!16962)

(assert (=> b!196348 (= res!164276 (isPrefixOf!0 (_2!9126 lt!304783) (_2!9126 lt!305428)))))

(declare-fun e!134945 () Bool)

(assert (=> b!196348 (=> (not res!164276) (not e!134945))))

(declare-fun b!196349 () Bool)

(declare-fun e!134946 () tuple2!16962)

(declare-fun lt!305456 () tuple2!16962)

(assert (=> b!196349 (= e!134946 (tuple2!16963 (_1!9126 lt!305456) (_2!9126 lt!305456)))))

(declare-fun lt!305451 () Bool)

(assert (=> b!196349 (= lt!305451 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196349 (= lt!305428 (appendBit!0 (_2!9126 lt!304783) lt!305451))))

(declare-fun res!164275 () Bool)

(assert (=> b!196349 (= res!164275 (= (size!4439 (buf!4925 (_2!9126 lt!304783))) (size!4439 (buf!4925 (_2!9126 lt!305428)))))))

(assert (=> b!196349 (=> (not res!164275) (not e!134945))))

(assert (=> b!196349 e!134945))

(declare-fun lt!305465 () tuple2!16962)

(assert (=> b!196349 (= lt!305465 lt!305428)))

(assert (=> b!196349 (= lt!305456 (appendBitsLSBFirstLoopTR!0 (_2!9126 lt!305465) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!305480 () Unit!13854)

(assert (=> b!196349 (= lt!305480 (lemmaIsPrefixTransitive!0 (_2!9126 lt!304783) (_2!9126 lt!305465) (_2!9126 lt!305456)))))

(declare-fun call!3083 () Bool)

(assert (=> b!196349 call!3083))

(declare-fun lt!305454 () Unit!13854)

(assert (=> b!196349 (= lt!305454 lt!305480)))

(assert (=> b!196349 (invariant!0 (currentBit!9231 (_2!9126 lt!304783)) (currentByte!9236 (_2!9126 lt!304783)) (size!4439 (buf!4925 (_2!9126 lt!305465))))))

(declare-fun lt!305441 () BitStream!7986)

(assert (=> b!196349 (= lt!305441 (BitStream!7987 (buf!4925 (_2!9126 lt!305465)) (currentByte!9236 (_2!9126 lt!304783)) (currentBit!9231 (_2!9126 lt!304783))))))

(assert (=> b!196349 (invariant!0 (currentBit!9231 lt!305441) (currentByte!9236 lt!305441) (size!4439 (buf!4925 (_2!9126 lt!305456))))))

(declare-fun lt!305470 () BitStream!7986)

(assert (=> b!196349 (= lt!305470 (BitStream!7987 (buf!4925 (_2!9126 lt!305456)) (currentByte!9236 lt!305441) (currentBit!9231 lt!305441)))))

(declare-fun lt!305448 () tuple2!16964)

(assert (=> b!196349 (= lt!305448 (readBitPure!0 lt!305441))))

(declare-fun lt!305462 () tuple2!16964)

(assert (=> b!196349 (= lt!305462 (readBitPure!0 lt!305470))))

(declare-fun lt!305459 () Unit!13854)

(declare-fun readBitPrefixLemma!0 (BitStream!7986 BitStream!7986) Unit!13854)

(assert (=> b!196349 (= lt!305459 (readBitPrefixLemma!0 lt!305441 (_2!9126 lt!305456)))))

(declare-fun res!164285 () Bool)

(assert (=> b!196349 (= res!164285 (= (bitIndex!0 (size!4439 (buf!4925 (_1!9127 lt!305448))) (currentByte!9236 (_1!9127 lt!305448)) (currentBit!9231 (_1!9127 lt!305448))) (bitIndex!0 (size!4439 (buf!4925 (_1!9127 lt!305462))) (currentByte!9236 (_1!9127 lt!305462)) (currentBit!9231 (_1!9127 lt!305462)))))))

(declare-fun e!134940 () Bool)

(assert (=> b!196349 (=> (not res!164285) (not e!134940))))

(assert (=> b!196349 e!134940))

(declare-fun lt!305476 () Unit!13854)

(assert (=> b!196349 (= lt!305476 lt!305459)))

(declare-fun lt!305436 () tuple2!16986)

(assert (=> b!196349 (= lt!305436 (reader!0 (_2!9126 lt!304783) (_2!9126 lt!305456)))))

(declare-fun lt!305471 () tuple2!16986)

(assert (=> b!196349 (= lt!305471 (reader!0 (_2!9126 lt!305465) (_2!9126 lt!305456)))))

(declare-fun lt!305453 () tuple2!16964)

(assert (=> b!196349 (= lt!305453 (readBitPure!0 (_1!9138 lt!305436)))))

(assert (=> b!196349 (= (_2!9127 lt!305453) lt!305451)))

(declare-fun lt!305434 () Unit!13854)

(declare-fun Unit!13880 () Unit!13854)

(assert (=> b!196349 (= lt!305434 Unit!13880)))

(declare-fun lt!305469 () (_ BitVec 64))

(assert (=> b!196349 (= lt!305469 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305446 () (_ BitVec 64))

(assert (=> b!196349 (= lt!305446 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305460 () Unit!13854)

(assert (=> b!196349 (= lt!305460 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9126 lt!304783) (buf!4925 (_2!9126 lt!305456)) lt!305446))))

(assert (=> b!196349 (validate_offset_bits!1 ((_ sign_extend 32) (size!4439 (buf!4925 (_2!9126 lt!305456)))) ((_ sign_extend 32) (currentByte!9236 (_2!9126 lt!304783))) ((_ sign_extend 32) (currentBit!9231 (_2!9126 lt!304783))) lt!305446)))

(declare-fun lt!305452 () Unit!13854)

(assert (=> b!196349 (= lt!305452 lt!305460)))

(declare-fun lt!305447 () tuple2!16984)

(assert (=> b!196349 (= lt!305447 (readNBitsLSBFirstsLoopPure!0 (_1!9138 lt!305436) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!305469))))

(declare-fun lt!305481 () (_ BitVec 64))

(assert (=> b!196349 (= lt!305481 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!305429 () Unit!13854)

(assert (=> b!196349 (= lt!305429 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9126 lt!305465) (buf!4925 (_2!9126 lt!305456)) lt!305481))))

(assert (=> b!196349 (validate_offset_bits!1 ((_ sign_extend 32) (size!4439 (buf!4925 (_2!9126 lt!305456)))) ((_ sign_extend 32) (currentByte!9236 (_2!9126 lt!305465))) ((_ sign_extend 32) (currentBit!9231 (_2!9126 lt!305465))) lt!305481)))

(declare-fun lt!305474 () Unit!13854)

(assert (=> b!196349 (= lt!305474 lt!305429)))

(declare-fun lt!305477 () tuple2!16984)

(assert (=> b!196349 (= lt!305477 (readNBitsLSBFirstsLoopPure!0 (_1!9138 lt!305471) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!305469 (ite (_2!9127 lt!305453) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!305440 () tuple2!16984)

(assert (=> b!196349 (= lt!305440 (readNBitsLSBFirstsLoopPure!0 (_1!9138 lt!305436) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!305469))))

(declare-fun c!9774 () Bool)

(assert (=> b!196349 (= c!9774 (_2!9127 (readBitPure!0 (_1!9138 lt!305436))))))

