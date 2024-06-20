; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38304 () Bool)

(assert start!38304)

(declare-fun b!172188 () Bool)

(declare-fun res!142660 () Bool)

(declare-fun e!120303 () Bool)

(assert (=> b!172188 (=> (not res!142660) (not e!120303))))

(declare-datatypes ((array!9222 0))(
  ( (array!9223 (arr!5002 (Array (_ BitVec 32) (_ BitVec 8))) (size!4072 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7252 0))(
  ( (BitStream!7253 (buf!4500 array!9222) (currentByte!8561 (_ BitVec 32)) (currentBit!8556 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7252)

(declare-fun nBits!575 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172188 (= res!142660 (validate_offset_bits!1 ((_ sign_extend 32) (size!4072 (buf!4500 thiss!1817))) ((_ sign_extend 32) (currentByte!8561 thiss!1817)) ((_ sign_extend 32) (currentBit!8556 thiss!1817)) ((_ sign_extend 32) nBits!575)))))

(declare-datatypes ((tuple2!14804 0))(
  ( (tuple2!14805 (_1!8044 (_ BitVec 64)) (_2!8044 BitStream!7252)) )
))
(declare-fun lt!265286 () tuple2!14804)

(declare-fun e!120304 () Bool)

(declare-fun b!172190 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172190 (= e!120304 (not (= (bitIndex!0 (size!4072 (buf!4500 (_2!8044 lt!265286))) (currentByte!8561 (_2!8044 lt!265286)) (currentBit!8556 (_2!8044 lt!265286))) (bvadd (bitIndex!0 (size!4072 (buf!4500 thiss!1817)) (currentByte!8561 thiss!1817) (currentBit!8556 thiss!1817)) ((_ sign_extend 32) nBits!575)))))))

(declare-fun b!172191 () Bool)

(declare-fun e!120302 () Bool)

(declare-fun array_inv!3813 (array!9222) Bool)

(assert (=> b!172191 (= e!120302 (array_inv!3813 (buf!4500 thiss!1817)))))

(declare-fun b!172189 () Bool)

(assert (=> b!172189 (= e!120303 e!120304)))

(declare-fun res!142661 () Bool)

(assert (=> b!172189 (=> res!142661 e!120304)))

(assert (=> b!172189 (= res!142661 (not (= (buf!4500 (_2!8044 lt!265286)) (buf!4500 thiss!1817))))))

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!7252 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14804)

(assert (=> b!172189 (= lt!265286 (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!142662 () Bool)

(assert (=> start!38304 (=> (not res!142662) (not e!120303))))

(assert (=> start!38304 (= res!142662 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000)))))

(assert (=> start!38304 e!120303))

(assert (=> start!38304 true))

(declare-fun inv!12 (BitStream!7252) Bool)

(assert (=> start!38304 (and (inv!12 thiss!1817) e!120302)))

(assert (= (and start!38304 res!142662) b!172188))

(assert (= (and b!172188 res!142660) b!172189))

(assert (= (and b!172189 (not res!142661)) b!172190))

(assert (= start!38304 b!172191))

(declare-fun m!271349 () Bool)

(assert (=> start!38304 m!271349))

(declare-fun m!271351 () Bool)

(assert (=> b!172190 m!271351))

(declare-fun m!271353 () Bool)

(assert (=> b!172190 m!271353))

(declare-fun m!271355 () Bool)

(assert (=> b!172189 m!271355))

(declare-fun m!271357 () Bool)

(assert (=> b!172191 m!271357))

(declare-fun m!271359 () Bool)

(assert (=> b!172188 m!271359))

(push 1)

(assert (not b!172191))

(assert (not start!38304))

(assert (not b!172189))

(assert (not b!172188))

(assert (not b!172190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61037 () Bool)

(declare-fun e!120335 () Bool)

(assert (=> d!61037 e!120335))

(declare-fun res!142693 () Bool)

(assert (=> d!61037 (=> (not res!142693) (not e!120335))))

(declare-fun lt!265333 () (_ BitVec 64))

(declare-fun lt!265332 () (_ BitVec 64))

(declare-fun lt!265334 () (_ BitVec 64))

(assert (=> d!61037 (= res!142693 (= lt!265332 (bvsub lt!265334 lt!265333)))))

(assert (=> d!61037 (or (= (bvand lt!265334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265333 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!265334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!265334 lt!265333) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61037 (= lt!265333 (remainingBits!0 ((_ sign_extend 32) (size!4072 (buf!4500 (_2!8044 lt!265286)))) ((_ sign_extend 32) (currentByte!8561 (_2!8044 lt!265286))) ((_ sign_extend 32) (currentBit!8556 (_2!8044 lt!265286)))))))

(declare-fun lt!265329 () (_ BitVec 64))

(declare-fun lt!265330 () (_ BitVec 64))

(assert (=> d!61037 (= lt!265334 (bvmul lt!265329 lt!265330))))

(assert (=> d!61037 (or (= lt!265329 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!265330 (bvsdiv (bvmul lt!265329 lt!265330) lt!265329)))))

(assert (=> d!61037 (= lt!265330 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61037 (= lt!265329 ((_ sign_extend 32) (size!4072 (buf!4500 (_2!8044 lt!265286)))))))

(assert (=> d!61037 (= lt!265332 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8561 (_2!8044 lt!265286))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8556 (_2!8044 lt!265286)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!61037 (invariant!0 (currentBit!8556 (_2!8044 lt!265286)) (currentByte!8561 (_2!8044 lt!265286)) (size!4072 (buf!4500 (_2!8044 lt!265286))))))

(assert (=> d!61037 (= (bitIndex!0 (size!4072 (buf!4500 (_2!8044 lt!265286))) (currentByte!8561 (_2!8044 lt!265286)) (currentBit!8556 (_2!8044 lt!265286))) lt!265332)))

(declare-fun b!172228 () Bool)

(declare-fun res!142694 () Bool)

(assert (=> b!172228 (=> (not res!142694) (not e!120335))))

(assert (=> b!172228 (= res!142694 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!265332))))

(declare-fun b!172229 () Bool)

(declare-fun lt!265331 () (_ BitVec 64))

(assert (=> b!172229 (= e!120335 (bvsle lt!265332 (bvmul lt!265331 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!172229 (or (= lt!265331 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!265331 #b0000000000000000000000000000000000000000000000000000000000001000) lt!265331)))))

(assert (=> b!172229 (= lt!265331 ((_ sign_extend 32) (size!4072 (buf!4500 (_2!8044 lt!265286)))))))

(assert (= (and d!61037 res!142693) b!172228))

(assert (= (and b!172228 res!142694) b!172229))

(declare-fun m!271393 () Bool)

(assert (=> d!61037 m!271393))

(declare-fun m!271395 () Bool)

(assert (=> d!61037 m!271395))

(assert (=> b!172190 d!61037))

(declare-fun d!61051 () Bool)

(declare-fun e!120336 () Bool)

(assert (=> d!61051 e!120336))

(declare-fun res!142695 () Bool)

(assert (=> d!61051 (=> (not res!142695) (not e!120336))))

(declare-fun lt!265340 () (_ BitVec 64))

(declare-fun lt!265338 () (_ BitVec 64))

(declare-fun lt!265339 () (_ BitVec 64))

(assert (=> d!61051 (= res!142695 (= lt!265338 (bvsub lt!265340 lt!265339)))))

(assert (=> d!61051 (or (= (bvand lt!265340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265339 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!265340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!265340 lt!265339) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61051 (= lt!265339 (remainingBits!0 ((_ sign_extend 32) (size!4072 (buf!4500 thiss!1817))) ((_ sign_extend 32) (currentByte!8561 thiss!1817)) ((_ sign_extend 32) (currentBit!8556 thiss!1817))))))

(declare-fun lt!265335 () (_ BitVec 64))

(declare-fun lt!265336 () (_ BitVec 64))

(assert (=> d!61051 (= lt!265340 (bvmul lt!265335 lt!265336))))

(assert (=> d!61051 (or (= lt!265335 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!265336 (bvsdiv (bvmul lt!265335 lt!265336) lt!265335)))))

(assert (=> d!61051 (= lt!265336 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61051 (= lt!265335 ((_ sign_extend 32) (size!4072 (buf!4500 thiss!1817))))))

(assert (=> d!61051 (= lt!265338 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8561 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8556 thiss!1817))))))

(assert (=> d!61051 (invariant!0 (currentBit!8556 thiss!1817) (currentByte!8561 thiss!1817) (size!4072 (buf!4500 thiss!1817)))))

(assert (=> d!61051 (= (bitIndex!0 (size!4072 (buf!4500 thiss!1817)) (currentByte!8561 thiss!1817) (currentBit!8556 thiss!1817)) lt!265338)))

(declare-fun b!172230 () Bool)

(declare-fun res!142696 () Bool)

(assert (=> b!172230 (=> (not res!142696) (not e!120336))))

(assert (=> b!172230 (= res!142696 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!265338))))

(declare-fun b!172231 () Bool)

(declare-fun lt!265337 () (_ BitVec 64))

(assert (=> b!172231 (= e!120336 (bvsle lt!265338 (bvmul lt!265337 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!172231 (or (= lt!265337 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!265337 #b0000000000000000000000000000000000000000000000000000000000001000) lt!265337)))))

(assert (=> b!172231 (= lt!265337 ((_ sign_extend 32) (size!4072 (buf!4500 thiss!1817))))))

(assert (= (and d!61051 res!142695) b!172230))

(assert (= (and b!172230 res!142696) b!172231))

(declare-fun m!271397 () Bool)

(assert (=> d!61051 m!271397))

(declare-fun m!271399 () Bool)

(assert (=> d!61051 m!271399))

(assert (=> b!172190 d!61051))

(declare-fun d!61053 () Bool)

(assert (=> d!61053 (= (array_inv!3813 (buf!4500 thiss!1817)) (bvsge (size!4072 (buf!4500 thiss!1817)) #b00000000000000000000000000000000))))

(assert (=> b!172191 d!61053))

(declare-fun d!61055 () Bool)

(assert (=> d!61055 (= (inv!12 thiss!1817) (invariant!0 (currentBit!8556 thiss!1817) (currentByte!8561 thiss!1817) (size!4072 (buf!4500 thiss!1817))))))

(declare-fun bs!15182 () Bool)

(assert (= bs!15182 d!61055))

(assert (=> bs!15182 m!271399))

(assert (=> start!38304 d!61055))

(declare-fun d!61057 () Bool)

(assert (=> d!61057 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4072 (buf!4500 thiss!1817))) ((_ sign_extend 32) (currentByte!8561 thiss!1817)) ((_ sign_extend 32) (currentBit!8556 thiss!1817)) ((_ sign_extend 32) nBits!575)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4072 (buf!4500 thiss!1817))) ((_ sign_extend 32) (currentByte!8561 thiss!1817)) ((_ sign_extend 32) (currentBit!8556 thiss!1817))) ((_ sign_extend 32) nBits!575)))))

(declare-fun bs!15183 () Bool)

(assert (= bs!15183 d!61057))

(assert (=> bs!15183 m!271397))

(assert (=> b!172188 d!61057))

(declare-fun b!172275 () Bool)

(declare-fun e!120358 () Bool)

(declare-fun e!120357 () Bool)

(assert (=> b!172275 (= e!120358 e!120357)))

(declare-fun res!142734 () Bool)

(assert (=> b!172275 (=> res!142734 e!120357)))

(assert (=> b!172275 (= res!142734 (bvsge #b00000000000000000000000000000000 nBits!575))))

(declare-fun b!172277 () Bool)

(declare-fun res!142731 () Bool)

(assert (=> b!172277 (=> (not res!142731) (not e!120358))))

(declare-fun lt!265413 () (_ BitVec 64))

(declare-fun lt!265411 () (_ BitVec 64))

(declare-fun lt!265410 () tuple2!14804)

(assert (=> b!172277 (= res!142731 (= (bvlshr (_1!8044 lt!265410) lt!265413) (bvlshr #b0000000000000000000000000000000000000000000000000000000000000000 lt!265411)))))

(assert (=> b!172277 (and (bvsge lt!265411 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265411 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172277 (= lt!265411 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172277 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172277 (and (bvsge lt!265413 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265413 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172277 (= lt!265413 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172277 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun b!172278 () Bool)

(declare-fun res!142732 () Bool)

(assert (=> b!172278 (=> (not res!142732) (not e!120358))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172278 (= res!142732 (= (bvand (_1!8044 lt!265410) (onesLSBLong!0 nBits!575)) (_1!8044 lt!265410)))))

(declare-fun b!172279 () Bool)

(declare-fun e!120356 () tuple2!14804)

(assert (=> b!172279 (= e!120356 (tuple2!14805 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1817))))

(declare-fun b!172280 () Bool)

(declare-fun res!142730 () Bool)

(assert (=> b!172280 (=> (not res!142730) (not e!120358))))

(declare-fun lt!265412 () (_ BitVec 64))

(declare-fun lt!265418 () (_ BitVec 64))

(assert (=> b!172280 (= res!142730 (= (bitIndex!0 (size!4072 (buf!4500 (_2!8044 lt!265410))) (currentByte!8561 (_2!8044 lt!265410)) (currentBit!8556 (_2!8044 lt!265410))) (bvadd lt!265418 lt!265412)))))

(assert (=> b!172280 (or (not (= (bvand lt!265418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265412 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!265418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!265418 lt!265412) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172280 (= lt!265412 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172280 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172280 (= lt!265418 (bitIndex!0 (size!4072 (buf!4500 thiss!1817)) (currentByte!8561 thiss!1817) (currentBit!8556 thiss!1817)))))

(declare-fun b!172281 () Bool)

(declare-fun lt!265417 () (_ BitVec 64))

(declare-datatypes ((tuple2!14814 0))(
  ( (tuple2!14815 (_1!8049 BitStream!7252) (_2!8049 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7252) tuple2!14814)

(assert (=> b!172281 (= e!120357 (= (= (bvand (bvlshr (_1!8044 lt!265410) lt!265417) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!8049 (readBitPure!0 thiss!1817))))))

(assert (=> b!172281 (and (bvsge lt!265417 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265417 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!265414 () (_ BitVec 32))

(assert (=> b!172281 (= lt!265417 ((_ sign_extend 32) (bvsub lt!265414 #b00000000000000000000000000000000)))))

(assert (=> b!172281 (or (= (bvand lt!265414 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand lt!265414 #b10000000000000000000000000000000) (bvand (bvsub lt!265414 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172281 (= lt!265414 (bvsub nBits!575 #b00000000000000000000000000000001))))

(assert (=> b!172281 (or (= (bvand nBits!575 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!172276 () Bool)

(declare-fun lt!265416 () tuple2!14804)

(assert (=> b!172276 (= e!120356 (tuple2!14805 (_1!8044 lt!265416) (_2!8044 lt!265416)))))

(declare-datatypes ((tuple2!14816 0))(
  ( (tuple2!14817 (_1!8050 Bool) (_2!8050 BitStream!7252)) )
))
(declare-fun lt!265415 () tuple2!14816)

(declare-fun readBit!0 (BitStream!7252) tuple2!14816)

(assert (=> b!172276 (= lt!265415 (readBit!0 thiss!1817))))

(assert (=> b!172276 (= lt!265416 (readNLeastSignificantBitsLoop!0 (_2!8050 lt!265415) nBits!575 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!8050 lt!265415) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!575 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!61059 () Bool)

(assert (=> d!61059 e!120358))

(declare-fun res!142733 () Bool)

(assert (=> d!61059 (=> (not res!142733) (not e!120358))))

(assert (=> d!61059 (= res!142733 (= (buf!4500 (_2!8044 lt!265410)) (buf!4500 thiss!1817)))))

(assert (=> d!61059 (= lt!265410 e!120356)))

(declare-fun c!9066 () Bool)

(assert (=> d!61059 (= c!9066 (= nBits!575 #b00000000000000000000000000000000))))

(assert (=> d!61059 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!575) (bvsle nBits!575 #b00000000000000000000000001000000))))

(assert (=> d!61059 (= (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!265410)))

(assert (= (and d!61059 c!9066) b!172279))

(assert (= (and d!61059 (not c!9066)) b!172276))

(assert (= (and d!61059 res!142733) b!172280))

(assert (= (and b!172280 res!142730) b!172277))

(assert (= (and b!172277 res!142731) b!172278))

(assert (= (and b!172278 res!142732) b!172275))

(assert (= (and b!172275 (not res!142734)) b!172281))

(declare-fun m!271419 () Bool)

(assert (=> b!172278 m!271419))

(declare-fun m!271421 () Bool)

(assert (=> b!172280 m!271421))

(assert (=> b!172280 m!271353))

(declare-fun m!271423 () Bool)

(assert (=> b!172281 m!271423))

(declare-fun m!271425 () Bool)

(assert (=> b!172276 m!271425))

(declare-fun m!271427 () Bool)

(assert (=> b!172276 m!271427))

(assert (=> b!172189 d!61059))

(push 1)

(assert (not d!61051))

(assert (not d!61037))

(assert (not b!172281))

(assert (not b!172280))

(assert (not b!172276))

(assert (not d!61055))

(assert (not b!172278))

(assert (not d!61057))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

