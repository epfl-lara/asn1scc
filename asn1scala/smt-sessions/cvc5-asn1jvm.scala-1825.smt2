; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49062 () Bool)

(assert start!49062)

(declare-fun b!233089 () Bool)

(declare-fun e!160566 () Bool)

(declare-fun e!160565 () Bool)

(assert (=> b!233089 (= e!160566 e!160565)))

(declare-fun res!195015 () Bool)

(assert (=> b!233089 (=> (not res!195015) (not e!160565))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!369102 () (_ BitVec 64))

(assert (=> b!233089 (= res!195015 (bvsle bits!86 lt!369102))))

(declare-datatypes ((array!12031 0))(
  ( (array!12032 (arr!6268 (Array (_ BitVec 32) (_ BitVec 8))) (size!5281 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9658 0))(
  ( (BitStream!9659 (buf!5822 array!12031) (currentByte!10829 (_ BitVec 32)) (currentBit!10824 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9658)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233089 (= lt!369102 (bitIndex!0 (size!5281 (buf!5822 b2!99)) (currentByte!10829 b2!99) (currentBit!10824 b2!99)))))

(declare-fun lt!369100 () (_ BitVec 64))

(declare-fun b!233090 () Bool)

(declare-fun e!160563 () Bool)

(declare-fun b1!101 () BitStream!9658)

(declare-fun lt!369101 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!233090 (= e!160563 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5281 (buf!5822 b1!101)))) lt!369101) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14397 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10829 b2!99))) ((_ sign_extend 32) (currentBit!10824 b2!99))))) (and (= lt!369102 bdg!14397) (= (bvsub lt!369102 bits!86) lt!369101) (let ((bdg!14398 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5281 (buf!5822 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14398 (bvsub bdg!14397 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14398 bdg!14397) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369100)) (bvsge lt!369100 #b0000000000000000000000000000000010000000000000000000000000000000)))))))))

(assert (=> b!233090 (= lt!369101 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10829 b1!101))) ((_ sign_extend 32) (currentBit!10824 b1!101))))))

(declare-fun b!233092 () Bool)

(declare-fun e!160567 () Bool)

(declare-fun array_inv!5022 (array!12031) Bool)

(assert (=> b!233092 (= e!160567 (array_inv!5022 (buf!5822 b1!101)))))

(declare-fun b!233093 () Bool)

(declare-fun res!195014 () Bool)

(assert (=> b!233093 (=> (not res!195014) (not e!160563))))

(assert (=> b!233093 (= res!195014 (= lt!369102 (bvadd (bitIndex!0 (size!5281 (buf!5822 b1!101)) (currentByte!10829 b1!101) (currentBit!10824 b1!101)) bits!86)))))

(declare-fun b!233094 () Bool)

(declare-fun e!160562 () Bool)

(assert (=> b!233094 (= e!160562 (array_inv!5022 (buf!5822 b2!99)))))

(declare-fun b!233095 () Bool)

(assert (=> b!233095 (= e!160565 e!160563)))

(declare-fun res!195017 () Bool)

(assert (=> b!233095 (=> (not res!195017) (not e!160563))))

(assert (=> b!233095 (= res!195017 (bvsle ((_ extract 31 0) lt!369100) bytes!19))))

(assert (=> b!233095 (= lt!369100 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233096 () Bool)

(declare-fun res!195013 () Bool)

(assert (=> b!233096 (=> (not res!195013) (not e!160563))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233096 (= res!195013 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5281 (buf!5822 b1!101))) ((_ sign_extend 32) (currentByte!10829 b1!101)) ((_ sign_extend 32) (currentBit!10824 b1!101)) bytes!19))))

(declare-fun res!195018 () Bool)

(assert (=> start!49062 (=> (not res!195018) (not e!160566))))

(assert (=> start!49062 (= res!195018 (and (= (size!5281 (buf!5822 b1!101)) (size!5281 (buf!5822 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49062 e!160566))

(declare-fun inv!12 (BitStream!9658) Bool)

(assert (=> start!49062 (and (inv!12 b1!101) e!160567)))

(assert (=> start!49062 (and (inv!12 b2!99) e!160562)))

(assert (=> start!49062 true))

(declare-fun b!233091 () Bool)

(declare-fun res!195016 () Bool)

(assert (=> b!233091 (=> (not res!195016) (not e!160563))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233091 (= res!195016 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5281 (buf!5822 b1!101))) ((_ sign_extend 32) (currentByte!10829 b1!101)) ((_ sign_extend 32) (currentBit!10824 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!49062 res!195018) b!233089))

(assert (= (and b!233089 res!195015) b!233095))

(assert (= (and b!233095 res!195017) b!233096))

(assert (= (and b!233096 res!195013) b!233093))

(assert (= (and b!233093 res!195014) b!233091))

(assert (= (and b!233091 res!195016) b!233090))

(assert (= start!49062 b!233092))

(assert (= start!49062 b!233094))

(declare-fun m!355811 () Bool)

(assert (=> b!233092 m!355811))

(declare-fun m!355813 () Bool)

(assert (=> b!233093 m!355813))

(declare-fun m!355815 () Bool)

(assert (=> b!233089 m!355815))

(declare-fun m!355817 () Bool)

(assert (=> start!49062 m!355817))

(declare-fun m!355819 () Bool)

(assert (=> start!49062 m!355819))

(declare-fun m!355821 () Bool)

(assert (=> b!233091 m!355821))

(declare-fun m!355823 () Bool)

(assert (=> b!233094 m!355823))

(declare-fun m!355825 () Bool)

(assert (=> b!233096 m!355825))

(push 1)

(assert (not b!233092))

(assert (not b!233094))

(assert (not b!233093))

(assert (not b!233096))

(assert (not start!49062))

(assert (not b!233089))

(assert (not b!233091))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78536 () Bool)

(declare-fun e!160617 () Bool)

(assert (=> d!78536 e!160617))

(declare-fun res!195068 () Bool)

(assert (=> d!78536 (=> (not res!195068) (not e!160617))))

(declare-fun lt!369161 () (_ BitVec 64))

(declare-fun lt!369159 () (_ BitVec 64))

(declare-fun lt!369158 () (_ BitVec 64))

(assert (=> d!78536 (= res!195068 (= lt!369158 (bvsub lt!369161 lt!369159)))))

(assert (=> d!78536 (or (= (bvand lt!369161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369159 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369161 lt!369159) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78536 (= lt!369159 (remainingBits!0 ((_ sign_extend 32) (size!5281 (buf!5822 b2!99))) ((_ sign_extend 32) (currentByte!10829 b2!99)) ((_ sign_extend 32) (currentBit!10824 b2!99))))))

(declare-fun lt!369157 () (_ BitVec 64))

(declare-fun lt!369162 () (_ BitVec 64))

(assert (=> d!78536 (= lt!369161 (bvmul lt!369157 lt!369162))))

(assert (=> d!78536 (or (= lt!369157 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369162 (bvsdiv (bvmul lt!369157 lt!369162) lt!369157)))))

(assert (=> d!78536 (= lt!369162 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78536 (= lt!369157 ((_ sign_extend 32) (size!5281 (buf!5822 b2!99))))))

(assert (=> d!78536 (= lt!369158 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10829 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10824 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78536 (invariant!0 (currentBit!10824 b2!99) (currentByte!10829 b2!99) (size!5281 (buf!5822 b2!99)))))

(assert (=> d!78536 (= (bitIndex!0 (size!5281 (buf!5822 b2!99)) (currentByte!10829 b2!99) (currentBit!10824 b2!99)) lt!369158)))

(declare-fun b!233157 () Bool)

(declare-fun res!195067 () Bool)

(assert (=> b!233157 (=> (not res!195067) (not e!160617))))

(assert (=> b!233157 (= res!195067 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369158))))

(declare-fun b!233158 () Bool)

(declare-fun lt!369160 () (_ BitVec 64))

(assert (=> b!233158 (= e!160617 (bvsle lt!369158 (bvmul lt!369160 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233158 (or (= lt!369160 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369160 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369160)))))

(assert (=> b!233158 (= lt!369160 ((_ sign_extend 32) (size!5281 (buf!5822 b2!99))))))

(assert (= (and d!78536 res!195068) b!233157))

(assert (= (and b!233157 res!195067) b!233158))

(declare-fun m!355865 () Bool)

(assert (=> d!78536 m!355865))

(declare-fun m!355867 () Bool)

(assert (=> d!78536 m!355867))

(assert (=> b!233089 d!78536))

(declare-fun d!78538 () Bool)

(assert (=> d!78538 (= (array_inv!5022 (buf!5822 b2!99)) (bvsge (size!5281 (buf!5822 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!233094 d!78538))

(declare-fun d!78540 () Bool)

(assert (=> d!78540 (= (inv!12 b1!101) (invariant!0 (currentBit!10824 b1!101) (currentByte!10829 b1!101) (size!5281 (buf!5822 b1!101))))))

(declare-fun bs!19345 () Bool)

(assert (= bs!19345 d!78540))

(declare-fun m!355869 () Bool)

(assert (=> bs!19345 m!355869))

(assert (=> start!49062 d!78540))

(declare-fun d!78542 () Bool)

(assert (=> d!78542 (= (inv!12 b2!99) (invariant!0 (currentBit!10824 b2!99) (currentByte!10829 b2!99) (size!5281 (buf!5822 b2!99))))))

(declare-fun bs!19346 () Bool)

(assert (= bs!19346 d!78542))

(assert (=> bs!19346 m!355867))

(assert (=> start!49062 d!78542))

(declare-fun d!78544 () Bool)

(declare-fun e!160618 () Bool)

(assert (=> d!78544 e!160618))

(declare-fun res!195070 () Bool)

(assert (=> d!78544 (=> (not res!195070) (not e!160618))))

(declare-fun lt!369164 () (_ BitVec 64))

(declare-fun lt!369165 () (_ BitVec 64))

(declare-fun lt!369167 () (_ BitVec 64))

(assert (=> d!78544 (= res!195070 (= lt!369164 (bvsub lt!369167 lt!369165)))))

(assert (=> d!78544 (or (= (bvand lt!369167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369165 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369167 lt!369165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78544 (= lt!369165 (remainingBits!0 ((_ sign_extend 32) (size!5281 (buf!5822 b1!101))) ((_ sign_extend 32) (currentByte!10829 b1!101)) ((_ sign_extend 32) (currentBit!10824 b1!101))))))

(declare-fun lt!369163 () (_ BitVec 64))

(declare-fun lt!369168 () (_ BitVec 64))

(assert (=> d!78544 (= lt!369167 (bvmul lt!369163 lt!369168))))

(assert (=> d!78544 (or (= lt!369163 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369168 (bvsdiv (bvmul lt!369163 lt!369168) lt!369163)))))

(assert (=> d!78544 (= lt!369168 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78544 (= lt!369163 ((_ sign_extend 32) (size!5281 (buf!5822 b1!101))))))

(assert (=> d!78544 (= lt!369164 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10829 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10824 b1!101))))))

(assert (=> d!78544 (invariant!0 (currentBit!10824 b1!101) (currentByte!10829 b1!101) (size!5281 (buf!5822 b1!101)))))

(assert (=> d!78544 (= (bitIndex!0 (size!5281 (buf!5822 b1!101)) (currentByte!10829 b1!101) (currentBit!10824 b1!101)) lt!369164)))

(declare-fun b!233159 () Bool)

(declare-fun res!195069 () Bool)

(assert (=> b!233159 (=> (not res!195069) (not e!160618))))

(assert (=> b!233159 (= res!195069 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369164))))

(declare-fun b!233160 () Bool)

(declare-fun lt!369166 () (_ BitVec 64))

(assert (=> b!233160 (= e!160618 (bvsle lt!369164 (bvmul lt!369166 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233160 (or (= lt!369166 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369166 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369166)))))

(assert (=> b!233160 (= lt!369166 ((_ sign_extend 32) (size!5281 (buf!5822 b1!101))))))

(assert (= (and d!78544 res!195070) b!233159))

(assert (= (and b!233159 res!195069) b!233160))

(assert (=> d!78544 m!355821))

(assert (=> d!78544 m!355869))

(assert (=> b!233093 d!78544))

(declare-fun d!78546 () Bool)

(assert (=> d!78546 (= (array_inv!5022 (buf!5822 b1!101)) (bvsge (size!5281 (buf!5822 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!233092 d!78546))

(declare-fun d!78548 () Bool)

(assert (=> d!78548 (= (remainingBits!0 ((_ sign_extend 32) (size!5281 (buf!5822 b1!101))) ((_ sign_extend 32) (currentByte!10829 b1!101)) ((_ sign_extend 32) (currentBit!10824 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5281 (buf!5822 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10829 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10824 b1!101)))))))

(assert (=> b!233091 d!78548))

(declare-fun d!78550 () Bool)

(assert (=> d!78550 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5281 (buf!5822 b1!101))) ((_ sign_extend 32) (currentByte!10829 b1!101)) ((_ sign_extend 32) (currentBit!10824 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5281 (buf!5822 b1!101))) ((_ sign_extend 32) (currentByte!10829 b1!101)) ((_ sign_extend 32) (currentBit!10824 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19347 () Bool)

(assert (= bs!19347 d!78550))

(assert (=> bs!19347 m!355821))

(assert (=> b!233096 d!78550))

(push 1)

(assert (not d!78536))

(assert (not d!78544))

(assert (not d!78540))

(assert (not d!78542))

(assert (not d!78550))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

